Imports Microsoft.VisualBasic
Imports System.Data
Imports CrystalDecisions.CrystalReports.Engine
Imports System.Net.Mail
Imports System.IO

Imports System.Net
Imports MySql.Data.MySqlClient


Partial Class receipt
    Inherits EmailReadyPage
    'Private InvoiceReport As ReportDocument
    'do not put a slash in front of directory. It makes a difference in how the server.mappathe interperts the path.
    Dim mydatamaker As New InvoiceConfig(Server.MapPath("ReportDataSet\"))
    Private okToSendMarkup As Boolean = False
    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        If okToSendMarkup Then
            'EmailReceipt()
        End If


        MyBase.Render(writer)
        ' ALTERNATE OPTION:
        ' Remove EmailReceipt(); from above, and instead do: okToSendMarkup = True
        ' Then, in the Render() method, the markup will be generated and emailed
        ' If this alternate option is used, you do not need to disable event validation since
        ' the control is being rendered during the Render stage. Therefore, event validation
        ' can proceed as expected.
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Dim cs As String = Request.QueryString("CS")
		LoadLic()
        Label4.Text = "Thank you for your order #" & Request.QueryString("orderid")
        Dim SC As ShoppingCart
        If Not IsNothing(Session("ShoppingCart")) Then
            SC = Session("ShoppingCart")
        Else
            SC = New ShoppingCart
        End If

        SetLabel(SC)
        SetAdminLink(SC)
        SetCurrentCust(SC)


        If Not IsPostBack Then
            Page.Form.Target = "_blank"

			Dim custemailed As Boolean = CheckIfCustEmailed()
			If custemailed = False Then
				EmailReceipt()
			End If
		End If

		If IsNothing(cs) Then
			Dim CSemailed As Boolean = CheckIfEmailed()
			If CSemailed = False Then
				EmailReceiptCS()
			End If
			'EmailReceipt()	 ' being done manually
		ElseIf cs.ToUpper = "TRUE" Then
			EmailReceiptCS()
		End If


		If Session("pagesubmitted") = True Then
			If Not IsPostBack Then
				SC.ClearOrder()
				Dim ordermessage As String = Session("ordermessage") 'must be saved since session are being cleared
				LinkButton1.Visible = SC.IsCs
				Dim lt As LookUpTable
				lt = Session("LookUp")

			End If
		Else 'pagesubmitted=false
			' this fires on changing pages if hide ctrl enabled then info is hidden when page index is changed
		End If

    End Sub
    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click

    End Sub
    Protected Sub gv1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gv1.RowDataBound
		If e.Row.RowType = DataControlRowType.DataRow Then
			If e.Row.RowIndex = 0 Then
                e.Row.Style.Add("height", "80px")

				e.Row.VerticalAlign = VerticalAlign.Bottom

			End If
		End If
		If e.Row.RowType = DataControlRowType.DataRow Then
			Select Case e.Row.Cells(0).Text
				Case "Graduate Package", "Scholar Package", "Achiever Package", "Milestone Package", "Learner Package"
					e.Row.Font.Bold = True
			End Select
			Select Case e.Row.Cells(3).Text
				Case "0"
					e.Row.Font.Italic = True
					e.Row.Font.Size = 8
			End Select
		End If


        If e.Row.RowType <> DataControlRowType.DataRow Then
            Return
        End If
        Dim SCa As ShoppingCart
        SCa = Session("ShoppingCart")
        Dim Datarow As DataRowView = CType(e.Row.DataItem, DataRowView)
        'Dim vdetailid As Integer = Datarow("OrderDetailId")
        Dim vdetailid As Integer = gv1.DataKeys(e.Row.RowIndex).Value.ToString
        Dim cmdtext As String
        Dim opd As GridView = e.Row.FindControl("opd")


        Try
            cmdtext = "SELECT * FROM orderoptions o WHERE DetailId=" & vdetailid.ToString & ";"
            dsorderoptions.SelectCommand = cmdtext

            'Dim qresults As DataTable = opdat.Select("detailid=" & vdetailid.ToString).CopyToDataTable
            opd.DataSource = dsorderoptions
            opd.DataBind()

        Catch ex As Exception

            opd.DataSource = Nothing
            opd.DataBind()
            Return
        End Try

    End Sub
    Private Sub HideCtrl()
        'DetailsView1.Visible = False
        'DetailsView2.Visible = False
        'FormView2.Visible = False
        'gv1.Visible = False
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        'disabled this as it was locking up all the time. 4/01/2015 rw
        'Dim orderid As String = DetailsView2.DataKey("orderid")

        'Response.Redirect("PrintReceipt.aspx?orderid=" & orderid)
    End Sub
	Sub EmailReceipt()

		'Save the position of the DataGrid in the myForm Controls collection
		Dim SB As New StringBuilder()
		Dim SW As New StringWriter(SB)
		Dim htmlTW As New HtmlTextWriter(SW)
		gv1.AllowPaging = False
		gv1.RenderControl(htmlTW)

		Dim thegrid As String = SB.ToString
		SB.Clear()
		gv1.AllowPaging = True
		DetailsView1.RenderControl(htmlTW)
		Dim thefirstdetailview As String = SB.ToString
		SB.Clear()
		DetailsView2.RenderControl(htmlTW)
		Dim theseconddetailview As String = SB.ToString
		SB.Clear()
		FormView2.RenderControl(htmlTW)
		Dim thesecondformview As String = SB.ToString

		'Now, send the email
		'Create an instance of the MailMessage class
		Dim objMM As New MailMessage()
		Dim tomail As String = ""
		Dim smtpclient As String = ""
		Dim cpassword As String = ""
		Dim cuser As String = ""
		If Directory.Exists("F:\IsDev") Then 'set dev settings
			'smtpclient = "cmain1.wdfm.net" '"mail.woodalldevelopment.com"
			'cuser = "rwoodall@wdfm.net"
			'cpassword = "Briggitte1"
			tomail = "randy@woodalldevelopment.com"
		Else 'live
			'SmtpClient = "192.168.1.245"
			'cuser = "authnet@memorybook.com"
			'cpassword = "authnet"
			Dim email As String = DetailsView1.Rows(10).Cells(1).Text

			tomail = Trim(email)


		End If

		smtpclient = ConfigurationManager.AppSettings("smtpserver")
		cuser = ConfigurationManager.AppSettings("smtpuser")
		cpassword = ConfigurationManager.AppSettings("smtppassword")
		'Set the properties
		objMM.From = New MailAddress(ConfigurationManager.AppSettings("FromAddr"), ConfigurationManager.AppSettings("FromName"))
		'objMM.Bcc.Add(ConfigurationManager.AppSettings("FromAddr"))
		Try
			objMM.To.Add(tomail) 'customer address if address bad try statement in send will catch
		Catch ex As Exception

		End Try

		'Send the email in text format
		objMM.IsBodyHtml = True

		'Set the subject
		objMM.Subject = "Jostens Kinderkraft Order Confirmation"

		objMM.Body = "<table class='style1' align='center'> <tr><td align='center' colspan='2' style='font-weight: bolder'>Thank you! Your order# is " & DetailsView2.DataKey("orderid") _
		 & "<br /> Your order was placed on " & DetailsView2.DataKey("orderdate") & "</td></tr> <tr><td align='center' style='font-weight: bolder'>Billing Information</td><td align='center' style='font-weight: bold'>Shipping Information</td></tr>" _
		 & "<tr><td align='right'>" & thefirstdetailview & "</td><td>" & theseconddetailview & "</td></tr><tr><td colspan='2'>" _
		 & thegrid & "</td> </tr> <tr><td align='center' colspan='2'>" & thesecondformview & " </td></tr><tr><td align='center' colspan='2'><a href='http://www.jostenskinderkraft.com/frequently_asked_questions.html ' >Frequently Asked Questions</a><br/><br/>" _
		 & " Thank you for shopping at Jostens Kinderkraft. <br/> Visit us again at <a href='http://www.jostenskinderkraft.com ' >www.jostenskinderkraft.com. </a></td><tr></table>"

		Dim smtp As New SmtpClient(SmtpClient)
		smtp.Credentials = New NetworkCredential(cuser, cpassword)

		Try
			'smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some servers
			smtp.Send(objMM)
			SetCustEmailTrue()
		Catch ex As Exception
			MsgBox1.Show("Email Error", "Your confirmation email was not sent because of the following error:" & ex.Message & "Your order has been received and will be processed. No further action is needed.", Nothing, New EO.Web.MsgBoxButton("OK"))
			Dim objMM1 As New MailMessage
			Dim orderid As String = Request.QueryString("orderid")
			smtpclient = ConfigurationManager.AppSettings("smtpserver")
			cuser = ConfigurationManager.AppSettings("smtpuser")
			cpassword = ConfigurationManager.AppSettings("smtppassword")
			Dim smtperror As New SmtpClient(SmtpClient)
			smtperror.Credentials = New NetworkCredential(cuser, cpassword)
			objMM1.From = New MailAddress(ConfigurationManager.AppSettings("FromAddr"), ConfigurationManager.AppSettings("FromName"))
			objMM1.To.Add("randy@woodalldevelopment.com")
			objMM1.CC.Add("kinderkraftcs@jostens.com")
			objMM1.Subject = "Jostens Kinderkraft Order Email Error Order Id:" & orderid
			objMM1.IsBodyHtml = True
			objMM1.Body = "The customer did not receive an email because of the following error:" & ex.Message & "If possible generate an email to the customer by going to the order screen and selecting an option in the order operation drop down box."
			Try
				smtperror.Send(objMM1)
			Catch ex2 As Exception

			End Try


		Finally

		End Try



	End Sub
	Sub EmailReceiptCS()

		'Save the position of the DataGrid in the myForm Controls collection
		Dim SB As New StringBuilder()
		Dim SW As New StringWriter(SB)
		Dim htmlTW As New HtmlTextWriter(SW)
		gv1.AllowPaging = False
		gv1.RenderControl(htmlTW)

		Dim thegrid As String = SB.ToString
		SB.Clear()
		gv1.AllowPaging = True
		DetailsView1.RenderControl(htmlTW)
		Dim thefirstdetailview As String = SB.ToString
		SB.Clear()
		DetailsView2.RenderControl(htmlTW)
		Dim theseconddetailview As String = SB.ToString
		SB.Clear()
		FormView2.RenderControl(htmlTW)
		Dim thesecondformview As String = SB.ToString

		'Now, send the email
		'Create an instance of the MailMessage class
		Dim objMM As New MailMessage()
		Dim tomail As String = ""
		Dim smtpclient As String = ""
		Dim cpassword As String = ""
		Dim cuser As String = ""
		If Directory.Exists("F:\IsDev") Then 'set dev settings
			'smtpclient = "cmain1.wdfm.net" '"mail.woodalldevelopment.com"
			'cuser = "rwoodall@wdfm.net"
			'cpassword = "Briggitte1"
			tomail = "randy@woodalldevelopment.com"
		Else 'live
			'SmtpClient = "192.168.1.245"
			'cuser = "authnet@memorybook.com"
			'cpassword = "authnet"
			'Dim email As String = DetailsView1.Rows(10).Cells(1).Text

			tomail = ConfigurationManager.AppSettings("FromAddr")


		End If

		smtpclient = ConfigurationManager.AppSettings("smtpserver")
		cuser = ConfigurationManager.AppSettings("smtpuser")
		cpassword = ConfigurationManager.AppSettings("smtppassword")
		'Set the properties
		objMM.From = New MailAddress(ConfigurationManager.AppSettings("FromAddr"), ConfigurationManager.AppSettings("FromName"))

		objMM.To.Add(tomail) 'customer address
		'Send the email in text format
		objMM.IsBodyHtml = True

		'Set the subject
		objMM.Subject = "Jostens Kinderkraft Order Confirmation   " & "(Email Date:" & Now().ToString & ")"

		objMM.Body = "<table class='style1' align='center'> <tr><td align='center' colspan='2' style='font-weight: bolder'>Thank you! Your order# is " & DetailsView2.DataKey("orderid") _
		 & "<br /> Your order was placed on " & DetailsView2.DataKey("orderdate") & "</td></tr> <tr><td align='center' style='font-weight: bolder'>Billing Information</td><td align='center' style='font-weight: bold'>Shipping Information</td></tr>" _
		 & "<tr><td align='right'>" & thefirstdetailview & "</td><td>" & theseconddetailview & "</td></tr><tr><td colspan='2'>" _
		 & thegrid & "</td> </tr> <tr><td align='center' colspan='2'>" & thesecondformview & " </td></tr><tr><td align='center' colspan='2'><a href='http://www.jostenskinderkraft.com/frequently_asked_questions.html ' >Frequently Asked Questions</a><br/><br/>" _
		 & " Thank you for shopping at Jostens Kinderkraft. <br/> Visit us again at <a href='http://www.jostenskinderkraft.com ' >www.jostenskinderkraft.com. </a></td><tr></table>"

		Dim smtp As New SmtpClient(smtpclient)
		smtp.Credentials = New NetworkCredential(ConfigurationManager.AppSettings("smtpuser"), ConfigurationManager.AppSettings("smtppassword"))

		Try
			'smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some servers
			smtp.Send(objMM)
			SetCsEmailTrue()
		Catch ex As Exception
			Try	'if this fail due to no connection go on.
				Dim objMM1 As New MailMessage
				smtpclient = ConfigurationManager.AppSettings("smtpserver")
				cuser = cuser = ConfigurationManager.AppSettings("smtpuser")
				cpassword = cpassword = ConfigurationManager.AppSettings("smtppassword")
				objMM1.From = New MailAddress(ConfigurationManager.AppSettings("FromAddr"), ConfigurationManager.AppSettings("FromName"))
				objMM1.To.Add("randy@woodalldevelopment.com")
				objMM1.Subject = "Jostens Kinderkraft Order Email Error"
				objMM1.IsBodyHtml = True
				objMM1.Body = "Jostens Cs did not receive a confirmation email because of the following error:" & ex.Message
				smtp.Send(objMM1)
			Catch ex1 As Exception

			End Try

		Finally

		End Try



	End Sub
	Private Sub SetLabel(ByVal Sc As Object)

		Dim lklogin As LinkButton = Me.FindControl("lklogin")
		If Sc.LoggedIn = True Then
			lklogin.Text = "Log Out"

		Else
			lklogin.Text = "Log In"

		End If
		If Sc.username <> "GUEST" Then
			Label1.Text = "Welcome, " & Sc.username
			Label1.Visible = True
		Else
			Label1.Visible = False
		End If

	End Sub
	Private Sub SetAdminLink(ByVal Sc As Object)

		If IsNothing(Session("IsCs")) Then
			LinkButton1.Visible = Sc.IsCs
		Else
			'SC session is erased after order is place I save to session so must use that to see if button is hid
			LinkButton1.Visible = Session("IsCs")
		End If
	End Sub
	Private Sub SetCurrentCust(ByVal Sc As ShoppingCart)

		lblcurrentcustomer.Text = "Current Customer is:" & Sc.CompanyName & "(" & Sc.custid.ToString & ")"
		lblcurrentcustomer.Visible = Sc.IsCs

	End Sub

	Protected Sub lklogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lklogin.Click


		If lklogin.Text = "Log Out" Then
			LogOut()
			Response.Redirect("~/login.aspx")
		Else
			Response.Redirect("~/login.aspx")
		End If
	End Sub
	Protected Sub LogOut()
		Session.RemoveAll()

	End Sub
	Protected Sub ordstatus_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ordstatus.Click

		Response.Redirect("~/CustomerOrders.aspx")
	End Sub
	'Protected Sub dsorderoptions_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles dsorderoptions.Selected
	'    Session.Add("affectedrows", e.AffectedRows)
	'End Sub
	'Protected Sub gv1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gv1.RowCommand
	'    Dim cmdtext As String
	'    Dim vindex As Integer = Convert.ToInt32(e.CommandArgument)
	'    Dim selectedrow As GridViewRow = gv1.Rows(vindex)

	'    Select Case e.CommandName
	'        Case "Toggle"
	'            Dim btntoggle As LinkButton = selectedrow.FindControl("btnToggle")
	'            Dim opd As GridView = selectedrow.FindControl("opd")
	'            If btntoggle.Text = "Options" Then
	'                btntoggle.Text = "Close Options"
	'                Dim vdetailid As Integer = gv1.DataKeys(vindex).Value.ToString
	'                Try
	'                    cmdtext = "SELECT * FROM kinderkraft5.orderoptions o WHERE o.`DetailId`=" & vdetailid.ToString & ";"
	'                    dsorderoptions.SelectCommand = cmdtext

	'                    'Dim qresults As DataTable = opdat.Select("detailid=" & vdetailid.ToString).CopyToDataTable
	'                    opd.DataSource = dsorderoptions
	'                    opd.DataBind()
	'                    If Session("affectedrows") > 0 Then

	'                        Session.Remove("affectedrows")
	'                    Else
	'                        Throw New Exception("No Date returned!")
	'                        Session.Remove("affectedrows")
	'                    End If
	'                Catch ex As Exception
	'                    btntoggle.Text = "N/A"
	'                    opd.DataSource = Nothing
	'                    opd.DataBind()
	'                    Return
	'                End Try
	'            Else
	'                btntoggle.Text = "Options"
	'                opd.DataSource = Nothing
	'                opd.DataBind()
	'            End If
	'        Case "Delete"
	'            'Dim detailid As Integer = gv1.DataKeys(vindex).Values(0)
	'            'Dim pkgid As String = gv1.DataKeys(vindex).Values(1)
	'            'Dim orderid As Integer = gv1.DataKeys(vindex).Values(2)


	'            'Select Case Trim(pkgid)
	'            '    Case "01KGRADPKD", "02KSCHPKD", "03KACHPKD", "04KMILEPKD", "05KLEAPKD"
	'            '        deletepkg(pkgid, orderid)
	'            '    Case Else 'not a package
	'            '        Deleteitem(detailid, orderid)
	'            'End Select

	'        Case Else 'command not in list
	'            Return

	'    End Select
	'End Sub
	Private Sub LoadLic()
		EO.Web.Runtime.AddLicense( _
		 "b/8goVnt6QMe6KjlwbPcsGenprHavUaBpLHLn1mXpLHn4J3bpAUk7560puQX" + _
		 "6J3c0fYZ9FuX+vYd8qLm8s7NsGqltLPLrneEjrHLn1mXpLHLu5rb6LEf+Knc" + _
		 "wbP/4JvK+AMU71uX+vYd8qLm8s7NsGqltLPLrneEjrHLn1mXpLHLu5rb6LEf" + _
		 "+KncwbP/8Z7c2voQ9luX+vYd8qLm8s7NsGqltLPLrneEjrHLn1mXpLHLu5rb" + _
		 "6LEf+KncwbP49KXr7eEM5p6ZpAcQ8azg8//ooWqossHNn2i1kZvLn1mXpLHL" + _
		 "n3XY6PXL87Ln6c7Nwprj6f8P4KuZpAcQ8azg8//ooWqossHNn2i1kZvLn1mX" + _
		 "pLHLn3XY6PXL87Ln6c7Nwprj8PMM4qSZpAcQ8azg8//ooWqossHNn2i1kZvL" + _
		 "n1mXpLHLn3XY6PXL87Ln6c7NwIO43OYb66jY6PYdoVnt6QMe6KjlwbPcsGen" + _
		 "prHavUaBpLHLn1mXpLHn4J3bpAUk7560ptUU4KXm67PL9Z7p9/oa7XaZtcLZ" + _
		 "r1uXs8+4iVmXpLHLn1mXwPIP41nr/QEQvFvK9P0U863c9rPL9Z7p9/oa7XaZ" + _
		 "tcLZr1uXs8+4iVmXpLHLn1mXwPIP41nr/QEQvFvE5QQW5J286PofoVnt6QMe" + _
		 "6KjlwbPcsGenprHavUaBpLHLn1mXpLHn4J3bpAUk7560ptgd6J2ZpAcQ8azg" + _
		 "8//ooWqossHNn2i1kZvLn1mXpLHLn3XY6PXL87Ln6c7Nwqjj8wP76Jzi6QPN" + _
		 "n6/c9gQU7qe0psLcrWmZpMDpjEOXpLHLn1mXpM0M452X+Aob5HaZ1wEQ66W6" + _
		 "7PYO6p7pprEh5Kvq7QAZvFuotb/boVmmwp61n1mXpLHLn1mz5fUPn63w9Pbo" + _
		 "oX7b7QUa8VuX+vYd8qLm8s7NsGqltLPLrneEjrHLn1mXpLHLu5rb6LEf+Knc" + _
		 "wbP07Jre6esa7qaZpAcQ8azg8//ooWqossHNn2i1kZvLn1mXpLHLn3XY6PXL" + _
		 "87Ln6c7Nw6ju8v0a4J3c9rPL9Z7p9/oa7XaZtcLZr1uXs8+4iVmXpLHLn1mX" + _
		 "wPIP41nr/QEQvFu98AAM857pprEh5Kvq7QAZvFuotb/boVmmwp61n1mXpLHL" + _
		 "n1mz5fUPn63w9PbooYzj7fUQoVnt6QMe6KjlwbPcsGenprHavUaBpLHLn1mX" + _
		 "pLHn4J3bpAUk7560ptcX+Kjs+LPL9Z7p9/oa7XaZtcLZr1uXs8+4iVmXpLHL" + _
		 "n1mXwPIP41nr/QEQvFu86Pof4Jvj6d0M4Z7jprEh5Kvq7QAZvFuotb/boVmm" + _
		 "wp61n1mXpLHLn1mz5fUPn63w9PbooYXg9wXt7rGZpAcQ8azg8//ooWqossHN" + _
		 "n2i1kZvLn1mXpLHLn3XY6PXL87Ln6c7Nwqjk5gDt7rGZpAcQ8azg8//ooWqo" + _
		 "ssHNn2i1kZvLn1mXpLHLn3XY6PXL87Ln6c7Nwprn+PQT4FuX+vYd8qLm8s7N" + _
		 "sGqltLPLrneEjrHLn1mXpLHLu5rb6LEf+KncwbP/7qjj2PoboVnt6QMe6Kjl" + _
		 "wbPcsGenprHavUaBpLHLn1mXpLHn4J3bpAUk7560puMM86Ll67PL9Z7p9/oa" + _
		 "7XaZtcLZr1uXs8+4iVmXpLHLn1mXwPIP41nr/QEQvFvK8PoP5KuZpAcQ8azg" + _
		 "8//ooWqossHNn2i1kZvLn1mXwMAM66Xm+8+4iVmXpLHn7qvb6QP07Z/mpPUM" + _
		 "8560psPasXCmtsHcsluX+vYd8qLm8s7NsGmZpMDpjEOXpLHLu6zg6/8M867p" + _
		 "6c8a2HDs8bzi56PFt9wU12nQ0QAl4pvewc7nrqzg6/8M867p6c+4iXWm8PoO" + _
		 "5Kfq6c+4iXXj7fQQ7azcwp61n1mXpM0X6Jzc8gQQyJ21ucHfsW+vtMjgtnWm" + _
		 "8PoO5Kfq6doPvUaBpLHLn3Xj7fQQ7azc6c/nrqXg5/YZ8p7cwp61n1mXpM0M" + _
		 "66Xm+8+4iVmXpLHLn1mXwPIP41nr/QEQvFvE6Q==")
	End Sub


	Protected Sub Button3_Click(sender As Object, e As System.EventArgs) Handles Button3.Click
		Response.Redirect("shopjostenshome.aspx")
	End Sub
	Private Function CheckIfEmailed() As Boolean
		Dim dvSql As New DataView
		Dim drvSql As DataRowView
		Dim a As Integer
		Dim sstring As String = dsOrders.SelectCommand
		Dim retval As Boolean = False
		dsOrders.SelectCommand = "SELECT distinct csemailed FROM orders  WHERE orderid=@orderid;"
		dsOrders.SelectParameters.Clear()
		dsOrders.SelectParameters.Add("@orderid", Request.QueryString("orderid"))
		Try
			dvSql = CType(Me.dsOrders.Select(DataSourceSelectArguments.Empty), Data.DataView)
			For Each drvSql In dvSql 'only one record
				a = drvSql("csemailed")
				If a = 0 Then
					retval = False
				ElseIf a = 1 Then
					retval = True
				End If
			Next
		Catch ex As Exception

		End Try
		dsOrders.SelectCommand = sstring
		Return retval
	End Function
	Private Function CheckIfCustEmailed() As Boolean
		Dim dvSql As New DataView
		Dim drvSql As DataRowView
		Dim a As Integer
		Dim sstring As String = dsOrders.SelectCommand
		Dim retval As Boolean = False
		dsOrders.SelectCommand = "SELECT distinct custemailed FROM orders  WHERE orderid=@orderid;"
		dsOrders.SelectParameters.Clear()
		dsOrders.SelectParameters.Add("@orderid", Request.QueryString("orderid"))
		Try
			dvSql = CType(Me.dsOrders.Select(DataSourceSelectArguments.Empty), Data.DataView)
			For Each drvSql In dvSql 'only one record
				a = drvSql("custemailed")
				If a = 0 Then
					retval = False
				ElseIf a = 1 Then
					retval = True
				End If
			Next
		Catch ex As Exception

		End Try
		dsOrders.SelectCommand = sstring
		Return retval
	End Function

	Protected Sub SetCsEmailTrue()
		dsOrders.UpdateCommand = "update orders set csemailed=1 where orderid=@orderid;"
		dsOrders.UpdateParameters.Clear()
		dsOrders.UpdateParameters.Add("@orderid", Request.QueryString("orderid"))
		Try
			dsOrders.Update()

		Catch ex As Exception

		End Try

	End Sub
	Protected Sub SetCustEmailTrue()
		dsOrders.UpdateCommand = "update orders set custemailed=1 where orderid=@orderid;"
		dsOrders.UpdateParameters.Add("@orderid", Request.QueryString("orderid"))
		Try
			dsOrders.Update()

		Catch ex As Exception

		End Try

	End Sub
	Protected Sub btnemailrecpt_Click(sender As Object, e As System.EventArgs) Handles btnemailrecpt.Click
		EmailReceipt()
	End Sub
End Class
