Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Data
Imports System.Net.Mail
Imports System.Net
Imports MySql.Data.MySqlClient

Imports System.IO.File
Imports System.IO


Partial Class login
    Inherits System.Web.UI.Page
    Protected Sub EmailTaxForm()
        'Dim fileupload1 As FileUpload = FormView1.FindControl("fileupload1")
        'Dim companyname As TextBox = FormView1.FindControl("txtcompanyname")
        If fileupload1.HasFile Then


            Dim filename As String = Path.GetFileName(fileupload1.FileName)
            fileupload1.SaveAs(Server.MapPath("~/MyAttach/") & filename)


            Dim attachementpath As String = Server.MapPath("MyAttach/" & fileupload1.FileName)



            'Now, send the email
            'Create an instance of the MailMessage class
            Dim objMM As New MailMessage
            Dim tomail As String
            Dim smtpclient As String
            Dim cpassword As String
            Dim cuser As String
            If Directory.Exists("F:\IsDev") Then 'set dev settings
                smtpclient = "mail.woodalldevelopment.com"
                cuser = "randy@woodalldevelopment.com"
                cpassword = "briggitte"
                tomail = "randy@woodalldevelopment.com"
            Else 'live
                smtpclient = "192.168.1.245"
                cuser = "authnet@memorybook.com"
                cpassword = "authnet"
            End If
            'Set the properties

            objMM.To.Add("kinderkraftcs@jostens.com") 'Cs address
            'objMM.To.Add("wdalfarm@embarqmail.com") 'for testing remove when done
            objMM.From = New MailAddress("kinderkraftcs@jostens.com")
            'objMM.From = New MailAddress("randy@woodalldevelopment.com")
            objMM.Attachments.Add(New Attachment(attachementpath))
            'Send the email in text format
            objMM.IsBodyHtml = True

            'Set the subject
            objMM.Subject = "TaxId Form "

            objMM.Body = "Attached is a taxid form from " & txtname.Text

            Dim smtp As New SmtpClient(smtpclient)
            smtp.Credentials = New NetworkCredential(cuser, cpassword)
            Try
                'smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some servers
                smtp.Send(objMM)
            Catch

            End Try
        End If
    End Sub

    Protected Sub Login1_Authenticate(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.AuthenticateEventArgs) Handles Login1.Authenticate
        Session.Add("e", e)
        Dim cPassword As String = Me.Login1.Password.ToString.Trim
        Dim cUser As String = Me.Login1.UserName.ToString.Trim
        Dim dvSql As New DataView
		Dim drvSql As DataRowView
		Dim dvSql1 As New DataView
		Dim drvSql1 As DataRowView
        Dim selectcmd As String
        selectcmd = "SELECT distinct  cust.iscs,cust.username,cust.EmailAddress,Companyname,password,sinternational,international,postalcode,spostalcode,taxexemptconfirmed,state,holdpayment,allowpo,dollar11,dollar12,dollar13,custid from cust where trim(cust.username)='" & cUser & "' and trim(cust.password)='" & cPassword & "';"
        Me.DSSQLCUST.SelectCommand = selectcmd
        Try
            dvSql = CType(Me.DSSQLCUST.Select(DataSourceSelectArguments.Empty), Data.DataView)
        Catch ex As Exception
            e.Authenticated = False
            Me.Login1.FailureText = "The data server connection is not available. Please contact your KinderKraft customer representative. "
            Return
        End Try
        If dvSql.Table.Rows.Count = 0 Then
            e.Authenticated = False
            Me.Login1.FailureText = "Your username was not found. Please renter the username or create a new account."
            Return
        End If
        Dim dvusername As String = ""
        Dim international As Boolean = False
        Dim sinternational As Boolean = False
		Dim dvIsCS As Boolean
        Dim dvemailaddress As String = ""
        Dim dvpassword As String = ""
        Dim dvzipcode As String = ""
        Dim dvszipcode As String = ""
		Dim dvtaxexempt As Boolean = False
		Dim dvallowpo As Boolean = False
        Dim dvstate As String = ""
        Dim dvid As Integer = 0
		Dim dvcompanyname As String = ""
		Dim dvholdpayment As Boolean = False
		Dim dvdollar11 As Decimal = 0
		Dim dvdollar12 As Decimal = 0
		Dim dvdollar13 As Decimal = 0
		Dim dollartot As Decimal = 0
		For Each drvSql In dvSql

			dvemailaddress = drvSql("EmailAddress").ToString()
			dvIsCS = drvSql("iscs")
			dvusername = drvSql("username").ToString()
			dvpassword = drvSql("password").ToString()
			dvtaxexempt = drvSql("taxexemptconfirmed") ' taxexempt field is for display only,use this field to determine if taxexempt
            dvid = drvSql("custid")
            international = drvSql("international")
            sinternational = drvSql("sinternational")
            Try
                dvcompanyname = drvSql("CompanyName")
            Catch ex As Exception

            End Try

			dvholdpayment = drvSql("holdpayment")
			dvallowpo = drvSql("allowpo")
			Try
				dvdollar11 = CDec(drvSql("dollar11"))

			Catch ex As Exception
			End Try
			Try
				dvdollar12 = CDec(drvSql("dollar12"))
			Catch ex As Exception
			End Try
			Try
				dvdollar13 = CDec(drvSql("dollar13"))
			Catch ex As Exception
			End Try
			dollartot = dvdollar11 + dvdollar12 + dvdollar13
			Try
				dvstate = drvSql("state").ToString
                dvzipcode = drvSql("postalcode").ToString()
                dvszipcode = drvSql("spostalcode").ToString
			Catch ex As Exception

			End Try
		Next
		'see if cust has orders if not new cust
		selectcmd = "SELECT distinct  orderid from orders where orders.customerid='" & dvid & "';"
		Me.DSSQLCUST.SelectCommand = selectcmd

		Try
			dvSql1 = CType(Me.DSSQLCUST.Select(DataSourceSelectArguments.Empty), Data.DataView)
		Catch ex As Exception

		End Try
		Dim vordid As Integer
		For Each drvSql1 In dvSql1

			vordid = drvSql1("orderid")

		Next
		Dim newcust As Boolean
		If dvSql1.Count > 0 Or dollartot > 0 Or dvallowpo = True Then
			newcust = False
		Else
			newcust = True

		End If



		If dvpassword = cPassword Then
			'Session.Add("user", dvusername)

			'Session.Add("emailaddress", dvusername)
			'Session.Add("userzip", dvzipcode)
			'Session.Add("taxexempt", dvtaxexempt)
			'Session.Add("state", dvstate)
			'Session.Add("id", dvid)
			e.Authenticated = True
			If IsNothing(Session("ShoppingCart")) Then
				Dim SC As New ShoppingCart
				Dim lt As New LookUpTable
				SC.IsCs = dvIsCS
				SC.HoldPayment = dvholdpayment
				SC.NewOrg = newcust				   'used to determine taxexempt status
				SC.CompanyName = dvcompanyname
				SC.loginid = dvid
				SC.username = dvusername
				SC.useremail = dvemailaddress ' Session("emailaddress")
                SC.userzip = IIf(IsNothing(dvszipcode), dvzipcode, dvszipcode)   'Session("userzip")
				SC.taxexempt = dvtaxexempt 'Session("taxexempt")
                SC.state = dvstate 'Session("state")
                If international = True Then
                    SC.International = True
                ElseIf sinternational = True Then
                    SC.International = True
                End If
				If SC.IsCs <> True Then
					SC.custid = dvid 'Session("id")
				Else
					SC.custid = 0
				End If
				SC.LoggedIn = True
				SC.taxrate = lt.Gettax(SC.userzip)
				Session.Add("ShoppingCart", SC)	'contains orderdetail table and options table and any other tables I create in the new sub of shopping cart
				Session.Add("LookUp", lt) 'contains product table and eventually option tables in it.


			Else 'shopping cart has been created already
				Dim Sc1 As ShoppingCart = Session("ShoppingCart")
				Dim lt1 As LookUpTable = Session("LookUp")
				Sc1.IsCs = dvIsCS
				Session.Add("IsCs", dvIsCS)
				Sc1.username = dvusername
				Sc1.loginid = dvid
				Sc1.NewOrg = newcust
				Sc1.HoldPayment = dvholdpayment
				Sc1.useremail = dvemailaddress ' Session("emailaddress")
                Sc1.userzip = IIf(IsNothing(dvszipcode), dvzipcode, dvszipcode) ' Session("userzip")
				Sc1.taxexempt = dvtaxexempt	' Session("taxexempt")
				Sc1.state = dvstate	' Session("state")
                Sc1.CompanyName = dvcompanyname
                If international = True Then
                    Sc1.International = True
                ElseIf sinternational = True Then
                    Sc1.International = True
                End If
				If Sc1.IsCs <> True Then
					Sc1.custid = dvid 'Session("id")
				Else
					Sc1.custid = 0
				End If
				Sc1.taxrate = lt1.Gettax(Sc1.userzip)
				Sc1.LoggedIn = True
				Session("ShoppingCart") = Sc1 'contains orderdetail table and options table and any other tables I create in the new sub of shopping cart
				Session("LookUp") = lt1	'contains product table and eventually option tables in it



			End If
			Session.Remove("e")
			Session.Remove("login")
			If dvIsCS = True Then
				Session.Remove("checkout")
				Login1.DestinationPageUrl = "~/Admin/Admin.aspx"
			End If
			If Session("checkout") = True Then
				Session.Remove("checkout")
				Login1.DestinationPageUrl = "invoice.aspx"
				'Response.Redirect("Invoice.aspx")

			End If
		Else
			e.Authenticated = False
            Me.Login1.FailureText = "Invalid PassWord"

			Return
		End If





	End Sub

    
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        Response.Redirect("NewOrg.aspx")
    End Sub

   
    
   
    Protected Sub Page_Disposed(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Disposed
        'make sure session is remove
        Session.Remove("checkout")
    End Sub

  
   
   
    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Response.Redirect("NewIndv.aspx")
    End Sub

  

	
	Protected Sub ordstatus_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ordstatus.Click
		Response.Redirect("~/CustomerOrders.aspx")
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
	Private Sub SetLabel(ByVal Sc As Object)

		If SC.username <> "GUEST" Then
			label1.Text = "Welcome, " & SC.username
			label1.Visible = True
		Else
			label1.Visible = False
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

    Protected Sub Button3_Click(sender As Object, e As System.EventArgs) Handles Button3.Click
        EmailTaxForm()
    End Sub

    Protected Sub LoginButton_Click(sender As Object, e As System.EventArgs)

    End Sub
End Class
