Imports System.IO
Imports System.Data

Partial Class Admin_data
	Inherits System.Web.UI.Page

	Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
		Dim goodtogo As Boolean = False
		Dim filepath As String = "F:\InetPub\wwwroot\volusioncust.txt"
		'kk past cust for database 1-23-13


		Dim anerror As Boolean = False
		Dim companyname As String = ""
		Dim bphone As String = ""
		Dim addr1 As String = ""
		Dim addr2 As String = ""
		Dim bcity As String = ""
		Dim bstate As String = ""
		Dim oldtotsales As String = ""
		Dim zip As String = ""
		Dim state As String = ""
		Dim totalsalestax As String = ""
		Dim firstname As String = ""
		Dim lastname As String = ""
		Dim email As String = ""
		Dim shoporder As String = ""
		Dim oraclecustnum As String = ""
		Dim emailsubscribe As String = ""
		Dim d11 As String = "0.00"
		Dim d12 As String = "0.00"
		Dim d13 As String = "0.00"

		Dim i As Integer = 0
		Dim sr As IO.StreamReader = New StreamReader(filepath)
		Dim line, vals() As String

		Do While Not sr.EndOfStream
			Dim a As DateTime = Now()

			line = sr.ReadLine

			If line Is Nothing Then
				Exit Do
			End If
			If i > 0 Then
				Try
					vals = line.Split(vbTab)
					'SY11 KK Cust.txt
					companyname = vals(0)
					bphone = vals(1)
					addr1 = vals(2)
					addr2 = vals(3)
					bcity = vals(4)
					bstate = vals(5) 'convert to full name in 13
					zip = vals(6)
					'oldtotsales = vals(7)
					''SY12 KK Cust.txt and sy13
					email = vals(7)
					firstname = vals(8)
					lastname = vals(9)
					emailsubscribe = vals(10) 'convert to 0 or 1 boolean
					If emailsubscribe = "N" Then
						emailsubscribe = "0"
					ElseIf emailsubscribe = "Y" Then
						emailsubscribe = "1"
					Else
						emailsubscribe = "0"

					End If
					oraclecustnum = vals(11)
					'shoporder = vals(11)

					'd11 = IIf(vals(9) = "  ", "0.00", vals(9))
					'd12 = IIf(vals(10) = "  ", "0.00", vals(10))
					'd13 = IIf(vals(11) = "  ", "0.00", vals(11))
					''volusion

					Try
						dscust.InsertParameters.Clear()
						dscust.InsertParameters.Add("@fname", firstname)
						dscust.InsertParameters.Add("@lname", lastname)
						dscust.InsertParameters.Add("@EmailAddress", email)
						dscust.InsertParameters.Add("@CompanyName", companyname)
						dscust.InsertParameters.Add("@billingaddr1", addr1)
						dscust.InsertParameters.Add("@billingaddr2", addr2)
						dscust.InsertParameters.Add("@city", bcity)
						dscust.InsertParameters.Add("@state", bstate)
						dscust.InsertParameters.Add("@postalcode", zip)
						dscust.InsertParameters.Add("@phonenumber", bphone)
						dscust.InsertParameters.Add("@emailsubscriber", emailsubscribe)
						dscust.InsertParameters.Add("@oracleshoporder", shoporder)
						dscust.InsertParameters.Add("@oraclecustid", oraclecustnum)
						dscust.InsertParameters.Add("@dollar11", CDec(d11))
						dscust.InsertParameters.Add("@dollar12", CDec(d12))
						dscust.InsertParameters.Add("@dollar13", CDec(d13))
						dscust.InsertCommand = "INSERT INTO cust(fname, lname, EmailAddress, billingaddr1, billingaddr2, city, phonenumber, emailsubscriber, CompanyName, state, postalcode," _
						 & "oracleshoporder, oraclecustid,dollar11,dollar12,dollar13) VALUES (@fname, @lname, @EmailAddress, @billingaddr1, @billingaddr2, @city, @phonenumber, @emailsubscriber, @CompanyName,     @state, @postalcode," _
						 & "@oracleshoporder, @oraclecustid,@dollar11,@dollar12,@dollar13)"
						dscust.Insert()
					Catch ex As Exception


					End Try
				Catch ex As Exception

				End Try
			End If



			i = i + 1

		Loop
		sr.Close()
		sr = Nothing


	End Sub
	Private Function convert(ByVal namepart As Integer, thevalue As String) As String
		'sub string val and return which part is requested
		Dim space = thevalue.IndexOf(" ")
		Dim retval As String
		If namepart = 1 Then 'get first name
			retval = thevalue.Substring(0, space)
		Else 'get last name
			retval = thevalue.Substring(space + 1)
		End If
		Return retval
	End Function

	Protected Sub Button2_Click(sender As Object, e As System.EventArgs) Handles Button2.Click
		dscust.SelectCommand = "SELECT * FROM CUST;"
		Dim dvSql As New DataView
		Dim drvSql As DataRowView
		Dim dvSTATE As String
		Dim DVCUSTID As Integer
		Try
			dvSql = CType(Me.dscust.Select(DataSourceSelectArguments.Empty), Data.DataView)
			For Each drvSql In dvSql
				dvSTATE = drvSql("STATE").ToString()
				DVCUSTID = drvSql("CUSTID")
				If dvSTATE.Length < 3 Then
					UPDATESTATE(dvSTATE, DVCUSTID)
				End If
			Next



		Catch ex As Exception

		End Try
	End Sub
	Private Sub UPDATESTATE(DVSTATE As String, DVCUSTID As Integer)
		Dim dvSql As New DataView
		Dim drvSql As DataRowView
		Dim FULLSTATE As String
		DSSTATE.SelectCommand = "SELECT * FROM STATES WHERE ABRV=@ABRV"
		DSSTATE.UpdateParameters.Clear()
		DSSTATE.SelectParameters.Clear()
		DSSTATE.SelectParameters.Add("@ABRV", DVSTATE)
		dvSql = CType(Me.DSSTATE.Select(DataSourceSelectArguments.Empty), Data.DataView)
		Try
			For Each drvSql In dvSql
				FULLSTATE = Trim(drvSql("NAME").ToString())
				dscust.UpdateCommand = "UPDATE cust SET STATE =@STATE WHERE CUSTID=@CUSTID"
				dscust.UpdateParameters.Clear()
				dscust.UpdateParameters.Add("@STATE", FULLSTATE)
				dscust.UpdateParameters.Add("@CUSTID", DVCUSTID)
				dscust.Update()

			Next
		Catch ex As Exception

		End Try

	End Sub

	Protected Sub Button3_Click(sender As Object, e As System.EventArgs) Handles Button3.Click
		Dim dvSql As New DataView
		Dim drvSql As DataRowView
		Dim username As String
		Dim companyname As String
		Dim rnum As New Random
		Dim password As String
		Dim custid As Integer
		DSSTATE.SelectCommand = "SELECT * FROM cust"
		DSSTATE.UpdateParameters.Clear()
	
		dvSql = CType(Me.DSSTATE.Select(DataSourceSelectArguments.Empty), Data.DataView)
		For Each drvSql In dvSql
			companyname = Trim(drvSql("CompanyName"))
			custid = drvSql("custid")
			username = companyname & rnum.Next(1000, 9999).ToString
			password = SetPassword()

			dscust.UpdateCommand = "UPDATE cust SET username =@username,password=@password WHERE CUSTID=@CUSTID"
			dscust.UpdateParameters.Clear()
			dscust.UpdateParameters.Add("@username", username)
			dscust.UpdateParameters.Add("@password", password)
			dscust.UpdateParameters.Add("@CUSTID", custid.ToString)
			Try
				dscust.Update()
			Catch ex As Exception

			End Try


		Next
	End Sub
	Function SetPassword() As String
		Dim s As String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
		Dim r As New Random
		Dim sb As New StringBuilder
		For i As Integer = 1 To 5
			Dim idx As Integer = r.Next(0, 35)
			sb.Append(s.Substring(idx, 1))
		Next
		Return sb.ToString()

	End Function

	Protected Sub Button4_Click(sender As Object, e As System.EventArgs) Handles Button4.Click
		'imports orders
		Dim goodtogo As Boolean = False
		Dim filepath As String = "F:\InetPub\wwwroot\volusionorders.txt"
		'kk past cust for database 1-23-13


		Dim anerror As Boolean = False
		Dim companyname As String = ""
		Dim sphone As String = ""
		Dim addr1 As String = ""
		Dim addr2 As String = ""
		Dim scity As String = ""
		Dim sstate As String = ""
		Dim oldtotsales As String = ""
		Dim zip As String = ""
		Dim state As String = ""
		Dim totalsalestax As String = ""
		Dim firstname As String = ""
		Dim lastname As String = ""
		Dim shipcost As String = ""
		Dim transactionid As String = ""
		Dim shoporder As String = ""
		Dim oraclecustnum As String = ""
		Dim orderdate As DateTime
		Dim orderstatus As String = ""
		Dim ordernote As String = ""
		Dim volorderid As String = ""
		Dim tax As String = ""
		Dim paymethod As String = ""
		Dim subtot As String = ""
		Dim a As String
		Dim customerid As String = ""
		Dim volcustomerid As String = ""
		Dim total As String = ""
		Dim refby As String = ""
		Dim taxid As String = ""
		Dim isorg As String = ""
		Dim i As Integer = 0
		Dim sr As IO.StreamReader = New StreamReader(filepath)
		Dim line, vals() As String

		Do While Not sr.EndOfStream


			line = sr.ReadLine

			If line Is Nothing Then
				Exit Do
			End If
			If i > 0 Then
				Try
					vals = line.Split(vbTab)
					'SY11 KK Cust.txt
					volorderid = vals(0)
					volcustomerid = vals(1)
					companyname = vals(2)
					sphone = vals(3)
					addr1 = vals(4)
					addr2 = vals(5)
					scity = vals(6)
					sstate = vals(7) 'convert to full name in 13
					zip = vals(8)
					firstname = vals(9)
					lastname = vals(10)
					shipcost = vals(11)
					transactionid = vals(12)
					orderdate = vals(13)
					a = orderdate.ToString("s")
					'orderstatus = vals(14)	'convert to my status
					tax = vals(15)
					total = vals(16)
					subtot = CDec(total) - (CDec(tax) + CDec(shipcost))
					ordernote = vals(17)
					If ordernote = "  " Then
						ordernote = vals(18)
					End If
					taxid = vals(19)
					refby = vals(20)
					isorg = vals(21)
					If isorg = "Y" Then
						isorg = "1"
					Else
						isorg = "0"
					End If
					paymethod = vals(22)
					If paymethod = "5" Then
						paymethod = "VISA"
					ElseIf paymethod = "6" Then
						paymethod = "MASTERCARD"
					ElseIf paymethod = "7" Then
						paymethod = "AMERICAN EXPRESS"
					ElseIf paymethod = "13" Then
						paymethod = "PO"

					End If
					customerid = GetCustomerId(volcustomerid)
					Try
						dsorders.InsertParameters.Clear()

						dsorders.InsertParameters.Add("@customerid", customerid)
						dsorders.InsertParameters.Add("@volorderid", volorderid)
						dsorders.InsertParameters.Add("@volcustid", volcustomerid)
						dsorders.InsertParameters.Add("@CompanyName", companyname)
						dsorders.InsertParameters.Add("@sphone", sphone)
						dsorders.InsertParameters.Add("@saddr1", addr1)
						dsorders.InsertParameters.Add("@sadd2", addr2)
						dsorders.InsertParameters.Add("@scity", scity)
						dsorders.InsertParameters.Add("@sstate", sstate)
						dsorders.InsertParameters.Add("@szip", zip)
						dsorders.InsertParameters.Add("@sfname", firstname)
						dsorders.InsertParameters.Add("@slname", lastname)
						dsorders.InsertParameters.Add("@shpchrg", shipcost)
						dsorders.InsertParameters.Add("@authnettranid", transactionid)
						dsorders.InsertParameters.Add("@orderdate", a)
						'dsorders.InsertParameters.Add("@orderstatus",or)
						dsorders.InsertParameters.Add("@tax", tax)
						dsorders.InsertParameters.Add("@total", total)
						dsorders.InsertParameters.Add("@subtot", subtot)
						dsorders.InsertParameters.Add("@ordernotes", ordernote)
						dsorders.InsertParameters.Add("@refby", refby)
						dsorders.InsertParameters.Add("@taxid", taxid)
						dsorders.InsertParameters.Add("@isorg", isorg)
						dsorders.InsertParameters.Add("@paytype", paymethod)





						dsorders.InsertCommand = "INSERT INTO orders(customerid,sfname, slname, saddr, sadd2, scity, sphone,sCompanyName, sstate, szip," _
						 & "volorderid, volcustid,shpchrg,authnettranid,orderdate,tax,total,subtot,ordernotes,paytype)" _
						 & "VALUES (@customerid,@sfname, @slname,@saddr1, @add2, @scity, @sphone,@CompanyName, @sstate, @szip," _
						 & "@volorderid, @volcustid,@shpchrg,@authnettranid,@orderdate,@tax,@total,@subtot,@ordernotes,@paytype)"
						dsorders.Insert()
					Catch ex As Exception


					End Try
				Catch ex As Exception

				End Try
			End If



			i = i + 1

		Loop
		sr.Close()
		sr = Nothing
	End Sub
	Function GetCustomerId(volsioncustid As String) As String

		Dim dvSql As New DataView
		Dim drvSql As DataRowView
		dscust.SelectCommand = "Select oraclecustid,custid from cust where oraclecustid=" & volsioncustid
		Try
			dvSql = CType(Me.dscust.Select(DataSourceSelectArguments.Empty), Data.DataView)
		Catch ex As Exception
			
		End Try
		Dim dvoraclecustid As String = ""
		Dim custid As Integer = 0
		For Each drvSql In dvSql
			dvoraclecustid = drvSql("oraclecustid")
			custid = drvSql("custid")
		Next
		Return custid.ToString
	End Function
	Function GetOrderidId(volusionorderid As String) As String

		Dim dvSql As New DataView
		Dim drvSql As DataRowView
        dscust.SelectCommand = "Select volorderid,orderid from orders where volorderid=" & volusionorderid
		Try
			dvSql = CType(Me.dscust.Select(DataSourceSelectArguments.Empty), Data.DataView)
		Catch ex As Exception

		End Try
		Dim dvvolusionorderid As String = ""
		Dim orderid As Integer = 0
		For Each drvSql In dvSql
			dvvolusionorderid = drvSql("volorderid")
			orderid = drvSql("orderid")
		Next
		Return orderid.ToString
	End Function

	
	
	Protected Sub Button5_Click(sender As Object, e As System.EventArgs) Handles Button5.Click
		'imports order details
		Dim goodtogo As Boolean = False
        Dim filepath As String = "F:\InetPub\wwwroot\volusionordersdetail.txt"
		'kk past cust for database 1-23-13


		Dim anerror As Boolean = False
		
		Dim productcode As String = ""
		Dim productname As String = ""
		Dim quantity As String = ""
		Dim price As String = ""
		Dim totalprice As String = ""
		Dim pkgid As String = ""
		Dim volorderid As String = ""
		Dim opdesc As String = ""
        Dim orderid As String = ""
		Dim volcustomerid As String = ""
		Dim total As String = ""
		Dim refby As String = ""
		Dim taxid As String = ""
		Dim isorg As String = ""
		Dim i As Integer = 0
		Dim sr As IO.StreamReader = New StreamReader(filepath)
		Dim line, vals() As String

		Do While Not sr.EndOfStream


			line = sr.ReadLine

			If line Is Nothing Then
				Exit Do
			End If
			If i > 0 Then
				Try
					vals = line.Split(vbTab)
					'SY11 KK Cust.txt
                    volorderid = vals(0)
                    orderid = GetOrderidId(volorderid)

					productcode = vals(1)
					productname = vals(2)
					quantity = vals(3)
					price = vals(4)
					totalprice = vals(5)
					pkgid = vals(6)	'convert to full name in 13
					opdesc = vals(7)

					Try
						dsorders.InsertParameters.Clear()
                        dsorders.InsertParameters.Add("@volorderid", volorderid)

                        dsorders.InsertParameters.Add("@orderid", orderid)
						dsorders.InsertParameters.Add("@productcode", productcode)
						dsorders.InsertParameters.Add("@productname", productname)
						dsorders.InsertParameters.Add("@quantity", quantity)
						dsorders.InsertParameters.Add("@prodprice", price)
						dsorders.InsertParameters.Add("@totalprice", totalprice)
                        'dsorders.InsertParameters.Add("@pkgid", pkgid)
                        'dsorders.InsertParameters.Add("@opdesc", opdesc)

                        dsorders.InsertCommand = "INSERT INTO orderdetail(orderid,productcode,productname,quantity,prodprice,totalprice,volorderid)" _
       & "VALUES (@orderid, @productcode,@productname, @quantity, @prodprice, @totalprice,@volorderid)"
						dsorders.Insert()
					Catch ex As Exception


					End Try
				Catch ex As Exception

				End Try
			End If



			i = i + 1

		Loop
		sr.Close()
		sr = Nothing
	End Sub
End Class
