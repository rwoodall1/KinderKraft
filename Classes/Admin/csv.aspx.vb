Imports System.Data
Imports System.IO
Imports System.Net


Partial Class Admin_csv
    Inherits System.Web.UI.Page
    Dim currentyr As String = "2015"
    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Dim sb As New StringBuilder()
        Dim prodcode As String
        Dim dvSql As New DataView
        Dim cdatarow As DataRowView
        Dim orderid As Integer
        Dim testorderid As Integer
        Dim testpkgid As String = "0"
        Dim savedorderid As Integer = 0
        Dim pkgopswrote As Boolean = False
        Dim detailwrote As Boolean = False
        Dim paydetailid As String = 0
		Dim oraclecustid As String = "1022753"
        Dim pkgdetailid As Integer = 0
        Dim aa As String
        Dim oracleshpmeth As String = ""
        Try
            dvSql = CType(Me.dstable.Select(DataSourceSelectArguments.Empty), Data.DataView)
        Catch ex As Exception

        End Try
        If dvSql.Count = 0 Then 'no records stop processing
            Return
        End If
        Dim dtorder As DataTable = dvSql.Table
        'Dim cdatarow As DataRow = dtorder.Rows(0) 'use first row has all info needed

        For Each cdatarow In dvSql
            orderid = cdatarow(2)
            If savedorderid <> orderid Then 'we are on next order so write options and payment at end of order
                If savedorderid <> 0 Then 'make sure we are not on very first order or else payment will be 1st line wrote
                    sb = WritePayment(sb, savedorderid, paydetailid)
                    savedorderid = orderid ' save to current order now
                    paydetailid = cdatarow("orderdetailid") 'saves first detailid of order for payment
                Else
                    savedorderid = orderid ' save to current order now
                    paydetailid = cdatarow("orderdetailid") 'saves first detailid of order for payment 
                End If
            End If
            If cdatarow(15) <> 0 Then 'prod price
                pkgopswrote = False
            ElseIf pkgopswrote = False Then

            Else
                Continue For 'part of a pkg skip

            End If

            Select Case cdatarow(13) 'take out 2 leading numbers
                Case "01KGRADPKD", "02KSCHPKD", "03KACHPKD", "04KMILEPKD", "05KLEAPKD"
					prodcode = cdatarow(13).ToString.Substring(2)
					pkgdetailid = cdatarow(12)
                Case Else
                    prodcode = cdatarow(13)
            End Select
            'write customer table Line1
            '__________________________________________________________________________________________________________________________________________
            If testorderid <> orderid Then 'if not = then write line1 and 2 if = then these line have been wrote for this order
                testorderid = orderid
                sb.Append(Environment.NewLine)
                sb.Append("1~SHOP_V2~")
                sb.Append("K" & cdatarow(2) & "~") 'orderid with k added in front per sharon 12/20/2013
                sb.Append("K" & cdatarow(2) & "~") 'orderid
                orderid = cdatarow(2) 'set current orderid

                If cdatarow(1).ToString.Trim = "" Then
                    oraclecustid = "1022753"
                    sb.Append(oraclecustid & "~") 'house account oracle id, customer not set up.

                Else
                    oraclecustid = cdatarow(1).ToString.Trim
                    sb.Append(oraclecustid & "~") 'oracle custid
                End If

                'order table Line 2________________________________________________________________________________________________________
                sb.Append(CDate(cdatarow(26)).Date & "~") 'orderdate
				sb.Append(SetStatus(cdatarow)) '"KK_AUDIT"  holdstatus---all on hold insert new hold status emails 12/20/2013
				sb.Append("~CUSTOMER")
				'write order table
                sb.Append(Environment.NewLine)
                sb.Append("2~SHOP_V2~")
                sb.Append("K" & cdatarow(2) & "~") 'orderid with k added in front per sharon 12/20/2013
                sb.Append("K" & cdatarow(2) & "~") 'orderid
                sb.Append(cdatarow(4).ToString.Trim & "~") 'cust lname
                sb.Append(cdatarow(3).ToString.Trim & "~") 'cust fname
                sb.Append(cdatarow(5).ToString.Trim & "~") 'cust phone
                sb.Append(cdatarow(6).ToString.Trim & "~") 'cust email
                aa = cdatarow(35).ToString.Trim
                sb.Append(cdatarow(35).ToString.Trim & "~") 'PO Number_______________________
                sb.Append(cdatarow(7) & "~") 'orders total
                sb.Append(cdatarow(10) & "~") 'orders subtotal
                sb.Append(" ~") 'orders tax
                sb.Append(getpaymenttotal(orderid.ToString.Trim) & "~") 'payment total
                sb.Append(cdatarow(8) & "~") 'orders.shiptotal
                sb.Append("0") 'handling total always 0
                '______________________________________________________________________________________________________________________________________________
				'write line 3 shipping codes
				sb.Append(Environment.NewLine)
				sb.Append("3~SHOP_V2~")
				sb.Append("K" & cdatarow(2) & "~") 'orderid with k added in front per sharon 12/20/2013
				sb.Append("K" & cdatarow(2) & "~") 'orderid
				sb.Append(cdatarow(2) & "-2" & "~")	'detailid  for discount amount only
				sb.Append("GREG_KKO~CUSTOMER~")
				sb.Append(oraclecustid & "~") 'oracle custid
				sb.Append(cdatarow(31)  & "~") 'prodcode
				sb.Append("1~")	'quantity
				sb.Append(cdatarow(8) & "~") 'price
				sb.Append(" ~")	'tax not being sent
				sb.Append(cdatarow(20) & "~") 'shipaddress
				sb.Append(" ~")	'shipp address2
				sb.Append(cdatarow(21).ToString.Trim & "~")	'ship city
				sb.Append(cdatarow(22).ToString.Trim & "~")	'ship state?????????????????????????????check full or abrev
				If cdatarow(28).ToString.Trim = "" Then
					sb.Append("US~") 'ship country
				Else
					sb.Append(cdatarow(28) & "~") 'ship country 
				End If
                sb.Append(cdatarow(23) & "~") 'ship postal code
                'Oracle does not accept the values International or AK/HIso change to standard for export only
                If cdatarow(9).ToString.ToUpper.Trim = "INTERNATIONAL" Then
                    oracleshpmeth = "STANDARD"

                ElseIf cdatarow(9).ToString.ToUpper.Trim = "AK/HI" Then
                    oracleshpmeth = "STANDARD"
                Else
                    oracleshpmeth = cdatarow(9).ToString.ToUpper.Trim   'ship method

                End If
                sb.Append(oracleshpmeth & "~")  'ship method

                sb.Append("0~0~ ~")
                sb.Append(cdatarow(18).ToString.Trim & "~") 'sfname
                sb.Append(" ~") 'mname
                sb.Append(cdatarow(19).ToString.Trim & "~") 'slname
                sb.Append(" ~")
                sb.Append(cdatarow(2) & "-2") 'detailid  for ship amount only


                '______________________________________________________________________________________________________________________________________________
                'if a discount exist write it to order detail once
                'discount line 3 add-------------------------------------------------------------------------------------------------------------------------------------------------------
                'if discount not 0 write discount only once
                If cdatarow(27) <> 0 Then 'discount amount write another orderdetail line add discount and uniqe detailid
                    sb.Append(Environment.NewLine)
                    sb.Append("3~SHOP_V2~")
                    sb.Append("K" & cdatarow(2) & "~") 'orderid with k added in front per sharon 12/20/2013
                    sb.Append("K" & cdatarow(2) & "~") 'orderid
                    sb.Append(cdatarow(2) & "-1" & "~") 'detailid  for discount amount only
                    sb.Append("GREG_KKO~CUSTOMER~")
                    sb.Append(oraclecustid & "~") 'oracle custid
                    'sb.Append(prodcode.Trim & "~") 'prodcode
                    sb.Append("KKDISC~") 'prodcode
                    sb.Append("1~") 'quantity
                    sb.Append(cdatarow(27) & "~") 'price
                    sb.Append(" ~") 'tax not being sent
                    sb.Append(cdatarow(20) & "~") 'shipaddress
                    sb.Append(" ~") 'shipp address2
                    sb.Append(cdatarow(21) & "~") 'ship city
                    sb.Append(cdatarow(22).ToString.Trim & "~") 'ship state?????????????????????????????check full or abrev
                    If cdatarow(28).ToString.Trim = "" Then
                        sb.Append("US~") 'ship country
                    Else
                        sb.Append(cdatarow(28) & "~") 'ship country 
                    End If
                    sb.Append(cdatarow(23) & "~") 'ship postal code
                    If cdatarow(9).ToString.ToUpper.Trim = "INTERNATIONAL" Then
                        oracleshpmeth = "STANDARD"

                    ElseIf cdatarow(9).ToString.ToUpper.Trim = "AK/HI" Then
                        oracleshpmeth = "STANDARD"
                    Else
                        oracleshpmeth = cdatarow(9).ToString.ToUpper.Trim   'ship method

                    End If
                    sb.Append(oracleshpmeth & "~")  'ship method
                    sb.Append("0~0~ ~")
                    sb.Append(cdatarow(18).ToString.Trim & "~") 'sfname
                    sb.Append(" ~") 'mname
                    sb.Append(cdatarow(19).ToString.Trim & "~") 'slname
                    sb.Append(" ~")
                    sb.Append(cdatarow(2) & "-1") 'detailid  for discount amount only
                    
                End If
                'end discount add line3---------------------------------------------------------------------------------------------------------------------------------------------------------
            End If
            '______________________________________________________________________________________________________________________________________ end of write only once


            Select Case detailwrote
                Case False
                    'write orderdetails table
                    sb.Append(Environment.NewLine)
                    sb.Append("3~SHOP_V2~")
                    sb.Append("K" & cdatarow(2) & "~") 'orderid with k added in front per sharon 12/20/2013
                    sb.Append("K" & cdatarow(2) & "~") 'orderid
                    sb.Append(cdatarow(12) & "~") 'orderdetailid
                    sb.Append("GREG_KKO~CUSTOMER~")
                    sb.Append(oraclecustid & "~") 'oracle custid
                    sb.Append(prodcode.Trim & "~") 'prodcode
                    sb.Append(cdatarow(14) & "~") 'quantity
                    sb.Append(cdatarow(15) & "~") 'price
                    sb.Append(" ~") 'tax not being sent
                    sb.Append(cdatarow(20) & "~") 'shipaddress
                    sb.Append(" ~") 'shipp address2
                    sb.Append(cdatarow(21).ToString.Trim & "~") 'ship city
                    sb.Append(cdatarow(22).ToString.Trim & "~") 'ship state?????????????????????????????check full or abrev
                    If cdatarow(28).ToString.Trim = "" Then
                        sb.Append("US~") 'ship country
                    Else
                        sb.Append(cdatarow(28) & "~") 'ship country 
                    End If
                    sb.Append(cdatarow(23) & "~") 'ship postal code
                    If cdatarow(9).ToString.ToUpper.Trim = "INTERNATIONAL" Then
                        oracleshpmeth = "STANDARD"

                    ElseIf cdatarow(9).ToString.ToUpper.Trim = "AK/HI" Then
                        oracleshpmeth = "STANDARD"
                    Else
                        oracleshpmeth = cdatarow(9).ToString.ToUpper.Trim   'ship method

                    End If
                    sb.Append(oracleshpmeth & "~")  'ship method
                    sb.Append("0~0~ ~")
                    sb.Append(cdatarow(18).ToString.Trim & "~") 'sfname
                    sb.Append(" ~") 'mname
                    sb.Append(cdatarow(19).ToString.Trim & "~") 'slname
                    sb.Append(" ~")
                    sb.Append(cdatarow(12)) 'detailid for main
                    If cdatarow(16) = "0" Then 'pkgid package wait until next loop to get pkgid 1st line of pkg is always 0
                        detailwrote = True

                    Else
                        If detailwrote = False Then 'not a pkg write options

                            sb = WriteOrderOptions1(sb, cdatarow(2), cdatarow(12), cdatarow(16)) 'single item write options keep detail wrote false
                            detailwrote = False
                        End If


                    End If
                Case True 'we can now get the pkgid and write options
                    sb = WriteOrderOptions2(sb, cdatarow(2), cdatarow(16), pkgdetailid)
                    pkgopswrote = True
                    detailwrote = False 'reset for next item
            End Select

            'next record
        Next

        ' writes last record payment line
		sb = WritePayment(sb, savedorderid, paydetailid)

		Dim a As String = sb.ToString()
		Dim TheFile As String = "PE_GREG_KKO" & Now.Ticks.ToString & ".csv"
		Dim filename As String = "CVS/" & TheFile

		Dim sPath As String = HttpContext.Current.Server.MapPath(filename)
		Dim statustxt As String = "Export has finished."
		Try

			Dim fs As New FileStream(sPath, FileMode.Append, FileAccess.Write)
			Dim writer As New StreamWriter(fs)
			writer.Write(a)
			writer.Close()
			fs.Close()

            FtpFile(TheFile)  '____________________________________________________+++++++++++++++++++++++++++++++++++++++++++++++++++++++

		Catch ex As Exception
		   statustxt=ex.Message 
		End Try
		Label1.Text = statustxt
    End Sub
	Private Function WriteOrderOptions1(sb As StringBuilder, orderid As String, detailid As String, pkgid As String) As StringBuilder	'item
		'4~SHOP_V2~4458~4458~45452~GREG_KKO~KK_CAP_COLOR~GOLD
		'4~SHOP_V2~4458~4458~45452~GREG_KKO~OR_KK_GOWN_SIZE~305 308
		'4~SHOP_V2~4458~4458~45452~GREG_KKO~KK_GOWN_COLOR~GOLD
		'4~SHOP_V2~4458~4458~45452~GREG_KKO~KK_TASSEL_COLOR~GOLD
        '4~SHOP_V2~4458~4458~45452~GREG_KKO~KK_GRADYEAR~currentyr
		'4~SHOP_V2~4458~4458~45452~GREG_KKO~KK_FRAME_STYLE~CHALK BOARD
		'4~SHOP_V2~4458~4458~45452~GREG_KKO~KK_DIPL_CERT_STYLE~ELEMENTARY
		'4~SHOP_V2~4458~4458~45452~GREG_KKO~KK_SASH_COLORS~GOLD
		'4~SHOP_V2~4458~4458~45452~GREG_KKO~KK_FRAME_COLOR~BLACK
		'4~SHOP_V2~4458~4458~45453~GREG_KKO~KKDISC~-10.00
		dsOrderOptions.SelectParameters.Clear()
		dsOrderOptions.SelectParameters.Add("orderid", orderid)
		dsOrderOptions.SelectParameters.Add("pkgid", pkgid)
		dsOrderOptions.SelectParameters.Add("detailid", detailid)
		Dim dvSql As New DataView
		Dim drvSql As DataRowView
		Dim framestyle As String
		Dim certstyle As String
		Dim sashgrad As String
		Dim sashyear As String
		Dim sashcolor As String

		Dim pos As Integer
		Dim lastpos As Integer
		Try
			dvSql = CType(dsOrderOptions.Select(DataSourceSelectArguments.Empty), Data.DataView)

			For Each drvSql In dvSql
				sb.Append(Environment.NewLine)
				sb.Append("4~SHOP_V2~")
				sb.Append("K" & drvSql(0) & "~") 'orderid
				sb.Append("K" & drvSql(0) & "~") 'orderid
				sb.Append(drvSql(1) & "~") 'detailid
				sb.Append("GREG_KKO~")

				If drvSql(6) = "KK_FRAME_STYLE" Then

					sb.Append(drvSql(6) & "~") 'optiondesc code from jostens?? sending optionid
					pos = drvSql(7).ToString.Trim.IndexOf("/") - 1
					framestyle = drvSql(7).ToString.Trim.Substring(0, pos + 1)
					certstyle = drvSql(7).ToString.Trim.Substring(pos + 2)
					sb.Append(framestyle)
					sb = AddCertStyle(sb, drvSql, certstyle)
				ElseIf drvSql(6) = "KK_TASSEL_COLOR" Then
					sb.Append(drvSql(6) & "~")
					sb.Append(drvSql(7).trim) 'tassel color
					sb.Append(Environment.NewLine)
					sb.Append("4~SHOP_V2~")
					sb.Append("K" & drvSql(0) & "~") 'orderid
					sb.Append("K" & drvSql(0) & "~") 'orderid
					sb.Append(drvSql(1) & "~") 'detailid
					sb.Append("GREG_KKO~")
                    sb.Append("KK_GRADYEAR~" & currentyr)
				ElseIf drvSql(6) = "KK_SASH_COLOR" Then
					pos = drvSql(7).ToString.Trim.IndexOf("/") - 1
					lastpos = drvSql(7).ToString.Trim.LastIndexOf("/") - 1
					sashcolor = drvSql(7).ToString.Trim.Substring(0, pos + 1)
					sashgrad = drvSql(7).ToString.Trim.Substring(pos + 2, (lastpos + 1) - (pos + 2))
					sashyear = drvSql(7).ToString.Trim.Substring(lastpos + 2)
					sb.Append(drvSql(6) & "~") 'optiondesc code from jostens?? sending optionid
					sb.Append(sashcolor)
					sb.Append(Environment.NewLine)
					sb.Append("4~SHOP_V2~")
					sb.Append("K" & drvSql(0) & "~") 'orderid
					sb.Append("K" & drvSql(0) & "~") 'orderid
					sb.Append(drvSql(1) & "~") 'detailid
					sb.Append("GREG_KKO~")
					sb.Append("KK_SASH_DESIGN~" & sashgrad)

					sb.Append(Environment.NewLine)
					sb.Append("4~SHOP_V2~")
					sb.Append("K" & drvSql(0) & "~") 'orderid
					sb.Append("K" & drvSql(0) & "~") 'orderid
					sb.Append(drvSql(1) & "~") 'detailid
					sb.Append("GREG_KKO~")
					sb.Append("KK_GRADYEAR~" & sashyear)  'changed from Sash_year to GradYear

				Else
					sb.Append(drvSql(6) & "~") 'optiondesc code from jostens?? sending optionid
					sb.Append(drvSql(7).trim) 'optionvalue not optiondescription

				End If
			Next

		Catch ex As Exception

		End Try

		Return sb
	End Function
	Private Function WriteOrderOptions2(sb As StringBuilder, orderid As String, pkgid As String, pkgdetailid As Integer) As StringBuilder  'pkg
		'4~SHOP_V2~4458~4458~45452~GREG_KKO~KK_CAP_COLOR~GOLD
		'4~SHOP_V2~4458~4458~45452~GREG_KKO~OR_KK_GOWN_SIZE~305 308
		'4~SHOP_V2~4458~4458~45452~GREG_KKO~KK_GOWN_COLOR~GOLD
		'4~SHOP_V2~4458~4458~45452~GREG_KKO~KK_TASSEL_COLOR~GOLD
        '4~SHOP_V2~4458~4458~45452~GREG_KKO~KK_GRADYEAR~currentyr
		'4~SHOP_V2~4458~4458~45452~GREG_KKO~KK_FRAME_STYLE~CHALK BOARD
		'4~SHOP_V2~4458~4458~45452~GREG_KKO~KK_DIPL_CERT_STYLE~ELEMENTARY
		'4~SHOP_V2~4458~4458~45452~GREG_KKO~KK_SASH_COLORS~GOLD
		'4~SHOP_V2~4458~4458~45452~GREG_KKO~KK_FRAME_COLOR~BLACK
		'4~SHOP_V2~4458~4458~45453~GREG_KKO~KKDISC~-10.00
		dsOrderOptions.SelectParameters.Clear()
		dsOrderOptions.SelectCommand = "SELECT orderoptions.OrderId, orderoptions.DetailId, orderoptions.OpId, orderoptions.opdesc, orderoptions.pkgid, orderoptions.qty, options.optioncode, options.optionvalue, options.selectorder, options.optiondesc, options.optioncatid, options.id FROM orderoptions INNER JOIN options ON orderoptions.OpId = options.id WHERE (orderoptions.OrderId = @orderid) AND (orderoptions.pkgid = @pkgid);"
		dsOrderOptions.SelectParameters.Add("orderid", orderid)
		dsOrderOptions.SelectParameters.Add("pkgid", pkgid)
		Dim dvSql As New DataView
		Dim drvSql As DataRowView
		Dim framestyle As String
		Dim pos As Integer
		Dim certstyle As String
		Dim sashgrad As String
		Dim sashyear As String
		Dim sashcolor As String
		Dim lastpos As Integer
		Try
			dvSql = CType(dsOrderOptions.Select(DataSourceSelectArguments.Empty), Data.DataView)

			For Each drvSql In dvSql
				sb.Append(Environment.NewLine)
				sb.Append("4~SHOP_V2~")
				sb.Append("K" & drvSql(0) & "~") 'orderid
				sb.Append("K" & drvSql(0) & "~") 'orderid
				sb.Append(pkgdetailid & "~") 'detailid
				sb.Append("GREG_KKO~")

				If drvSql(6) = "KK_FRAME_STYLE" Then
					sb.Append(drvSql(6) & "~") 'optiondesc code from jostens?? sending optionid
					pos = drvSql(7).ToString.Trim.IndexOf("/") - 1
					framestyle = drvSql(7).ToString.Trim.Substring(0, pos + 1)
					certstyle = drvSql(7).ToString.Trim.Substring(pos + 2)
					sb.Append(framestyle)
					sb = AddCertStyle(sb, drvSql, certstyle, pkgdetailid)
				
				ElseIf drvSql(6) = "KK_SASH_COLOR" Then
					pos = drvSql(7).ToString.Trim.IndexOf("/") - 1
					lastpos = drvSql(7).ToString.Trim.LastIndexOf("/") - 1
					sashcolor = drvSql(7).ToString.Trim.Substring(0, pos + 1)
					sashgrad = drvSql(7).ToString.Trim.Substring(pos + 2, (lastpos + 1) - (pos + 2))
					sashyear = drvSql(7).ToString.Trim.Substring(lastpos + 2)
					sb.Append(drvSql(6) & "~") 'optiondesc code from jostens?? sending optionid
					sb.Append(sashcolor)
					sb.Append(Environment.NewLine)
					sb.Append("4~SHOP_V2~")
					sb.Append("K" & drvSql(0) & "~") 'orderid
					sb.Append("K" & drvSql(0) & "~") 'orderid
					sb.Append(pkgdetailid & "~") 'detailid
					sb.Append("GREG_KKO~")
					sb.Append("KK_SASH_DESIGN~" & sashgrad)
					
				Else
					sb.Append(drvSql(6) & "~") 'optiondesc code from jostens?? sending optionid


					sb.Append(drvSql(7).trim)
					'End Select
				End If
			Next
			'writing this once will cover the whole pkg
			sb.Append(Environment.NewLine)
            sb.Append("4~SHOP_V2~" & "K" & orderid & "~" & "K" & orderid & "~" & pkgdetailid & "~GREG_KKO~KK_GRADYEAR~" & currentyr)
		Catch ex As Exception

		End Try

		Return sb
	End Function
    Private Function WriteDiscount(sb As StringBuilder, orderid As String, cdatarow As String) As StringBuilder
        If CDec(cdatarow) <> 0 Then 'default will be 0 should never be a null value
            sb.Append(Environment.NewLine)
            sb.Append("4~SHOP_V2~")
            sb.Append("K" & orderid & "~") 'orderid
            sb.Append("K" & orderid & "~") 'orderid
            sb.Append(orderid & "-1~") 'detailid
            sb.Append("GREG_KKO~")
            sb.Append("KKDISC~") 'optiondesc code from jostens?? sending optionid
            sb.Append(cdatarow) 'optiondesc value from jostens??
        End If
        Return sb
    End Function


    Private Function getpaymenttotal(orderid As String) As String
        Dim retval As String = "0"

		dspayment.SelectCommand = "SELECT sum(p.`amount`) as total FROM payment p WHERE p.`orderid`= @orderid;"
		dspayment.SelectParameters.Clear()
        dspayment.SelectParameters.Add("orderid", orderid)
        Dim dvSql As New DataView

        Dim drvSql As DataRowView

        Try
			dvSql = CType(Me.dspayment.Select(DataSourceSelectArguments.Empty), Data.DataView)
			For Each drvSql In dvSql
				retval = drvSql(0).ToString
			Next
		Catch ex As Exception

		End Try
        Return retval
    End Function
    'Private Function StateAbrev(state As String) As String
    ' I have since changed the database to hold Abbrev instead of full names.
    'Dim retval As String = ""
    'dsstate.SelectParameters.Clear()
    'dsstate.SelectParameters.Add("name", state)
    'Dim dvSql As New DataView
    'Dim drvSql As DataRowView

    'Try
    '    dvSql = CType(Me.dsstate.Select(DataSourceSelectArguments.Empty), Data.DataView)
    '    For Each drvSql In dvSql
    '        retval = drvSql("abrv").ToString.Trim
    '    Next
    'Catch ex As Exception

    'End Try
    'Return retval
    'End Function
    Private Function WritePayment(sb As StringBuilder, orderid As String, detailid As String) As StringBuilder
        dspayment.SelectCommand = "SELECT sum(p.`amount`) as total,paydate FROM payment p WHERE p.`orderid`= @orderid;"
        dspayment.SelectParameters.Clear()
        dspayment.SelectParameters.Add("orderid", orderid)
        Dim dvSql As New DataView

        Dim drvSql As DataRowView

        Try
            dvSql = CType(Me.dspayment.Select(DataSourceSelectArguments.Empty), Data.DataView)
            'payments are summed only one record returned. If no payments such as a PO then nothing is wrote and that is they way jostens wants it.
            For Each drvSql In dvSql
                sb.Append(Environment.NewLine)
                sb.Append("5~SHOP_V2~")
                sb.Append("K" & orderid & "~") 'orderid with k added in front per sharon 12/20/2013
                sb.Append("K" & orderid & "~") 'orderid
                sb.Append(detailid & "~")
                sb.Append("GREG_KKO~")
                sb.Append(drvSql(1) & "~") ' 1st payment date if there are more than 1
                sb.Append(drvSql(0) & "~") 'summed amount field afterwards not being used
                dsorders.UpdateParameters.Clear()
                dsorders.UpdateParameters.Add("@orderid", orderid)
                dsorders.Update()
            Next

        Catch ex As Exception

		End Try
		
        Return sb
    End Function
	Private Function AddCertStyle(sb As StringBuilder, drvsql As DataRowView, cval As String, pkgdetailid As Integer) As StringBuilder
		sb.Append(Environment.NewLine)
		sb.Append("4~SHOP_V2~")
		sb.Append("K" & drvsql(0) & "~") 'orderid
		sb.Append("K" & drvsql(0) & "~") 'orderid
		sb.Append(pkgdetailid & "~") 'detailid
		sb.Append("GREG_KKO~")
		sb.Append("KK_DIPL_CERT_STYLE~" & cval)	'optiondesc code from jostens?? sending optionid
		Return sb
	End Function
	Private Function AddCertStyle(sb As StringBuilder, drvsql As DataRowView, cval As String) As StringBuilder
		sb.Append(Environment.NewLine)
		sb.Append("4~SHOP_V2~")
		sb.Append("K" & drvsql(0) & "~") 'orderid
		sb.Append("K" & drvsql(0) & "~") 'orderid
		sb.Append(drvsql(1) & "~") 'detailid
		sb.Append("GREG_KKO~")
		sb.Append("KK_DIPL_CERT_STYLE~" & cval)	'optiondesc code from jostens?? sending optionid
		Return sb
	End Function
    Protected Sub FtpFile(filename As String)

        Dim myFtpWebRequest As FtpWebRequest
        Dim myFtpWebResponse As FtpWebResponse
        Dim myStreamWriter As StreamWriter
		Dim a As String
		Dim cftpserver As String = ConfigurationManager.AppSettings("ftpserver")
		Dim cftpserveruser As String = ConfigurationManager.AppSettings("ftpserveruser")
		Dim cftpserverpw As String = ConfigurationManager.AppSettings("ftpserverpw")
		Dim test As String = cftpserver & filename
		myFtpWebRequest = WebRequest.Create(cftpserver & filename) 'test ftp take i off for live
		myFtpWebRequest.Credentials = New NetworkCredential(cftpserveruser, cftpserverpw)


        'myFtpWebRequest = WebRequest.Create("ftp://cmain1/" & filename & ".txt")
        'myFtpWebRequest.Credentials = New NetworkCredential("rwoodall", "Briggitte8")
        myFtpWebRequest.Method = WebRequestMethods.Ftp.UploadFile
        myFtpWebRequest.UseBinary = True
		myStreamWriter = New StreamWriter(myFtpWebRequest.GetRequestStream())
		Dim cc As String = Server.MapPath(filename)
		Dim Sreader As New StreamReader(Server.MapPath("CVS\" & filename))
        myStreamWriter.Write(Sreader.ReadToEnd)
        myStreamWriter.Flush()
        myStreamWriter.Close()
        myFtpWebResponse = myFtpWebRequest.GetResponse()
        a = myFtpWebResponse.StatusDescription
        Sreader.Dispose()
        myFtpWebResponse.Close() ' See more at: http://dotnetacademy.blogspot.com/2010/12/how-to-upload-download-delete-file.html#sthash.e4PuN5aM.dpuf
        Dim path As String = Server.MapPath(filename)
        'If File.Exists(path) Then
        '    File.Delete(path)
        'End If
    End Sub
	Private Function SetStatus(cdatarow As DataRowView) As String
		Dim a As String = cdatarow(31).ToString.Substring(0, 2)
		Dim b As String = cdatarow(1).ToString
		Dim c As String = cdatarow(33).ToString
		Dim retval As String = "ENTERED"
		If cdatarow(1).ToString = "" Then  'new customer(customer id will be empty.I transpose in line72 and send "1022753" as jostens house id
			retval = "KK_AUDIT"
		ElseIf cdatarow(33) = "True" And cdatarow(34) = "FALSE" Then	 'notconfirmed tax exmempt but checked tax exempt" 
			retval = "KK_AUDIT"
		Else

			Select Case cdatarow(31).ToString.Substring(0, 2)
				Case "SR", "SE", "SI"
					retval = "KK_AUDIT"
			End Select

		End If
		Return retval
	End Function


End Class
