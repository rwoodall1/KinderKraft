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
Public Class ShoppingCart
	Private detailDT As System.Data.DataTable
	Private vuseremail As String
	Private vusername As String = "GUEST" 'default value
	Private vuserzip As String
	Private vpromocode As String = ""
    Private vshipmethod As String = "Standard"
    Private vexpectedshipdate As String
	Private viscs As Boolean
	Private vtaxexempt As Boolean = False
	Private vneworg As Boolean = False
	Private vstate As String
	Private vcompanyname As String
	Private vshipcode As String
	Private vadminguest As Boolean
	Private vholdpayment As Boolean = False
	Private vphonelog As Boolean = False
	Private vloggedin As Boolean = False
	Private vcustid As Integer = 0
	Private vloginid As Integer
	Private vtaxrate As Decimal = 0
	Private opfieldDT As System.Data.DataTable
	Private objDR As System.Data.DataRow
	Private vinternational As Boolean = False
	Private vnoshpchg As Boolean = False
    Private vpersdiploma As Boolean = False
    Private vtmpbannername As String = ""

#Region "Properties"
    Public Property tmpBannerName As String
        Get
            Return vtmpbannername
        End Get
        Set(ByVal Value As String)
            vtmpbannername = Value
        End Set
    End Property
    Public Property PersDiploma As Boolean
        Get
            Return vpersdiploma
        End Get
        Set(ByVal Value As Boolean)
            vpersdiploma = Value
        End Set
    End Property
    Public Property NoShipChg As Boolean
        Get
            Return vnoshpchg
        End Get
        Set(ByVal Value As Boolean)
            vnoshpchg = Value
        End Set
    End Property
    Public Property International As Boolean
        Get
            Return vinternational
        End Get
        Set(ByVal Value As Boolean)
            vinternational = Value
        End Set
    End Property
    Public Property CompanyName As String
        Get
            Return vcompanyname
        End Get
        Set(ByVal Value As String)
            vcompanyname = Value
        End Set
    End Property
    Public Property AdminGuest As Boolean
        Get
            Return vadminguest
        End Get
        Set(ByVal Value As Boolean)
            vadminguest = Value
        End Set
    End Property
    Public Property NewOrg As Boolean
        Get
            Return vneworg
        End Get
        Set(ByVal Value As Boolean)
            vneworg = Value
        End Set
    End Property
    Public Property HoldPayment As Boolean
        Get
            Return vholdpayment
        End Get
        Set(ByVal Value As Boolean)
            vholdpayment = Value
        End Set
    End Property
    Public Property LoggedIn As Boolean
        Get
            Return vloggedin
        End Get
        Set(ByVal Value As Boolean)
            vloggedin = Value
        End Set
    End Property
    Public Property taxrate As Decimal
        Get
            Return vtaxrate
        End Get
        Set(ByVal Value As Decimal)
            vtaxrate = Value
        End Set
    End Property
    Public Property custid As Integer
        Get
            Return vcustid
        End Get
        Set(ByVal Value As Integer)
            If Me.IsCs = True Then
                If Value <> vcustid Then 'new customer
                    If Value = 0 Then '0 is set if logged in as cs after logging in as a user so don't do phone log
                        Me.DoPhonelog = False
                    Else
                        Me.DoPhonelog = True
                    End If


                Else
                    Me.DoPhonelog = False
                End If
            End If
            vcustid = Value
        End Set
    End Property
    Public Property loginid As Integer
        Get
            Return vloginid
        End Get
        Set(ByVal Value As Integer)
            vloginid = Value
        End Set
    End Property
    Public Property shipmethod As String
        Get
            Return vshipmethod
        End Get
        Set(ByVal Value As String)
            vshipmethod = Value
        End Set
    End Property
    Public Property ShipCode As String
        Get
            Return vshipcode
        End Get
        Set(ByVal Value As String)
            vshipcode = Value
        End Set
    End Property
    Public Property promocode As String
        Get
            Return vpromocode
        End Get
        Set(ByVal Value As String)
            vpromocode = Value
        End Set
    End Property
    Public Property expectedshipdate As String
        Get
            Return vexpectedshipdate
        End Get
        Set(ByVal Value As String)
            vexpectedshipdate = Value
        End Set
    End Property
    Public Property state As String
        Get
            Return vstate
        End Get
        Set(ByVal Value As String)
            vstate = Value
        End Set
    End Property
    Public Property taxexempt As Boolean
        Get
            Return vtaxexempt
        End Get
        Set(ByVal Value As Boolean)
            vtaxexempt = Value
        End Set
    End Property
    Public Property username As String
        Get
            Return vusername
        End Get
        Set(ByVal Value As String)
            vusername = Value
        End Set
    End Property
    Public Property IsCs As Boolean
        Get
            Return viscs
        End Get
        Set(ByVal Value As Boolean)
            viscs = Value
        End Set
    End Property
    Public Property DoPhonelog As Boolean
        Get
            Return vphonelog
        End Get
        Set(ByVal Value As Boolean)
            vphonelog = Value
        End Set
    End Property
    Public Property useremail As String
        Get
            Return vuseremail
        End Get
        Set(ByVal Value As String)
            vuseremail = Value
        End Set
    End Property
    Public Property userzip As String
        Get
            Return vuserzip
        End Get
        Set(ByVal Value As String)
            vuserzip = Value
        End Set
    End Property
    Public Property orderdetail() As System.Data.DataTable
        Get
            Return detailDT
        End Get
        Set(ByVal Value As System.Data.DataTable)
            detailDT = Value
        End Set
    End Property
    Public Property OrderOptions() As System.Data.DataTable
        Get
            Return opfieldDT
        End Get
        Set(ByVal Value As System.Data.DataTable)
            opfieldDT = Value
        End Set
    End Property
#End Region
	Sub New()
		Me.MakeCart()
		Me.MakeOrderOptionTable()
	End Sub
#Region "Make Tables Functions"
	Sub MakeOrder()
		'orderDt = New System.Data.DataTable("Order")
		'orderDt.Columns.Add("custid", GetType(Integer))
		'orderDt.Columns("custid").AutoIncrement = True
		'orderDt.Columns("custid").AutoIncrementSeed = 1

		'orderDt.Columns.Add("DetailId", GetType(Integer))
		'orderDt.Columns("DetailId").AutoIncrement = True
		'orderDt.Columns("DetailId").AutoIncrementSeed = 1
		'orderDt.Columns.Add("fname", GetType(String))
		'orderDt.Columns.Add("lname", GetType(String))
		'orderDt.Columns.Add("Quantity", GetType(Integer))
		'orderDt.Columns.Add("Price", GetType(Decimal))
		'orderDt.Columns.Add("Cost", GetType(Decimal))
		'orderDt.Columns.Add("pkgid", GetType(string))

		'Me.orderdetail = orderDt
	End Sub
	Sub MakeCart()
		detailDT = New System.Data.DataTable("DetailsOrder")
		detailDT.Columns.Add("OrderId", GetType(Integer))

		detailDT.Columns.Add("DetailId", GetType(Integer))
		detailDT.Columns("DetailId").AutoIncrement = True
		detailDT.Columns("DetailId").AutoIncrementSeed = 1
		detailDT.Columns.Add("PRODuctCODE", GetType(String))
		detailDT.Columns.Add("ProductName", GetType(String))
		detailDT.Columns.Add("Quantity", GetType(Integer))
		detailDT.Columns.Add("ProdPrice", GetType(Decimal))	'was price
		detailDT.Columns.Add("totalprice", GetType(Decimal)) 'was cost
		detailDT.Columns.Add("pkgid", GetType(String)) 'this was changed from int to varchar
		detailDT.Columns.Add("OpDesc", GetType(String))	'combines for pkg all the descr

		Me.orderdetail = detailDT
	End Sub
	Sub MakeOrderOptionTable()
		opfieldDT = New System.Data.DataTable("OrderOptions")
		opfieldDT.Columns.Add("OrderId", GetType(Integer))
		opfieldDT.Columns.Add("DetailId", GetType(Integer))
		opfieldDT.Columns.Add("opid", GetType(Integer))
		opfieldDT.Columns.Add("opdesc", GetType(String))
		opfieldDT.Columns.Add("pkgid", GetType(String))

		Me.OrderOptions = opfieldDT
	End Sub
#End Region
	Sub ClearOrder()
        Me.shipmethod = Nothing
		Me.promocode = Nothing
        Me.NoShipChg = False
        Me.PersDiploma = False
        Me.tmpBannerName = Nothing
        Dim rcount As Integer = Me.orderdetail.Rows.Count - 1

        Do While rcount > -1
            Me.orderdetail.Rows(rcount).Delete()
            'Me.orderdetail.Rows(rcount).AcceptChanges()
            rcount = rcount - 1
        Loop
        rcount = Me.OrderOptions.Rows.Count - 1
        Do While rcount > -1

            Me.OrderOptions.Rows(rcount).Delete()
            'Me.OrderOptions.Rows(rcount).AcceptChanges()
            rcount = rcount - 1
        Loop

	End Sub
	Sub AdminCustLogin(custid As Integer)
		Dim lt As New LookUpTable
		Dim dvSql As New DataView
		Dim drvSql As DataRowView
		Dim dscust1 As New SqlDataSource
		dscust1.ProviderName = "MySql.Data.MySqlClient"
        dscust1.SelectCommandType = SqlDataSourceCommandType.Text
        dscust1.ConnectionString = ConfigurationManager.ConnectionStrings("KK5").ToString
        Dim selectcmd As String
		selectcmd = "SELECT distinct  cust.iscs,cust.username,cust.EmailAddress,Companyname,password,postalcode,taxexempt,taxexemptconfirmed,taxstate,holdpayment,custid from cust where cust.custid=" & custid & ";"
		dscust1.SelectCommand = selectcmd
		Try
			dvSql = CType(dscust1.Select(DataSourceSelectArguments.Empty), Data.DataView)
		Catch ex As Exception

		End Try
		Dim dvcompanyname As String = ""
		Dim dvemailaddress As String = ""
		Dim dvpassword As String = ""
		Dim dvzipcode As String = ""
		Dim dvtaxexempt As Boolean = False
		Dim dvstate As String = ""
		Dim dvid As Integer = 0
		Dim dvholdpayment As Boolean = False


		For Each drvSql In dvSql
			Me.useremail = drvSql("EmailAddress").ToString()
			dvtaxexempt = drvSql("taxexemptconfirmed")
			dvholdpayment = drvSql("holdpayment")
			Me.CompanyName = drvSql("companyname")
			Try
				Me.state = drvSql("state").ToString
				Me.userzip = drvSql("postalcode").ToString()
			Catch ex As Exception
			End Try
		Next
		Me.HoldPayment = dvholdpayment
		Me.custid = custid
		Me.taxexempt = dvtaxexempt
		Me.taxrate = LT.Gettax(Me.userzip)


	End Sub
	Function GetTaxableItemTotal(ByVal dt As System.Data.DataTable, ByVal zip As String, ByVal shipping As Decimal, ByVal taxexempt As Boolean) As Decimal
		Dim intCounter As Integer
		Dim decRunningTotal As Decimal = 0
		Dim cost As Decimal
		Dim prodcode As String = ""
		Dim qty As Integer
        For intCounter = 0 To dt.Rows.Count - 1
            If dt.Rows(intCounter).RowState <> DataRowState.Deleted Then
                objDR = dt.Rows(intCounter)
                cost = objDR("ProdPrice")
                prodcode = objDR("productcode")
                qty = objDR("Quantity")
                If taxexempt = False Then
                    If NonTaxable(zip, prodcode) = False Then   'check to see if product is exempt 
                        decRunningTotal += (objDR("ProdPrice") * objDR("Quantity"))
                    Else
                        'don't add this product to total
                    End If
                Else
                    'we are tax exempt don't add product to total

                End If


            End If


        Next
		If dt.Rows.Count = 1 Then

			If NonTaxable(zip, prodcode) = True Then

                If prodcode = "CAPGWN" Or prodcode = "GWN" Or prodcode = "CAP" Or prodcode = "TAS" Or prodcode = "KSASH" Or prodcode = "KCHOIRSASH" Then
                    Return decRunningTotal
                Else 'not correct prod codes
                    If shiptaxable(zip) = True Then 'check to see if shipping is taxed, some states exempt tax on shipping and handling
                        If taxexempt = False Then
                            If decRunningTotal > 0 Then
                                decRunningTotal = decRunningTotal + shipping
                            End If
                        End If
                    End If
                    End If
			Else 'nontaxable=false
                    If shiptaxable(zip) = True Then 'check to see if shipping is taxed, some states exempt tax on shipping and handling
                    If taxexempt = False Then
                        If decRunningTotal > 0 Then
                            decRunningTotal = decRunningTotal + shipping
                        End If
                    End If
                End If
                End If
		Else 'rowcown>1
                If shiptaxable(zip) = True Then 'check to see if shipping is taxed, some states exempt tax on shipping and handling
                If taxexempt = False Then
                    If decRunningTotal > 0 Then
                        decRunningTotal = decRunningTotal + shipping
                    End If
                End If
            End If
            End If
            Return decRunningTotal
    End Function
	Function shiptaxable(ByVal zip As String) As Boolean
		Dim retval As Boolean = True
		Dim lt As New LookUpTable
		retval = lt.Getshiptaxable(zip)
		Return retval
	End Function
	Function NonTaxable(ByVal zip As String, ByVal prodcode As String) As Boolean
		Dim retval As Boolean = False
		Dim lt As New LookUpTable
		retval = lt.GettaxableProduct(zip, prodcode)
		Return retval
	End Function
	Function GetItemTotal(ByVal dt As System.Data.DataTable) As Decimal
		Dim intCounter As Integer
		Dim decRunningTotal As Decimal
		Dim cost As Decimal
		Dim qty As Integer
        For intCounter = 0 To dt.Rows.Count - 1
            If dt.Rows(intCounter).RowState <> DataRowState.Deleted Then
                objDR = dt.Rows(intCounter)
                cost = objDR("ProdPrice")
                qty = objDR("Quantity")
                decRunningTotal += (objDR("ProdPrice") * objDR("Quantity"))
            End If
        Next
		Return decRunningTotal
	End Function
	Sub Delete_ItemG(ByVal orddt As System.Data.DataTable, ByVal opdt As System.Data.DataTable, ByVal e As DataGridCommandEventArgs) 'datagrid
		Dim detailid As Integer = orddt.Rows(e.Item.ItemIndex).Item("DetailId")	'get order detail id
		orddt.Rows(e.Item.ItemIndex).Delete() 'delete detail of order
		Dim opdetailid As Integer
		Dim i As Integer = opdt.Rows.Count 'get how many option records
		i = i - 1 '0 based array
		'we loop from last row to first row
		Do While i <> -1
			'For i = 0 To rcount 'loop each record and see if it belongs to the deleted order detail record, if so deletd that option record
			opdetailid = opdt.Rows(i).Item("DetailId")
			If opdt.Rows(i).Item("DetailId") = detailid Then
				opdt.Rows(i).Delete()

			End If
			i = i - 1 'next row below
		Loop
		Me.orderdetail = orddt
		Me.OrderOptions = opdt
	End Sub
    Sub Delete_Item(ByVal orddt As System.Data.DataTable, ByVal opdt As System.Data.DataTable, ByVal detailid As Integer, ByVal ProdCode As String, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) 'dataview
        'Dim detailid As Integer = orddt.Rows(e.RowIndex).Item("DetailId") 'get order detail id 

        Dim pkgid As String = detailid 'set to detailid if pkg will be correct if not pkg then not used  'orddt.Rows(e.RowIndex).Item("pkgid")
        If ispkg(prodcode) = True Then
            DeletePkg(pkgid, orddt, opdt, e)
            Me.orderdetail = orddt
            Me.OrderOptions = opdt
        Else
            For Each dr As DataRow In orddt.Rows  'ds.Tables(0).Rows
                If dr.RowState <> DataRowState.Deleted Then
                    If (dr("detailid") = detailid) Then

                        dr.Delete()
                        orddt.AcceptChanges()
                        Exit For
                    End If
                End If
            Next



            'orddt.Rows(e.RowIndex).Delete() 'delete detail of order
            Dim opdetailid As Integer
            Dim i As Integer = opdt.Rows.Count 'get how many option records
            i = i - 1 '0 based array
            'we loop from last row to first row
            Do While i <> -1
                'For i = 0 To rcount 'loop each record and see if it belongs to the deleted order detail record, if so deletd that option record
                If opdt.Rows(i).RowState <> DataRowState.Deleted Then
                    opdetailid = opdt.Rows(i).Item("DetailId")
                    If opdt.Rows(i).Item("DetailId") = detailid Then
                        opdt.Rows(i).Delete()
                        opdt.AcceptChanges()
                    End If
                    i = i - 1 'next row below
                End If
            Loop


            Me.orderdetail = orddt
            Me.OrderOptions = opdt
        End If

    End Sub
	Function AddToCart(ByVal orddetails As System.Data.DataTable, ByVal productcode As String, ByVal qty As String, ByVal price As String, ByVal prodname As String, ByVal opdesc As String) As Integer

		objDR = orddetails.NewRow
		objDR("OrderId") = 1 'one will always be used for cart. When we put in database database will assign orderid
		objDR("Quantity") = Int32.Parse(qty)
		objDR("PRODuctCODE") = productcode
		objDR("TotalPrice") = Decimal.Parse(price) * Int32.Parse(qty)
		objDR("ProductName") = prodname
		objDR("ProdPrice") = Decimal.Parse(price)
		objDR("pkgid") = productcode
		objDR("OpDesc") = Trim(opdesc)
		orddetails.Rows.Add(objDR)
		Me.orderdetail = orddetails
		Dim rowcount As Integer = orderdetail.Rows.Count
		Dim detid As Integer = orderdetail.Rows(rowcount - 1).Item("DetailId")
		Return detid.ToString
	End Function
	Sub AddPkgToCart(ByVal orddetails As System.Data.DataTable, ByVal lt As LookUpTable, ByVal productcode As String, ByVal qty As String, ByVal price As String, ByVal prodname As String, ByVal opqty As Integer, ByVal aropttions As Array)


		Dim kitid As Integer = lt.GetKitId(lt, productcode)
		Dim vdetid As Integer
		Dim optioncat As Integer
		lt.AddKitOpData(kitid) 'add correct kit options
        Dim rowcount As Integer = lt.KitOptionsTable.Rows.Count - 1

		'add the pkg row
		objDR = orddetails.NewRow
		objDR("OrderId") = 1 'one will always be used for cart. When we put in database database will assign orderid
		objDR("Quantity") = opqty

		objDR("PRODuctCODE") = productcode
		objDR("ProdPrice") = Decimal.Parse(price)
		objDR("TotalPrice") = Decimal.Parse(price) * Int32.Parse(opqty)
		objDR("ProductName") = prodname
		objDR("OpDesc") = ""
		objDR("pkgid") = 0 'detailid is not know yet set to zeor
		'= objDR("pkgid") 'used to know what items to delete in the pkg
		orddetails.Rows.Add(objDR)
		Dim pkgid As String = orderdetail.Rows(orderdetail.Rows.Count - 1).Item("DetailId")	'id of pkg row, will use for pkg id
		'add the individual products 
		Do While rowcount <> -1
			optioncat = lt.GetProductOptionCat(RTrim(lt.KitOptionsTable.Rows(rowcount).Item("KitOpProductCode").ToString.ToUpper))
			objDR = orddetails.NewRow
			objDR("OrderId") = 1 'one will always be used for cart. When we put in database database will assign orderid
			objDR("Quantity") = opqty 'as of now this will always be the same as the pkg qty, use qty out of kitoptions if something changes
			Dim tmpcode As String = RTrim(lt.KitOptionsTable.Rows(rowcount).Item("KitOpProductCode").ToString.ToUpper)
			objDR("PRODuctCODE") = tmpcode
			objDR("TotalPrice") = 0	'cost is reflected in the pkg row
			objDR("ProductName") = lt.GetProductName(RTrim(lt.KitOptionsTable.Rows(rowcount).Item("KitOpProductCode").ToString.ToUpper))
			objDR("ProdPrice") = 0 'price is reflected in the pkg row
			objDR("OpDesc") = AddPkgDetailDesc(tmpcode, aropttions, optioncat)
			objDR("pkgid") = pkgid 'used to know what items to delete in the pkg
			orddetails.Rows.Add(objDR)
			vdetid = orderdetail.Rows(orderdetail.Rows.Count - 1).Item("DetailId")
			AddPkgOptions(tmpcode, vdetid, optioncat, aropttions, pkgid)
			rowcount = rowcount - 1
		Loop


		Me.orderdetail = orderdetail

	End Sub
	Private Function AddPkgDetailDesc(ByVal prodcode As String, ByVal arroptions As Array, ByVal optioncat As Integer) As String
		Dim i As Integer
		Dim iend As Integer = arroptions.GetUpperBound(0)
		Dim arraydesc As String
		Dim desc As String = ""
		Select Case prodcode
			Case "CAP"
				For i = 0 To iend
                    If arroptions(i, 4) = 45 Then
                        arraydesc = arroptions(i, 2)
                        desc = desc & " " & Trim(arraydesc)
                        Exit For
                    End If
				Next

			Case "GWN"

				For i = 0 To iend
					If arroptions(i, 4) = 21 Then 'alway use 21 for gown clr                 
						arraydesc = arroptions(i, 2)
						desc = desc & " " & Trim(arraydesc)
						Exit For
					End If
				Next

				For i = 0 To iend
					If arroptions(i, 4) = 34 Then
						arraydesc = arroptions(i, 2)
						desc = desc & " " & Trim(arraydesc)
						Exit For
					End If
				Next
			Case Else

				If optioncat = 36 Then


					For i = 0 To iend
						If arroptions(i, 4) = 36 Then
							arraydesc = arroptions(i, 2)
							desc = desc & " " & Trim(arraydesc)
						End If
					Next
				ElseIf optioncat = 37 Then
					For i = 0 To iend
						If arroptions(i, 4) = 37 Then
							arraydesc = arroptions(i, 2)
							desc = desc & " " & Trim(arraydesc)
						End If
					Next
				ElseIf optioncat = 39 Then
					For i = 0 To iend
						If arroptions(i, 4) = 39 Then
							arraydesc = arroptions(i, 2)
							desc = desc & " " & Trim(arraydesc)
							Exit For
						End If
					Next
				ElseIf optioncat = 41 Then
					For i = 0 To iend
						If arroptions(i, 4) = 41 Then
							arraydesc = arroptions(i, 2)
							desc = desc & " " & Trim(arraydesc)
							Exit For
						End If
					Next
				ElseIf optioncat = 42 Then
					For i = 0 To iend
						If arroptions(i, 4) = 42 Then
							arraydesc = arroptions(i, 2)
							desc = desc & " " & Trim(arraydesc)
						End If
					Next
				ElseIf optioncat = 43 Then
					For i = 0 To iend
						If arroptions(i, 4) = 43 Then
							arraydesc = arroptions(i, 2)
							desc = desc & " " & Trim(arraydesc)
						End If
					Next
				ElseIf optioncat = 44 Then
					For i = 0 To iend
						If arroptions(i, 4) = 44 Then
							arraydesc = arroptions(i, 2)
							desc = desc & " " & Trim(arraydesc)
						End If
					Next
				ElseIf optioncat = 45 Then
					For i = 0 To iend
						If arroptions(i, 4) = 45 Then
							arraydesc = arroptions(i, 2)
							desc = desc & " " & Trim(arraydesc)
						End If
					Next
                ElseIf optioncat = 46 Then
                    For i = 0 To iend
                        If arroptions(i, 4) = 46 Then
                            arraydesc = arroptions(i, 2)
                            desc = desc & " " & Trim(arraydesc)
                        End If
                    Next
                ElseIf optioncat = 48 Then
                    For i = 0 To iend
                        If arroptions(i, 4) = 48 Then
                            arraydesc = arroptions(i, 2)
                            desc = desc & " " & Trim(arraydesc)
                        End If
                    Next
				End If
		End Select
		Return desc
	End Function
	Sub SetShipCode(subtotal As Decimal, shipop As String)
		Select Case subtotal
			Case 0 To 49.99
				Select Case shipop


					Case "STANDARD"
						Me.ShipCode = "SS1"
					Case "RUSH"
						Me.ShipCode = "SR1"
					Case "EXPRESS"
						Me.ShipCode = "SE1"
					Case "AK/HI"
						Me.ShipCode = "SA1"
					Case "INTERNATIONAL"
						Me.ShipCode = "SI1"
				End Select
			Case 50.0 To 149.99
				Select Case shipop

					Case "STANDARD"
						Me.ShipCode = "SS2"
					Case "RUSH"
						Me.ShipCode = "SR2"
					Case "EXPRESS"
						Me.ShipCode = "SE2"
					Case "AK/HI"
						Me.ShipCode = "SA2"
					Case "INTERNATIONAL"
						Me.ShipCode = "SI2"
				End Select
			Case 150 To 299.99
				Select Case shipop

					Case "STANDARD"
						Me.ShipCode = "SS3"
					Case "RUSH"
						Me.ShipCode = "SR3"
					Case "EXPRESS"
						Me.ShipCode = "SE3"
					Case "AK/HI"
						Me.ShipCode = "SA3"
					Case "INTERNATIONAL"
						Me.ShipCode = "SI3"
				End Select
			Case 300 To 449.99
				Select Case shipop

					Case "STANDARD"
						Me.ShipCode = "SS4"
					Case "RUSH"
						Me.ShipCode = "SR4"
					Case "EXPRESS"
						Me.ShipCode = "SE4"
					Case "AK/HI"
						Me.ShipCode = "SA4"
					Case "INTERNATIONAL"
						Me.ShipCode = "SI4"
				End Select
			Case Is > 450
				Select Case shipop

					Case "STANDARD"
						Me.ShipCode = "SS5"
					Case "RUSH"
						Me.ShipCode = "SR5"
					Case "EXPRESS"
						Me.ShipCode = "SE5"
					Case "AK/HI"
						Me.ShipCode = "SA5"
					Case "INTERNATIONAL"
						Me.ShipCode = "SI5"
				End Select

		End Select
	End Sub

	Sub AddOptions(ByVal OrderOptions As System.Data.DataTable, ByVal arroptions As Array, ByVal pkgid As String)
		Dim i As Integer
		Dim iend As Integer = arroptions.GetUpperBound(0)



		For i = 0 To iend

			objDR = OrderOptions.NewRow
			objDR("OrderId") = 1 'order id will always be 1

			objDR("opid") = arroptions(i, 1)
			objDR("opdesc") = arroptions(i, 2)
			objDR("pkgid") = arroptions(i, 3)
			objDR("DetailId") = arroptions(i, 4)
			OrderOptions.Rows.Add(objDR)
		Next

		Me.OrderOptions = OrderOptions

	End Sub
	Sub AddPkgOptions(ByVal productcode As String, ByVal detailid As Integer, ByVal optioncat As Integer, ByVal arroptions As Array, ByVal pkgid As String)
		'optioncat are
		'21=Cap/Gown color
		'34=Gown Size
		'36=Tassel clr
		'37=Sash Style
		'39=Diploma/Cert
		'41=Grad Bear Color
		'42=Tee Size
		'43=Ribbon Options
		'44=Mgnetic Frame
        '45=Cap Clr
        '46=frame clr
		Dim i As Integer
		Dim iend As Integer = arroptions.GetUpperBound(0)

		Select Case productcode
			Case "CAP"
				For i = 0 To iend
                    If arroptions(i, 4) = 45 Then
                        objDR = OrderOptions.NewRow
                        objDR("OrderId") = 1 'order id will always be 1

                        objDR("opid") = arroptions(i, 1)
                        objDR("opdesc") = Trim(arroptions(i, 2))
                        objDR("pkgid") = pkgid
                        objDR("DetailId") = detailid
                        OrderOptions.Rows.Add(objDR)
                        Exit For
                    End If
				Next

			Case "GWN"

				For i = 0 To iend
					If arroptions(i, 4) = 21 Then 'alway use 21 for gown clr
						objDR = OrderOptions.NewRow
						objDR("OrderId") = 1 'order id will always be 1

						objDR("opid") = arroptions(i, 1)
						objDR("opdesc") = Trim(arroptions(i, 2))
						objDR("pkgid") = pkgid
						objDR("DetailId") = detailid
						OrderOptions.Rows.Add(objDR)
						Exit For
					End If
				Next

				For i = 0 To iend
					If arroptions(i, 4) = 34 Then
						objDR = OrderOptions.NewRow
						objDR("OrderId") = 1 'order id will always be 1

						objDR("opid") = arroptions(i, 1)
						objDR("opdesc") = Trim(arroptions(i, 2))
						objDR("pkgid") = pkgid
						objDR("DetailId") = detailid
						OrderOptions.Rows.Add(objDR)
						Exit For
					End If
                Next
            Case "KSASH"
                For i = 0 To iend
                    If arroptions(i, 4) = 37 Then 'alway use 37 for sash color
                        objDR = OrderOptions.NewRow
                        objDR("OrderId") = 1 'order id will always be 1

                        objDR("opid") = arroptions(i, 1)
                        objDR("opdesc") = Trim(arroptions(i, 2))
                        objDR("pkgid") = pkgid
                        objDR("DetailId") = detailid
                        OrderOptions.Rows.Add(objDR)
                        Exit For
                    End If
                Next

                For i = 0 To iend
                    If arroptions(i, 4) = 49 Then 'add grad 14
                        objDR = OrderOptions.NewRow
                        objDR("OrderId") = 1 'order id will always be 1

                        objDR("opid") = arroptions(i, 1)
                        objDR("opdesc") = Trim(arroptions(i, 2))
                        objDR("pkgid") = pkgid
                        objDR("DetailId") = detailid
                        OrderOptions.Rows.Add(objDR)
                        Exit For
                    End If
                Next



            Case Else

                If optioncat = 36 Then


                    For i = 0 To iend
                        If arroptions(i, 4) = 36 Then
                            objDR = OrderOptions.NewRow
                            objDR("OrderId") = 1 'order id will always be 1

                            objDR("opid") = arroptions(i, 1)
                            objDR("opdesc") = Trim(arroptions(i, 2))
                            objDR("pkgid") = pkgid
                            objDR("DetailId") = detailid
                            OrderOptions.Rows.Add(objDR)
                            Exit For
                        End If
                    Next
                    'ElseIf optioncat = 37 Then
                    '    For i = 0 To iend
                    '        If arroptions(i, 4) = 37 Then
                    '            objDR = OrderOptions.NewRow
                    '            objDR("OrderId") = 1 'order id will always be 1

                    '            objDR("opid") = arroptions(i, 1)
                    '            objDR("opdesc") = Trim(arroptions(i, 2))
                    '            objDR("pkgid") = pkgid
                    '            objDR("DetailId") = detailid
                    '            OrderOptions.Rows.Add(objDR)
                    '            Exit For
                    '        End If
                    '    Next
                ElseIf optioncat = 39 Then
                    For i = 0 To iend
                        If arroptions(i, 4) = 39 Then
                            objDR = OrderOptions.NewRow
                            objDR("OrderId") = 1 'order id will always be 1

                            objDR("opid") = arroptions(i, 1)
                            objDR("opdesc") = Trim(arroptions(i, 2))
                            objDR("pkgid") = pkgid
                            objDR("DetailId") = detailid
                            OrderOptions.Rows.Add(objDR)
                            Exit For
                        End If
                    Next
                ElseIf optioncat = 41 Then
                    For i = 0 To iend
                        If arroptions(i, 4) = 41 Then
                            objDR = OrderOptions.NewRow
                            objDR("OrderId") = 1 'order id will always be 1

                            objDR("opid") = arroptions(i, 1)
                            objDR("opdesc") = Trim(arroptions(i, 2))
                            objDR("pkgid") = pkgid
                            objDR("DetailId") = detailid
                            OrderOptions.Rows.Add(objDR)
                            Exit For
                        End If
                    Next
                ElseIf optioncat = 42 Then
                    For i = 0 To iend
                        If arroptions(i, 4) = 42 Then
                            objDR = OrderOptions.NewRow
                            objDR("OrderId") = 1 'order id will always be 1

                            objDR("opid") = arroptions(i, 1)
                            objDR("opdesc") = Trim(arroptions(i, 2))
                            objDR("pkgid") = pkgid
                            objDR("DetailId") = detailid
                            OrderOptions.Rows.Add(objDR)
                            Exit For
                        End If
                    Next
                ElseIf optioncat = 43 Then
                    For i = 0 To iend
                        If arroptions(i, 4) = 43 Then
                            objDR = OrderOptions.NewRow
                            objDR("OrderId") = 1 'order id will always be 1

                            objDR("opid") = arroptions(i, 1)
                            objDR("opdesc") = Trim(arroptions(i, 2))
                            objDR("pkgid") = pkgid
                            objDR("DetailId") = detailid
                            OrderOptions.Rows.Add(objDR)
                            Exit For
                        End If
                    Next
                ElseIf optioncat = 44 Then
                    For i = 0 To iend
                        If arroptions(i, 4) = 44 Then
                            objDR = OrderOptions.NewRow
                            objDR("OrderId") = 1 'order id will always be 1

                            objDR("opid") = arroptions(i, 1)
                            objDR("opdesc") = Trim(arroptions(i, 2))
                            objDR("pkgid") = pkgid
                            objDR("DetailId") = detailid
                            OrderOptions.Rows.Add(objDR)
                            Exit For
                        End If
                    Next
                ElseIf optioncat = 45 Then
                    For i = 0 To iend
                        If arroptions(i, 4) = 45 Then
                            objDR = OrderOptions.NewRow
                            objDR("OrderId") = 1 'order id will always be 1

                            objDR("opid") = arroptions(i, 1)
                            objDR("opdesc") = Trim(arroptions(i, 2))
                            objDR("pkgid") = pkgid
                            objDR("DetailId") = detailid
                            OrderOptions.Rows.Add(objDR)
                            Exit For
                        End If
                    Next
                ElseIf optioncat = 46 Then
                    For i = 0 To iend
                        If arroptions(i, 4) = 46 Then
                            objDR = OrderOptions.NewRow
                            objDR("OrderId") = 1 'order id will always be 1

                            objDR("opid") = arroptions(i, 1)
                            objDR("opdesc") = Trim(arroptions(i, 2))
                            objDR("pkgid") = pkgid
                            objDR("DetailId") = detailid
                            OrderOptions.Rows.Add(objDR)
                            Exit For
                        End If
                    Next



                ElseIf optioncat = 48 Then
                    For i = 0 To iend
                        If arroptions(i, 4) = 48 Then
                            objDR = OrderOptions.NewRow
                            objDR("OrderId") = 1 'order id will always be 1

                            objDR("opid") = arroptions(i, 1)
                            objDR("opdesc") = Trim(arroptions(i, 2))
                            objDR("pkgid") = pkgid
                            objDR("DetailId") = detailid
                            OrderOptions.Rows.Add(objDR)
                            Exit For
                        End If
                    Next

                End If
        End Select

		Me.OrderOptions = OrderOptions


	End Sub
	Private Sub DeletePkg(ByVal pkgid As String, ByVal orddt As DataTable, ByVal opdt As DataTable, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs)
		Dim ordpkgid As String
		Dim i As Integer
		i = orddt.Rows.Count - 1 '0 based array

        Do While i <> -1
            If orddt.Rows(i).RowState <> DataRowState.Deleted Then
                ordpkgid = orddt.Rows(i).Item("pkgid")
                If orddt.Rows(i).Item("pkgid") = pkgid Or orddt.Rows(i).Item("DetailId") = pkgid Then
                    orddt.Rows(i).Delete()
                    orddt.AcceptChanges()
                    i = i - 1
                Else
                    i = i - 1
                End If
            End If
        Loop



		i = opdt.Rows.Count	'get how many option records
		i = i - 1 '0 based array
		'we loop from last row to first row
		Do While i <> -1
            If opdt.Rows(i).RowState <> DataRowState.Deleted Then

                If opdt.Rows(i).Item("pkgid") = pkgid Then
                    opdt.Rows(i).Delete()
                    opdt.AcceptChanges()
                    i = i - 1
                Else
                    i = i - 1
                End If
            End If
        Loop


        Me.orderdetail = orddt
		Me.OrderOptions = opdt
	End Sub
	Private Function ispkg(ByVal prodcode As String) As Boolean
		Dim retval As Boolean = False
		Dim lt As New LookUpTable
		Dim kits As DataTable = lt.KitTable
		Dim rowcount As Integer = kits.Rows.Count - 1

		Do While rowcount <> -1
			If RTrim(kits.Rows(rowcount).Item("KitProductCode").ToString.ToUpper) = RTrim(prodcode.ToUpper) Then
				retval = True
				Exit Do
			End If
			rowcount = rowcount - 1
		Loop

		Return retval
	End Function
End Class
