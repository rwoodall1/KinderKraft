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
Public Class LookUpTable
    Private vconnect As String
    Dim ProdDT As System.Data.DataTable
    Dim TaxDR As System.Data.DataRow
    Dim TaxDT As System.Data.DataTable
    Dim KitDT As System.Data.DataTable
    Dim KitOpDT As System.Data.DataTable
    Dim ProdDR As System.Data.DataRow
    Dim KitDR As System.Data.DataRow
    Dim KitOpDR As System.Data.DataRow
    Dim ShipDr As System.Data.DataRow
    Dim ShipDT As System.Data.DataTable
    Dim strcon As String = "Server=memserver;User id=root;Password=3l3phant1;Connection Timeout=2;Persist Security Info=True;Database=KINDERKRAFT5"
    Dim strcon1 As String = "Server=databases;User id=root;Password=3l3phant1;Connection Timeout=2;Persist Security Info=True;Database=KINDERKRAFT5"

    Sub New()
        Me.SetConnectionStr()
        Me.MakeProductTable()
        Me.AddProduct()
        Me.MakeKitTable()
        Me.AddKitData()
        Me.MakeKitOptionsTable()

    End Sub
#Region "Properties"
    Public Property ConnectStr As String
        Get
            Return vconnect
        End Get
        Set(ByVal Value As String)
            vconnect = Value
        End Set
    End Property
    Public Property TaxTable() As System.Data.DataTable
        Get
            Return TaxDT
        End Get
        Set(ByVal Value As System.Data.DataTable)
            TaxDT = Value
        End Set
    End Property
    Public Property ShipTable() As System.Data.DataTable
        Get
            Return ShipDT
        End Get
        Set(ByVal Value As System.Data.DataTable)
            ShipDT = Value
        End Set
    End Property
    Public Property ProductTable() As System.Data.DataTable
        Get
            Return ProdDT
        End Get
        Set(ByVal Value As System.Data.DataTable)
            ProdDT = Value
        End Set
    End Property
    Public Property KitTable() As System.Data.DataTable
        Get
            Return KitDT
        End Get
        Set(ByVal Value As System.Data.DataTable)
            KitDT = Value
        End Set
    End Property
    Public Property KitOptionsTable() As System.Data.DataTable
        Get
            Return KitOpDT
        End Get
        Set(ByVal Value As System.Data.DataTable)
            KitOpDT = Value
        End Set
    End Property
#End Region
#Region "CreatTables"
    Sub MakeProductTable()
        ProdDT = New System.Data.DataTable("Products")
        ProdDT.Columns.Add("ProdCode", GetType(String))
        ProdDT.Columns.Add("Prodname", GetType(String))
        ProdDT.Columns.Add("Price", GetType(Decimal))
        ProdDT.Columns.Add("Prodtype", GetType(String))
        ProdDT.Columns.Add("CatOpId", GetType(Integer))
        ProdDT.Columns.Add("exempttaxable", GetType(Integer))
        Me.ProductTable = ProdDT

    End Sub
    Sub MakeKitTable()
        KitDT = New System.Data.DataTable("Kits")
        KitDT.Columns.Add("KitId", GetType(Integer))
        KitDT.Columns.Add("KitProductCode", GetType(String))
        KitDT.Columns.Add("KitType", GetType(String))
        Me.KitTable = KitDT
    End Sub
    Sub MakeKitOptionsTable()
        KitOpDT = New System.Data.DataTable("KitOptions")
        KitOpDT.Columns.Add("KitOpId", GetType(Integer))
        KitOpDT.Columns.Add("KitOpProductCode", GetType(String))
        KitOpDT.Columns.Add("KitOpQtyType", GetType(Integer))
        Me.KitOptionsTable = KitOpDT
    End Sub
    Sub MakeShippingTable()
        ShipDT = New System.Data.DataTable("KitOptions")
        ShipDT.Columns.Add("id", GetType(Integer))
        ShipDT.Columns.Add("topamt", GetType(Decimal))
        ShipDT.Columns.Add("standard", GetType(Decimal))
        ShipDT.Columns.Add("expedited", GetType(Decimal))
        ShipDT.Columns.Add("AlHw", GetType(Decimal))
        ShipDT.Columns.Add("btamt", GetType(Decimal))
        ShipDT.Columns.Add("year", GetType(Integer))
        Me.ShipTable = KitOpDT
    End Sub
    Sub MakeTaxTable()
        TaxDT = New System.Data.DataTable("KitOptions")
        TaxDT.Columns.Add("zipcode", GetType(String))
        Dim columns(1) As DataColumn
        columns(0) = TaxDT.Columns("zipcode")
        TaxDT.PrimaryKey = columns 'make zipcode primarykey
        TaxDT.Columns.Add("id", GetType(Integer))
        TaxDT.Columns.Add("state", GetType(String))
        TaxDT.Columns.Add("totsalestx", GetType(Decimal))
        TaxDT.Columns.Add("capgwn", GetType(Integer))
        TaxDT.Columns.Add("diploma", GetType(Integer))
        TaxDT.Columns.Add("taxsh", GetType(Integer))

        Me.TaxTable = TaxDT
        AddTaxData()

    End Sub
#End Region

    Function GetShipping(ByVal subtotal As Decimal, ByVal shipop As String) As Decimal 'ship ops are Standard,Expedited,state
        'add data to ship table-------------------------------------------------------------------------------------------------------------------------------------
        'I changed my mind on getting shipping info. There was so few options I decided to hard code it. I left the stub in for future use. I need to compensate for future price changes by putting a where statement for the year


        'Dim dsshipping As New SqlDataSource
		'If Directory.Exists("f:\IsDev") Then 'set dev settings
        '    dsshipping.ConnectionString = strcon

        'Else
        '    dsshipping.ConnectionString = strcon1 ' MBC    
        'End If
        'Dim dvSql As New DataView
        'Dim drvSql As DataRowView
        'Dim selectcmd As String
        'selectcmd = "SELECT * from shippingprc;"
        'dsshipping.ProviderName = "MySql.Data.MySqlClient"
        'dsshipping.SelectCommand = selectcmd
        'dsshipping.SelectCommandType = SqlDataSourceCommandType.Text
        'Try
        '    dvSql = CType(dsshipping.Select(DataSourceSelectArguments.Empty), Data.DataView)
        'Catch ex As Exception
        '    'Return
        'End Try
        ''If dvSql.Table.Rows.Count = 0 Then
        ''End If

        'For Each drvSql In dvSql
        '    ProdDR = Me.ShipTable.NewRow
        '    ProdDR("id") = drvSql("id")
        '    ProdDR("topamt") = drvSql("topamt")
        '    ProdDR("standard") = drvSql("standard")
		'    ProdDR("expedited") = drvSql("expedited")
        '    ProdDR("AlHw") = drvSql("AlHw")
        '    ProdDR("btamt") = drvSql("btamt")
        '    ProdDR("year") = drvSql("year")
        '    Me.ProductTable.Rows.Add(ProdDR)
        'Next
        ' end adding data-------------------------------------------------------------------------------------------------------------------------
        Dim retval As Decimal = 0
        Select Case subtotal
			Case 0 To 49.99
                Select Case shipop
                    Case "No Shipping"
                        retval = 0
					Case "STANDARD"
						retval = 11.5
					Case "RUSH"
						retval = 36.5
					Case "EXPRESS"
						retval = 46.5
                    Case "AK/HI"
                        retval = 35.5
					Case "INTERNATIONAL"
						retval = 60.5
				End Select
            Case 50.0 To 149.99
                Select Case shipop
                    Case "No Shipping"
                        retval = 0
					Case "STANDARD"
						retval = 14.5
					Case "RUSH"
						retval = 46.5
					Case "EXPRESS"
						retval = 56.5
                    Case "AK/HI"
						retval = 42.5
					Case "INTERNATIONAL"
						retval = 67.5
				End Select
            Case 150 To 299.99
                Select Case shipop
                    Case "No Shipping"
                        retval = 0
					Case "STANDARD"
						retval = 16.5
					Case "RUSH"
						retval = 56.5
					Case "EXPRESS"
						retval = 66.5
                    Case "AK/HI"
                        retval = 56.5
					Case "INTERNATIONAL"
						retval = 81.5
				End Select
            Case 300 To 449.99
                Select Case shipop
                    Case "No Shipping"
                        retval = 0
					Case "STANDARD"
						retval = 21.5
					Case "RUSH"
						retval = 66.5
					Case "EXPRESS"
						retval = 76.5
                    Case "AK/HI"
                        retval = 75.5
					Case "INTERNATIONAL"
						retval = 100.5
				End Select
            Case Is > 450
                Select Case shipop
                    Case "No Shipping"
                        retval = 0
					Case "STANDARD"
						retval = 25.0
					Case "RUSH"
						retval = 85.5
					Case "EXPRESS"
						retval = 95.5
                    Case "AK/HI"
                        retval = 100.0
					Case "INTERNATIONAL"
						retval = 125.0
				End Select

        End Select

        Return retval.ToString("N2") 'N2 is so it return two decimels
    End Function
    Function Gettax(ByVal zip As String) As Decimal
        Dim retval As Decimal = 0

        Dim dstaxrate As New SqlDataSource
        dstaxrate.ConnectionString = ConnectStr
        Dim dvSql As New DataView
        Dim drvSql As DataRowView
        Dim selectcmd As String
        selectcmd = "SELECT * from taxrate Where zipcode=" & zip & ";"
        dstaxrate.ProviderName = "MySql.Data.MySqlClient"
        dstaxrate.SelectCommand = selectcmd
        dstaxrate.SelectCommandType = SqlDataSourceCommandType.Text
        Try
            dvSql = CType(dstaxrate.Select(DataSourceSelectArguments.Empty), Data.DataView)
        Catch ex As Exception
            Return retval
        End Try
        If dvSql.Count > 0 Then
            For Each drvSql In dvSql

                
                retval = drvSql("totsalestx")
                

            Next
        End If

        Return retval








        'Me.MakeTaxTable()
        'Dim rowcount As Integer = Me.TaxTable.Rows.Count - 1
        'Do While rowcount <> -1
        '    If Trim(Me.TaxTable.Rows(rowcount).Item("zipcode").ToString) = Trim(zip) Then
        '        retval = Me.TaxTable.Rows(rowcount).Item("totsalestx")
        '        Exit Do
        '    End If
        '    rowcount = rowcount - 1
        'Loop

    End Function
    Function GettaxableProduct(ByVal zip As String, ByVal prodcode As String) As Decimal
        'need to add items that are not taxable to the taxrate table create a field for each item
		Dim retval As Boolean = False ' this was changed from true
        'Me.MakeTaxTable()
		Dim capgwn As Boolean
		Dim diploma As Boolean
		Dim ktshirt As Boolean
        Dim tassle As Boolean
        Dim sash As Boolean
        Dim dstaxrate As New SqlDataSource
        dstaxrate.ConnectionString = ConnectStr
        Dim dvSql As New DataView
        Dim drvSql As DataRowView
        Dim selectcmd As String
        selectcmd = "SELECT * from taxrate Where zipcode=" & zip & ";"
        dstaxrate.ProviderName = "MySql.Data.MySqlClient"
        dstaxrate.SelectCommand = selectcmd
        dstaxrate.SelectCommandType = SqlDataSourceCommandType.Text
        Try
            dvSql = CType(dstaxrate.Select(DataSourceSelectArguments.Empty), Data.DataView)
        Catch ex As Exception
            Return retval
        End Try
        If dvSql.Count > 0 Then
            For Each drvSql In dvSql

                'Dim id As Integer = drvSql("id")
                'Dim zipcode As String = drvSql("zipcode").ToString()
                'TaxDR("state") = drvSql("state").ToString
                'retval = drvSql("totsalestx")
                capgwn = drvSql("capgwn")
				diploma = drvSql("diploma")
                ktshirt = drvSql("ktshirt")
                tassle = drvSql("tassle")
                sash = drvSql("sash")
            Next
            Select Case prodcode.ToUpper
                Case "CAPGWN"
                    retval = capgwn
                Case "CAP"
                    retval = capgwn
                Case "GWN"
                    retval = capgwn
				Case "KDIP"	'diploma
					retval = diploma
				Case "KTSHIRT"
                    retval = ktshirt

                Case "TAS"
                    retval = ktshirt
                Case "KSASH"
                    retval = sash
                Case "KCHOIRSASH"
                    retval = sash
            End Select
        End If




        'Dim rowcount As Integer = Me.TaxTable.Rows.Count - 1
        'Do While rowcount <> -1
        '    If Trim(Me.TaxTable.Rows(rowcount).Item("zipcode").ToString) = Trim(zip) Then
        '        Select Case prodcode.ToUpper
        '            Case "CAPGWN"
        '                retval = Me.TaxTable.Rows(rowcount).Item("capgwn")
        '            Case "CAP"
        '                retval = Me.TaxTable.Rows(rowcount).Item("capgwn")
        '            Case "GWN"
        '                retval = Me.TaxTable.Rows(rowcount).Item("capgwn")
        '            Case "DIPLOMA"
        '                retval = Me.TaxTable.Rows(rowcount).Item("diploma")
        '        End Select


        '        Exit Do
        '    End If
        '    rowcount = rowcount - 1
        'Loop
        Return retval
    End Function
    Function Getshiptaxable(ByVal zipcode As String) As Decimal
        Dim retval As Boolean = True
        'Me.MakeTaxTable()


        Dim dstaxrate As New SqlDataSource
        dstaxrate.ConnectionString = ConnectStr
        Dim dvSql As New DataView
        Dim drvSql As DataRowView
        Dim selectcmd As String
        selectcmd = "SELECT * from taxrate Where zipcode=" & zipcode & ";"
        dstaxrate.ProviderName = "MySql.Data.MySqlClient"
        dstaxrate.SelectCommand = selectcmd
        dstaxrate.SelectCommandType = SqlDataSourceCommandType.Text
        Try
            dvSql = CType(dstaxrate.Select(DataSourceSelectArguments.Empty), Data.DataView)
        Catch ex As Exception
            Return retval
        End Try
        If dvSql.Count > 0 Then
            For Each drvSql In dvSql

                'Dim id As Integer = drvSql("id")
                'Dim zipcode As String = drvSql("zipcode").ToString()
                'TaxDR("state") = drvSql("state").ToString
                retval = drvSql("taxsh")
                'capgwn = drvSql("capgwn")
                'diploma = drvSql("diploma")
            Next

        End If
















        'Dim rowcount As Integer = Me.TaxTable.Rows.Count - 1
        'Do While rowcount <> -1
        '    If Trim(Me.TaxTable.Rows(rowcount).Item("zipcode").ToString) = Trim(zipcode) Then
        '        retval = Me.TaxTable.Rows(rowcount).Item("taxsh")

        '        Exit Do
        '    End If
        '    rowcount = rowcount - 1
        'Loop
        Return retval
    End Function
    Private Sub SetConnectionStr()
        ConnectStr = ConfigurationManager.ConnectionStrings("KK5").ToString
        'If Directory.Exists("f:\IsDev") Then 'set dev settings
        '    ConnectStr = "Server=memserver;User id=root;Password=3l3phant1;Connection Timeout=2;Persist Security Info=True;Database=KINDERKRAFT5" 'home
        '    'ConnectStr = "Server=memserver;User id=root;Password=3l3phant1;Connection Timeout=2;Persist Security Info=True;Database=KINDERKRAFT5"

        'Else
        '    ConnectStr = "Server=databases;User id=root;Password=3l3phant1;Connection Timeout=2;Persist Security Info=True;Database=KINDERKRAFT5" 'memorybook
        '    'ConnectStr = "Server=databases;User id=root;Password=3l3phant1;Connection Timeout=2;Persist Security Info=True;Database=KINDERKRAFT5"
        'End If
    End Sub
    Sub AddProduct()
        Dim dsProducttable As New SqlDataSource
        dsProducttable.ConnectionString = ConnectStr
        Dim dvSql As New DataView
        Dim drvSql As DataRowView
        Dim selectcmd As String
        selectcmd = "SELECT * from Product;"
        dsProducttable.ProviderName = "MySql.Data.MySqlClient"
        dsProducttable.SelectCommand = selectcmd
        dsProducttable.SelectCommandType = SqlDataSourceCommandType.Text
        Try
            dvSql = CType(dsProducttable.Select(DataSourceSelectArguments.Empty), Data.DataView)
        Catch ex As Exception
            Return
        End Try
        'If dvSql.Table.Rows.Count = 0 Then
        'End If

        For Each drvSql In dvSql
            ProdDR = Me.ProductTable.NewRow
            ProdDR("ProdCode") = drvSql("prodcode").ToString()
            ProdDR("ProdName") = drvSql("productname").ToString()
            ProdDR("Price") = drvSql("productprice")
            ProdDR("ProdType") = drvSql("prodtype").ToString()
            ProdDR("CatOpId") = drvSql("catopid")
            ProdDR("exempttaxable") = drvSql("exempttaxable")
            Me.ProductTable.Rows.Add(ProdDR)
        Next
    End Sub
    Sub AddTaxData()
        Dim dstaxrate As New SqlDataSource
        dstaxrate.ConnectionString = ConnectStr
        Dim dvSql As New DataView
        Dim drvSql As DataRowView
        Dim selectcmd As String
        selectcmd = "SELECT * from taxrate;"
        dstaxrate.ProviderName = "MySql.Data.MySqlClient"
        dstaxrate.SelectCommand = selectcmd
        dstaxrate.SelectCommandType = SqlDataSourceCommandType.Text
        Try
            dvSql = CType(dstaxrate.Select(DataSourceSelectArguments.Empty), Data.DataView)
        Catch ex As Exception
            Return
        End Try
        For Each drvSql In dvSql
            TaxDR = Me.TaxTable.NewRow
            TaxDR("id") = drvSql("id")
            TaxDR("zipcode") = drvSql("zipcode").ToString()
            TaxDR("state") = drvSql("state").ToString
            TaxDR("totsalestx") = drvSql("totsalestx")
            TaxDR("capgwn") = drvSql("capgwn")
            TaxDR("diploma") = drvSql("diploma")
            TaxDR("taxsh") = drvSql("taxsh")
            Me.TaxTable.Rows.Add(TaxDR)
        Next


    End Sub
    Sub AddKitData()
        Dim dsKit As New SqlDataSource
        dsKit.ConnectionString = ConnectStr
        Dim dvSql As New DataView
        Dim drvSql As DataRowView
        Dim selectcmd As String
        selectcmd = "SELECT * from kit;"
        dsKit.ProviderName = "MySql.Data.MySqlClient"
        dsKit.SelectCommand = selectcmd
        dsKit.SelectCommandType = SqlDataSourceCommandType.Text
        Try
            dvSql = CType(dsKit.Select(DataSourceSelectArguments.Empty), Data.DataView)
        Catch ex As Exception
            Return
        End Try


        For Each drvSql In dvSql
            KitDR = Me.KitTable.NewRow
            KitDR("KitId") = drvSql("kitid")
            KitDR("KitProductCode") = drvSql("kitproductcode").ToString()
            KitDR("KitType") = drvSql("kittype").ToString

            Me.KitTable.Rows.Add(KitDR)
        Next

    End Sub
    Sub AddKitOpData(ByVal vkitid As Integer)
        'clear table first
        Me.KitOptionsTable.Clear()
        'now create new data
        Dim dsKitOp As New SqlDataSource
        dsKitOp.ConnectionString = ConnectStr
        Dim dvSql As New DataView
        Dim drvSql As DataRowView
        Dim selectcmd As String
        selectcmd = "SELECT * from kitoptions where kitid=" & vkitid & " order by selectorder;"
        dsKitOp.ProviderName = "MySql.Data.MySqlClient"
        dsKitOp.SelectCommand = selectcmd
        dsKitOp.SelectCommandType = SqlDataSourceCommandType.Text
        Try
            dvSql = CType(dsKitOp.Select(DataSourceSelectArguments.Empty), Data.DataView)
        Catch ex As Exception
            Return
        End Try


        For Each drvSql In dvSql
            KitOpDR = Me.KitOptionsTable.NewRow
            KitOpDR("KitoPId") = drvSql("kitid")
            KitOpDR("KitoPProductCode") = drvSql("KITPRODCODE").ToString()


            Me.KitOptionsTable.Rows.Add(KitOpDR)
        Next
        Me.KitOptionsTable = KitOptionsTable
    End Sub
    Function GetKitId(ByVal lt As LookUpTable, ByVal productcode As String) As Integer
        'I changed this to using linq the below commented was using a loop
        Dim kitid As Integer
        Dim qresults = From Kit In lt.KitTable.AsEnumerable Where Kit.Field(Of String)("KitProductcode") = productcode Select Kit
        Dim dr As DataRow
        For Each dr In qresults
            kitid = dr.Field(Of Integer)("KitId")
        Next
        Return kitid

        'Dim kitid As Integer = 0
        'Dim a As String
        'Dim rowcount As Integer = lt.KitTable.Rows.Count - 1
        'Do While rowcount <> -1
        '    a = RTrim(lt.KitTable.Rows(rowcount).Item("KitProductCode").ToString.ToUpper)
        '    If RTrim(lt.KitTable.Rows(rowcount).Item("KitProductCode").ToString.ToUpper) = RTrim(productcode.ToUpper) Then
        '        kitid = lt.KitTable.Rows(rowcount).Item("KitId")
        '        Exit Do
        '    End If
        '    rowcount = rowcount - 1
        'Loop
        'Return kitid
    End Function
    Function GetProductName(ByVal prodcode As String) As String
        'I changed this to using linq the below commented was using a loop
        Dim prodname As String = ""
        Dim qresults = From product In Me.ProductTable.AsEnumerable Where Trim(product.Field(Of String)("ProdCode").ToUpper) = Trim(prodcode.ToUpper) Select product
        Dim dr As DataRow
        For Each dr In qresults
            prodname = dr.Field(Of String)("Prodname")
        Next
        Return prodname





        'Dim rowcount As Integer = Me.ProductTable.Rows.Count - 1
        'Dim prodname As String = ""
        'Do While rowcount <> -1
        '    If RTrim(Me.ProductTable.Rows(rowcount).Item("ProdCode").ToString.ToUpper) = RTrim(prodcode.ToUpper) Then
        '        prodname = Me.ProductTable.Rows(rowcount).Item("Prodname")
        '        Exit Do
        '    End If
        '    rowcount = rowcount - 1
        'Loop
        'Return prodname
    End Function
    Function GetProductOptionCat(ByVal prodcode As String) As Integer
        Dim rowcount As Integer = Me.ProductTable.Rows.Count - 1
        Dim catid As Integer = 0
        Do While rowcount <> -1
            If RTrim(Me.ProductTable.Rows(rowcount).Item("ProdCode").ToString.ToUpper) = RTrim(prodcode.ToUpper) Then
                catid = Me.ProductTable.Rows(rowcount).Item("CatOpId")
                Exit Do
            End If
            rowcount = rowcount - 1
        Loop
        Return catid
    End Function
	Function GetPromoDiscount(ByVal code As String, ByVal subtot As Decimal) As String
		code = code.ToUpper
		Dim retval As Decimal = 0.0
		Dim dspromo As New SqlDataSource
		dspromo.ConnectionString = ConnectStr
		Dim dvSql As New DataView
		Dim drvSql As DataRowView
		Dim selectcmd As String
		Dim startdte As Date
		Dim enddte As Date
		Dim percentage As Decimal = 0
		Dim amount As Decimal = 0
		selectcmd = "SELECT * from promotions where code=@code;"
		dspromo.ProviderName = "MySql.Data.MySqlClient"
		dspromo.SelectParameters.Add("@code", code.ToUpper)
		dspromo.SelectCommand = selectcmd
		dspromo.SelectCommandType = SqlDataSourceCommandType.Text

		Try
			dvSql = CType(dspromo.Select(DataSourceSelectArguments.Empty), Data.DataView)
			If dvSql.Count > 0 Then
				For Each drvSql In dvSql

					'Dim code As String = drvSql("code").ToString() use code that was passed if we are this far it is good.
					startdte = drvSql("startdte")
					enddte = drvSql("enddte")
					Try
						percentage = drvSql("percentage")
					Catch ex As Exception

					End Try
					Try
						amount = drvSql("amount")
					Catch ex As Exception

					End Try

				Next
			End If

			Dim currentdate As Date = Today
			If currentdate <= enddte And currentdate >= startdte Then
				Select Case code
					Case "10KKWINTER"
						If amount > 0 Then

							If subtot > 149.99 Then
								retval = amount
							Else
								retval = 0
							End If

						Else
							If subtot > 149.99 Then
								retval = (percentage * subtot)
								retval = Decimal.Round(retval, 2)
							Else
								retval = 0
							End If
						End If

					Case "KKSPRING14"
						If subtot > 99.99 Then
							Dim i As Integer = subtot \ 100	'slash is to left for integer division right slash returns partials
							retval = (i * 10)
						End If
					Case "KKWINTER14"
						Select Case subtot
							Case 0 To 49.99
								retval = 11.5
							Case 50.0 To 149.99
								retval = 14.5
							Case 150 To 299.99
								retval = 16.5
							Case 300 To 449.99
								retval = 21.5
							Case Is > 450
								retval = 25.0
						End Select
					Case "HOLIDAY14"   '200 over free shipping
						Select Case subtot
							
							Case 200 To 299.99
								retval = 16.5
							Case 300 To 449.99
								retval = 21.5
							Case Is > 450
								retval = 25.0
                        End Select
                    Case "SHIP15"   '200 over free shipping
                        Select Case subtot

                            Case 200 To 299.99
                                retval = 16.5
                            Case 300 To 449.99
                                retval = 21.5
                            Case Is > 450
                                retval = 25.0
                        End Select
                    Case "CHART15"   '200 over free shipping
                        Select Case subtot

                            Case 200 To 299.99
                                retval = 16.5
                            Case 300 To 449.99
                                retval = 21.5
                            Case Is > 450
                                retval = 25.0
                        End Select
					Case "CSNOSHP"
						'take off shipping
						Select Case subtot
							Case 0 To 49.99
								retval = 11.5
							Case 50.0 To 149.99
								retval = 14.5
							Case 150 To 299.99
								retval = 16.5
							Case 300 To 449.99
								retval = 21.5
							Case Is > 450
								retval = 25.0
						End Select


					Case Else
						If amount <> 0 Then
							retval = amount
						Else
							retval = (percentage * subtot)
							retval = Decimal.Round(retval, 2)
						End If
				End Select
			Else
				retval = 0.0
			End If

		Catch ex As Exception

		End Try



		Dim a As Decimal = retval * 2
		Dim discnt As Decimal = retval - a
		Dim finalretval As String = "$" & discnt.ToString("N2")

		Return finalretval
	End Function
End Class
