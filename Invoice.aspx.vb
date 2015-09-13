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
Imports System.IO
Imports System.Activities.Statements
Imports AuthorizeNet




Partial Class Invoice
    Inherits webformbase
   
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
          Page.Response.AppendHeader("Cache-Control", "no-store, no-cache, must-revalidate, post-check=0, pre-check=0")
        Page.MaintainScrollPositionOnPostBack = True


        Dim SC As ShoppingCart 'if we got this far we know there is a session(shopping cart)
        Dim lt As LookUpTable
        If Not IsPostBack Then
            If IsNothing(Session("ShoppingCart")) Then 'check to be sure haven't time out
                Session.Add("SessionError", "Your session has ended. Please reorder your products.")
                Response.Redirect("Error.aspx")
            Else 'may or may not be logged in
                SC = Session("ShoppingCart")
                lt = Session("LookUp")
                If SC.International Then
                    Response.Redirect("intinvoice.aspx")
                End If
                If SC.username <> "GUEST" Then
                    If SC.AdminGuest <> True Then
                        DSCust.SelectCommand = "SELECT * FROM cust where custid=" & SC.custid
                        FormView1.ChangeMode(FormViewMode.Edit)
                        'FormView1.DataBind()

                    Else
                        If Session("guestloggedin") Then 'cust record has been created
                            SC = Session("ShoppingCart")
                            lt = Session("LookUp")
                            If SC.International Then
                                Response.Redirect("intinvoice.aspx")
                            End If
                            DSCust.SelectCommand = "SELECT * FROM cust where custid=" & SC.custid
                            FormView1.ChangeMode(FormViewMode.Edit)
                            'FormView1.DataBind()

                        Else 'cust not created
                            FormView1.ChangeMode(FormViewMode.Insert)
                            'FormView1.DataBind()

                        End If
                    End If

                Else 'is a guest
                    If Session("guestloggedin") Then 'cust record has been created
                        SC = Session("ShoppingCart")
                        lt = Session("LookUp")
                        If SC.International Then
                            Response.Redirect("intinvoice.aspx")
                        End If
                        DSCust.SelectCommand = "SELECT * FROM cust where custid=" & SC.custid
                        FormView1.ChangeMode(FormViewMode.Edit)
                        'FormView1.DataBind()

                    Else 'cust not created
                        FormView1.ChangeMode(FormViewMode.Insert)
                        'FormView1.DataBind()

                    End If

                End If 'not guest

            End If

        Else 'is postback
            If Session("guestloggedin") Then 'cust record has been created
                SC = Session("ShoppingCart")
                lt = Session("LookUp")
                If SC.International Then
                    Response.Redirect("intinvoice.aspx")
                End If
                DSCust.SelectCommand = "SELECT * FROM cust where custid=" & SC.custid
                FormView1.ChangeMode(FormViewMode.Edit)
                'FormView1.DataBind()

                Session("guestloggedin") = False
            End If
        End If

    End Sub
    

	Protected Sub Button1_Click2(ByVal sender As Object, ByVal e As System.EventArgs)
		Page.Validate()
		If Page.IsValid Then

			'insert button
			Dim SC As ShoppingCart = Session("ShoppingCart")
			Dim LT As LookUpTable = Session("LookUp")
			Dim connection1 As New MySqlConnection(LT.ConnectStr)
            Dim custid As Integer
            Dim izip As Integer
            Dim email As TextBox = FormView1.FindControl("emailaddress")
            If Not IsNothing(email) Then
                SC.useremail = email.Text
            Else
                SC.useremail = ""
            End If

            Dim commandtext As String = "INSERT INTO cust(fname, lname, EmailAddress, CompanyName, billingaddr1, billingaddr2, city, state, postalcode,country,scountry, phonenumber," _
             & "refby, sfname, slname, scompanyname, saddr1, saddr2, scity, sstate, spostalcode, sphonenumber,username)" _
             & "VALUES (upper(@fname),upper(@lname), @emailaddress, upper(@companyname), @billingaddr1, @billingaddr2,upper(@city), @state, @postalcode,upper(@country),upper(@scountry), @phonenumber, @refby, upper(@sfname),upper(@slname)," _
             & "upper(@scompanyname), @saddr1, @saddr2, @scity, @sstate, @spostalcode, @sphonenumber,'GUEST')"
			Dim cmd As MySqlCommand = New MySqlCommand(commandtext, connection1)

            Dim fname As TextBox = FormView1.FindControl("fnameins")
			cmd.Parameters.AddWithValue("@fname", fname.Text)
            Dim lname As TextBox = FormView1.FindControl("lnameins")
			cmd.Parameters.AddWithValue("@lname", lname.Text)
            Dim emailaddress As TextBox = FormView1.FindControl("emailaddressins")
			cmd.Parameters.AddWithValue("@emailaddress", emailaddress.Text)
            Dim companyname As TextBox = FormView1.FindControl("companyins")
			cmd.Parameters.AddWithValue("@companyname", companyname.Text)
            Dim billingaddr1 As TextBox = FormView1.FindControl("addr1ins")
			cmd.Parameters.AddWithValue("@billingaddr1", billingaddr1.Text)
            Dim billingaddr2 As TextBox = FormView1.FindControl("addr2ins")
			cmd.Parameters.AddWithValue("@billingaddr2", billingaddr2.Text)
            Dim city As TextBox = FormView1.FindControl("cityins")
            cmd.Parameters.AddWithValue("@city", city.Text)


            cmd.Parameters.AddWithValue("@country", "US")


            cmd.Parameters.AddWithValue("@scountry", "US")
            Dim state As DropDownList = FormView1.FindControl("ddlstateins")
                    cmd.Parameters.AddWithValue("@state", state.SelectedValue)
            Dim postalcode As TextBox = FormView1.FindControl("zipins")
            cmd.Parameters.AddWithValue("@postalcode", postalcode.Text)
            Dim phonenumber As TextBox = FormView1.FindControl("phonenumberins")
            cmd.Parameters.AddWithValue("@phonenumber", phonenumber.Text)
            Dim refby As DropDownList = FormView1.FindControl("ddlhearins")
            cmd.Parameters.AddWithValue("@refby", refby.SelectedValue)
            Dim sfname As TextBox = FormView1.FindControl("sfnameshpins")
            cmd.Parameters.AddWithValue("@sfname", sfname.Text)
            Dim slname As TextBox = FormView1.FindControl("slnameshpins")
            cmd.Parameters.AddWithValue("@slname", slname.Text)
            Dim scompanyname As TextBox = FormView1.FindControl("scompanyshpins")
            cmd.Parameters.AddWithValue("@scompanyname", scompanyname.Text)
            Dim sbillingaddr1 As TextBox = FormView1.FindControl("saddr1shpins")
            cmd.Parameters.AddWithValue("@saddr1", sbillingaddr1.Text)
            Dim sbillingaddr2 As TextBox = FormView1.FindControl("saddr2shpins")
            cmd.Parameters.AddWithValue("@saddr2", sbillingaddr2.Text)
            Dim scity As TextBox = FormView1.FindControl("scityshpins")
            cmd.Parameters.AddWithValue("@scity", scity.Text)
            Dim sstate As DropDownList = FormView1.FindControl("sddlstateshpins")
					cmd.Parameters.AddWithValue("@sstate", sstate.SelectedValue)
            Dim spostalcode As TextBox = FormView1.FindControl("szipshpins")
            Try
                izip = CInt(spostalcode.Text)
                If izip > 99500 And izip < 99951 Then
                    SC.shipmethod = "AK/HI"

                ElseIf izip > 96700 And izip < 96899 Then
                    SC.shipmethod = "AK/HI"
                End If

            Catch ex As Exception

            End Try
            cmd.Parameters.AddWithValue("@spostalcode", spostalcode.Text)
            Dim sphonenumber As TextBox = FormView1.FindControl("sphoneshpins")
            cmd.Parameters.AddWithValue("@sphonenumber", sphonenumber.Text)
            Try

                connection1.Open()
            Catch ex As Exception 'connection failed
                Session.Add("SessionError", ex.Message)
                Session.Add("errexception", ex)
                Response.Redirect("Error.aspx")

            End Try

            Try
                'insert or update cust
                cmd.ExecuteNonQuery()
                commandtext = "Select Last_Insert_ID();"
                cmd = New MySqlCommand(commandtext, connection1)
                custid = CInt(cmd.ExecuteScalar())
                SC.custid = custid
                Session.Add("guestloggedin", True)


            Catch ex As Exception 'sql failed
                Session.Add("SessionError", ex.Message)
                Session.Add("errexception", ex)
                Response.Redirect("Error.aspx")
            Finally
                connection1.Close()

            End Try

            Dim zip As TextBox = FormView1.FindControl("zipins")


            SC.taxrate = LT.Gettax(zip.Text)
            SC.userzip = spostalcode.Text
            Session("ShoppingCart") = SC
            Session("Lookup") = LT
            Response.Redirect("secure/invoice3.aspx?custid=" & custid.ToString)
            'Response.Redirect("secure.jostenskinderkraft.com/invoice3.aspx?custid=" & custid.ToString)

        End If
	End Sub

    Protected Sub FormView1_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormView1.ItemUpdated
        Dim SC As ShoppingCart = Session("ShoppingCart") 'we have a cust id when we get this far
		'Response.Redirect("secure.jostenskinderkraft.com/invoice3.aspx?custid=" & SC.custid)
		Response.Redirect("secure/invoice3.aspx?custid=" & SC.custid)
    End Sub

    Protected Sub FormView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormView1.ItemInserted
        Dim SC As ShoppingCart = Session("ShoppingCart") 'we have a cust id when we get this far
		Session.Add("guestloggedin", True)
		'Response.Redirect("secure.jostenskinderkraft.com/invoice3.aspx?custid=" & SC.custid)
		Response.Redirect("secure/invoice3.aspx?custid=" & SC.custid)
    End Sub

    Protected Sub DSCust_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles DSCust.Updated

    End Sub

    Protected Sub btninsertcopy_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim fname As TextBox = FormView1.FindControl("fnameins")
        Dim lname As TextBox = FormView1.FindControl("lnameins")
        Dim companyname As TextBox = FormView1.FindControl("companyins")
        Dim billingaddr1 As TextBox = FormView1.FindControl("addr1ins")
        Dim billingaddr2 As TextBox = FormView1.FindControl("addr2ins")
        Dim city As TextBox = FormView1.FindControl("cityins")
        Dim country As DropDownList = FormView1.FindControl("ddlcountryins")
        Dim state As DropDownList = FormView1.FindControl("ddlstateins")
        Dim postalcode As TextBox = FormView1.FindControl("zipins")
        Dim phonenumber As TextBox = FormView1.FindControl("phonenumberins")
        Dim schname As TextBox = FormView1.FindControl("companyins")
        Dim refby As DropDownList = FormView1.FindControl("ddlhearins")

        Dim sfname As TextBox = FormView1.FindControl("sfnameshpins")
        sfname.Text = fname.Text
        Dim slname As TextBox = FormView1.FindControl("slnameshpins")
        slname.Text = lname.Text
        Dim scompanyname As TextBox = FormView1.FindControl("scompanyshpins")
        scompanyname.Text = companyname.Text
        Dim sbillingaddr1 As TextBox = FormView1.FindControl("saddr1shpins")
        sbillingaddr1.Text = billingaddr1.Text
        Dim sbillingaddr2 As TextBox = FormView1.FindControl("saddr2shpins")
        sbillingaddr2.Text = billingaddr2.Text
        Dim scity As TextBox = FormView1.FindControl("scityshpins")
        scity.Text = city.Text
       
        Dim sstate As DropDownList = FormView1.FindControl("sddlstateshpins")
        sstate.SelectedValue = state.SelectedValue
        Dim spostalcode As TextBox = FormView1.FindControl("szipshpins")
        spostalcode.Text = postalcode.Text
        Dim sphonenumber As TextBox = FormView1.FindControl("sphoneshpins")
        sphonenumber.Text = phonenumber.Text
    End Sub

    Protected Sub btnupdate_Click(ByVal sender As Object, ByVal e As System.EventArgs)
		'update(buttone)
		Page.Validate()

        If Page.IsValid Then
            Dim SC As ShoppingCart = Session("ShoppingCart")
            Dim LT As LookUpTable = Session("LookUp")
            Dim connection1 As New MySqlConnection(LT.ConnectStr)
            Dim izip As Integer
            Dim commandtext As String = "UPDATE cust SET fname =upper(@fname), lname = upper(@lname),country=upper(@country),scountry=upper(@scountry), CompanyName =upper(@companyname), billingaddr1 = @billingaddr1, billingaddr2 = @billingaddr2, city = upper(@city), state = @state," _
   & "postalcode = @postalcode, phonenumber = @phonenumber,   refby = @refby, sfname = @sfname,emailaddress=@emailaddress," _
   & "slname =upper(@slname), scompanyname =upper(@scompanyname), saddr1 = @saddr1, saddr2 = @saddr2, scity =upper(@scity), sstate = @sstate, spostalcode = @spostalcode, sphonenumber = @sphonenumber" _
   & " WHERE (custid =" & SC.custid & ");"
            Dim cmd As MySqlCommand = New MySqlCommand(commandtext, connection1)
           
            cmd.Parameters.AddWithValue("@country", "US")
            Dim fname As TextBox = FormView1.FindControl("fnameedt")
            cmd.Parameters.AddWithValue("@fname", fname.Text)
            Dim lname As TextBox = FormView1.FindControl("lnameedt")
            cmd.Parameters.AddWithValue("@lname", lname.Text)
            Dim companyname As TextBox = FormView1.FindControl("companyedt")
            cmd.Parameters.AddWithValue("@companyname", companyname.Text)
            Dim billingaddr1 As TextBox = FormView1.FindControl("addr1edt")
            cmd.Parameters.AddWithValue("@billingaddr1", billingaddr1.Text)
            Dim billingaddr2 As TextBox = FormView1.FindControl("addr2edt")
            cmd.Parameters.AddWithValue("@billingaddr2", billingaddr2.Text)
            Dim city As TextBox = FormView1.FindControl("cityedt")
            cmd.Parameters.AddWithValue("@city", city.Text)
            Dim phonenumber As TextBox = FormView1.FindControl("phonenumberedt")
            cmd.Parameters.AddWithValue("@phonenumber", phonenumber.Text)
            Dim ddlstate As DropDownList = FormView1.FindControl("ddlstateedt")
            Dim txtstate As TextBox = FormView1.FindControl("txtstateedt")

            cmd.Parameters.AddWithValue("@state", ddlstate.SelectedValue)

        Dim postalcode As TextBox = FormView1.FindControl("zipedt")
        cmd.Parameters.AddWithValue("@postalcode", postalcode.Text)
        Dim emailaddress As TextBox = FormView1.FindControl("EmailAddressedt")
        cmd.Parameters.AddWithValue("@emailaddress", emailaddress.Text)


        'shipping
            cmd.Parameters.AddWithValue("@scountry", "US")
            Dim sfname As TextBox = FormView1.FindControl("sfnameshipedt")
        cmd.Parameters.AddWithValue("@sfname", sfname.Text)
        Dim slname As TextBox = FormView1.FindControl("slnameshpedt")
        cmd.Parameters.AddWithValue("@slname", slname.Text)
        Dim scompanyname As TextBox = FormView1.FindControl("scompanyshpedt")
        cmd.Parameters.AddWithValue("@scompanyname", scompanyname.Text)
        Dim sbillingaddr1 As TextBox = FormView1.FindControl("saddr1shpedt")
        cmd.Parameters.AddWithValue("@saddr1", sbillingaddr1.Text)
        Dim sbillingaddr2 As TextBox = FormView1.FindControl("saddr2shpedt")
        cmd.Parameters.AddWithValue("@saddr2", sbillingaddr2.Text)
        Dim scity As TextBox = FormView1.FindControl("scityshpedt")
            cmd.Parameters.AddWithValue("@scity", scity.Text)
            Dim ddlsstate As DropDownList = FormView1.FindControl("ddlstateshpedt")
            cmd.Parameters.AddWithValue("@sstate", ddlsstate.SelectedValue)
            Dim spostalcode As TextBox = FormView1.FindControl("szipshpedt")
            Try
                izip = CInt(spostalcode.Text)
                If izip > 99500 And izip < 99951 Then
                    SC.shipmethod = "AK/HI"

                ElseIf izip > 96700 And izip < 96899 Then
                    SC.shipmethod = "AK/HI"
                End If

            Catch ex As Exception

            End Try
        cmd.Parameters.AddWithValue("@spostalcode", spostalcode.Text)
        Dim sphonenumber As TextBox = FormView1.FindControl("sphoneshpedt")
        cmd.Parameters.AddWithValue("@sphonenumber", sphonenumber.Text)
        Dim refby As DropDownList = FormView1.FindControl("ddlhearedt")
        cmd.Parameters.AddWithValue("@refby", refby.SelectedValue)

        Try

            connection1.Open()
        Catch ex As Exception 'connection failed
            Session.Add("SessionError", ex.Message)
            Session.Add("errexception", ex)
            Response.Redirect("Error.aspx")

        End Try

        Try
            'update(cust)
            cmd.ExecuteNonQuery()

            Session.Add("guestloggedin", True)


        Catch ex As Exception 'sql failed
            Session.Add("SessionError", ex.Message)
            Session.Add("errexception", ex)
            connection1.Close()
            Response.Redirect("Error.aspx")
        Finally
            connection1.Close()

        End Try

        Dim szip As TextBox = FormView1.FindControl("szip")

        'SC.taxexempt = taxexempt.Checked
        SC.taxrate = LT.Gettax(spostalcode.Text)
        SC.userzip = spostalcode.Text
        Response.Redirect("secure/invoice3.aspx?custid=" & SC.custid.ToString)
        'Response.Redirect("https://www.secure.jostenskinderkraft.com/secure/invoice3.aspx?custid=" & SC.custid.ToString)
        End If
    End Sub

	Protected Sub btneditcopy_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim fname As TextBox = FormView1.FindControl("fnameedt")
        Dim lname As TextBox = FormView1.FindControl("lnameedt")
        Dim companyname As TextBox = FormView1.FindControl("companyedt")
        Dim billingaddr1 As TextBox = FormView1.FindControl("addr1edt")
        Dim billingaddr2 As TextBox = FormView1.FindControl("addr2edt")
        Dim city As TextBox = FormView1.FindControl("cityedt")
        Dim state As DropDownList = FormView1.FindControl("ddlstateedt")
        Dim postalcode As TextBox = FormView1.FindControl("zipedt")
        Dim phonenumber As TextBox = FormView1.FindControl("phonenumberedt")



        Dim sfname As TextBox = FormView1.FindControl("sfnameshipedt")
        sfname.Text = fname.Text
        Dim slname As TextBox = FormView1.FindControl("slnameshpedt")
        slname.Text = lname.Text
        Dim scompanyname As TextBox = FormView1.FindControl("scompanyshpedt")
        scompanyname.Text = companyname.Text
        Dim sbillingaddr1 As TextBox = FormView1.FindControl("saddr1shpedt")
		sbillingaddr1.Text = billingaddr1.Text
        Dim sbillingaddr2 As TextBox = FormView1.FindControl("saddr2shpedt")
		sbillingaddr2.Text = billingaddr2.Text
        Dim scity As TextBox = FormView1.FindControl("scityshpedt")
		scity.Text = city.Text
        Dim sstate As DropDownList = FormView1.FindControl("ddlstateshpedt")
        sstate.SelectedValue = state.SelectedValue
        Dim spostalcode As TextBox = FormView1.FindControl("szipshpedt")
		spostalcode.Text = postalcode.Text
        Dim sphonenumber As TextBox = FormView1.FindControl("sphoneshpedt")
		sphonenumber.Text = phonenumber.Text
	End Sub

    Protected Sub Page_Unload(sender As Object, e As System.EventArgs) Handles Me.Unload
        Dim SC As ShoppingCart = Session("ShoppingCart")
        Dim shipzip As TextBox = FormView1.FindControl("szipshpedt")

        Try
            Dim izip As Integer = CInt(shipzip.Text)
            If izip > 99500 And izip < 99951 Then
                SC.shipmethod = "AK/HI"
            ElseIf izip > 96700 And izip < 96899 Then
                SC.shipmethod = "AK/HI"
            Else
                If SC.shipmethod = "AK/HI" Then
                    SC.shipmethod = "STANDARD"
                End If
            End If

        Catch ex As Exception

        End Try

    End Sub

    'Edit PAGE______________________________________________________________________________________________________________________
    '__________________________________________________________________________________________________________________________________


    'INSERT PAGE______________________________________________________________________________________________________________________
    '__________________________________________________________________________________________________________________________________

   

    
    
  
    Protected Sub chkint2edt_CheckedChanged(sender As Object, e As EventArgs)
        Dim chkint2edt As CheckBox = sender
        Dim sc As ShoppingCart = Session("ShoppingCart")
        If chkint2edt.Checked = True Then
            sc.International = True
            Session("ShoppingCart") = sc
            Response.Redirect("intinvoice.aspx")
        End If
    End Sub

    Protected Sub chkintshpedt_CheckedChanged(sender As Object, e As EventArgs)
        Dim sc As ShoppingCart = Session("ShoppingCart")
        Dim chkintshpedt As CheckBox = sender
        If chkintshpedt.Checked = True Then
            sc.International = True
            Session("ShoppingCart") = sc
            Response.Redirect("intinvoice.aspx")
        End If
    End Sub

    Protected Sub chkinterins_CheckedChanged(sender As Object, e As EventArgs)
        Dim sc As ShoppingCart = Session("ShoppingCart")
        Dim chkinterins As CheckBox = sender
        If chkinterins.Checked = True Then
            sc.International = True
            Session("ShoppingCart") = sc
            Response.Redirect("intinvoice.aspx")
        End If
    End Sub

    Protected Sub chkintshpins_CheckedChanged(sender As Object, e As EventArgs)
        Dim sc As ShoppingCart = Session("ShoppingCart")
        Dim chkintshpins As CheckBox = sender
        If chkintshpins.Checked = True Then
            sc.International = True
            Session("ShoppingCart") = sc
            Response.Redirect("intinvoice.aspx")
        End If
    End Sub
End Class
