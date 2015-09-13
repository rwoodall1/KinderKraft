Imports System.IO

Partial Class TaxUpload
    Inherits webformbase
    Protected Sub ProgressBar1_RunTask(ByVal sender As Object, ByVal e As EO.Web.ProgressTaskEventArgs)
        'You can not change anything else in the page inside
        'RunTask handler except for calling UpdateProgress.
        'If you do need to change other contents on the page
        'based on progress information, you can make use of
        'the second parameter of UpdateProgress.
        'The following code demonstrates how to pass addtional
        'data to the client side with UpdateProgress.
        'Here we call UpdateProgress with an additonal parameter.
        'This addtional parameter is passed to the client side
        'and can be accessed by getExtraData client side function.
        'The sample code handles ClientSideOnValueChanged on the
        'client side and checks the return value of getExtraData.
        'The handler then displays this extra value to the user 
        'when it sees it.
        e.UpdateProgress(0, "Running...")

        'Import Notes:
        '1. The progress bar does not figure out the progress
        '   by itself because it does not know how long your
        '   task will run;
        '2. The progress bar does not move by itself because
        '   it can not figure out the progress by itself;
        'This means you must repeatly report your progress to
        'the progress bar (by calling UpdateProgress). 
        'Here we use a loop to demonstrate this. You do not 
        'have to use a loop but you must repeatly report the 
        'progress information to the progress bar. For example,
        'if your long running task is copying 100 files, you
        'can loop 100 times like this code does, but replacing
        'Thread.Sleep with code to copy a single file and report
        'your progress to the progress bar after each file. 
        'Likewise, if your task is copying a single file, you 
        'can get the file length first, then use a loop to copy 
        'chunk by chunk and report the progress after each
		'chunk. 
		Dim filepath As String
		Dim goodtogo As Boolean = False

		If FileUpload1.HasFile Then
			Try
				Dim filename As String = Path.GetFileName(FileUpload1.FileName)
				FileUpload1.SaveAs(Server.MapPath("~/TaxRateUpload/") & filename)
				filepath = Server.MapPath("~/TaxRateUpload/") & filename
				goodtogo = True
			Catch ex As Exception

			End Try
		End If
        If goodtogo = True Then

            Dim anerror As Boolean = False
            Dim zip As String = ""
            Dim state As String = ""
            Dim totalsalestax As String = ""



            Dim i As Integer = 0
            Dim sr As IO.StreamReader = New StreamReader(filepath)
			Dim line, vals() As String

			Do While Not sr.EndOfStream
				Dim a As DateTime = Now()

				line = sr.ReadLine
				If i > 0 Then 'i =updateprogress.value with a maximum set at 41812 which =100%
					If e.IsStopped Then

						Exit Do
					End If
					If line Is Nothing Then
						Exit Do
					End If

					Try
						vals = line.Split(vbTab)
						zip = vals(0)
						state = vals(1)
						totalsalestax = vals(10)
						Try
							dstaxrate.UpdateParameters.Clear()
							dstaxrate.UpdateParameters.Add("@totsalestx", totalsalestax)
							dstaxrate.UpdateParameters.Add("@zipcode", zip)
							dstaxrate.Update()
						Catch ex As Exception
							e.UpdateProgress(i, "There was an update error. Please try again!")
							anerror = True
							Exit Do
							Session.Add("TaxUploadMessage", "There was an erro uploading the tax rates. <br/> Last record  not updated was zip " & zip.ToString)

						End Try
					Catch ex As Exception

					End Try

					If i Mod 500 = 0 Then
						Dim b As DateTime = Now()
						Dim diff As TimeSpan = b.Subtract(a)
						e.UpdateProgress(i, "Loading record number " & i.ToString & " Zip Code:" & zip)
					Else
						e.UpdateProgress(i)
					End If

				End If
				
				i = i + 1

			Loop
            sr.Close()
            sr = Nothing
            If anerror = False Then
				e.UpdateProgress(ProgressBar1.Maximum, "Last record loaded: " & i.ToString & " Zip Code:" & zip)
                e.UpdateProgress(ProgressBar1.Maximum, "The upload is done!") 'sets end of task
            End If
        Else
            e.UpdateProgress(0, "Please select a file in the file textbox!")
        End If

    End Sub 'ProgressBar1_RunTask


    Protected Sub CallbackPanel1_Execute(ByVal sender As Object, ByVal e As EO.Web.CallbackEventArgs)
        If e.Parameter = "start" Then
            e.Data = "start"

            'Perform additional action before RunTask
            Label1.Text = ""
        ElseIf e.Parameter = "done" Then
            e.Data = "done"

            'Perform additional action after RunTask
			lblmsg.Text = "The upload is done!"
        ElseIf e.Parameter = "error" Then
			lblmsg.Text = "There was an error in updating the tax rate. Please try again or contact the developer."


        End If
    End Sub 'CallbackPanel1_Execute


End Class
