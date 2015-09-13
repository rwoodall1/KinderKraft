Imports Microsoft.VisualBasic
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
Partial Class NewOrg
    Inherits webformbase
	Protected Sub Page_Load1(sender As Object, e As System.EventArgs) Handles Me.Load
		Dim txtPassword As TextBox = FormView1.FindControl("txtpassword")
        Dim txtPassword2 As TextBox = FormView1.FindControl("txtpassword2")
        If Not IsPostBack Then
            Dim chkemailsubscriber As CheckBox = FormView1.FindControl("chkemailsubscriber")
            Try
                chkemailsubscriber.Checked = True
            Catch ex As Exception

            End Try
        End If
		If IsPostBack Then
			If Not String.IsNullOrEmpty(txtPassword.Text.Trim()) Then
				txtPassword.Attributes.Add("value", txtPassword.Text)
				txtPassword2.Attributes.Add("value", txtPassword2.Text)
			End If
		End If
	End Sub
    Protected Sub DSCust_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles DSCust.Inserted


        Dim dvSql As New DataView
        Dim drvSql As DataRowView
        Dim username As TextBox = FormView1.FindControl("txtusername1")
        Dim useremail As TextBox = FormView1.FindControl("txtemail")
        Dim txtzip As TextBox = FormView1.FindControl("txtzip")
        Dim chktaxexempt As CheckBox = FormView1.FindControl("chktaxexempt")
        Dim state As DropDownList = FormView1.FindControl("ddlstate")
        Dim SC As ShoppingCart
        Dim lt As LookUpTable
        If IsNothing(Session("ShoppingCart")) Then
            SC = New ShoppingCart
            lt = New LookUpTable
        Else
            SC = Session("ShoppingCart")
            lt = Session("LookUp")
        End If
        SC.useremail = Trim(useremail.Text)
        SC.userzip = txtzip.Text
        SC.taxexempt = chktaxexempt.Checked
        SC.state = state.SelectedValue
		SC.taxrate = lt.Gettax(SC.userzip)

        'get custid and set --------------------------------------------------------------------------------------------------------------------------------------------------
        
        Dim selectcmd As String
        selectcmd = "SELECT distinct  cust.iscs,cust.username,cust.EmailAddress,international, password,postalcode,taxexempt,state,custid from cust where cust.username='" & Trim(username.Text) & "';"
        Me.DSSQLCUST.SelectCommand = selectcmd

        Try
            dvSql = CType(Me.DSSQLCUST.Select(DataSourceSelectArguments.Empty), Data.DataView)
        Catch ex As Exception

            Return
        End Try

        If dvSql.Table.Rows.Count > 0 Then
            Dim dvusername As String = ""
            Dim dvIsCS As Boolean
            Dim dvemailaddress As String = ""
            Dim dvpassword As String = ""
            Dim dvzipcode As String = ""
            Dim dvtaxexempt As Boolean = False
            Dim dvstate As String = ""
            Dim dvintrnational As Boolean = False
            Dim dvid As Integer = 0
            For Each drvSql In dvSql
                dvemailaddress = drvSql("EmailAddress").ToString()
                dvIsCS = drvSql("iscs")
                dvusername = drvSql("username").ToString()
                dvpassword = drvSql("password").ToString()
                dvzipcode = drvSql("postalcode").ToString()
                dvtaxexempt = drvSql("taxexempt")
                dvstate = drvSql("state")
                dvid = drvSql("custid")
                dvintrnational = drvSql("international")
            Next

            SC.IsCs = dvIsCS
            SC.username = dvusername
            SC.useremail = dvemailaddress
            SC.userzip = dvzipcode
			SC.taxexempt = False 'always false for new user until taxexempt confirmed
            SC.state = dvstate
            SC.International = dvintrnational
            If SC.International Then
                SC.shipmethod = "INTERNATIONAL"
            End If
			SC.custid = dvid
			SC.NewOrg = True
            SC.LoggedIn = True
            SC.taxrate = lt.Gettax(SC.userzip)
            Session.Add("ShoppingCart", SC) 'contains orderdetail table and options table and any other tables I create in the new sub of shopping cart
            Session.Add("LookUp", lt) 'contains product table and eventually option tables in it.
            EmailTaxForm()
            WelcomeEmail()
            Response.Redirect("scart.aspx")
        Else
            'would not be this far if record did not insert
        End If
    End Sub

    Function username() As Boolean
        Dim dvSql As New DataView
        Dim retval As Boolean = False
        Dim txtusername1 As TextBox = FormView1.FindControl("txtusername1")
        
        Dim selectcmd As String
        selectcmd = "SELECT distinct cust.EmailAddress,custid from cust where cust.username='" & txtusername1.Text & "';"
        Me.DSSQLCUST.SelectCommand = selectcmd

        Try
            dvSql = CType(Me.DSSQLCUST.Select(DataSourceSelectArguments.Empty), Data.DataView)
        Catch ex As Exception

            Return retval
        End Try
        Dim btninsert As Button = FormView1.FindControl("btninsert")
        If dvSql.Table.Rows.Count > 0 Then
            retval = False 'name exist choose another
        Else
            retval = True

        End If
        ''-----------------------------
        Return retval
    End Function

    Protected Sub txtusername_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.username()
    End Sub

    Protected Sub valName_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs)
        args.IsValid = Me.username()

    End Sub

    Protected Sub WelcomeEmail()
        Dim objMM As New MailMessage
        Dim tomail As String
        Dim smtpclient As String
        Dim cpassword As String
        Dim cuser As String
        Dim newuser As String = ""
        Dim newuserpassword As String = ""
        Try
            Dim vusertxtbox As TextBox = FormView1.FindControl("txtusername1")
            newuser = vusertxtbox.Text
            Dim vuserPasswordtxtbox As TextBox = FormView1.FindControl("txtpassword")
            newuserpassword = vuserPasswordtxtbox.Text
        Catch ex As Exception

        End Try

        If Directory.Exists("F:\IsDev") Then 'set dev settings
            smtpclient = "smtp.embarqmail.com"
            cuser = "wdal_farm@embarqmail.com"
            cpassword = "briggitt"
            tomail = "wdal_farm@embarqmail.com"
        Else 'live
            smtpclient = "192.168.1.245"
            cuser = "authnet@memorybook.com"
            cpassword = "authnet"
        End If
        'Set the properties
        Dim txtemail As TextBox = FormView1.FindControl("txtemail") 'validation will not let this be empty
        Dim emailto As String = Trim(txtemail.Text)
        objMM.To.Add(emailto)

        objMM.From = New MailAddress("kinderkraftcs@jostens.com", "Jostens Kinderkraft")

        'Send the email in text format
        objMM.IsBodyHtml = True

        'Set the subject
        objMM.Subject = "Welcome to Jostens Kinderkraft!"
        Dim vbody As String = "Thank you for creating an account with Jostens Kinderkraft®. The Kinderkraft® collection is your source for daycare," _
                              & "preschool, kindergarten, and elementary graduation items. <br/><br/> Your username: " & newuser & "<br/> Your password: " & newuserpassword & "<br/><br/>" _
                              & "From your account you can view orders and account information. To place your order, " _
                              & "return to www.jostenskinderkraft.com and login to proceed. If you have placed an order, thank you for your business.<br/> <br/>" _
                              & "If you have any questions, please see our frequently asked questions (<a href=http://www.jostenskinderkraft.com/frequently_asked_questions.html > Frequently Asked Questions</a> ) page," _
                              & "or call 855-826-2355.<br/><br/><br/><br/> Sincerely, <br/> Ashley Grandfield<br/> Jostens Kinderkraft® Customer Service"

        objMM.Body = vbody

        Dim smtp As New SmtpClient(smtpclient)
        smtp.Credentials = New NetworkCredential(cuser, cpassword)
        Try
            'smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some servers
            smtp.Send(objMM)
        Catch

        End Try

    End Sub

    Protected Sub EmailTaxForm()
        Dim fileupload1 As FileUpload = FormView1.FindControl("fileupload1")
        Dim companyname As TextBox = FormView1.FindControl("txtcompanyname")
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
                smtpclient = "smtp.embarqmail.com"
                cuser = "wdal_farm@embarqmail.com"
                cpassword = "briggitt"
                tomail = "wdal_farm@embarqmail.com"
            Else 'live
                smtpclient = "192.168.1.245"
                cuser = "authnet@memorybook.com"
                cpassword = "authnet"
            End If
            'Set the properties

			objMM.To.Add("kinderkraftcs@jostens.com") 'Cs address
			'objMM.To.Add("wdalfarm@embarqmail.com") 'for testing remove when done
            objMM.From = New MailAddress("kinderkraftcs@jostens.com")
            objMM.Attachments.Add(New Attachment(attachementpath))
            'Send the email in text format
            objMM.IsBodyHtml = True

            'Set the subject
            objMM.Subject = "TaxId Form "

            objMM.Body = "Attached is a taxid form from " & companyname.Text

            Dim smtp As New SmtpClient(smtpclient)
            smtp.Credentials = New NetworkCredential(cuser, cpassword)
            Try
                'smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some servers
                smtp.Send(objMM)
            Catch

            End Try
        End If
    End Sub

    Protected Sub chktaxexempt_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim chktaxexempt As CheckBox = FormView1.FindControl("chktaxexempt")
		Dim txttaxid As TextBox = FormView1.FindControl("Textbox5")
		Dim holdlpayment As HiddenField = FormView1.FindControl("hfholdpayment")
		If chktaxexempt.Checked = True Then
			holdlpayment.Value = 1
		Else
			holdlpayment.Value = 0
		End If
        If chktaxexempt.Checked = True Then
            txttaxid.Enabled = True
        Else
            txttaxid.Enabled = False
            txttaxid.Text = ""
        End If
    End Sub

	Protected Sub chktaxexempt_CheckedChanged1(sender As Object, e As System.EventArgs)
		Dim chktaxexempt As CheckBox = FormView1.FindControl("chktaxexempt")
		Dim holdlpayment As HiddenField = FormView1.FindControl("hfholdpayment")
		Dim txttaxid As TextBox = FormView1.FindControl("Textbox5")

		If chktaxexempt.Checked = True Then
			holdlpayment.Value = 1
		Else
			holdlpayment.Value = 0
		End If
		If chktaxexempt.Checked = True Then
			txttaxid.Enabled = True
		Else
			txttaxid.Enabled = False
			txttaxid.Text = ""
		End If
	End Sub


	
   

    Protected Sub chkemailsubscriber_CheckedChanged(sender As Object, e As System.EventArgs)

    End Sub

    

  

   
   

    Protected Sub Page_PreRenderComplete(sender As Object, e As System.EventArgs) Handles Me.PreRenderComplete
        'Try


        '    Select Case sender.id.ToString

        '        Case "txtstate"
        '            Try
        '                Dim ddlstate As DropDownList = FormView1.FindControl("ddlstate")
        '                ddlstate.SelectedValue = sender.text.ToString.ToUpper

        '            Catch ex As Exception

        '            End Try

        '    End Select
        'Catch ex As Exception

        'End Try
    End Sub

    

	Protected Sub ddlcountryins_SelectedIndexChanged(sender As Object, e As System.EventArgs)
        Dim ddlcountry As DropDownList = sender
		Dim chkinternational As CheckBox = FormView1.FindControl("CheckBox112")
		Try
            If ddlcountry.SelectedValue <> "US" Then
                chkinternational.Checked = True
            ElseIf ddlcountry.SelectedValue = "US" Then
                chkinternational.Checked = False

            End If
		Catch ex As Exception

		End Try
	End Sub

	Protected Sub CheckBox112_CheckedChanged(sender As Object, e As System.EventArgs)
		Dim RequiredFieldValidator7 As RequiredFieldValidator = FormView1.FindControl("RequiredFieldValidator7")
		Dim chk As CheckBox = sender
        Dim ddlcountryins As DropDownList = FormView1.FindControl("ddlcountry")
        Dim txtstate As TextBox = FormView1.FindControl("txtstate")
        Dim ddlstate As DropDownList = FormView1.FindControl("ddlstate")
		If chk.Checked = True Then
            RequiredFieldValidator7.Enabled = False
            txtstate.Visible = True
            ddlstate.Visible = False
		Else
            RequiredFieldValidator7.Enabled = True
            txtstate.Visible = False
            ddlstate.Visible = True
		End If
		Try
			If chk.Checked = False Then
				ddlcountryins.SelectedValue = "US"
			End If
		Catch ex As Exception

		End Try
	End Sub

    Protected Sub CheckBox1112_CheckedChanged(sender As Object, e As EventArgs)
        Dim RequiredFieldValidator77 As RequiredFieldValidator = FormView1.FindControl("RequiredFieldValidator7")
        Dim chk As CheckBox = sender
        Dim ddlcountryins As DropDownList = FormView1.FindControl("ddlcountryedt")
        Dim txtstate As TextBox = FormView1.FindControl("txtstateedt")
        Dim ddlstate As DropDownList = FormView1.FindControl("ddlstateedt")
        If chk.Checked = True Then
            RequiredFieldValidator77.Enabled = False
            txtstate.Visible = True
            ddlstate.Visible = False
        Else
            RequiredFieldValidator77.Enabled = True
            txtstate.Visible = False
            ddlstate.Visible = True
        End If
        Try
            If chk.Checked = False Then
                ddlcountryins.SelectedValue = "US"
            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub cvcountry_ServerValidate(source As Object, args As ServerValidateEventArgs)
        Dim retval As Boolean = True
        Dim CheckBox112 As CheckBox = FormView1.FindControl("CheckBox112")
        Dim ddlcountryins As DropDownList = FormView1.FindControl("ddlcountryins")
        Try
            If CheckBox112.Checked Then
                If ddlcountryins.SelectedValue = "US" Then
                    retval = False
                End If
            End If
        Catch ex As Exception

        End Try
        args.IsValid = retval
    End Sub
End Class
