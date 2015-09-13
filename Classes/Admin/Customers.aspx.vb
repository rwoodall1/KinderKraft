Imports MySql
Imports MySql.Data.MySqlClient
Imports System.Data
Imports System.IO

Partial Class Admin_Customers
    Inherits webformbase


    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        'page load gets query string and sets filter
        If txtsearch.Text = "" Or IsNothing(txtsearch.Text) Then
            Response.Redirect("customers.aspx")
        Else
            Response.Redirect("customers.aspx?custid=" & txtsearch.Text)
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Dim LinkButton1 As LinkButton = DirectCast(Master.FindControl("LinkButton1"), LinkButton)
        Page.MaintainScrollPositionOnPostBack = True
        If IsNothing(Session("ShoppingCart")) Then

            Response.Redirect("../login.aspx")
        Else
            Dim sc As ShoppingCart = Session("ShoppingCart")
            If sc.IsCs = False Then
                Response.Redirect("../shopjostenshome.aspx")
            Else
                LinkButton1.Visible = sc.IsCs
            End If


            If IsNothing(Session("user")) Then
                Session.Add("user", "GUEST") 'logged in as guest
            End If
        End If

        Dim custid As String = Request.QueryString("custid")
        Dim cmdtext As String
        If IsNothing(custid) Then
            cmdtext = "select * from cust;"
        Else
            cmdtext = "select * from cust where custid =" & custid & ";"
        End If

        dscust.SelectCommand = cmdtext

    End Sub

    Protected Sub Button5_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim txtcustid As Label = FormView1.FindControl("Label1")
        Dim custid As String = txtcustid.Text
        Response.Redirect("~/Admin/CustOrders.aspx?custid=" & custid)
    End Sub



    Protected Sub Button6_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim RequiredFieldValidator1 As RequiredFieldValidator = FormView1.FindControl("RequiredFieldValidator1")
        RequiredFieldValidator1.Enabled = False
        FormView1.ChangeMode(FormViewMode.ReadOnly)
    End Sub





    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        FormView1.ChangeMode(FormViewMode.Edit)
        'FormView1.DataBind()


    End Sub


    Protected Sub dscust_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles dscust.Inserted
        Dim command As String = "Select Last_Insert_ID()"
        Dim cmd As New MySqlCommand(command, CType(e.Command.Connection, MySql.Data.MySqlClient.MySqlConnection))

        Dim newid As Integer = cmd.ExecuteScalar()
        Response.Redirect("customers.aspx?custid=" & newid)
        'dscust.SelectCommand = "SELECT * FROM cust c where custid=" & newid & ";"
    End Sub





    Protected Sub btneditcancel_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        FormView1.ChangeMode(FormViewMode.ReadOnly)
        FormView1.DataBind()
    End Sub



    Protected Sub btnnewrec_Click(ByVal sender As Object, ByVal e As System.EventArgs)


        FormView1.ChangeMode(FormViewMode.Insert)
        'FormView1.DataBind()
        'FormView1_ModeChanged(sender, e)

    End Sub

    Protected Sub btninsertcancel_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        FormView1.ChangeMode(FormViewMode.ReadOnly)
        FormView1.DataBind()

    End Sub

    Protected Sub Button6_Click1(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim txtbcompanyname As TextBox = FormView1.FindControl("Textbox3")
        Dim txtscompanyname As TextBox = FormView1.FindControl("Textbox11")
        txtscompanyname.Text = txtbcompanyname.Text
        Dim txtbfname As TextBox = FormView1.FindControl("fname")
        Dim txtsfname As TextBox = FormView1.FindControl("Textbox122")
        txtsfname.Text = txtbfname.Text
        Dim txtblname As TextBox = FormView1.FindControl("Textbox2")
        Dim txtslname As TextBox = FormView1.FindControl("Textbox13")
        txtslname.Text = txtblname.Text
        Dim txtbaddr1 As TextBox = FormView1.FindControl("Textbox44")
        Dim txtsaddr1 As TextBox = FormView1.FindControl("Textbox14")
        txtsaddr1.Text = txtbaddr1.Text
        Dim txtbaddr2 As TextBox = FormView1.FindControl("Textbox55")
        Dim txtsaddr2 As TextBox = FormView1.FindControl("Textbox15")
        txtsaddr2.Text = txtbaddr2.Text
        Dim txtbcity As TextBox = FormView1.FindControl("TextBox6")
        Dim txtscity As TextBox = FormView1.FindControl("TextBox16")
        txtscity.Text = txtbcity.Text
        Dim ddlbstate As DropDownList = FormView1.FindControl("DropDownList11")
        Dim ddlsstate As DropDownList = FormView1.FindControl("DropDownList31")
        ddlsstate.SelectedValue = ddlbstate.SelectedValue
        Dim txtbzip As TextBox = FormView1.FindControl("Textbox77")
        Dim txtszip As TextBox = FormView1.FindControl("Textbox1888")
        txtszip.Text = txtbzip.Text
        Dim txtbphone As TextBox = FormView1.FindControl("Textbox8")
        Dim txtsphone As TextBox = FormView1.FindControl("Textbox17")
        txtsphone.Text = txtbphone.Text
        Dim country As TextBox = FormView1.FindControl("TextBox1891226")
        Dim scountry As TextBox = FormView1.FindControl("TextBox1891225")
        scountry.Text = country.Text
        Dim txtstate As TextBox = FormView1.FindControl("TextBox18901")
        Dim stxtstate As TextBox = FormView1.FindControl("TextBox18911")
        stxtstate.Text = txtstate.Text
    End Sub

    Protected Sub Button7_Click(sender As Object, e As System.EventArgs) Handles Button7.Click
        Dim custid As String = FormView1.DataKey("custid")
        Response.Redirect("~/Admin/PhoneLog.aspx?custid=" & custid)
    End Sub



    Protected Sub Button8_Click(sender As Object, e As System.EventArgs)
        Dim msg As String = "Are you sure you want to delete this customer record?"
        MsgBox1.Show( _
      "Delete Customer", msg, Nothing, New EO.Web.MsgBoxButton("Yes", Nothing, "Yes"), New EO.Web.MsgBoxButton("No"))
    End Sub
    Protected Sub DeleteCustomer()
        Dim vcustid As Label = FormView1.FindControl("label1")
        Dim commandtext As String = "DELETE FROM cust WHERE (custid =" & vcustid.Text & ")"
        dscust.DeleteCommand = commandtext
        dscust.Delete()
    End Sub

    Protected Sub chkinter21_CheckedChanged(sender As Object, e As System.EventArgs)


    End Sub


    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As System.EventArgs)


        Dim ddlstate As DropDownList = FormView1.FindControl("dropdownlist1")
        Dim txtstate As TextBox = FormView1.FindControl("TextBox1890")

        If ddlstate.SelectedValue = "add" Then
            ddlstate.Visible = False
            txtstate.Visible = True
        Else
            ddlstate.Visible = True
            txtstate.Visible = False
        End If

    End Sub



    Protected Sub TextBox1890_TextChanged(sender As Object, e As System.EventArgs)
        Dim txtstate As TextBox = FormView1.FindControl("TextBox1890")
        Dim ddlstate As DropDownList = FormView1.FindControl("dropdownlist1")

        If txtstate.Text.Length > 0 And UniqueState(txtstate.Text) = True Then
            dsstates.InsertCommand = "INSERT INTO states(name) VALUES (upper('" & txtstate.Text & "'))"
            Try
                dsstates.Insert()
                ViewState.Add("editinsertstate", txtstate.Text)
                FormView1.DataBind()
                'sender.text = txtstate.Text
                'Page_PreRenderComplete(sender, e)
                'ddlstate.Visible = True
                'txtstate.Visible = False


            Catch ex As Exception
                ddlstate.Visible = True
                txtstate.Visible = False
            End Try
        Else
            ViewState.Add("editinsertstate", txtstate.Text)
            FormView1.DataBind()
            'ddlstate.Visible = True
            'txtstate.Visible = False
        End If
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




    Protected Sub TextBox18901_TextChanged(sender As Object, e As System.EventArgs)
        Dim txtstate As TextBox = FormView1.FindControl("TextBox18901")
        Dim ddlstate As DropDownList = FormView1.FindControl("dropdownlist11")

        If txtstate.Text.Length > 0 And UniqueState(txtstate.Text) = True Then
            dsstates.InsertCommand = "INSERT INTO states(name) VALUES (upper('" & txtstate.Text & "'))"
            Try
                dsstates.Insert()
                'ddlstate.Visible = True
                ViewState.Add("Iinsertstate", txtstate.Text)
                FormView1.DataBind()
                'sender.text = txtstate.Text
                'Page_PreRenderComplete(sender, e)
                'txtstate.Visible = False
            Catch ex As Exception
                ddlstate.Visible = True
                txtstate.Visible = False
            End Try
        Else
            ViewState.Add("Iinsertstate", txtstate.Text)
            FormView1.DataBind()
            'ddlstate.Visible = True
            'txtstate.Visible = False
        End If
    End Sub

    Protected Sub DropDownList11_SelectedIndexChanged(sender As Object, e As System.EventArgs)


        Dim ddlstate As DropDownList = FormView1.FindControl("dropdownlist11")
        Dim txtstate As TextBox = FormView1.FindControl("TextBox18901")

        If ddlstate.SelectedValue = "add" Then
            ddlstate.Visible = False
            txtstate.Visible = True
        Else
            ddlstate.Visible = True
            txtstate.Visible = False
        End If
    End Sub




    Protected Sub Page_PreRenderComplete(sender As Object, e As System.EventArgs) Handles Me.PreRenderComplete
        ''updates the drop list with current value
        'Try


        '    Select Case sender.id.ToString

        '        Case "TextBox18901"
        '            Try
        '                Dim ddlstate As DropDownList = FormView1.FindControl("dropdownlist11")
        '                ddlstate.SelectedValue = sender.text.ToString.ToUpper

        '            Catch ex As Exception

        '            End Try
        '        Case "TextBox18911"
        '            Try
        '                Dim ddlstate As DropDownList = FormView1.FindControl("dropdownlist31")
        '                ddlstate.SelectedValue = sender.text.ToString.ToUpper

        '            Catch ex As Exception

        '            End Try
        '        Case "TextBox1890"
        '            Try
        '                Dim ddlstate As DropDownList = FormView1.FindControl("dropdownlist1")
        '                ddlstate.SelectedValue = sender.text.ToString.ToUpper

        '            Catch ex As Exception

        '            End Try
        '        Case "TextBox1891"
        '            Try
        '                Dim ddlstate As DropDownList = FormView1.FindControl("dropdownlist3")
        '                ddlstate.SelectedValue = sender.text.ToString.ToUpper

        '            Catch ex As Exception

        '            End Try

        '    End Select
        'Catch ex As Exception

        'End Try
    End Sub

    Protected Sub TextBox18911_TextChanged(sender As Object, e As System.EventArgs)
        Dim txtstate As TextBox = FormView1.FindControl("TextBox18911")
        Dim ddlstate As DropDownList = FormView1.FindControl("dropdownlist31")

        If txtstate.Text.Length > 0 And UniqueState(txtstate.Text) = True Then
            dsstates.InsertCommand = "INSERT INTO states(name) VALUES (upper('" & txtstate.Text & "'))"
            Try
                dsstates.Insert()

                'ddlstate.Visible = True
                'FormView1.DataBind()
                ViewState.Add("Iinsertsstate", txtstate.Text)
                FormView1.DataBind()
                'sender.text = txtstate.Text
                'Page_PreRenderComplete(sender, e)
                'txtstate.Visible = False
            Catch ex As Exception
                ddlstate.Visible = True
                txtstate.Visible = False
            End Try
        Else
            ViewState.Add("Iinsertsstate", txtstate.Text)
            FormView1.DataBind()
            'ddlstate.Visible = True
            'txtstate.Visible = False
        End If
    End Sub

    Protected Sub DropDownList31_SelectedIndexChanged(sender As Object, e As System.EventArgs)

        Dim ddlstate As DropDownList = FormView1.FindControl("dropdownlist31")
        Dim txtstate As TextBox = FormView1.FindControl("TextBox18911")

        If ddlstate.SelectedValue = "add" Then
            ddlstate.Visible = False
            txtstate.Visible = True
        Else
            ddlstate.Visible = True
            txtstate.Visible = False
        End If
    End Sub

    Protected Sub TextBox1891_TextChanged(sender As Object, e As System.EventArgs)
        Dim txtstate As TextBox = FormView1.FindControl("TextBox1891")
        Dim ddlstate As DropDownList = FormView1.FindControl("dropdownlist3")

        If txtstate.Text.Length > 0 And UniqueState(txtstate.Text) = True Then
            dsstates.InsertCommand = "INSERT INTO states(name) VALUES (upper('" & txtstate.Text & "'))"
            Try
                dsstates.Insert()
                'ddlstate.Visible = True
                'FormView1.DataBind()
                ViewState.Add("editinsertsstate", txtstate.Text)
                FormView1.DataBind()
                'sender.text = txtstate.Text
                'Page_PreRenderComplete(sender, e)
                'txtstate.Visible = False
            Catch ex As Exception
                ddlstate.Visible = True
                txtstate.Visible = False
            End Try
        Else
            ViewState.Add("editinsertsstate", txtstate.Text)
            FormView1.DataBind()
            'ddlstate.Visible = True
            'txtstate.Visible = False
        End If
    End Sub

    Protected Sub DropDownList3_SelectedIndexChanged(sender As Object, e As System.EventArgs)
        Dim ddlstate As DropDownList = FormView1.FindControl("dropdownlist3")
        Dim txtstate As TextBox = FormView1.FindControl("TextBox1891")

        If ddlstate.SelectedValue = "add" Then
            ddlstate.Visible = False
            txtstate.Visible = True
        Else
            ddlstate.Visible = True
            txtstate.Visible = False
        End If
    End Sub

    Protected Sub DropDownList31_DataBound(sender As Object, e As System.EventArgs)
        Dim ddlstate As DropDownList = FormView1.FindControl("dropdownlist31")
        If Not IsNothing(ViewState("Iinsertsstate")) Then
            ddlstate.SelectedValue = ViewState("Iinsertsstate")
        End If
    End Sub

    Protected Sub DropDownList3_DataBound(sender As Object, e As System.EventArgs)
        Dim ddlstate As DropDownList = FormView1.FindControl("dropdownlist3")
        If Not IsNothing(ViewState("editinsertsstate")) Then
            ddlstate.SelectedValue = ViewState("editinsertsstate")

        End If
    End Sub

    Protected Sub DropDownList1_DataBound(sender As Object, e As System.EventArgs)
        Dim ddlstate As DropDownList = sender ' FormView1.FindControl("dropdownlist1")
        If Not IsNothing(ViewState("editinsertstate")) Then
            ddlstate.SelectedValue = ViewState("editinsertstate")

        End If
    End Sub

    Protected Sub DropDownList11_DataBound(sender As Object, e As System.EventArgs)

        Dim ddlstate As DropDownList = FormView1.FindControl("dropdownlist11")
        If Not IsNothing(ViewState("Iinsertstate")) Then
            ddlstate.SelectedValue = ViewState("Iinsertstate")
        End If
    End Sub

    Protected Sub FormView1_ItemUpdated(sender As Object, e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormView1.ItemUpdated
        FormView1.DataBind()
    End Sub


    Protected Sub btnsvinsert_Click(sender As Object, e As System.EventArgs)

    End Sub

    Protected Sub dscust_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles dscust.Inserting
        Dim a As String = e.Command.Parameters("companyname").Value
    End Sub
    Function username() As Boolean
        Dim dvSql As New DataView
        Dim retval As Boolean = False
        Dim TextBox20 As TextBox = FormView1.FindControl("TextBox20")
        Dim txtusername1 As TextBox = FormView1.FindControl("txtusername1")
        
        Dim selectcmd As String
        selectcmd = "SELECT distinct cust.EmailAddress,custid from cust where cust.username='" & TextBox20.Text & "';"
        Me.DSSQLCUST.SelectCommand = selectcmd

        Try
            dvSql = CType(Me.DSSQLCUST.Select(DataSourceSelectArguments.Empty), DataView)
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


    Protected Sub MsgBox1_ButtonClick(sender As Object, e As System.Web.UI.WebControls.CommandEventArgs) Handles MsgBox1.ButtonClick
        If e.CommandName = "Yes" Then
            DeleteCustomer()
        End If
    End Sub

    Protected Sub valName1_ServerValidate(source As Object, args As System.Web.UI.WebControls.ServerValidateEventArgs)
        args.IsValid = Me.username()
    End Sub

    Protected Sub valName2_ServerValidate(source As Object, args As System.Web.UI.WebControls.ServerValidateEventArgs)
        args.IsValid = Me.username()
    End Sub

    'Protected Sub FormView1_PreRender(sender As Object, e As System.EventArgs) Handles FormView1.PreRender a way to bind dropdown so you have control over exception when the data is not in list.

    '    If FormView1.CurrentMode = FormViewMode.Edit Then
    '        Dim rowView As DataRowView = CType(FormView1.DataItem, DataRowView)
    '        If Not IsNothing(rowView) AndAlso Not IsNothing(CType(FormView1.FindControl("DropDownList1"), DropDownList).Items.FindByValue(rowView("state").ToString())) Then
    '            'CType(FormView1.FindControl("DropDownList1"), DropDownList).SelectedValue = rowView("state").ToString()
    '            Dim thedropdownlist As DropDownList = FormView1.FindControl("DropDownList1")
    '            thedropdownlist.SelectedValue=<%bind("state")%>
    '        End If
    '    End If
    'End Sub


End Class
