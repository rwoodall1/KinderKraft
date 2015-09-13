Imports System.Data
Imports MySql.Data.MySqlClient
Imports AuthorizeNet
Imports System.Net.Mail
Imports System.IO
Imports System.Net

Partial Class Order
    Inherits webformbase

   
    'Protected Sub deletepkg(ByVal pkgid As String, ByVal orderid As Integer)
    '    'this is not being used but I left in for future use
    '    Dim command As String
    '    Try
    '        command = "DELETE FROM kinderkraft5.orderdetail WHERE `pkgid`=" & Chr(39) & pkgid & Chr(39) & " and orderid=" & orderid.ToString & ";"
    '        dsorderdetail.DeleteCommand = command
    '        dsorderdetail.Delete()
    '        dototal(orderid)
    '    Catch ex As Exception

    '        Return
    '    End Try
    '    Try
    '        command = "DELETE FROM kinderkraft5.orderoptions WHERE `pkgid`=" & Chr(39) & pkgid & Chr(39) & " and orderid=" & orderid.ToString & ";"
    '        dsorderoptions.DeleteCommand = command
    '        dsorderoptions.Delete()
    '    Catch ex As Exception
    '        Return
    '    End Try

    'End Sub
    'Protected Sub Deleteitem(ByVal detailid As Integer, ByVal orderid As Integer)
    '    'this is not being used but I left in for future use

    '    Dim command As String
    '    Try
    '        command = "DELETE FROM kinderkraft5.orderdetail WHERE `orderdetailid`=" & detailid.ToString & ";"
    '        dsorderdetail.DeleteCommand = command
    '        dsorderdetail.Delete()
    '        dototal(orderid)
    '    Catch ex As Exception
    '        dototal(orderid)
    '        Return
    '    End Try
    '    Try
    '        command = "DELETE FROM kinderkraft5.orderoptions WHERE `detailid`=" & detailid.ToString & ";"
    '        dsorderoptions.DeleteCommand = command
    '        dsorderoptions.Delete()

    '    Catch ex As Exception
    '        Return
    '    End Try


    'End Sub
    Protected Sub gv1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gv1.RowDataBound
        Dim a As String = ""

        'dsorderdetail.SelectCommand = "SELECT orderid, orderdetailid, productcode, productname, quantity, prodprice, totalprice, pkgid FROM orderdetail WHERE (orderid = @orderid);"
        'below is not being used kept in for future use
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
        'not being used column does not exist
        'Dim lblremove As LinkButton = e.Row.FindControl("lbremove")
        'lblremove.Visible = SCa.IsCs
      
        Try
            cmdtext = "SELECT * FROM orderoptions  WHERE DetailId=" & vdetailid.ToString & ";"

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
    'Protected Sub dototal(ByVal orderid As Integer)
    '    Dim hforderstatus As HiddenField = FormView1.FindControl("hforderstatus")
    '    If hforderstatus.Value = "PROCESSING" Or hforderstatus.Value = "" Then
    '        Dim command As String = ""
    '        Dim LT As New LookUpTable
    '        Dim dvSql As New DataView
    '        Dim discount As Decimal = 0
    '        Dim subtot As Decimal = 0
    '        Dim total As Decimal = 0
    '        Dim tax As Decimal = 0
    '        Dim shippingcost As Decimal = 0
    '        Dim connection1 As New MySqlConnection(LT.ConnectStr)
    '        Dim lblpromoamt As Label = FormView1.FindControl("lblpromoamt")
    '        Dim txtpromocode As TextBox = FormView1.FindControl("txtpromocode")


    '        Dim cmd As MySqlCommand = New MySqlCommand(command, connection1)

    '        Try
    '            command = "select sum(o.`totalprice`) from kinderkraft5.orderdetail o WHERE o.`orderid`=" & orderid.ToString & ";"

    '            cmd = New MySqlCommand(command, connection1)
    '            connection1.Open()
    '            subtot = CDec(cmd.ExecuteScalar())

    '        Catch ex As Exception ' no records to sum so zero out everything

    '            'dsOrders.DeleteCommand = "DELETE FROM kinderkraft5.orders WHERE `orderid`=" & orderid.ToString & ";"
    '            'dsorders1.Delete()
    '            'dsorderdetail.DeleteCommand = "DELETE FROM kinderkraft5.orderdetail WHERE `orderid`=" & orderid.ToString & ";"
    '            'dsorderdetail.Delete()
    '            'Response.Redirect("OrderSearch.aspx")
    '            connection1.Close()
    '            Return
    '        Finally
    '            connection1.Close()

    '        End Try
    '        If subtot > 0 Then
    '            'get order details to send to taxable total function
    '            command = "SELECT orderid, orderdetailid, productcode, productname, quantity, prodprice, totalprice, pkgid FROM orderdetail WHERE (orderid = @orderid);"
    '            dsorderdetailmisc.SelectCommand = command
    '            Try
    '                dvSql = CType(Me.dsorderdetailmisc.Select(DataSourceSelectArguments.Empty), Data.DataView)
    '            Catch ex As Exception
    '                Return
    '            End Try
    '            Dim orderdetail As DataTable = dvSql.Table 'to send to gettaxable total
    '            Dim shpmeth As String
    '            Dim lblshipmeth As Label = DetailsView2.FindControl("lblshpmeth")
    '            If Not IsNothing(lblshipmeth) Then
    '                shpmeth = lblshipmeth.Text
    '            Else
    '                Dim ddlshipmeth As DropDownList = DetailsView2.FindControl("ddlshipmeth")
    '                shpmeth = ddlshipmeth.SelectedValue
    '            End If

    '            shippingcost = GetShipping(subtot)

    '            discount = LT.GetPromoDiscount(txtpromocode.Text.ToUpper, subtot)

    '            tax = GetTax(subtot, shippingcost, orderdetail, discount)
    '            total = subtot + shippingcost + discount + tax

    '            command = "UPDATE kinderkraft5.orders o SET total=" & total.ToString & ",subtot=" & subtot.ToString & ",shpchrg=" & shippingcost.ToString & ",discountamt=" & discount.ToString & ",tax=" & tax.ToString & " WHERE o.`orderid`=" & orderid.ToString & ";"
    '            dsorders1.UpdateCommand = command
    '            dsorders1.Update()
    '            FormView1.DataBind()
    '        Else 'less than 0
    '            'command = "DELETE FROM kinderkraft5.order WHERE `orderid`=" & orderid.ToString & ";"
    '            'dsorders1.DeleteCommand = command
    '            'dsorders1.Delete()

    '            Response.Redirect("OrderSearch.aspx")

    '        End If
    '    Else 'orderstatus

    '    End If


    'End Sub
    'Protected Sub dototal(ByVal orderid As Integer)
    '    Dim command As String = ""
    '    Dim LT As New LookUpTable
    '    Dim dvSql As New DataView
    '    Dim discount As Decimal = 0
    '    Dim subtot As Decimal = 0
    '    Dim total As Decimal = 0
    '    Dim tax As Decimal = 0
    '    Dim shippingcost As Decimal = 0
    '    Dim connection1 As New MySqlConnection(LT.ConnectStr)
    '    Dim lblpromoamt As Label = FormView1.FindControl("lblpromoamt")
    '    Dim txtpromocode As TextBox = FormView1.FindControl("txtpromocode")
    '    Dim cmd As MySqlCommand = New MySqlCommand(command, connection1)
    '    Dim status As String = DetailsView2.Rows(16).Cells(1).Text
    '    Select Case status
    '        Case "PROCESSING"
    '            Try
    '                command = "select sum(o.`totalprice`) from kinderkraft5.orderdetail o WHERE o.`orderid`=" & orderid.ToString & ";"

    '                cmd = New MySqlCommand(command, connection1)
    '                connection1.Open()
    '                subtot = CDec(cmd.ExecuteScalar())

    '            Catch ex As Exception ' no records to sum so zero out everything

    '                'dsOrders.DeleteCommand = "DELETE FROM kinderkraft5.orders WHERE `orderid`=" & orderid.ToString & ";"
    '                'dsorders1.Delete()
    '                'dsorderdetail.DeleteCommand = "DELETE FROM kinderkraft5.orderdetail WHERE `orderid`=" & orderid.ToString & ";"
    '                'dsorderdetail.Delete()
    '                'Response.Redirect("OrderSearch.aspx")
    '                connection1.Close()
    '                Return
    '            Finally
    '                connection1.Close()

    '            End Try
    '            If subtot > 0 Then
    '                'get order details to send to taxable total function
    '                command = "SELECT orderid, orderdetailid, productcode, productname, quantity, prodprice, totalprice, pkgid FROM orderdetail WHERE (orderid = @orderid);"
    '                dsorderdetailmisc.SelectCommand = command
    '                Try
    '                    dvSql = CType(Me.dsorderdetailmisc.Select(DataSourceSelectArguments.Empty), Data.DataView)
    '                Catch ex As Exception
    '                    Return
    '                End Try
    '                Dim orderdetail As DataTable = dvSql.Table 'to send to gettaxable total
    '                Dim shpmeth As String
    '                Dim lblshipmeth As Label = DetailsView2.FindControl("lblshpmeth")
    '                If Not IsNothing(lblshipmeth) Then
    '                    shpmeth = lblshipmeth.Text
    '                Else
    '                    Dim ddlshipmeth As DropDownList = DetailsView2.FindControl("ddlshipmeth")
    '                    shpmeth = ddlshipmeth.SelectedValue
    '                End If

    '                shippingcost = GetShipping(subtot)

    '                discount = LT.GetPromoDiscount(txtpromocode.Text, subtot)

    '                tax = GetTax(subtot, shippingcost, orderdetail, discount)
    '                total = subtot + shippingcost + discount + tax

    '                command = "UPDATE kinderkraft5.orders o SET total=" & total.ToString & ",subtot=" & subtot.ToString & ",shpchrg=" & shippingcost.ToString & ",discountamt=" & discount.ToString & ",tax=" & tax.ToString & " WHERE o.`orderid`=" & orderid.ToString & ";"
    '                dsorders1.UpdateCommand = command
    '                dsorders1.Update()
    '                FormView1.DataBind()
    '            Else 'less than 0
    '                'command = "DELETE FROM kinderkraft5.order WHERE `orderid`=" & orderid.ToString & ";"
    '                'dsorders1.DeleteCommand = command
    '                'dsorders1.Delete()

    '                Response.Redirect("~/Admin/OrderSearch.aspx")

    '            End If
    '        Case ""
    '            Try
    '                command = "select sum(o.`totalprice`) from kinderkraft5.orderdetail o WHERE o.`orderid`=" & orderid.ToString & ";"

    '                cmd = New MySqlCommand(command, connection1)
    '                connection1.Open()
    '                subtot = CDec(cmd.ExecuteScalar())

    '            Catch ex As Exception ' no records to sum so zero out everything

    '                'dsOrders.DeleteCommand = "DELETE FROM kinderkraft5.orders WHERE `orderid`=" & orderid.ToString & ";"
    '                'dsorders1.Delete()
    '                'dsorderdetail.DeleteCommand = "DELETE FROM kinderkraft5.orderdetail WHERE `orderid`=" & orderid.ToString & ";"
    '                'dsorderdetail.Delete()
    '                'Response.Redirect("OrderSearch.aspx")
    '                connection1.Close()
    '                Return
    '            Finally
    '                connection1.Close()

    '            End Try
    '            If subtot > 0 Then
    '                'get order details to send to taxable total function
    '                command = "SELECT orderid, orderdetailid, productcode, productname, quantity, prodprice, totalprice, pkgid FROM orderdetail WHERE (orderid = @orderid);"
    '                dsorderdetailmisc.SelectCommand = command
    '                Try
    '                    dvSql = CType(Me.dsorderdetailmisc.Select(DataSourceSelectArguments.Empty), Data.DataView)
    '                Catch ex As Exception
    '                    Return
    '                End Try
    '                Dim orderdetail As DataTable = dvSql.Table 'to send to gettaxable total
    '                Dim shpmeth As String
    '                Dim lblshipmeth As Label = DetailsView2.FindControl("lblshpmeth")
    '                If Not IsNothing(lblshipmeth) Then
    '                    shpmeth = lblshipmeth.Text
    '                Else
    '                    Dim ddlshipmeth As DropDownList = DetailsView2.FindControl("ddlshipmeth")
    '                    shpmeth = ddlshipmeth.SelectedValue
    '                End If

    '                shippingcost = GetShipping(subtot)

    '                discount = LT.GetPromoDiscount(txtpromocode.Text, subtot)

    '                tax = GetTax(subtot, shippingcost, orderdetail, discount)
    '                total = subtot + shippingcost + discount + tax

    '                command = "UPDATE kinderkraft5.orders o SET total=" & total.ToString & ",subtot=" & subtot.ToString & ",shpchrg=" & shippingcost.ToString & ",discountamt=" & discount.ToString & ",tax=" & tax.ToString & " WHERE o.`orderid`=" & orderid.ToString & ";"
    '                dsorders1.UpdateCommand = command
    '                dsorders1.Update()
    '                FormView1.DataBind()
    '            Else 'less than 0
    '                'command = "DELETE FROM kinderkraft5.order WHERE `orderid`=" & orderid.ToString & ";"
    '                'dsorders1.DeleteCommand = command
    '                'dsorders1.Delete()

    '                Response.Redirect("~/Admin/OrderSearch.aspx")

    '            End If
    '        Case Else
    '            'do nothing
    '    End Select






    'End Sub
    'Private Function GetShipping(ByVal subtot As Decimal) As Decimal

    '    Dim shpmeth As String
    '    Dim lblshipmeth As Label = DetailsView2.FindControl("lblshpmeth")
    '    If Not IsNothing(lblshipmeth) Then
    '        shpmeth = lblshipmeth.Text
    '    Else
    '        Dim ddlshipmeth As DropDownList = DetailsView2.FindControl("ddlshipmeth")
    '        shpmeth = ddlshipmeth.SelectedValue
    '    End If



    '    'Dim shp1 As Label = DetailsView2.FindControl("lblshipmeth")
    '    'Dim shp2 As DropDownList = DetailsView2.FindControl("ddlshipmeth")
    '    'If shp1.Text = Nothing Then
    '    '    shpmeth = shp2.SelectedValue
    '    'Else
    '    '    shpmeth = shp1.Text

    '    'End If
    '    Dim lt As New LookUpTable
    '    Dim val As Decimal = lt.GetShipping(subtot, shpmeth)
    '    Return val
    'End Function
    'Private Function GetTax(ByVal subtot As Decimal, ByVal shippingcost As Decimal, ByVal orderdetail As DataTable, discount As Decimal) As Decimal
    '	Dim SC As ShoppingCart = Session("ShoppingCart")
    '	Dim tax As Decimal
    '	Dim taxrate As Decimal = GetTaxRate()
    '	Dim exemptval As Boolean = SC.taxexempt
    '	Dim taxexemptchk As CheckBox = DetailsView1.FindControl("chktaxexempt1")
    '	If Not IsNothing(taxexemptchk) Then
    '		exemptval = taxexemptchk.Checked
    '	Else
    '		Dim taxexemptchk1 As CheckBox = DetailsView1.FindControl("chktaxexempt0")
    '		exemptval = taxexemptchk1.Checked
    '	End If
    '	Dim vpostalcode As String
    '	Dim lblshipzip As Label = DetailsView2.FindControl("lblshipzip")

    '	If IsNothing(lblshipzip) Then
    '		Dim txtship As TextBox = DetailsView2.FindControl("txtshipzip")
    '		vpostalcode = txtship.Text
    '	Else
    '		vpostalcode = lblshipzip.Text
    '	End If
    '       Dim taxabletotal As Decimal = SC.GetTaxableItemTotal(orderdetail, vpostalcode, shippingcost, exemptval)
    '       If (taxabletotal + discount) > 0 Then
    '           taxabletotal = taxabletotal + discount
    '       Else

    '       End If
    '       'taxabletotal = IIf(taxabletotal = 0, 0, taxabletotal + discount)
    '	tax = Math.Round(taxabletotal * taxrate, 2).ToString("N2")
    '	Return tax
    'End Function
    '  Private Function GetTaxRate() As Decimal
    'Dim LT As New LookUpTable
    'Dim vpostalcode As String
    'Dim lblshipzip As Label = DetailsView2.FindControl("lblshipzip")

    'If IsNothing(lblshipzip) Then
    '	Dim txtship As TextBox = DetailsView2.FindControl("txtshipzip")
    '	vpostalcode = txtship.Text
    'Else
    '	vpostalcode = lblshipzip.Text
    'End If

    'Dim rate As Decimal = LT.Gettax(vpostalcode)
    '      Return rate
    '  End Function
    'Private Sub DeleteOrder()

    '    Dim a As Integer = dscust.Delete() 'deletes orderss order table set up here
    '    Dim orderid As String = DetailsView2.DataKey("orderid")
    '    Dim orddetalicmd As String = "Delete from orderdetail where orderid=" & orderid
    '    Dim ordercmd As String = "Delete from orders where orderid=" & orderid
    '    Dim ordopcmd As String = "DELETE FROM orderoptions WHERE OrderId=" & orderid
    '    dsorderdetail.DeleteCommand = orddetalicmd
    '    dsorderoptions.DeleteCommand = ordopcmd
    '    dscust.DeleteCommand = ordercmd
    '    dsorderdetail.Delete()
    '    dsorderoptions.Delete()
    '    dscust.Delete() 'deletes orderss order table set up here
    '    DetailsView1.DataBind()
    '    DetailsView2.DataBind()
    '    FormView1.DataBind()

    '    Response.Redirect("~/Admin/OrderSearch.aspx")
    'End Sub


   

    Protected Sub Button2_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.PreRender
        Try

            Dim orderid As String = DetailsView2.DataKey("orderid").ToString

            Dim url As String = "~/PrintReceipt.aspx?orderid=" & orderid
            url = Page.ResolveClientUrl(url)
            Button2.OnClientClick = "window.open('" & url & "')"
        Catch ex As Exception

        End Try

    End Sub

    

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

		If Not IsPostBack Then

			If IsNothing(Session("ShoppingCart")) Then
				Dim SC As New ShoppingCart
				Dim lt As New LookUpTable
               
                'If SC.IsCs = True Then
                '	FormView1.ChangeMode(FormViewMode.Edit)
                'Else
                FormView1.ChangeMode(FormViewMode.ReadOnly)
                'End If
                Session.Add("ShoppingCart", SC) 'contains orderdetail table and options table and any other tables I create in the new sub of shopping cart
                Session.Add("LookUp", lt) 'contains product table and eventually option tables in it.
            Else
                Dim SC As ShoppingCart = Session("ShoppingCart")
               
                'If SC.IsCs = True Then
                '    FormView1.ChangeMode(FormViewMode.Edit)
                'Else
                FormView1.ChangeMode(FormViewMode.ReadOnly)
                'End If

            End If
        Else

        End If
	End Sub





	Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
		'onclick is set in button render using java script to open a new window

		'Dim orderid As String = DetailsView2.DataKey("orderid")

		'Response.Redirect("PrintReceipt.aspx?orderid=" & orderid)
	End Sub

    'Private Sub CancledOrderEmail(ByVal orderid As String)
    '	'Create an instance of the MailMessage class
    '	Dim objMM As New MailMessage
    '	Dim tomail As String
    '       'Dim smtpclient As String
    '       'Dim cpassword As String
    '       'Dim cuser As String
    '	If Directory.Exists("F:\IsDev") Then 'set dev settings
    '           'smtpclient = "smtp.embarqmail.com"
    '           'cuser = "wdal_farm@embarqmail.com"
    '           'cpassword = "briggitt"
    '		tomail = "wdal_farm@embarqmail.com"
    '	Else 'live
    '           'smtpclient = "192.168.1.245"
    '           'cuser = "authnet@memorybook.com"
    '           'cpassword = "authnet"
    '		Dim email As String = DetailsView1.Rows(10).Cells(1).Text
    '		tomail = Trim(email)
    '	End If
    '	'Set the properties

    '	objMM.To.Add(tomail) 'customer address
    '       objMM.Bcc.Add("kinderkraftcs@jostens.com") 'change this to correct address when done
    '       objMM.From = New MailAddress(ConfigurationManager.AppSettings("FromAddr"), ConfigurationManager.AppSettings("FromName"))

    '	'Send the email in text format
    '	objMM.IsBodyHtml = True

    '	'Set the subject
    '	objMM.Subject = "Order Cancellation from Jostens Kinderkraft"

    '	objMM.Body = "Your request to cancel your order #" & orderid & " from Jostens Kinderkraft has been completed and the amount of your order has been refunded. " _
    '	 & "If you need additional graduation items or ways to celebrate achievements all year, please visit us again at <a href='http://www.jostenskinderkraft.com ' >www.jostenskinderkraft.com. </a> <br/><br/>" _
    '	 & "If you have received this email in error or you did not cancel your order please call <br/> 855-826-2355.<br/> Sincerely,<br/>Jostens Kinderkraft Customer Service"

    '       Dim smtp As New SmtpClient(ConfigurationManager.AppSettings("smtpserver"))
    '       smtp.Credentials = New NetworkCredential(ConfigurationManager.AppSettings("smtpuser"), ConfigurationManager.AppSettings("smtppassword"))
    '	Try
    '		'smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some servers
    '		smtp.Send(objMM)
    '	Catch

    '	End Try
    'End Sub




	Protected Sub DetailsView1_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles DetailsView1.Init
        'Dim sc As ShoppingCart = Session("ShoppingCart")
        'Try
        '    DetailsView1.AutoGenerateEditButton = sc.IsCs
        'Catch ex As Exception

        'End Try

	End Sub

	Protected Sub DetailsView2_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles DetailsView2.Init
        'Dim sc As ShoppingCart = Session("ShoppingCart")
        'DetailsView2.AutoGenerateEditButton = sc.IsCs
	End Sub

	Protected Sub dsorderdetail_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles dsorderdetail.Updated
        'dototal(DetailsView2.DataKey("orderid"))
	End Sub

	Protected Sub dsOrders_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles dsOrders.Updated
		'called from details2 item updated
		'dototal(DetailsView2.DataKey("orderid"))
	End Sub

	Protected Sub dscust_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles dscust.Updated
		'called in detailsview1 itemupdated
        'dototal(DetailsView2.DataKey("orderid"))
	End Sub

	Protected Sub dsorderdetail_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles dsorderdetail.Deleted
        'dototal(DetailsView2.DataKey("orderid"))
	End Sub

    'Protected Sub CaptureOrder()
    '	Dim amount As Decimal
    '	Dim transid As String
    '	Dim authcode As String
    '	Try	'test if there is not data or if buttons were pushed before getting order
    '		Dim lbltotal As Label = FormView1.FindControl("lbltotal")
    '		amount = CDec(lbltotal.Text)
    '		transid = Gettransid()
    '		authcode = GetAuthCode()
    '		If IsNothing(transid) Then
    '			Return
    '		End If
    '	Catch ex As Exception
    '		Return
    '	End Try
    '	Dim gate As Object = OpenGateway()
    '	''  build the request from the Form post
    '	Dim auth As CaptureRequest = New AuthorizeNet.CaptureRequest(amount, transid, authcode)

    '	''  send to Auth.NET
    '	Dim response__1 As Object = gate.Send(auth)
    '	'' We must get the whole response to get CC company, the respons only hold a certain number of properties. The CC company is not
    '	'' one of them. We could sub class the response and add the CC company propery but I didn't want to do this for one field.
    '	'Dim BaseGatewayResponse As AuthorizeNet.GatewayResponse
    '	'BaseGatewayResponse = response__1



    '	'If response__1.Approved Then
    '	Dim orderid As String = DetailsView2.DataKey("orderid")
    '	'Dim orderid As String = DetailsView2.Rows(8).Cells(1).Text
    '	Dim connection1 As New MySqlConnection(dsOrders.ConnectionString)
    '	Dim commandtext As String = "UPDATE orders SET paymentcompleted = 1 WHERE (orderid =" & orderid & ");"
    '	dsOrders.UpdateCommand = commandtext
    '	Try
    '		dsOrders.Update()
    '	Catch ex As Exception

    '	End Try
    '	'Else
    '	'Dim a As String = response__1.message
    '	'End If

    'End Sub
	Private Function OpenGateway() As IGateway
		' we used the form builder so we can now just load it up
		'using the form reader
		Dim login As String = ConfigurationManager.AppSettings("ApiLogin")
		Dim transactionKey As String = ConfigurationManager.AppSettings("TransactionKey")


        Dim gate1 As New Gateway(login, transactionKey, ConfigurationManager.AppSettings("GatewayTest"))
		Return gate1


	End Function




	

    Protected Sub DetailsView2_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsView2.ItemUpdated

        'dototal(DetailsView2.DataKey("orderid"))
        'FormView1.DataBind()

    End Sub

    Protected Sub DetailsView1_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsView1.ItemUpdated
        'dototal(DetailsView2.DataKey("orderid"))
        'FormView1.DataBind()
    End Sub
    

   
    Protected Sub CheckBox2_PreRender(ByVal sender As Object, ByVal e As System.EventArgs)
        'Dim chkcanceled As CheckBox = FormView1.FindControl("checkbox2")
        'chkcanceled.Visible = chkcanceled.Checked
    End Sub
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
    'Protected Sub dsorderoptions_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles dsorderoptions.Selected
    '    Session.Add("affectedrows", e.AffectedRows)
    'End Sub

	Protected Sub DetailsView2_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles DetailsView2.ItemUpdating
        'Dim zip As String = e.NewValues.Item("szip")
        'Dim shipmethod As String = e.NewValues.Item("shipmethod")
        'Dim izip As Integer
        'Dim ddlshipmeth As DropDownList = DetailsView2.FindControl("ddlshipmeth")
        'Try
        '	izip = CInt(zip)
        '	If izip > 99500 And izip < 99951 Then
        '		e.NewValues.Item("shipmethod") = "AK/HI"
        '		'this is changed so dototal function will work
        '		ddlshipmeth.SelectedValue = "AK/HI"
        '	ElseIf izip > 96700 And izip < 96899 Then

        '		e.NewValues.Item("shipmethod") = "AK/HI"
        '		'this is changed so dototal function will work
        '		ddlshipmeth.SelectedValue = "AK/HI"
        '	Else
        '		If ddlshipmeth.SelectedValue = "AK/HI" Then
        '			ddlshipmeth.SelectedValue = "Standard"
        '		End If
        '	End If

        'Catch ex As Exception

        'End Try
	End Sub

	Protected Sub Button3_Click1(sender As Object, e As System.EventArgs)
        'Dim lblpromoamt As Label = FormView1.FindControl("lblpromoamt")
        'Dim txtpromocode As TextBox = FormView1.FindControl("txtpromocode")
        'Dim txtordnotes As TextBox = FormView1.FindControl("TextBox1")
        'Dim dstmporders As New SqlDataSource
        'dstmporders.ConnectionString = dsOrders.ConnectionString
        'Dim selectcmd As String = "Update orders set promocode=@promocode,discountamt=@discountamt, ordernotes=@ordernotes where orderid=@orderid;"
        'dstmporders.ProviderName = "MySql.Data.MySqlClient"
        'dstmporders.UpdateParameters.Add("@promocode", txtpromocode.Text)
        'dstmporders.UpdateParameters.Add("@ordernotes", txtordnotes.Text)
        'dstmporders.UpdateParameters.Add("@discountamt", lblpromoamt.Text)
        'dstmporders.UpdateParameters.Add("orderid", DetailsView2.DataKey("orderid"))
        'dstmporders.UpdateCommand = selectcmd
        'dstmporders.UpdateCommandType = SqlDataSourceCommandType.Text
        'dstmporders.Update()
        'dototal(DetailsView2.DataKey("orderid"))
	End Sub

	
	Protected Sub txtpromocode_TextChanged(sender As Object, e As System.EventArgs)
        'Dim lblpromoamt As Label = FormView1.FindControl("lblpromoamt")
        'Dim txtpromocode As TextBox = FormView1.FindControl("txtpromocode")
        'Dim txtordnotes As TextBox = FormView1.FindControl("TextBox1")
        'Dim dstmporders As New SqlDataSource
        'dstmporders.ConnectionString = dsOrders.ConnectionString
        'Dim selectcmd As String = "Update orders set promocode=@promocode,discountamt=@discountamt, ordernotes=@ordernotes where orderid=@orderid;"
        'dstmporders.ProviderName = "MySql.Data.MySqlClient"
        'dstmporders.UpdateParameters.Add("@promocode", txtpromocode.Text)
        'dstmporders.UpdateParameters.Add("@ordernotes", txtordnotes.Text)
        'dstmporders.UpdateParameters.Add("@discountamt", lblpromoamt.Text)
        'dstmporders.UpdateParameters.Add("orderid", DetailsView2.DataKey("orderid"))
        'dstmporders.UpdateCommand = selectcmd
        'dstmporders.UpdateCommandType = SqlDataSourceCommandType.Text
        'dstmporders.Update()
        'dototal(DetailsView2.DataKey("orderid"))

	End Sub

	

	Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
		Response.Redirect("~/CustomerOrders.aspx")
	End Sub

	Protected Sub DetailsView1_ModeChanging(sender As Object, e As System.Web.UI.WebControls.DetailsViewModeEventArgs) Handles DetailsView1.ModeChanging
		Dim sc As ShoppingCart = Session("ShoppingCart")
		Dim custid As Integer = DetailsView1.DataKey("custid")
		sc.AdminCustLogin(custid)
		Session("ShoppingCart") = sc
	End Sub

	Protected Sub DetailsView2_ModeChanging(sender As Object, e As System.Web.UI.WebControls.DetailsViewModeEventArgs) Handles DetailsView2.ModeChanging
		Dim sc As ShoppingCart = Session("ShoppingCart")
		Dim custid As Integer = DetailsView1.DataKey("custid")
		sc.AdminCustLogin(custid)
		Session("ShoppingCart") = sc
	End Sub

    Protected Sub CheckBox3_PreRender(sender As Object, e As System.EventArgs)
        'Dim chkonhold As CheckBox = FormView1.FindControl("checkbox3")
        'chkonhold.Visible = chkonhold.Checked
    End Sub

    'Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
    '    Dim cval As String = DropDownList1.SelectedValue.ToString
    '    Select Case cval
    '        Case "Delete Order"
    '            MsgBox1.Show("Delete Order", "Are you sure you want to deleted this order?", Nothing, New EO.Web.MsgBoxButton("Yes", Nothing, "YesDelete"), New EO.Web.MsgBoxButton("No", Nothing, "No"))
    '            'delete order called for msgbox click event
    '        Case DropDownList1.SelectedValue = "CompleteTransaction"

    '        Case "Cancel"
    '            MsgBox1.Show("Cancel Order", "Are you sure you want to cancel this order?", Nothing, New EO.Web.MsgBoxButton("Yes", Nothing, "YesCancel"), New EO.Web.MsgBoxButton("No", Nothing, "No"))

    '        Case "OrderHold"
    '            Dim orderid As String = DetailsView2.DataKey("orderid")
    '            If Not IsNothing(orderid) Then
    '                Dim command As String = "UPDATE orders SET onhold = 1,orderstatus='ON HOLD' WHERE (orderid =" & orderid.ToString & ");"
    '                dsorders1.UpdateCommand = command
    '                dsorders1.Update()
    '                FormView1.DataBind()

    '            End If
    '        Case "OffHold"
    '            Dim orderid As String = DetailsView2.DataKey("orderid")
    '            If Not IsNothing(orderid) Then
    '                Dim command As String = "UPDATE orders SET onhold = 0,orderstatus='PROCESSING' WHERE (orderid =" & orderid.ToString & ");"
    '                dsorders1.UpdateCommand = command
    '                dsorders1.Update()
    '                FormView1.DataBind()

    '            End If
    '        Case "orderemailcs"
    '            Dim cid As String = DetailsView1.DataKey("custid")
    '            Dim orderid As String = DetailsView2.DataKey("orderid")
    '            Dim newpage As String = "~/Receipt.aspx?customerid=" & cid & "&orderid=" & orderid & "&CS=True"

    '            Response.Redirect(newpage)
    '        Case "orderemailall"
    '            Dim cid As String = DetailsView1.DataKey("custid")
    '            Dim orderid As String = DetailsView2.DataKey("orderid")

    '            Dim newpage As String = "~/Receipt.aspx?customerid=" & cid & "&orderid=" & orderid & "&CS=False"
    '            Response.Redirect(newpage)
    '        Case "PENDING"
    '            Dim orderid As String = DetailsView2.DataKey("orderid")
    '            If Not IsNothing(orderid) Then
    '                Dim command As String = "UPDATE orders SET onhold = 1,orderstatus='PENDING' WHERE (orderid =" & orderid.ToString & ");"
    '                dsorders1.UpdateCommand = command
    '                dsorders1.Update()
    '                FormView1.DataBind()
    '            End If
    '    End Select
    'End Sub
    'Protected Sub CancelOrder()
    '    'Dim orderid As Label = DetailsView2.FindControl("lblorderid")
    '    Dim orderid As String = DetailsView2.DataKey("orderid")
    '    If Not IsNothing(orderid) Then
    '        Dim command As String = "UPDATE orders SET ordercanceled = 1 WHERE (orderid =" & orderid.ToString & ");"
    '        dsorders1.UpdateCommand = command
    '        dsorders1.Update()
    '        FormView1.DataBind()
    '        CancledOrderEmail(orderid.ToString)
    '    End If
    'End Sub
    'Protected Sub MsgBox1_ButtonClick(sender As Object, e As System.Web.UI.WebControls.CommandEventArgs) Handles MsgBox1.ButtonClick
    '    If e.CommandName = "YesDelete" Then
    '        DeleteOrder()
    '    ElseIf e.CommandName = "YesCancel" Then
    '        CancelOrder()
    '    End If

    'End Sub
  

    Protected Sub DetailsView2_PreRender(sender As Object, e As System.EventArgs) Handles DetailsView2.PreRender
        'Try 'I use try because when page first loads detailview is not available after it load everything is ok
        '    Dim status As String = DetailsView2.Rows(16).Cells(1).Text
        '    Select Case status
        '        Case "PROCESSING"
        '            DetailsView2.AutoGenerateEditButton = True
        '            DetailsView1.AutoGenerateEditButton = True
        '        Case ""
        '            DetailsView2.AutoGenerateEditButton = True
        '            DetailsView1.AutoGenerateEditButton = True
        '        Case Else
        '            DetailsView2.AutoGenerateEditButton = False
        '            DetailsView1.AutoGenerateEditButton = False
        '    End Select

        'Catch ex As Exception

        'End Try

    End Sub

    Protected Sub txtpromocode_Init1(sender As Object, e As System.EventArgs)
        'Try
        '    Dim status As String = DetailsView2.Rows(16).Cells(1).Text
        '    Dim txtpromocode As TextBox = FormView1.FindControl("txtpromocode")
        '    Select Case status
        '        Case "PROCESSING"
        '            txtpromocode.Enabled = True
        '        Case ""
        '            txtpromocode.Enabled = True
        '        Case Else
        '            txtpromocode.Enabled = False
        '    End Select
        'Catch ex As Exception

        'End Try
    End Sub

  
    
End Class
