Imports System.Data
Imports MySql.Data.MySqlClient
Imports AuthorizeNet
Imports System.IO
Imports System.Net.Mail
Imports System.Net

Partial Class OrderSearch
    Inherits webformbase

    Protected Sub gv1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gv1.RowDataBound
        'took out column left code in case I put it back in
        'Dim a As String = ""

        ''dsorderdetail.SelectCommand = "SELECT orderid, orderdetailid, productcode, productname, quantity, prodprice, totalprice, pkgid FROM orderdetail WHERE (orderid = @orderid);"
        'Try 'have to use try because I have paging enabled, creates rows with out cells and then bombs
        '    a = e.Row.Cells(4).Text
        '    If a = "0.00" Then
        '        e.Row.Cells(0).Enabled = False
        '    End If
        'Catch ex As Exception

        'End Try
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
            opd.DataSource = dsorderoptions
            opd.DataBind()

        Catch ex As Exception

            opd.DataSource = Nothing
            opd.DataBind()
            Return
        End Try
    End Sub
	Protected Sub Button3_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.PreRender
		Try

			Dim orderid As String = DetailsView2.DataKey("orderid")
			'Response.Redirect("~/PrintReceipt.aspx?orderid=" & orderid)
			Dim url As String = "~/PrintReceipt.aspx?orderid=" & orderid
			url = Page.ResolveClientUrl(url)
			Button3.OnClientClick = "window.open('" & url & "'); return false;"
		Catch ex As Exception

		End Try
	End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		LoadLic()
        If Not IsPostBack Then
            ViewState.Add("selectcmd", dscust.SelectCommand)
            Dim hforderstatus As HiddenField = FormView2.FindControl("hforderstatus")
            Dim ddlshipmeth As DropDownList = DetailsView2.FindControl("ddlshipmeth")
            If IsNothing(Session("ShoppingCart")) Then

                Response.Redirect("../login.aspx")
            
            'Dim SC As New ShoppingCart
            'Dim lt As New LookUpTable

            'DropDownList1.Visible = SC.IsCs
            'If SC.IsCs = True Then
            '    FormView2.ChangeMode(FormViewMode.Edit)

            'Else
            '    FormView2.ChangeMode(FormViewMode.ReadOnly)
            'End If
            'Session.Add("ShoppingCart", SC) 'contains orderdetail table and options table and any other tables I create in the new sub of shopping cart
            'Session.Add("LookUp", lt) 'contains product table and eventually option tables in it.
        Else
                Dim SC As ShoppingCart = Session("ShoppingCart")
                If SC.IsCs = False Then
                    Response.Redirect("../login.aspx")
                Else
                    LinkButton1.Visible = SC.IsCs
                End If

            DropDownList1.Visible = SC.IsCs
            If SC.IsCs = True Then
                FormView2.ChangeMode(FormViewMode.Edit)

            Else
                FormView2.ChangeMode(FormViewMode.ReadOnly)
 Response.Redirect("../login.aspx")
            End If

        End If
		Else

			dscust.SelectCommand = ViewState("selectcmd")
        End If
    End Sub
    Protected Sub dsorderdetail_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles dsorderdetail.Updated
		DoTotal(False)
    End Sub
    Protected Sub dscust_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles dscust.Updated
        DetailsView2.DataBind()
        'called in detailsview1 itemupdated
		DoTotal(False)
	End Sub
	Protected Sub dscust_Updating(ByVal source As Object, ByVal e As SqlDataSourceCommandEventArgs) Handles dscust.Updating
		'this code changes the date format for mysql. The drivers are not doing it
		Dim orshpdate As String = e.Command.Parameters.Item("shpdate").Value
		Dim dshpdate As Date = CDate(orshpdate)
		Dim fshpdate As String = CStr(dshpdate.Year).Trim & "/" & CStr(dshpdate.Month).PadLeft(2, "0") & "/" & CStr(dshpdate.Day).PadLeft(2, "0")
		e.Command.Parameters.Item("shpdate").Value = fshpdate
	End Sub
    Protected Sub dsorderdetail_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles dsorderdetail.Deleted
		DoTotal(False)
    End Sub
    'Protected Sub DetailsView1_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles DetailsView1.Init

    '    If Not IsNothing(Session("ShoppingCart")) Then
    '        Dim sc As ShoppingCart = Session("ShoppingCart")
    '        DetailsView1.AutoGenerateEditButton = sc.IsCs
    '    End If

    'End Sub
    'Protected Sub DetailsView2_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles DetailsView2.Init
    '    Dim sc As ShoppingCart = Session("ShoppingCart")

    '    DetailsView2.AutoGenerateEditButton = sc.IsCs
    'End Sub
    Protected Sub DetailsView2_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsView2.ItemUpdated
		DoTotal(False)

        FormView2.DataBind()
    End Sub
    Protected Sub DetailsView1_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsView1.ItemUpdated
		DoTotal(False)
        FormView2.DataBind()
    End Sub
    Protected Sub CheckBox2_PreRender(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim chkcanceled As CheckBox = FormView2.FindControl("checkbox2")
        chkcanceled.Visible = chkcanceled.Checked
    End Sub
    Protected Sub DetailsView2_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles DetailsView2.ItemUpdating
		Dim zip As String = e.NewValues.Item("szip")
		Dim izip As Integer
        Dim ddlshipmeth As DropDownList = DetailsView2.FindControl("ddlshipmeth")
		'Dim cmd As String = "UPDATE orders SET scompanyname = @scompanyname, sfname = @sfname, slname = @slname, saddr = @saddr, sadd2 = @sadd2, scity = @scity, sstate = @sstate, szip = @szip,carrier=@carrier,trknumber=@trknumber, ponumber = @ponumber,shipmethod=@shipmethod, authnettranid = @authnettranid,authcode=@authcode,bo = @bo WHERE (orderid = @orderid)"
		'dscust.UpdateCommand = cmd
		Dim cshpdate As String = e.Keys.Item("shpdate")
		Dim nshpdate As String = e.NewValues.Item("shpdate")
		e.Keys.Item("shpdate") = nshpdate


        Try
            izip = CInt(zip)
            If izip > 99500 And izip < 99951 Then
                e.NewValues.Item("shipmethod") = "AK/HI"
                'this is changed so dototal function will work
                ddlshipmeth.SelectedValue = "AK/HI"
            ElseIf izip > 96700 And izip < 96899 Then

                e.NewValues.Item("shipmethod") = "AK/HI"
                'this is changed so dototal function will work
                ddlshipmeth.SelectedValue = "AK/HI"
            Else
                If ddlshipmeth.SelectedValue = "AK/HI" Then
					ddlshipmeth.SelectedValue = "STANDARD"
                End If
            End If

        Catch ex As Exception

        End Try
	End Sub
	Protected Sub btnrefresh_Click(sender As Object, e As System.EventArgs)
		Dim lblpromoamt As Label = FormView2.FindControl("lblpromoamt")
        Dim txtpromocode As TextBox = FormView2.FindControl("txtpromocode")
        Dim dstmporders As New SqlDataSource
		Dim txtordnotes As TextBox = FormView2.FindControl("TextBox1")
		Dim cknoshp As CheckBox = FormView2.FindControl("cknoshp")
		Dim noshp As Integer
		If cknoshp.Checked Then
			noshp = 1
		Else
			noshp = 0
		End If
		dstmporders.ConnectionString = dsOrders.ConnectionString
		Dim selectcmd As String = "Update orders set promocode=@promocode,discountamt=@discountamt, ordernotes=@ordernotes,noshp=@noshp where orderid=@orderid;"
        dstmporders.ProviderName = "MySql.Data.MySqlClient"
        dstmporders.UpdateParameters.Add("@promocode", txtpromocode.Text)
        dstmporders.UpdateParameters.Add("@ordernotes", txtordnotes.Text)
        dstmporders.UpdateParameters.Add("@discountamt", lblpromoamt.Text)
		dstmporders.UpdateParameters.Add("orderid", DetailsView2.DataKey("orderid"))
		dstmporders.UpdateParameters.Add("noshp", noshp)
        dstmporders.UpdateCommand = selectcmd
        dstmporders.UpdateCommandType = SqlDataSourceCommandType.Text
        dstmporders.Update()
        Dim a As Integer = DetailsView2.DataKey("orderid")
		DoTotal(False)
    End Sub
    Protected Sub txtpromocode_TextChanged(sender As Object, e As System.EventArgs)
        Dim lblpromoamt As Label = FormView2.FindControl("lblpromoamt")
        Dim txtpromocode As TextBox = FormView2.FindControl("txtpromocode")
        Dim dstmporders As New SqlDataSource
        Dim txtordnotes As TextBox = FormView2.FindControl("TextBox1")
        dstmporders.ConnectionString = dsOrders.ConnectionString
        Dim selectcmd As String = "Update orders set promocode=@promocode,discountamt=@discountamt, ordernotes=@ordernotes where orderid=@orderid;"
        dstmporders.ProviderName = "MySql.Data.MySqlClient"
        dstmporders.UpdateParameters.Add("@promocode", txtpromocode.Text)
        dstmporders.UpdateParameters.Add("@ordernotes", txtordnotes.Text)
        dstmporders.UpdateParameters.Add("@discountamt", lblpromoamt.Text)
        dstmporders.UpdateParameters.Add("orderid", DetailsView2.DataKey("orderid"))
        dstmporders.UpdateCommand = selectcmd
        dstmporders.UpdateCommandType = SqlDataSourceCommandType.Text
        dstmporders.Update()
		DoTotal(False)
    End Sub
    Protected Sub Button4_Click(sender As Object, e As System.EventArgs) Handles Button4.Click
        Dim custid As String = DetailsView1.DataKey("custid")
        Response.Redirect("~/Admin/PhoneLog.aspx?custid=" & custid)
    End Sub
    Protected Sub DetailsView1_ModeChanging(sender As Object, e As System.Web.UI.WebControls.DetailsViewModeEventArgs) Handles DetailsView1.ModeChanging
        Dim sc As ShoppingCart = Session("ShoppingCart")
        Dim custid As Integer = DetailsView1.DataKey("custid")
        sc.AdminCustLogin(custid)
        Session("ShoppingCart") = sc
    End Sub
    Protected Sub DetailsView1_ModeChanged(sender As Object, e As System.EventArgs) Handles DetailsView1.ModeChanged

    End Sub
    Protected Sub DetailsView2_ModeChanging(sender As Object, e As System.Web.UI.WebControls.DetailsViewModeEventArgs) Handles DetailsView2.ModeChanging
        Dim sc As ShoppingCart = Session("ShoppingCart")
        Dim custid As Integer = DetailsView1.DataKey("custid")
        sc.AdminCustLogin(custid)
        Session("ShoppingCart") = sc
    End Sub
    Protected Sub DropDownList1_DataBound(sender As Object, e As System.EventArgs)

        Dim dropdownlist1 As DropDownList = DetailsView2.FindControl("ddlstatus")
        If Not IsNothing(dropdownlist1) Then

            If dropdownlist1.SelectedValue = "PROCESSING" Then
                Dim ai As ListItem = dropdownlist1.Items.FindByValue("REFUND")
                Try
                    ai.Attributes.Add("style", "color:gray;")
                    ai.Attributes.Add("disabled", "true")
                    'i.Value = ""
                Catch ex As Exception 'already grayed out and disabled

                End Try
            End If
            If dropdownlist1.SelectedValue = "CAPTURE" Then
                Dim aii As ListItem = dropdownlist1.Items.FindByValue("PROCESSING")
                Try
                    aii.Attributes.Add("style", "color:gray;")
                    aii.Attributes.Add("disabled", "true")
                    'i.Value = ""
                Catch ex As Exception 'already grayed out and disabled

                End Try
            End If
            Dim aiii As ListItem = dropdownlist1.Items.FindByValue("ON HOLD")
            Try
                aiii.Attributes.Add("style", "color:gray;")
                aiii.Attributes.Add("disabled", "true")
                'i.Value = ""
            Catch ex As Exception 'already grayed out and disabled

            End Try
            Dim aiiii As ListItem = dropdownlist1.Items.FindByValue("PENDING")
            Try
                aiiii.Attributes.Add("style", "color:gray;")
                aiiii.Attributes.Add("disabled", "true")
                'i.Value = ""
            Catch ex As Exception 'already grayed out and disabled

            End Try



            If dropdownlist1.SelectedValue = "REFUND" Then
                Dim bi As ListItem = dropdownlist1.Items.FindByValue("PROCESSING")
                Try
                    bi.Attributes.Add("style", "color:gray;")
                    bi.Attributes.Add("disabled", "true")
                    'i.Value = ""
                Catch ex As Exception 'already grayed out and disabled

                End Try
                Dim bii As ListItem = dropdownlist1.Items.FindByValue("VOID")
                Try
                    bii.Attributes.Add("style", "color:gray;")
                    bii.Attributes.Add("disabled", "true")
                    'i.Value = ""
                Catch ex As Exception 'already grayed out and disabled

                End Try

                Dim biii As ListItem = dropdownlist1.Items.FindByValue("CAPTURE")
                Try
                    biii.Attributes.Add("style", "color:gray;")
                    biii.Attributes.Add("disabled", "true")
                    'i.Value = ""
                Catch ex As Exception 'already grayed out and disabled

                End Try
                Dim biiii As ListItem = dropdownlist1.Items.FindByValue("REFUND")
                Try
                    biiii.Attributes.Add("style", "color:gray;")
                    biiii.Attributes.Add("disabled", "true")
                    'i.Value = ""
                Catch ex As Exception 'already grayed out and disabled

                End Try

                Dim biiiii As ListItem = dropdownlist1.Items.FindByValue("ON HOLD")
                Try
                    biiiii.Attributes.Add("style", "color:gray;")
                    biiiii.Attributes.Add("disabled", "true")
                    'i.Value = ""
                Catch ex As Exception 'already grayed out and disabled

                End Try
                Dim biiiiii As ListItem = dropdownlist1.Items.FindByValue("PENDING")
                Try
                    biiiiii.Attributes.Add("style", "color:gray;")
                    biiiiii.Attributes.Add("disabled", "true")
                    'i.Value = ""
                Catch ex As Exception 'already grayed out and disabled

                End Try
            End If

            If dropdownlist1.SelectedValue = "VOID" Then
                Dim ci As ListItem = dropdownlist1.Items.FindByValue("PROCESSING")
                Try
                    ci.Attributes.Add("style", "color:gray;")
                    ci.Attributes.Add("disabled", "true")
                    'i.Value = ""
                Catch ex As Exception 'already grayed out and disabled

                End Try
                Dim cii As ListItem = dropdownlist1.Items.FindByValue("REFUND")
                Try
                    cii.Attributes.Add("style", "color:gray;")
                    cii.Attributes.Add("disabled", "true")
                    'i.Value = ""
                Catch ex As Exception 'already grayed out and disabled

                End Try

                Dim ciii As ListItem = dropdownlist1.Items.FindByValue("CAPTURE")
                Try
                    ciii.Attributes.Add("style", "color:gray;")
                    ciii.Attributes.Add("disabled", "true")
                    'i.Value = ""
                Catch ex As Exception 'already grayed out and disabled

                End Try
                Dim ciiii As ListItem = dropdownlist1.Items.FindByValue("ON HOLD")
                Try
                    ciiii.Attributes.Add("style", "color:gray;")
                    ciiii.Attributes.Add("disabled", "true")
                    'i.Value = ""
                Catch ex As Exception 'already grayed out and disabled

                End Try
                Dim ciiiii As ListItem = dropdownlist1.Items.FindByValue("PENDING")
                Try
                    ciiii.Attributes.Add("style", "color:gray;")
                    ciiii.Attributes.Add("disabled", "true")
                    'i.Value = ""
                Catch ex As Exception 'already grayed out and disabled

                End Try
            End If





            If dropdownlist1.SelectedValue = "ON HOLD" Then
                Dim di As ListItem = dropdownlist1.Items.FindByValue("PROCESSING")
                Try
                    di.Attributes.Add("style", "color:gray;")
                    di.Attributes.Add("disabled", "true")
                    'i.Value = ""
                Catch ex As Exception 'already grayed out and disabled

                End Try
                Dim dii As ListItem = dropdownlist1.Items.FindByValue("REFUND")
                Try
                    dii.Attributes.Add("style", "color:gray;")
                    dii.Attributes.Add("disabled", "true")
                    'i.Value = ""
                Catch ex As Exception 'already grayed out and disabled

                End Try
                Dim diii As ListItem = dropdownlist1.Items.FindByValue("CAPTURE")
                Try
                    diii.Attributes.Add("style", "color:gray;")
                    diii.Attributes.Add("disabled", "true")
                    'i.Value = ""
                Catch ex As Exception 'already grayed out and disabled

                End Try
                Dim diiii As ListItem = dropdownlist1.Items.FindByValue("VOID")
                Try
                    diiii.Attributes.Add("style", "color:gray;")
                    diiii.Attributes.Add("disabled", "true")
                    'i.Value = ""
                Catch ex As Exception 'already grayed out and disabled

                End Try
            End If
            If dropdownlist1.SelectedValue = "PENDING" Then
                Dim di As ListItem = dropdownlist1.Items.FindByValue("PROCESSING")
                Try
                    di.Attributes.Add("style", "color:gray;")
                    di.Attributes.Add("disabled", "true")
                    'i.Value = ""
                Catch ex As Exception 'already grayed out and disabled

                End Try
                Dim dii As ListItem = dropdownlist1.Items.FindByValue("REFUND")
                Try
                    dii.Attributes.Add("style", "color:gray;")
                    dii.Attributes.Add("disabled", "true")
                    'i.Value = ""
                Catch ex As Exception 'already grayed out and disabled

                End Try
                Dim diii As ListItem = dropdownlist1.Items.FindByValue("CAPTURE")
                Try
                    diii.Attributes.Add("style", "color:gray;")
                    diii.Attributes.Add("disabled", "true")
                    'i.Value = ""
                Catch ex As Exception 'already grayed out and disabled

                End Try
                Dim diiii As ListItem = dropdownlist1.Items.FindByValue("VOID")
                Try
                    diiii.Attributes.Add("style", "color:gray;")
                    diiii.Attributes.Add("disabled", "true")
                    'i.Value = ""
                Catch ex As Exception 'already grayed out and disabled

                End Try
            End If
        End If
    End Sub
    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        Dim cval As String = DropDownList1.SelectedValue.ToString
        Select Case cval
            Case "Delete Order"
                MsgBox1.Show("Delete Order", "Are you sure you want to deleted this order?", Nothing, New EO.Web.MsgBoxButton("Yes", Nothing, "YesDelete"), New EO.Web.MsgBoxButton("No", Nothing, "No"))
                'delete order called for msgbox click event


            Case "OrderHold"
                Dim orderid As String = DetailsView2.DataKey("orderid")
                If Not IsNothing(orderid) Then
                    Dim command As String = "UPDATE orders SET onhold = 1,orderstatus='ON HOLD' WHERE (orderid =" & orderid.ToString & ");"
                    dsorders1.UpdateCommand = command
                    dsorders1.Update()
                    DetailsView2.DataBind()
                    FormView2.DataBind()
                End If
            Case "OffHold"
                Dim orderid As String = DetailsView2.DataKey("orderid")
                If Not IsNothing(orderid) Then
                    Dim command As String = "UPDATE orders SET onhold = 0, orderstatus='PROCESSING' WHERE (orderid =" & orderid.ToString & ");"
                    dsorders1.UpdateCommand = command
                    dsorders1.Update()
                    DetailsView2.DataBind()
                    FormView2.DataBind()
                End If
            Case "orderemailcs"
                Dim cid As String = DetailsView1.DataKey("custid")
                Dim orderid As String = DetailsView2.DataKey("orderid")

                Dim newpage As String = "~/Receipt.aspx?customerid=" & cid & "&orderid=" & orderid & "&CS=True"
                Response.Redirect(newpage)
            Case "orderemailall" 'just customer
                Dim cid As String = DetailsView1.DataKey("custid")
                Dim orderid As String = DetailsView2.DataKey("orderid")

                Dim newpage As String = "~/Receipt.aspx?customerid=" & cid & "&orderid=" & orderid & "&CS=False"
                Response.Redirect(newpage)
            Case "Pending"
                Dim orderid As String = DetailsView2.DataKey("orderid")
                If Not IsNothing(orderid) Then
                    Dim command As String = "UPDATE orders SET onhold = 1,orderstatus='PENDING' WHERE (orderid =" & orderid.ToString & ");"
                    dsorders1.UpdateCommand = command
                    dsorders1.Update()
                    DetailsView2.DataBind()
                    FormView2.DataBind()
                End If
			Case "TRKINFO"
				Dim orderid As String = DetailsView2.DataKey("orderid")
				EmailTrkInfo(orderid)

		End Select
	End Sub
	Private Sub EmailTrkInfo(orderid As String)
		Dim connectstring As String = ConfigurationManager.ConnectionStrings("KK5").ToString	   '"server=192.168.1.101;User Id=root;Password=3l3phant1;database=testkinderkraft5;Persist Security Info=True"
		Dim conn As MySqlConnection = New MySqlConnection(connectstring)
        Dim cmdstr As String = "Select orderid,trknumber,shpdate,carrier,semailaddress,sfname,slname,total,saddr,sadd2,scity,sstate,szip,howshp from orders where orderid=@orderid;"
		Dim cmd As New MySqlCommand(cmdstr, conn)
        Dim carrier, trknumber, semailaddress, sfname, slname, saddr, sadd2, scity, sstate, szip, howshp, total As String
        Dim shpdate As DateTime
		Dim reader As MySqlDataReader
		'Get data for email 


		cmd.Parameters.Clear()
		cmd.Parameters.AddWithValue("@orderid", orderid)
		Try
			conn.Open()
			reader = cmd.ExecuteReader()
			'Set values for data in email 
			If reader.HasRows Then
				Do While reader.Read	'should only be one row
                    orderid = IIf(IsDBNull(reader("orderid")), "", reader("orderid"))
                    shpdate = IIf(IsDBNull(reader("shpdate")), "", reader("shpdate"))
                    howshp = IIf(IsDBNull(reader("howshp")), "", reader("howshp"))
                    carrier = IIf(IsDBNull(reader("carrier")), "", reader("carrier"))
                    trknumber = IIf(IsDBNull(reader("trknumber")), "", reader("trknumber"))
                    Try
                        trknumber = Fmat(trknumber, carrier)
                    Catch ex As Exception

                    End Try
                    semailaddress = IIf(IsDBNull(reader("semailaddress")), "wdalfarm@woodalldevelopment.com", "") 'send to me of no email address
                    sfname = IIf(IsDBNull(reader("sfname")), "", reader("sfname"))
                    slname = IIf(IsDBNull(reader("slname")), "", reader("slname"))
                    saddr = IIf(IsDBNull(reader("saddr")), "", reader("saddr"))
                    sadd2 = IIf(IsDBNull(reader("sadd2")), "", reader("sadd2"))
                    scity = IIf(IsDBNull(reader("scity")), "", reader("scity"))
                    sstate = IIf(IsDBNull(reader("sstate")), "", reader("sstate"))
                    szip = IIf(IsDBNull(reader("szip")), "", reader("szip"))
                    howshp = IIf(IsDBNull(reader("howshp")), "", reader("howshp"))
                    total = IIf(IsDBNull(reader("total")), "", reader("total"))


					'Create an instance of the MailMessage class
					Dim objMM As New MailMessage()
					Dim tomail As String = ""
					Dim smtpclient As String = ""
					Dim cpassword As String = ""
					Dim cuser As String = ""
					smtpclient = ConfigurationManager.AppSettings("smtpserver")
					cuser = ConfigurationManager.AppSettings("smtpuser")
					cpassword = ConfigurationManager.AppSettings("smtppassword")
					'Set the properties
					objMM.From = New MailAddress(ConfigurationManager.AppSettings("FromAddr"), ConfigurationManager.AppSettings("FromName"))
					'objMM.Bcc.Add(ConfigurationManager.AppSettings("FromAddr"))
					Try
						objMM.To.Add(New MailAddress(semailaddress, sfname.Trim & " " & slname.Trim))		'check for empty______________-------------_________________---------------_______________
					Catch ex3 As Exception

					End Try

					'Send the email in text format
					objMM.IsBodyHtml = True

					'Set the subject
					objMM.Subject = "Jostens Kinderkraft Shipping Confirmation Orderid(" & orderid & ")"

                    objMM.Body = "<table align='center' style='margin: 0px auto;width: 650px;'><tr><td  colspan='2'>" _
                               & "<a href='https://www.secure.jostenskinderkraft.com/shopjostenshome.aspx'>" _
                               & "<img src='https://www.secure.jostenskinderkraft.com/images/jostenslogo.PNG' width='338' height='57' /></a>" _
                               & "</td><td><a href='https://www.secure.jostenskinderkraft.com/shopjostenshome.aspx'>" _
                               & "<img src='https://www.secure.jostenskinderkraft.com/images/Kinderkraft_2.jpg' width='160' height='34' alt=''/>" _
                               & "</a></td></tr><tr><td colspan='3'><img alt='Kinderkraft 2013 Collection' height='50'" _
                               & "src='https://www.secure.jostenskinderkraft.com/images/kinderkraft.jpg' width='400'/></td></tr>" _
                               & "<tr><td  colspan='3'></td></tr><tr><td colspan='3' style='font-size: large'>" _
                               & "<tr><td><table><tr><td colspan='3'>Your order has been shipped with the following information.</td></tr>" _
                               & "<tr><td style='text-align: center;'  colspan='3'>" & sfname & " " & slname & "</td></tr>" _
                               & "<tr style='color: #000000; background-color: #C0C0C0;'><td width='200' style='text-align: right;' > Address: </td><td width='602' colspan='2'>" & saddr & " " & sadd2 & "</td></tr>" _
                               & "<tr><td style='text-align: right'> City:</td><td width='602' colspan='2'>" & scity & "</td></tr>" _
                               & "<tr style='color: #000000; background-color: #C0C0C0;'><td  style='text-align: right'> State:</td><td width='602'  colspan='2'>" & sstate & "</td></tr>" _
                               & "<tr><td  style='text-align: right'> Zip Code:</td><td width='602' colspan='2'>" & szip & "</td></tr>" _
                               & "<tr style='color: #000000; background-color: #C0C0C0;'><td  style='text-align: right'> Order Id:</td><td width='602' colspan='2'>" & orderid & "</td></tr>" _
                               & "<tr><td  style='text-align: right'> Order Amount:</td><td width='602' colspan='2'>" & total & "</td></tr>" _
                               & "<tr style='color: #000000; background-color: #C0C0C0;'><td  style='text-align: right'> Ship Date:</td><td width='602' colspan='2'>" & shpdate.ToShortDateString & "</td></tr>" _
                               & "<tr style='color: #000000; background-color: #C0C0C0;'><td  style='text-align: right'> Carrier:</td><td width='602' colspan='2'>" & carrier & "</td></tr>" _
                               & "<tr><td  style='text-align: right'> Tracking Numbers:</td><td width='602' colspan='2'> " & trknumber & "</td></tr>" _
                               & "<tr style='color: #000000; background-color: #C0C0C0;'><td  style='text-align: right'> Ship Method:</td><td width='602' colspan='2'> " & howshp & "</td></tr>" _
                               & "<tr ><td >  </td><td width='602' colspan='2'>  </td></tr>" _
                               & "</table></td></tr>" _
                               & "<tr><td  colspan='3' style='font-style: italic; font-size: medium'>If you have any questions contact customer service at 855-826-2355.</td></tr>" _
                               & "</table>"

					Dim smtp As New SmtpClient(smtpclient)
					smtp.Credentials = New NetworkCredential(cuser, cpassword)

					Try
						'smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some servers
						smtp.Send(objMM)
					Catch ex4 As Exception


					End Try
				Loop
			End If ' has rows
		Catch ex As Exception	'excute reader

		Finally
			conn.Close()
		End Try


	End Sub
    Protected Sub CheckBox3_PreRender(sender As Object, e As System.EventArgs)
        Dim chkonhold As CheckBox = FormView2.FindControl("checkbox3")
        chkonhold.Visible = chkonhold.Checked
    End Sub
    Protected Sub CheckBox3_PreRender1(sender As Object, e As System.EventArgs)
        Dim chkonhold As CheckBox = FormView2.FindControl("checkbox3")
        chkonhold.Visible = chkonhold.Checked
    End Sub
    Protected Sub MsgBox1_ButtonClick(sender As Object, e As System.Web.UI.WebControls.CommandEventArgs) Handles MsgBox1.ButtonClick
        Select Case e.CommandName
            Case "yescapture"
                Me.Capture()
            Case "yesrefund"
                Me.Refund()
            Case "yesvoid"
                Me.Void()
            Case "YesDelete"
				Me.DeleteOrder()
			Case "YesSave"
				DoTotal(True)

			Case Else


		End Select

    End Sub
    Protected Sub txtpromocode_Init(sender As Object, e As System.EventArgs)
        Try
            Dim status As String = DetailsView2.Rows(16).Cells(1).Text
            Dim txtpromocode As TextBox = FormView2.FindControl("txtpromocode")
            Select Case status
                Case "PROCESSING"
                    txtpromocode.Enabled = True
                Case ""
                    txtpromocode.Enabled = True
                Case Else
                    txtpromocode.Enabled = False
            End Select
        Catch ex As Exception

        End Try

    End Sub
    Protected Sub DetailsView2_PreRender(sender As Object, e As System.EventArgs)
        Try 'I use try because when page first loads detailview is not available after it load everything is ok
            Dim status As String = DetailsView2.Rows(17).Cells(1).Text
            Select Case status
                Case "PROCESSING"
                    DetailsView2.AutoGenerateEditButton = True
                    DetailsView1.AutoGenerateEditButton = True
                    'Case ""
                    '    DetailsView2.AutoGenerateEditButton = True
                    '    DetailsView1.AutoGenerateEditButton = True
                Case Else
                    DetailsView2.AutoGenerateEditButton = False
                    DetailsView1.AutoGenerateEditButton = False
            End Select

        Catch ex As Exception

        End Try

    End Sub
    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
		Dim cmdstr As String = "SELECT cust.fname, cust.lname, cust.EmailAddress, cust.CompanyName, cust.billingaddr1, cust.billingaddr2, cust.city, cust.state," _
			  & "cust.postalcode,cust.phonenumber, cust.taxexempt, orders.orderid, orders.scompanyname, orders.sfname, orders.slname, orders.saddr," _
			  & "orders.sadd2, orders.scity,orders.sstate, orders.szip, orders.sphone, orders.sfax, orders.ponumber, orders.orderdate, orders.ordernotes," _
			  & "orders.subtot, orders.shipmethod,orders.shpchrg, orders.tax, orders.total,orders.carrier,orders.trknumber,orders.shpdate, orders.authnettranid, orders.bo, orders.orderstatus," _
			  & "orders.promocode, orders.authdate, orders.paytype, orders.discountamt, orders.authcode, orders.autherr, orders.ccnum,orders.expdeliverdate, cust.custid," _
			  & "orders.paymentcompleted,orders.noshp,payment.orderid AS porderid,payment.paydate, payment.amount, payment.paytype AS ppaytype, payment.transid," _
			  & "payment.authcode AS pauthcode, payment.ccnum AS pccnum, payment.notes, payment.payid FROM payment " _
			  & "RIGHT OUTER JOIN orders ON payment.orderid = orders.orderid RIGHT OUTER JOIN cust ON orders.customerid = cust.custid " _
			  & " WHERE (orders.orderid = @orderid);"

        dscust.SelectParameters.Clear()
        dscust.SelectParameters.Add("@orderid", txtsearch.Text)
        dscust.SelectCommand = cmdstr
        ViewState.Add("selectcmd", cmdstr)
    End Sub
    Protected Sub Button2_Click(sender As Object, e As System.EventArgs) Handles Button2.Click

		Dim cmdstr As String = "SELECT cust.fname, cust.lname, cust.EmailAddress, cust.CompanyName, cust.billingaddr1, cust.billingaddr2, cust.city, cust.state," _
			  & "cust.postalcode,cust.phonenumber, cust.taxexempt, orders.orderid, orders.scompanyname, orders.sfname, orders.slname, orders.saddr," _
			  & "orders.sadd2, orders.scity,orders.sstate, orders.szip, orders.sphone, orders.sfax, orders.ponumber, orders.orderdate, orders.ordernotes," _
			  & "orders.subtot, orders.shipmethod,orders.shpchrg, orders.tax, orders.total, orders.carrier,orders.trknumber,orders.shpdate,orders.authnettranid, orders.bo, orders.orderstatus," _
			  & "orders.promocode, orders.authdate, orders.paytype, orders.discountamt, orders.authcode, orders.autherr, orders.ccnum,orders.expdeliverdate, cust.custid," _
			  & "orders.paymentcompleted,orders.noshp,payment.orderid AS porderid,payment.paydate, payment.amount, payment.paytype AS ppaytype, payment.transid," _
			  & "payment.authcode AS pauthcode, payment.ccnum AS pccnum, payment.notes, payment.payid FROM payment " _
			  & "RIGHT OUTER JOIN orders ON payment.orderid = orders.orderid RIGHT OUTER JOIN cust ON orders.customerid = cust.custid " _
			  & "WHERE (orders.bo = @bo);"

        'Dim cmdstr As String = "SELECT cust.custid,cust.fname, cust.lname, cust.EmailAddress, cust.CompanyName, cust.billingaddr1, cust.billingaddr2, cust.city, cust.state," _
        '                       & "cust.postalcode, cust.phonenumber, cust.taxexempt, orders.orderid, orders.scompanyname, orders.sfname, orders.slname, orders.saddr," _
        '                       & "orders.sadd2, orders.scity , orders.sstate , orders.szip, orders.sphone, orders.sfax , orders.ponumber," _
        '                       & "orders.paymentcompleted,orders.orderdate, orders.ordernotes, orders.subtot, orders.shipmethod, orders.shpchrg, orders.tax, orders.total, orders.authnettranid," _
        '                       & "orders.bo, orders.orderstatus, orders.promocode, orders.authdate, orders.paytype, orders.discountamt, orders.authcode, orders.autherr," _
        '                       & "orders.ccnum FROM cust INNER JOIN orders ON cust.custid = orders.customerid WHERE (orders.bo = @bo)"
        dscust.SelectParameters.Clear()
        dscust.SelectParameters.Add("@bo", txtbosearch.Text)
        dscust.SelectCommand = cmdstr
        ViewState.Add("selectcmd", cmdstr)
    End Sub
    Protected Sub DetailsView1_ItemUpdating(sender As Object, e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles DetailsView1.ItemUpdating
        Dim cmd As String = "UPDATE cust  SET cust.CompanyName = @companyname,cust.fname = @fname, cust.lname = @lname, cust.billingaddr1 = @billingaddr1, cust.billingaddr2 = @billingaddr2, cust.city = @city,cust.state = @state, cust.postalcode = @postalcode,cust.taxexempt = @taxexempt,cust.EmailAddress = @emailaddress,cust.phonenumber=@phonenumber  WHERE (cust.custid=@custid)"
        dscust.UpdateCommand = cmd

    End Sub
    Protected Sub DetailsView2_ItemCreated(sender As Object, e As System.EventArgs) Handles DetailsView2.ItemCreated

    End Sub
    Protected Sub DetailsView1_ItemCreated(sender As Object, e As System.EventArgs) Handles DetailsView1.ItemCreated

    End Sub
    Protected Sub dsorderdetail_Selected(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles dsorderdetail.Selected

    End Sub
    Protected Sub dscust_Selected(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles dscust.Selected

    End Sub
    Protected Sub DetailsView2_PreRender1(sender As Object, e As System.EventArgs) Handles DetailsView2.PreRender

		Try	'I use try because when page first loads detailview is not available after it load everything is ok
			Dim lblstatus As Label = DetailsView2.FindControl("lblorderstatus")
			Dim status As String = lblstatus.Text
			Select Case status
				Case "PROCESSING"
					DetailsView2.AutoGenerateEditButton = True
					DetailsView1.AutoGenerateEditButton = True
					'Case ""
					'    DetailsView2.AutoGenerateEditButton = True
					'    DetailsView1.AutoGenerateEditButton = True
				Case Else
					DetailsView2.AutoGenerateEditButton = True
					DetailsView1.AutoGenerateEditButton = True
			End Select

		Catch ex As Exception

		End Try


		Dim orderid As String = ""
        Try
            orderid = DetailsView2.DataKey("orderid")
        Catch ex As Exception

        End Try

        'Dim orderid As String = DetailsView2.DataKey("orderid")
        dsorderdetail.SelectParameters.Clear()
        dsorderdetail.SelectParameters.Add("@orderid", orderid)
    End Sub
    Protected Sub DropDownList1_Load(sender As Object, e As System.EventArgs) Handles DropDownList1.Load
        If Not IsPostBack Then
            DropDownList1.SelectedValue = ""
        End If
    End Sub
    Protected Sub ddlstatus_SelectedIndexChanged(sender As Object, e As System.EventArgs)
        Dim ddlstatus As DropDownList = DetailsView2.FindControl("ddlstatus")
        Select Case ddlstatus.SelectedValue
            Case "PROCESSING"
                'do nothing
            Case "CAPTURE"
                MsgBox1.Show("Capture", "Are you sure you want to capture this transaction?", Nothing, New EO.Web.MsgBoxButton("Yes", "", "yescapture"), New EO.Web.MsgBoxButton("No", "", "no"))

            Case "REFUND"
                MsgBox1.Show("Capture", "Are you sure you want to refund this transaction?", Nothing, New EO.Web.MsgBoxButton("Yes", "", "yesrefund"), New EO.Web.MsgBoxButton("No", "", "no"))

            Case "VOID"
                MsgBox1.Show("Capture", "Are you sure you want to void this transaction?", Nothing, New EO.Web.MsgBoxButton("Yes", "", "yesvoid"), New EO.Web.MsgBoxButton("No", "", "no"))
            Case "ON HOLD"

            Case "PENDING"

        End Select
    End Sub
#Region "Order Ops"
    Private Function OpenGateway() As IGateway
        ' we used the form builder so we can now just load it up
        'using the form reader
        Dim login As String = ConfigurationManager.AppSettings("ApiLogin")
        Dim transactionKey As String = ConfigurationManager.AppSettings("TransactionKey")
        Dim gate1 As New Gateway(login, transactionKey, ConfigurationManager.AppSettings("GatewayTest"))
        Return gate1
    End Function

    Protected Sub Capture()

        Dim orderid As String = DetailsView2.DataKey("orderid")
        Dim connection1 As New MySqlConnection(dsOrders.ConnectionString)
        Dim hfpaytype As HiddenField = FormView2.FindControl("hfpaytype")
        Dim paymenttype As String = hfpaytype.Value
        If paymenttype = "PO" Then
            Dim commandtext As String = "UPDATE orders SET paymentcompleted = @paymentcompleted,orderstatus=@orderstatus,authdate=curdate() WHERE (orderid =" & orderid.ToString & ");"
            dsOrders.UpdateParameters.Add("@paymentcompleted", "1")
            dsOrders.UpdateParameters.Add("@orderstatus", "CAPTURE")

            dsOrders.UpdateCommand = commandtext
            Try
                dsOrders.Update()
            Catch ex As Exception
                MsgBox1.Show("Update Error", "The following error happened updating the local database. " & Chr(13) & ex.Message, Nothing, New EO.Web.MsgBoxButton("Ok"))

            End Try
            'Response.Redirect("CustomerCreditCard.aspx?orderid=" & orderid)
        Else
            x_type.Value = "PRIOR_AUTH_CAPTURE"
            Dim lbltotal As Label = FormView2.FindControl("lbltotal")
            Dim amount As Decimal
			Dim lbltransid As Label = DetailsView2.FindControl("lbltransid")
			Dim transid As String = lbltransid.Text
			Dim lblauthcode As Label = DetailsView2.FindControl("lblauthcode")
			Dim authcode As String = lblauthcode.Text

            Try 'test if there is not data or if buttons were pushed before getting order

                amount = CDec(lbltotal.Text)
                If IsNothing(transid) Then
                    MsgBox1.Show("Update Error", "Transaction Id is not available,capture not complete.", Nothing, New EO.Web.MsgBoxButton("Ok"))
                    Return
                ElseIf IsNothing(authcode) Then
                    MsgBox1.Show("Update Error", "Authorization Code is not available,capture not complete.", Nothing, New EO.Web.MsgBoxButton("Ok"))
                    Return
                End If
            Catch ex As Exception
                Return
            End Try
            Dim gate As Object = OpenGateway()
            ''  build the request from the Form post
            Dim auth As CaptureRequest = New AuthorizeNet.CaptureRequest(amount, transid, authcode)

            ''  send to Auth.NET
            Dim response__1 As Object = gate.Send(auth)
            '' We must get the whole response to get CC company, the respons only hold a certain number of properties. The CC company is not
            '' one of them. We could sub class the response and add the CC company propery but I didn't want to do this for one field.
            'Dim BaseGatewayResponse As AuthorizeNet.GatewayResponse
            'BaseGatewayResponse = response__1

            If response__1.Approved Then
                Dim commandtext As String = "UPDATE orders SET paymentcompleted = @paymentcompleted,orderstatus=@orderstatus,authdate=curdate() WHERE (orderid =" & orderid.ToString & ");"
                dsOrders.UpdateParameters.Add("@paymentcompleted", "1")
				'dsOrders.UpdateParameters.Add("@orderstatus", "CAPTURE")
				dsOrders.UpdateCommand = commandtext

				Dim commandtext1 As String = "update payment Set amount=@amount,capdate=NOW() WHERE (orderid =" & orderid.ToString & ");"
				dspayment.UpdateParameters.Add("@amount", amount)
				dspayment.UpdateParameters.Add("@capdate", Now())
				dspayment.UpdateCommand = commandtext1
                Try
					dsOrders.Update()
					dspayment.Update()
                Catch ex As Exception
                    MsgBox1.Show("Update Error", "The order has been processed for the customer by Authorize.net but the following error happened updating the local database. " & ex.Message, Nothing, New EO.Web.MsgBoxButton("Ok"))
                    Session.Add("capmsg", "The order has been processed for the customer but the following error happened updating the local database. " & ex.Message)
                End Try
            Else
                MsgBox1.Show("Authorize.net Error", "The capture of this order did not succeed because of the following error:" & Chr(13) & response__1.message, Nothing, New EO.Web.MsgBoxButton("Ok"))

            End If
        End If
        DetailsView2.ChangeMode(DetailsViewMode.ReadOnly)
    End Sub
    Protected Sub Void()
        'If you are not sure whether a transaction is settled, you can attempt to submit a
        'Void first. If the Void transaction results in an error, the original transaction is
        'likely settled and you can submit a Credit for the transaction.
        x_type.Value = "VOID"
        Dim amount As Decimal
        Dim lbltotal As Label = FormView2.FindControl("lbltotal")
        Dim hftransid As HiddenField = FormView2.FindControl("hftransid")
        Dim transid As String = hftransid.Value
        Dim hfauthcode As HiddenField = FormView2.FindControl("hfauthcode")
        Dim authcode As String = hfauthcode.Value
        Try 'test if there is no data or if buttons were pushed before getting order
            amount = CDec(lbltotal.Text)
            If IsNothing(transid) Then
                Return
            End If
        Catch ex As Exception

        End Try
        Dim hfpaytype As HiddenField = FormView2.FindControl("hfpaytype")
        Dim paymenttype As String = hfpaytype.Value
        If paymenttype <> "PO" Then
            Dim gate As Object = OpenGateway()
            ''  build the request from the Form post
            Dim auth As VoidRequest = New AuthorizeNet.VoidRequest(transid)

            ''  send to Auth.NET
            Dim response__1 As Object = gate.Send(auth)
            '' We must get the whole response to get CC company, the respons only hold a certain number of properties. The CC company is not
            '' one of them. We could sub class the response and add the CC company propery but I didn't want to do this for one field.
            'Dim BaseGatewayResponse As AuthorizeNet.GatewayResponse
            'BaseGatewayResponse = response__1
            If response__1.Approved Then

                Dim orderid As String = DetailsView2.DataKey("orderid")
                Dim connection1 As New MySqlConnection(dsOrders.ConnectionString)

                Dim commandtext As String = "UPDATE orders SET paymentcompleted = @paymentcompleted,orderstatus=@orderstatus,authdate=curdate() WHERE (orderid =" & orderid.ToString & ");"
                dsOrders.UpdateParameters.Add("@paymentcompleted", "1")
                dsOrders.UpdateParameters.Add("@orderstatus", "VOID")



                dsOrders.UpdateCommand = commandtext
                Try
                    dsOrders.Update()
                Catch ex As Exception
                    MsgBox1.Show("Update Error", "The following error happened updating the local database. " & Chr(13) & ex.Message, Nothing, New EO.Web.MsgBoxButton("Ok"))
                End Try
            Else
                ''Dim a As String = response__1.message
                MsgBox1.Show("Authorize.net Error", "The void for this order was not completed because of the following error:" & Chr(13) & response__1.message, Nothing, New EO.Web.MsgBoxButton("Ok"))

            End If
        Else 'is a PO

            Dim orderid As String = DetailsView2.DataKey("orderid")
            Dim connection1 As New MySqlConnection(dsOrders.ConnectionString)

            Dim commandtext As String = "UPDATE orders SET paymentcompleted = @paymentcompleted,orderstatus=@orderstatus,authdate=curdate() WHERE (orderid =" & orderid.ToString & ");"
            dsOrders.UpdateParameters.Add("@paymentcompleted", "1")
            dsOrders.UpdateParameters.Add("@orderstatus", "VOID")



            dsOrders.UpdateCommand = commandtext
            Try
                dsOrders.Update()
            Catch ex As Exception
                MsgBox1.Show("Update Error", "The update for this order was not completed because of the following error:" & Chr(13) & ex.Message, Nothing, New EO.Web.MsgBoxButton("Ok"))

            End Try
        End If
        DetailsView2.ChangeMode(DetailsViewMode.ReadOnly)
    End Sub
    Protected Sub Refund()

        x_type.Value = "CREDIT"

        Dim orderid As String = DetailsView2.DataKey("orderid")
        Dim hfpaytype As HiddenField = FormView2.FindControl("hfpaytype")
        Dim paymenttype As String = hfpaytype.Value
        Dim hftransid As HiddenField = FormView2.FindControl("hftransid")
        Dim transid As String = hftransid.Value
        Dim hfauthcode As HiddenField = FormView2.FindControl("hfauthcode")
        Dim authcode As String = hfauthcode.Value
        Dim hfcardnum As HiddenField = FormView2.FindControl("hfcardnum")
        Dim cardnum As String = hfcardnum.Value
        Dim lbltotal As Label = FormView2.FindControl("lbltotal")
        Dim amount As Decimal = 0
        If paymenttype = "PO" Then

        Else
            If transid = Nothing Then
                MsgBox1.Show("Transid Missing", "The transaction id is missing.", Nothing, New EO.Web.MsgBoxButton("Ok"))
                Return
            ElseIf cardnum = Nothing Then
                MsgBox1.Show("Card Number Missing", "The card number  is missing.", Nothing, New EO.Web.MsgBoxButton("Ok"))
                Return
            End If
            Try 'test if there is no data or if buttons were pushed before getting order
                amount = CDec(lbltotal.Text)

            Catch ex As Exception
                MsgBox1.Show("Amount", "The amount of the transaction can not be found.", Nothing, New EO.Web.MsgBoxButton("Ok"))
                Return
            End Try

            If paymenttype <> "PO" Then
                Dim gate As Object = OpenGateway()
                ''  build the request from the Form post
                Dim auth As CreditRequest = New AuthorizeNet.CreditRequest(transid, amount, cardnum)


                ''  send to Auth.NET
                Dim response__1 As Object = gate.Send(auth)
                '' We must get the whole response to get CC company, the respons only hold a certain number of properties. The CC company is not
                '' one of them. We could sub class the response and add the CC company propery but I didn't want to do this for one field.
                'Dim BaseGatewayResponse As AuthorizeNet.GatewayResponse
                'BaseGatewayResponse = response__1



                If response__1.Approved Then


                    Dim connection1 As New MySqlConnection(dsOrders.ConnectionString)

                    Dim commandtext As String = "UPDATE orders SET paymentcompleted = @paymentcompleted,orderstatus=@orderstatus,authdate=curdate() WHERE (orderid =" & orderid.ToString & ");"
                    dsOrders.UpdateParameters.Add("@paymentcompleted", "1")
                    dsOrders.UpdateParameters.Add("@orderstatus", "REFUND")



                    dsOrders.UpdateCommand = commandtext
                    Try
                        dsOrders.Update()
                    Catch ex As Exception
                        MsgBox1.Show("Update Error", "The order has been processed for the customer but the following error happened updating the local database." & Chr(13) & ex.Message, Nothing, New EO.Web.MsgBoxButton("Ok"))
                        Return
                        Session.Add("capmsg", "The order has been processed for the customer but the following error happened updating the local database. " & ex.Message)
                    End Try
                Else
                    ''Dim a As String = response__1.message
                    MsgBox1.Show("Authorize.net Error", "The refund of this order did not succeed because of the following error:" & Chr(13) & response__1.message, Nothing, New EO.Web.MsgBoxButton("Ok"))
                    Session.Add("capmsg", response__1.message)
                End If
            Else 'paytype is PO
                Dim connection1 As New MySqlConnection(dsOrders.ConnectionString)

                Dim commandtext As String = "UPDATE orders SET paymentcompleted = @paymentcompleted,orderstatus=@orderstatus,authdate=curdate() WHERE (orderid =" & orderid.ToString & ");"
                dsOrders.UpdateParameters.Add("@paymentcompleted", "1")
                dsOrders.UpdateParameters.Add("@orderstatus", "REFUND")
                dsOrders.UpdateCommand = commandtext
                Try
                    dsOrders.Update()
                Catch ex As Exception
                    MsgBox1.Show("Update Error", "The update of the local database did not succeed because of the following error:" & Chr(13) & ex.Message, Nothing, New EO.Web.MsgBoxButton("Ok"))
                    Session.Add("capmsg", "The following error happened updating the local database. " & ex.Message)
                End Try

            End If
        End If 'end if po
        DetailsView2.ChangeMode(DetailsViewMode.ReadOnly)
    End Sub
    Private Sub DeleteOrder()
        Dim label4 As Label = DetailsView2.FindControl("lblorderstatus")
        Try
            If label4.Text = "VOID" OrElse label4.Text = "ON HOLD" OrElse label4.Text = "PENDING" Then
                Dim orderid As String = DetailsView2.DataKey("orderid")
                Dim orddetalicmd As String = "Delete from orderdetail where orderid=" & orderid
                Dim ordercmd As String = "Delete from orders where orderid=" & orderid
                Dim ordopcmd As String = "DELETE FROM orderoptions WHERE OrderId=" & orderid
                dsorderdetail.DeleteCommand = orddetalicmd
                dsorderoptions.DeleteCommand = ordopcmd
                dscust.DeleteCommand = ordercmd
                dsorderdetail.Delete()
                dsorderoptions.Delete()
                Dim a As Integer = dscust.Delete() 'deletes orderss order table set up here
                DetailsView1.DataBind()
                DetailsView2.DataBind()
                FormView2.DataBind()
            Else
                MsgBox1.Show("Delete", "You must void this order before deleting it.", Nothing, New EO.Web.MsgBoxButton("OK"))
                DropDownList1.SelectedValue = ""
            End If

        Catch ex As Exception
            MsgBox1.Show("Edit Mode", "Your order was not delteted.Be sure you are not in edit mode when deleting an order.", Nothing, New EO.Web.MsgBoxButton("OK"))
            DropDownList1.SelectedValue = ""
        End Try

    End Sub

#End Region
    Private Function Fmat(trknumber As String, carrier As String) As String
        Dim webaddr As String = ""
        Dim formatedtrknumber As String = ""
        Dim i As Integer = trknumber.ToString.IndexOf(",")
        Dim pos1 As Integer = 0
        Dim pos2 As Integer = i
        Dim retval As String = ""
        Select Case carrier.ToUpper
            Case "UPS"
                webaddr = "<a href=http://wwwapps.ups.com/WebTracking/track?track=yes&trackNums="
            Case "FEDEX"
                webaddr = "<a href=http://www.fedex.com/Tracking?action=track&tracknumbers="
            Case "USPS"
                webaddr = "<a href=https://tools.usps.com/go/TrackConfirmAction_input?qtc_tLabels1="
            Case Else
                webaddr = ""
        End Select

        If trknumber = "NF" Then 'nothing to format
            retval = trknumber
        ElseIf webaddr = "" Then
            retval = trknumber
        Else
            Do While (i <> -1)
                formatedtrknumber = webaddr & trknumber.ToString.Substring(pos1, pos2) & ">" & trknumber.ToString.Substring(pos1, pos2) & "</a>"
                retval = formatedtrknumber & ","
                pos1 = i + 1
                i = trknumber.ToString.IndexOf(",", i + 1)
                pos2 = i - pos1

            Loop
            formatedtrknumber = webaddr & trknumber.ToString.Substring(pos1) & ">" & trknumber.ToString.Substring(pos1) & "</a>"
            retval = retval & formatedtrknumber
        End If
        Return retval
    End Function
#Region "Custom Functions"

	Protected Sub DoTotal(OveridAuthAmt As Boolean)
		Dim command As String = ""
		Dim LT As New LookUpTable
		Dim dvSql As New DataView
		Dim dvrow As DataRow

		Dim authorizedamt As Decimal = 0
		Dim retdiscount As Decimal = 0
		Dim subtot As Decimal = 0
		Dim total As Decimal = 0
		Dim tax As Decimal = 0
		Dim shippingcost As Decimal = 0

		Dim connection1 As New MySqlConnection(LT.ConnectStr)
		Dim lblpromoamt As Label = FormView2.FindControl("lblpromoamt")
		Dim discount As Decimal = CDec(lblpromoamt.Text)
		Dim cknoshp As CheckBox = FormView2.FindControl("cknoshp")
		Dim txtpromocode As TextBox = FormView2.FindControl("txtpromocode")
		Dim cmd As MySqlCommand = New MySqlCommand(command, connection1)
		Dim lblorderstatus As Label = DetailsView2.FindControl("lblorderstatus")
		Dim ddlorderstatus As DropDownList = DetailsView2.FindControl("ddlstatus")
		Dim status As String
		Dim orderid As Integer
		Dim lblorderid As Label = DetailsView2.FindControl("lblorderid")
		Dim txtorderid As TextBox = DetailsView2.FindControl("txtorderid")
		If Not IsNothing(lblorderid) Then
			orderid = lblorderid.Text
		Else
			orderid = txtorderid.Text
		End If

		command = "select * from payment where orderid=@orderid;"
		dspayment.SelectCommand = command
		dspayment.SelectParameters.Clear()
		dspayment.SelectParameters.Add("@orderid", orderid)
		Try
			dvSql = CType(dspayment.Select(DataSourceSelectArguments.Empty), Data.DataView)
			dvrow = dvSql.Item(0).Row
			authorizedamt = dvrow("authorizedamt")
		Catch ex As Exception

		End Try


		Try
			status = lblorderstatus.Text
		Catch ex As Exception
			'in edit mode
			status = ddlorderstatus.SelectedValue
		End Try

		Dim taxamt As Label = FormView2.FindControl("lbltax")
		Select Case status
			Case "PROCESSING"
				Try
					command = "select sum(totalprice) from orderdetail  WHERE orderid=" & orderid.ToString & ";"

					cmd = New MySqlCommand(command, connection1)
					connection1.Open()
					subtot = CDec(cmd.ExecuteScalar())

				Catch ex As Exception ' no records to sum so zero out everything

					'dsOrders.DeleteCommand = "DELETE FROM kinderkraft5.orders WHERE `orderid`=" & orderid.ToString & ";"
					'dsorders1.Delete()
					'dsorderdetail.DeleteCommand = "DELETE FROM kinderkraft5.orderdetail WHERE `orderid`=" & orderid.ToString & ";"
					'dsorderdetail.Delete()
					'Response.Redirect("OrderSearch.aspx")
					connection1.Close()
					Return
				Finally
					connection1.Close()

				End Try
				If subtot > 0 Then
					'get order details to send to taxable total function
					command = "SELECT orderid, orderdetailid, productcode, productname, quantity, prodprice, totalprice, pkgid FROM orderdetail WHERE (orderid = @orderid);"
					dsorderdetailmisc.SelectCommand = command
					Try
						dvSql = CType(Me.dsorderdetailmisc.Select(DataSourceSelectArguments.Empty), Data.DataView)
					Catch ex As Exception
						Return
					End Try
					Dim orderdetail As DataTable = dvSql.Table 'to send to gettaxable total
					Dim shpmeth As String
					Dim lblshipmeth As Label = DetailsView2.FindControl("lblshpmeth")
					If Not IsNothing(lblshipmeth) Then
						shpmeth = lblshipmeth.Text
					Else
						Dim ddlshipmeth As DropDownList = DetailsView2.FindControl("ddlshipmeth")
						shpmeth = ddlshipmeth.SelectedValue
					End If
					If cknoshp.Checked = True Then
						shippingcost = "0.00"
					Else
						shippingcost = GetShipping(subtot)
					End If


                    retdiscount = LT.GetPromoDiscount(txtpromocode.Text, subtot, shpmeth)
                    discount = IIf(retdiscount <> 0, retdiscount, discount)	'this will not allow you to take off a promotion once it is made.
					tax = GetTax(subtot, shippingcost, orderdetail, discount)
					total = subtot + shippingcost + discount + tax

					If total <= authorizedamt Then
						command = "UPDATE orders  SET total=" & total.ToString & ",subtot=" & subtot.ToString & ",shpchrg=" & shippingcost.ToString & ",discountamt=" & discount.ToString & ",tax=" & tax.ToString & " WHERE orderid=" & orderid.ToString & ";"
						dsorders1.UpdateCommand = command
						dsorders1.Update()
						FormView2.DataBind()

					Else
						If OveridAuthAmt = True Then
							command = "UPDATE orders  SET total=" & total.ToString & ",subtot=" & subtot.ToString & ",shpchrg=" & shippingcost.ToString & ",discountamt=" & discount.ToString & ",tax=" & tax.ToString & " WHERE orderid=" & orderid.ToString & ";"
							dsorders1.UpdateCommand = command
							dsorders1.Update()
							FormView2.DataBind()
						Else
							MsgBox1.Show("Authorized Amount", "The order total is more than the authorized amount. Collect payment before making order changes. Do you want to save changes?", Nothing, New EO.Web.MsgBoxButton("Yes", Nothing, "YesSave"), New EO.Web.MsgBoxButton("No", Nothing, "No"))
						End If
					End If
				Else 'less than 0
					'command = "DELETE FROM kinderkraft5.order WHERE `orderid`=" & orderid.ToString & ";"
					'dsorders1.DeleteCommand = command
					'dsorders1.Delete()

					Response.Redirect("~/Admin/OrderSearch.aspx")

				End If
			Case ""
				Try
					command = "select sum(totalprice) from orderdetail  WHERE orderid=" & orderid.ToString & ";"

					cmd = New MySqlCommand(command, connection1)
					connection1.Open()
					subtot = CDec(cmd.ExecuteScalar())

				Catch ex As Exception ' no records to sum so zero out everything

					'dsOrders.DeleteCommand = "DELETE FROM kinderkraft5.orders WHERE `orderid`=" & orderid.ToString & ";"
					'dsorders1.Delete()
					'dsorderdetail.DeleteCommand = "DELETE FROM kinderkraft5.orderdetail WHERE `orderid`=" & orderid.ToString & ";"
					'dsorderdetail.Delete()
					'Response.Redirect("OrderSearch.aspx")
					connection1.Close()
					Return
				Finally
					connection1.Close()

				End Try
				If subtot > 0 Then
					'get order details to send to taxable total function
					command = "SELECT orderid, orderdetailid, productcode, productname, quantity, prodprice, totalprice, pkgid FROM orderdetail WHERE (orderid = @orderid);"
					dsorderdetailmisc.SelectCommand = command
					Try
						dvSql = CType(Me.dsorderdetailmisc.Select(DataSourceSelectArguments.Empty), Data.DataView)
					Catch ex As Exception
						Return
					End Try
					Dim orderdetail As DataTable = dvSql.Table 'to send to gettaxable total
					Dim shpmeth As String
					Dim lblshipmeth As Label = DetailsView2.FindControl("lblshpmeth")
					If Not IsNothing(lblshipmeth) Then
						shpmeth = lblshipmeth.Text
					Else
						Dim ddlshipmeth As DropDownList = DetailsView2.FindControl("ddlshipmeth")
						shpmeth = ddlshipmeth.SelectedValue
					End If

					shippingcost = GetShipping(subtot)

                    discount = LT.GetPromoDiscount(txtpromocode.Text, subtot, shpmeth)


                    tax = GetTax(subtot, shippingcost, orderdetail, discount)
					total = subtot + shippingcost + discount + tax

					command = "UPDATE orders SET total=" & total.ToString & ",subtot=" & subtot.ToString & ",shpchrg=" & shippingcost.ToString & ",discountamt=" & discount.ToString & ",tax=" & tax.ToString & " WHERE orderid=" & orderid.ToString & ";"
					dsorders1.UpdateCommand = command
					dsorders1.Update()
					FormView2.DataBind()
				Else 'less than 0
					'command = "DELETE FROM kinderkraft5.order WHERE `orderid`=" & orderid.ToString & ";"
					'dsorders1.DeleteCommand = command
					'dsorders1.Delete()

					Response.Redirect("~/Admin/OrderSearch.aspx")

				End If
			Case Else
				'do nothing
		End Select






	End Sub
	Protected Sub deletepkg(ByVal pkgid As String, ByVal orderid As Integer)

		'not being used left for future use
		Dim command As String
		Try
			command = "DELETE FROM kinderkraft5.orderdetail WHERE `pkgid`=" & Chr(39) & pkgid & Chr(39) & " and orderid=" & orderid.ToString & ";"
			dsorderdetail.DeleteCommand = command
			dsorderdetail.Delete()
			DoTotal(False)
		Catch ex As Exception

			Return
		End Try
		Try
			command = "DELETE FROM kinderkraft5.orderoptions WHERE `pkgid`=" & Chr(39) & pkgid & Chr(39) & " and orderid=" & orderid.ToString & ";"
			dsorderoptions.DeleteCommand = command
			dsorderoptions.Delete()
		Catch ex As Exception
			Return
		End Try

	End Sub
	Protected Sub Deleteitem(ByVal detailid As Integer, ByVal orderid As Integer)
		'not being used left for future use
		Dim command As String
		Try
			command = "DELETE FROM kinderkraft5.orderdetail WHERE `orderdetailid`=" & detailid.ToString & ";"
			dsorderdetail.DeleteCommand = command
			dsorderdetail.Delete()
			DoTotal(False)
		Catch ex As Exception
			DoTotal(False)
			Return
		End Try
		Try
			command = "DELETE FROM kinderkraft5.orderoptions WHERE `detailid`=" & detailid.ToString & ";"
			dsorderoptions.DeleteCommand = command
			dsorderoptions.Delete()
		Catch ex As Exception
			Return
		End Try


	End Sub
	Private Function GetShipping(ByVal subtot As Decimal) As Decimal

		Dim shpmeth As String
		Dim lblshipmeth As Label = DetailsView2.FindControl("lblshpmeth")
		If Not IsNothing(lblshipmeth) Then
			shpmeth = lblshipmeth.Text
		Else
			Dim ddlshipmeth As DropDownList = DetailsView2.FindControl("ddlshipmeth")
			shpmeth = ddlshipmeth.SelectedValue
		End If



		'Dim shp1 As Label = DetailsView2.FindControl("lblshipmeth")
		'Dim shp2 As DropDownList = DetailsView2.FindControl("ddlshipmeth")
		'If shp1.Text = Nothing Then
		'    shpmeth = shp2.SelectedValue
		'Else
		'    shpmeth = shp1.Text

		'End If
		Dim lt As New LookUpTable
		Dim val As Decimal = lt.GetShipping(subtot, shpmeth)
		Return val
	End Function
	Private Function GetTax(ByVal subtot As Decimal, ByVal shippingcost As Decimal, ByVal orderdetail As DataTable, discount As Decimal) As Decimal
		Dim SC As ShoppingCart = Session("ShoppingCart")
		Dim tax As Decimal
		Dim taxrate As Decimal = GetTaxRate()
		Dim exemptval As Boolean = SC.taxexempt
		Dim taxexemptchk As CheckBox = DetailsView1.FindControl("chktaxexempt1")
		If Not IsNothing(taxexemptchk) Then
			exemptval = taxexemptchk.Checked
		Else
			Dim taxexemptchk1 As CheckBox = DetailsView1.FindControl("chktaxexempt0")
			exemptval = taxexemptchk1.Checked
		End If
		Dim vpostalcode As String
		Dim lblshipzip As Label = DetailsView2.FindControl("lblshipzip")

		If IsNothing(lblshipzip) Then
			Dim txtship As TextBox = DetailsView2.FindControl("txtshipzip")
			vpostalcode = txtship.Text
		Else
			vpostalcode = lblshipzip.Text
		End If
		Dim taxabletotal As Decimal = SC.GetTaxableItemTotal(orderdetail, vpostalcode, shippingcost, exemptval)

		If (taxabletotal + discount) > 0 Then
			taxabletotal = taxabletotal + discount
		Else

		End If

		'taxabletotal = IIf(taxabletotal = 0, 0, taxabletotal + discount)
		tax = Math.Round(taxabletotal * taxrate, 2).ToString("N2")
		Return tax
	End Function
	Private Function GetTaxRate() As Decimal
		Dim LT As New LookUpTable
		Dim vpostalcode As String
		Dim lblshipzip As Label = DetailsView2.FindControl("lblshipzip")

		If IsNothing(lblshipzip) Then
			Dim txtship As TextBox = DetailsView2.FindControl("txtshipzip")
			vpostalcode = txtship.Text
		Else
			vpostalcode = lblshipzip.Text
		End If

		Dim rate As Decimal = LT.Gettax(vpostalcode)
		Return rate
	End Function
	Private Sub CancledOrderEmail(ByVal orderid As String)
		'Create an instance of the MailMessage class
		Dim objMM As New MailMessage
		Dim tomail As String
		'Dim smtpclient As String
		'Dim cpassword As String
		'Dim cuser As String
		If Directory.Exists("F:\IsDev") Then 'set dev settings
			'smtpclient = "smtp.embarqmail.com"
			'cuser = "wdal_farm@embarqmail.com"
			'cpassword = "briggitt"
			tomail = "randy@woodalldevelopment.com"
		Else 'live
			'smtpclient = "192.168.1.245"
			'cuser = "authnet@memorybook.com"
			'cpassword = "authnet"
			Dim email As String = DetailsView1.Rows(10).Cells(1).Text
			tomail = Trim(email)
		End If
		'Set the properties

		objMM.To.Add(tomail) 'customer address
		objMM.Bcc.Add("kinderkraftcs@jostens.com") 'change this to correct address when done
		objMM.From = New MailAddress(ConfigurationManager.AppSettings("FromAddr"), ConfigurationManager.AppSettings("FromName"))

		'Send the email in text format
		objMM.IsBodyHtml = True

		'Set the subject
		objMM.Subject = "Order Cancellation from Jostens Kinderkraft"

		objMM.Body = "Your request to cancel your order #" & orderid & " from Jostens Kinderkraft has been completed and the amount of your order has been refunded. " _
		 & "If you need additional graduation items or ways to celebrate achievements all year, please visit us again at <a href='http://www.jostenskinderkraft.com ' >www.jostenskinderkraft.com. </a> <br/><br/>" _
		 & "If you have received this email in error or you did not cancel your order please call <br/> 855-826-2355.<br/> Sincerely,<br/>Jostens Kinderkraft Customer Service"

		Dim smtp As New SmtpClient(ConfigurationManager.AppSettings("smtpserver"))
		smtp.Credentials = New NetworkCredential(ConfigurationManager.AppSettings("smtpuser"), ConfigurationManager.AppSettings("smtppassword"))
		Try
			'smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some servers
			smtp.Send(objMM)
		Catch

		End Try
	End Sub
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
	Private Sub Recalculate()

	End Sub


#End Region
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
    '            Dim detailid As Integer = gv1.DataKeys(vindex).Values(0)
    '            Dim pkgid As String = gv1.DataKeys(vindex).Values(1)
    '            Dim orderid As Integer = gv1.DataKeys(vindex).Values(2)







    '            Select Case Trim(pkgid)
    '                Case "01KGRADPKD", "02KSCHPKD", "03KACHPKD", "04KMILEPKD", "05KLEAPKD"
    '                    deletepkg(pkgid, orderid)
    '                Case Else 'not a package
    '                    Deleteitem(detailid, orderid)
    '            End Select

    '        Case Else 'command not in list
    '            Return

    '    End Select




    'End Sub
    'Protected Sub dsorderoptions_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs)
    '    Session.Add("affectedrows", e.AffectedRows)
    'End Sub


	
	Protected Sub cknoshp_CheckedChanged(sender As Object, e As System.EventArgs)
		Dim cknoshp As CheckBox = sender
		Dim ival As Integer
		If cknoshp.Checked = True Then
			ival = 1
		Else
			ival = 0
		End If
		Dim orderid As String = DetailsView2.DataKey("orderid")
		Dim command As String = "UPDATE orders SET noshp = @noshp WHERE (orderid =" & orderid.ToString & ");"
		dsorders1.UpdateCommand = command
		dsorders1.UpdateParameters.Clear()
		dsorders1.UpdateParameters.Add("@noshp", ival)
		dsorders1.Update()
		DetailsView2.DataBind()
		FormView2.DataBind()
		DoTotal(False)
	End Sub
End Class
