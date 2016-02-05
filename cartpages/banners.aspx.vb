Imports System.Net
Imports System.IO
Imports System.Net.Mail


Partial Class cartpages_banners
    Inherits webformbase
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If IsNothing(Session("ShoppingCart")) Then
                Dim SC As New ShoppingCart
                Dim lt As New LookUpTable
                Session.Add("ShoppingCart", SC) 'contains orderdetail table and options table and any other tables I create in the new sub of shopping cart
                Session.Add("LookUp", lt) 'contains product table and eventually option tables in it.
            End If
        End If
    End Sub
    Function RetPrice(ByVal prodcode As String) As Decimal
        Dim lt As LookUpTable = Session("LookUp")
        Dim dprice As Decimal = 0
        Dim a As String
        Dim rowcount As Integer = lt.ProductTable.Rows.Count - 1
        Do While rowcount <> -1
            a = RTrim(lt.ProductTable.Rows(rowcount).Item("ProdCode").ToString.ToUpper)
            If RTrim(lt.ProductTable.Rows(rowcount).Item("ProdCode").ToString.ToUpper) = RTrim(prodcode.ToUpper) Then
                dprice = lt.ProductTable.Rows(rowcount).Item("Price")
                Exit Do
            End If
            rowcount = rowcount - 1
        Loop
        Return dprice

    End Function

    Protected Sub BAN_Load(sender As Object, e As System.EventArgs) Handles KBANNER.Load
        If Not IsPostBack Then
            Dim prodcode As Label = sender
            Me.KBANNER.Text = Me.RetPrice(sender.text.ToString.ToUpper)
        End If
    End Sub

    Protected Sub btnadd_Click(sender As Object, e As EventArgs) Handles btnadd.Click
        If Page.IsValid Then
            Dim filename As String
            Dim lt As LookUpTable
            lt = Session("LookUp") 'contains product table and eventually option tables in it.
            Dim SC As ShoppingCart
            SC = Session("ShoppingCart")
            'turned off until we go live
            filename = FtpFile()
            SC.tmpBannerName = IIf(SC.tmpBannerName = Nothing, filename, SC.tmpBannerName & "," & filename) 'will change this to orderid when order is made. checks if there are two or more banners uploaded. 

            Dim detid As String = SC.AddToCart(SC.orderdetail, KBANNER.ID, Me.txtqty.Text, Me.KBANNER.Text, "Banner", Me.ddlclr.SelectedItem.Text & "," & txtfname.Text & " " & txtlname.Text)

            Dim arroptions(2, 4) As String
            arroptions(0, 1) = Me.ddlclr.SelectedValue
            arroptions(0, 2) = Me.ddlclr.SelectedItem.Text
            arroptions(0, 3) = KBANNER.ID
            arroptions(0, 4) = detid
            arroptions(1, 1) = 0 'no option id value is got off the web
            arroptions(1, 2) = txtfname.Text & " " & txtlname.Text
            arroptions(1, 3) = KBANNER.ID
            arroptions(1, 4) = detid

            arroptions(2, 1) = ddlOrientation.SelectedItem.Value
            arroptions(2, 2) = ddlOrientation.SelectedItem.Text
            arroptions(2, 3) = KBANNER.ID
            arroptions(2, 4) = detid

            SC.AddOptions(SC.OrderOptions, arroptions, KBANNER.ID)
            Session("ShoppingCart") = SC
            Response.Redirect("../scart.aspx")

        End If
    End Sub
    Private Function FtpFile() As String


        Dim filename As String = Path.GetFileName(fuImgfile.FileName)
        Dim retValue As String = Now.Ticks.ToString & "~" & txtfname.Text & txtlname.Text & filename.ToString.Substring(filename.ToString.IndexOf("."))
        Dim ftpFullPath As String = ConfigurationManager.AppSettings("bannerftpserver").ToString() & retValue  'sets to a temp name
        Dim uncpath As String = ConfigurationManager.AppSettings("bannerunc").ToString()
        Dim FileByte() As Byte = fuImgfile.FileBytes
        Dim user As String = ConfigurationManager.AppSettings("bannerftpuser").ToString()
        Dim pw As String = ConfigurationManager.AppSettings("bannerftppw").ToString()
        Try

            Dim ftp As FtpWebRequest = FtpWebRequest.Create(New Uri(ftpFullPath))
            ftp.Credentials = New NetworkCredential(user, pw)
            ftp.KeepAlive = True
            ftp.UseBinary = True
            ftp.Method = WebRequestMethods.Ftp.UploadFile
            Dim ftpStream As Stream = ftp.GetRequestStream()
            ftpStream.Write(FileByte, 0, FileByte.Length) 'actual file being uploaded
            ftpStream.Close()
            ftpStream.Dispose()
            'change name
            'Dim ftp1 As FtpWebRequest = FtpWebRequest.Create(New Uri(ftpFullPath))
            'ftp1.Credentials = New NetworkCredential(user, pw)
            'ftp1.KeepAlive = True
            'ftp1.UseBinary = True
            'ftp1.Method = WebRequestMethods.Ftp.Rename
            'ftp1.RenameTo = retValue
            'ftp1.GetResponse()

           
            'Dim strFile As String = "E:\log.txt"


            'File.AppendAllText(strFile, " Start Emailcust " & DateTime.Now.ToString("MM/dd/yyyy HH:mm:ss") & Environment.NewLine)
            'My.Computer.FileSystem.RenameFile(uncpath & filename, retValue)



            'My.Computer.FileSystem.RenameFile(uncpath & filename, retValue)

        Catch ex As Exception
            'Now, send the email
            'Create an instance of the MailMessage class
            Dim objMM As New MailMessage()
            Dim tomail As String = ""
            Dim smtpclient As String = ""
            Dim cpassword As String = ""
            Dim cuser As String = ""
            tomail = "randy@woodalldevelopment.com"
            smtpclient = ConfigurationManager.AppSettings("smtpserver")
            cuser = ConfigurationManager.AppSettings("smtpuser")
            cpassword = ConfigurationManager.AppSettings("smtppassword")
            'Set the properties
            objMM.From = New MailAddress(ConfigurationManager.AppSettings("FromAddr"), ConfigurationManager.AppSettings("FromName"))
            objMM.To.Add(tomail) 'customer address
            'Send the email in text format
            objMM.IsBodyHtml = True

            'Set the subject
            objMM.Subject = "Error FTPing file"

            objMM.Body = "Error message:" & ex.Message

            Dim smtp As New SmtpClient(smtpclient)
            smtp.Credentials = New NetworkCredential(ConfigurationManager.AppSettings("smtpuser"), ConfigurationManager.AppSettings("smtppassword"))

            Try
                'smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some servers
                smtp.Send(objMM)

            Catch ex1 As Exception

            End Try
        End Try
        Return retValue
    End Function


    Protected Sub CustomValidator2_ServerValidate(source As Object, args As ServerValidateEventArgs) Handles CustomValidator2.ServerValidate
        Dim retval As Boolean = True
        If Trim(Me.ddlclr.SelectedItem.Text) = "Please Select" Then
            Me.CustomValidator2.ErrorMessage = "Please select a color."
            retval = False
        End If
        args.IsValid = retval
    End Sub

    Protected Sub valupload_ServerValidate(source As Object, args As ServerValidateEventArgs) Handles valupload.ServerValidate
        Dim retval As Boolean = False
        Dim filename As String = Path.GetFileName(fuImgfile.FileName)
        Dim file_extension As String = filename.ToString.Substring(filename.ToString.IndexOf("."))
        Select Case file_extension.ToUpper
            Case ".JPG", ".JPEG", ".PNG", ".TIFF"
                retval = True
        End Select
        args.IsValid = retval

    End Sub
    Protected Sub ddlclr_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlclr.SelectedIndexChanged
        Select Case ddlOrientation.SelectedItem.Text.ToUpper


            Case "HORIZONTAL"
                Select Case ddlclr.SelectedItem.Text.ToUpper


                    Case "BLUE"
                        defaultBanner.ImageUrl = "~/images/banners/KK_Class_Banner_Blue.jpg"

                    Case "GREEN"
                        defaultBanner.ImageUrl = "~/images/banners/KK_Class_Banner_Green.jpg"
                    Case "ORANGE"
                        defaultBanner.ImageUrl = "~/images/banners/KK_Class_Banner_Orange.jpg"
                    Case "PINK"
                        defaultBanner.ImageUrl = "~/images/banners/KK_Class_Banner_Pink.jpg"
                    Case "PURPLE"
                        defaultBanner.ImageUrl = "~/images/banners/KK_Class_Banner_Purple.jpg"
                    Case "RED"
                        defaultBanner.ImageUrl = "~/images/banners/KK_Class_Banner_Red.jpg"
                    Case "YELLOW"
                        defaultBanner.ImageUrl = "~/images/banners/KK_Class_Banner_Gold.jpg"

                End Select

            Case "VERTICAL"
                Select Case ddlclr.SelectedItem.Text.ToUpper

                    Case "BLUE"
                        defaultBanner.ImageUrl = "~/images/banners/KK_Stud_Banner_Blue.jpg"
                    Case "GREEN"
                        defaultBanner.ImageUrl = "~/images/banners/KK_Stud_Banner_Green.jpg"
                    Case "ORANGE"
                        defaultBanner.ImageUrl = "~/images/banners/KK_Stud_Banner_Orange.jpg"
                    Case "PINK"
                        defaultBanner.ImageUrl = "~/images/banners/KK_Stud_Banner_Pink.jpg"
                    Case "PURPLE"
                        defaultBanner.ImageUrl = "~/images/banners/KK_Stud_Banner_Purple.jpg"
                    Case "RED"
                        defaultBanner.ImageUrl = "~/images/banners/KK_Stud_Banner_Red.jpg"
                    Case "YELLOW"
                        defaultBanner.ImageUrl = "~/images/banners/KK_Stud_Banner_Gold.jpg"
                End Select
        End Select
    End Sub
    Protected Sub ddlOrientation_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlOrientation.SelectedIndexChanged
        ddlclr_SelectedIndexChanged(sender, e)
    End Sub
    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs) Handles btnblue.Click
        ddlclr.SelectedItem.Text = "Blue"
        ddlclr.SelectedValue = 263
        ddlclr_SelectedIndexChanged(sender, e)

    End Sub
    Protected Sub btngreen_Click(sender As Object, e As ImageClickEventArgs) Handles btngreen.Click
        ddlclr.SelectedItem.Text = "Green"
        ddlclr.SelectedValue = 264
        ddlclr_SelectedIndexChanged(sender, e)
    End Sub
    Protected Sub btnorange_Click(sender As Object, e As ImageClickEventArgs) Handles btnorange.Click
        ddlclr.SelectedItem.Text = "Orange"
        ddlclr.SelectedValue = 265
        ddlclr_SelectedIndexChanged(sender, e)
    End Sub
    Protected Sub btnpink_Click(sender As Object, e As ImageClickEventArgs) Handles btnpink.Click
        ddlclr.SelectedItem.Text = "Pink"
        ddlclr.SelectedValue = 266
        ddlclr_SelectedIndexChanged(sender, e)
    End Sub
    Protected Sub btnpurple_Click(sender As Object, e As ImageClickEventArgs) Handles btnpurple.Click
        ddlclr.SelectedItem.Text = "Purple"
        ddlclr.SelectedValue = 267
        ddlclr_SelectedIndexChanged(sender, e)
    End Sub
    Protected Sub btnred_Click(sender As Object, e As ImageClickEventArgs) Handles btnred.Click
        ddlclr.SelectedItem.Text = "Red"
        ddlclr.SelectedValue = 268
        ddlclr_SelectedIndexChanged(sender, e)
    End Sub
    Protected Sub btngold_Click(sender As Object, e As ImageClickEventArgs) Handles btngold.Click
        ddlclr.SelectedItem.Text = "Yellow"
        ddlclr.SelectedValue = 269
        ddlclr_SelectedIndexChanged(sender, e)
    End Sub
End Class
