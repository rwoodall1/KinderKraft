
Imports System.Data

Partial Class CustOrders
	Inherits webformbase
	Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
		Dim cmdtext As String
		If searchcustid.Text = Nothing Then
			cmdtext = "select * from cust;"
		Else
			cmdtext = "select * from cust where custid=" & searchcustid.Text & ";"
		End If

		dscust.SelectCommand = cmdtext


	End Sub


	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		'Dim LinkButton1 As LinkButton = DirectCast(Master.FindControl("LinkButton1"), LinkButton)
		Dim custid As String = Request.QueryString("custid")
		Dim cmdtext As String
		If IsNothing(Session("ShoppingCart")) Then

			Response.Redirect("../login.aspx")
		Else
			Dim sc As ShoppingCart = Session("ShoppingCart")
			If sc.IsCs = False Then
				Response.Redirect("../shopjostenshome.aspx")
			Else
				LinkButton1.Visible = sc.IsCs
			End If
		End If
		If IsNothing(custid) Then
			cmdtext = "select * from cust;"
			'cmdtext1 = "SELECT orderid, orderdate, shipdate, ordernotes, total, customerid, ponumber FROM orders WHERE (customerid =" & custid & ");"
		Else
			cmdtext = "select * from cust where custid =" & custid & ";"

		End If

		dscust.SelectCommand = cmdtext

	End Sub

	Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton2.Click

		Dim custid As String = DetailsView1.DataKey("custid")
		Response.Redirect("~/Admin/Customers.aspx?custid=" & custid)
	End Sub


	Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
		Dim dvSql As New DataView
		Dim drvSql As DataRowView
		Dim dvSql1 As New DataView
		Dim drvSql1 As DataRowView
		Dim custid As String = DetailsView1.DataKey("custid").ToString
		Dim selectcmd As String
        selectcmd = "SELECT distinct  cust.iscs,cust.username,cust.EmailAddress,international,sinternational,Companyname,password,postalcode,spostalcode,taxexemptconfirmed,state,holdpayment,allowpo,dollar11,dollar12,dollar13,custid from cust where cust.custid=" & custid & ";"
		Me.dscust1.SelectCommand = selectcmd
		Try
			dvSql = CType(Me.dscust1.Select(DataSourceSelectArguments.Empty), Data.DataView)
		Catch ex As Exception
			
		End Try
		Dim dvemailaddress As String = ""
		Dim dvpassword As String = ""
        Dim dvzipcode As String = ""
        Dim dvszipcode As String = ""
        Dim dvtaxexempt As Boolean = False
        Dim international As Boolean = False
        Dim sinternational As Boolean = False
		Dim dvstate As String = ""
		Dim dvid As Integer = 0
		Dim dvholdpayment As Boolean = False
		Dim dvallowpo As Boolean = False
		Dim dvcompanyname As String = ""
		Dim dvdollar11 As Decimal = 0
		Dim dvdollar12 As Decimal = 0
		Dim dvdollar13 As Decimal = 0
		Dim dollartot As Decimal = 0
		For Each drvSql In dvSql
			dvemailaddress = drvSql("EmailAddress").ToString()
			dvtaxexempt = drvSql("taxexemptconfirmed")
			dvholdpayment = drvSql("holdpayment")
            dvallowpo = drvSql("allowpo")
            international = drvSql("international")
            sinternational = drvSql("sinternational")
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
                dvszipcode = drvSql("spostalcode").ToString()
			Catch ex As Exception

			End Try
		Next
		'see if cust has orders if not new cust
		selectcmd = "SELECT distinct  orderid from orders where orders.customerid='" & dvid & "';"
		Me.dscust1.SelectCommand = selectcmd

		Try
			dvSql1 = CType(Me.dscust1.Select(DataSourceSelectArguments.Empty), Data.DataView)
		Catch ex As Exception

		End Try
		Dim vordid As Integer
		For Each drvSql1 In dvSql1

			vordid = drvSql1("orderid")

		Next
		Dim newcust As Boolean
        If dvSql1.Count > 0 Then
            newcust = False
        Else
            newcust = True

        End If
        If dollartot > 0 Then
            newcust = False
        Else
            newcust = True

        End If
        If dvallowpo = True Then
            newcust = False
        End If





			Dim SC As ShoppingCart = Session("ShoppingCart")
		Dim LT As LookUpTable = Session("LookUp")
		SC.HoldPayment = dvholdpayment
		SC.NewOrg = newcust
        SC.custid = DetailsView1.DataKey("custid")
        If international = True Then
            SC.International = True
        ElseIf sinternational = True Then
            SC.International = True
        End If
		Try
			SC.CompanyName = DetailsView1.DataKey("companyname")
		Catch ex As Exception
			SC.CompanyName = "Company Name Not Given"
		End Try

			SC.useremail = dvemailaddress
        SC.userzip = dvszipcode
			SC.taxexempt = dvtaxexempt
			SC.taxrate = LT.Gettax(SC.userzip)
			SC.state = dvstate
			Session("ShoppingCart") = SC

		Response.Redirect("../shopjostenshome.aspx")

	End Sub

	Protected Sub Button3_Click(sender As Object, e As System.EventArgs) Handles Button3.Click
		Dim custid As String = DetailsView1.DataKey("custid")
		Response.Redirect("~/Admin/PhoneLog.aspx?custid=" & custid)
	End Sub

    Protected Sub GridView1_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim a As String = DataBinder.Eval(e.Row.DataItem, "orderstatus")
            If DataBinder.Eval(e.Row.DataItem, "orderstatus") = "ON HOLD" Then
                e.Row.BackColor = Drawing.Color.LightPink
            ElseIf DataBinder.Eval(e.Row.DataItem, "orderstatus") = "PENDING" Then
                e.Row.BackColor = Drawing.Color.LightPink
            End If
           

        End If
    End Sub
End Class
