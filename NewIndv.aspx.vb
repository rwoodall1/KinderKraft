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
Partial Class NewIndv
    Inherits webformbase


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
        SC.taxexempt = False
        SC.state = state.SelectedValue
        SC.taxrate = lt.Gettax(SC.userzip)
        'get custid and set --------------------------------------------------------------------------------------------------------------------------------------------------
       
        Dim selectcmd As String
        selectcmd = "SELECT distinct  cust.iscs,cust.username,cust.EmailAddress,state,companyname,international, password,postalcode,taxexempt,state,custid from cust where cust.username='" & Trim(username.Text) & "';"
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
            Dim dvid As Integer = 0
            Dim dvinternational As Boolean = False
            For Each drvSql In dvSql
                dvemailaddress = drvSql("EmailAddress").ToString()
                dvIsCS = drvSql("iscs")
                dvusername = drvSql("username").ToString()
                dvpassword = drvSql("password").ToString()
                dvzipcode = drvSql("postalcode").ToString()
                dvtaxexempt = drvSql("taxexempt")
                dvinternational = drvSql("international")
                'dvstate = drvSql("state")
                dvid = drvSql("custid")
            Next

            SC.IsCs = dvIsCS
            SC.username = dvusername
            SC.useremail = dvemailaddress
            SC.userzip = dvzipcode
			SC.taxexempt = False 'always false for a new user and indv.
            SC.state = dvstate
            SC.custid = dvid
            SC.LoggedIn = True
            SC.International = dvinternational
            If SC.International Then
                SC.shipmethod = "INTERNATIONAL"
            End If
            SC.taxrate = lt.Gettax(SC.userzip)
            Session.Add("ShoppingCart", SC) 'contains orderdetail table and options table and any other tables I create in the new sub of shopping cart
            Session.Add("LookUp", lt) 'contains product table and eventually option tables in it.

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
        Dim vbody As String = "Thank you for creating an account with Jostens Kinderkraft®. The Kinderkraft® collection is your source for daycare, " _
            & "preschool, kindergarten, and elementary graduation items. <br/><br/> Your username: " & newuser & "<br/> Your password: " & newuserpassword & "<br/><br/>" _
            & "From your account you can view orders and account information. To place your order, " _
            & "return to www.jostenskinderkraft.com and login to proceed. If you have placed an order, thank you for your business.<br/> <br/>" _
            & "If you have any questions, please see our <a href=http://www.jostenskinderkraft.com/frequently_asked_questions.html > Frequently Asked Questions</a>  page, " _
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


   




    Protected Sub txtstate_TextChanged(sender As Object, e As System.EventArgs)
        'Dim txtstate As TextBox = FormView1.FindControl("txtstate")
        'Dim ddlstate As DropDownList = FormView1.FindControl("ddlstate")

        'If txtstate.Text.Length > 0 And UniqueState(txtstate.Text) = True Then
        '    dsstates.InsertCommand = "INSERT INTO states(name) VALUES (upper('" & txtstate.Text & "'))"
        '    Try
        '        dsstates.Insert()
        '        ViewState.Add("stateinsert", txtstate.Text)
        '        FormView1.DataBind()



        '    Catch ex As Exception
        '        ddlstate.Visible = True
        '        txtstate.Visible = False
        '    End Try
        'Else

        'End If
    End Sub


    Private Function UniqueState(txtval As String) As Boolean
        Dim retval As Boolean
        ddsstates1.SelectCommand = "Select * from states where name=upper('" & txtval & "')"
        Dim dvSql As New DataView
        Try
            dvSql = CType(Me.ddsstates1.Select(DataSourceSelectArguments.Empty), DataView)
        Catch ex As Exception
        End Try
        If dvSql.Count > 0 Then
            retval = False
        Else
            retval = True
        End If
        Return retval
    End Function

	Protected Sub Page_Load1(sender As Object, e As System.EventArgs) Handles Me.Load
		Page.Response.AppendHeader("Cache-Control", "no-store, no-cache, must-revalidate, post-check=0, pre-check=0")
		Page.MaintainScrollPositionOnPostBack = True
		If Not IsPostBack Then
			Dim chkemailsubscriber As CheckBox = FormView1.FindControl("chkemailsubscriber")
			Try
				chkemailsubscriber.Checked = True
			Catch ex As Exception

			End Try
		End If
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

   
   

    
	Protected Sub CheckBox1_CheckedChanged(sender As Object, e As System.EventArgs)
		Dim RequiredFieldValidator7 As RequiredFieldValidator = FormView1.FindControl("RequiredFieldValidator7")
        Dim chk As CheckBox = sender
        Dim txtstate As TextBox = FormView1.FindControl("txtstate")
        Dim ddlstate As DropDownList = FormView1.FindControl("ddlstate")
		Dim ddlcountryins As DropDownList = FormView1.FindControl("ddlcountryins")
		If chk.Checked = True Then
            RequiredFieldValidator7.Enabled = False
            ddlstate.Visible = False
            txtstate.Visible = True
		Else
            RequiredFieldValidator7.Enabled = True
            ddlstate.Visible = True
            txtstate.Visible = False
            ddlcountryins.SelectedValue = "US"
		End If
    End Sub

	
	Protected Sub ddlcountryins_SelectedIndexChanged(sender As Object, e As System.EventArgs)
		Dim ddlcountryins As DropDownList = sender
		Dim chkinternational As CheckBox = FormView1.FindControl("CheckBox1")
		Try
			If ddlcountryins.SelectedValue <> "US" Then
				chkinternational.Checked = True
			ElseIf ddlcountryins.SelectedValue = "US" Then
				chkinternational.Checked = False
			End If
		Catch ex As Exception

		End Try
	End Sub

	
	Protected Sub ddlcountryedt_SelectedIndexChanged(sender As Object, e As System.EventArgs)
		Dim ddlcountryedt As DropDownList = sender
		Dim chkinternationaledt As CheckBox = FormView1.FindControl("CheckBox2")
		Try
			If ddlcountryedt.SelectedValue <> "US" Then
				chkinternationaledt.Checked = True
			ElseIf ddlcountryedt.SelectedValue = "US" Then
				chkinternationaledt.Checked = False
			End If
		Catch ex As Exception

		End Try
	End Sub

	Protected Sub CheckBox2_CheckedChanged(sender As Object, e As System.EventArgs)

        Dim chk As CheckBox = sender
        Dim txtstateedt As TextBox = FormView1.FindControl("txtstateedt")
        Dim ddlstateedt As DropDownList = FormView1.FindControl("ddlstateedt")
        Dim ddlcountryinsedt As DropDownList = FormView1.FindControl("ddlcountryinsedt")

        If chk.Checked = True Then
            ddlstateedt.Visible = False
            txtstateedt.Visible = True
        Else

            ddlstateedt.Visible = True
            txtstateedt.Visible = False
            ddlcountryinsedt.SelectedValue = "US"
        End If
    End Sub
    Protected Sub cvcountry_ServerValidate(source As Object, args As ServerValidateEventArgs)
        Dim retval As Boolean = True
        Dim CheckBox112 As CheckBox = FormView1.FindControl("CheckBox1")
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
