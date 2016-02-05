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
Partial Class scart
	Inherits webformbase
    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)

        ClientScript.RegisterForEventValidation(gv1.UniqueID.ToString)
        MyBase.Render(writer)

    End Sub


	Private Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Dim LinkButton1 As LinkButton = DirectCast(Master.FindControl("LinkButton1"), LinkButton)
		LoadLic()
		
        If Not IsPostBack Then

            If IsNothing(Session("ShoppingCart")) Then
                Dim SC As New ShoppingCart
                Dim lt As New LookUpTable
                Try
                    ddlshipmeth1.SelectedValue = SC.shipmethod
                Catch ex As Exception

                End Try


                txtpromocode.Text = SC.promocode
				txtzip.Text = SC.userzip
				'No longer being used left for future use
				'           Try
				'If ddlshipmeth1.SelectedValue = "EXPRESS" Then
				'	DatePicker1.Visible = True
				'	Label3.Visible = True
				'	DatePicker1.SelectedDateString = SC.expectedshipdate
				'	rfdate.Enabled = True
				'Else
				'	DatePicker1.Visible = False
				'	DatePicker1.SelectedDateString = ""
				'	Label3.Visible = False
				'	rfdate.Enabled = False
				'End If
				'               DatePicker1.SelectedDateString = SC.expectedshipdate
				'           Catch ex As Exception

				'           End Try

                Session.Add("ShoppingCart", SC) 'contains orderdetail table and options table and any other tables I create in the new sub of shopping cart
                Session.Add("LookUp", lt) 'contains product table and eventually option tables in it.
            Else
                Dim SCa As ShoppingCart
                SCa = Session("ShoppingCart")

                Try
                    ddlshipmeth1.SelectedValue = SCa.shipmethod
                Catch ex As Exception

                End Try


				'No longer being used left for future use
				'           Try
				'If ddlshipmeth1.SelectedValue = "EXPRESS" Then
				'	DatePicker1.Visible = True
				'	Label3.Visible = True
				'	DatePicker1.SelectedDateString = SCa.expectedshipdate
				'Else
				'	DatePicker1.Visible = False
				'	DatePicker1.SelectedDateString = ""
				'	Label3.Visible = False

				'End If

				'           Catch ex As Exception

				'           End Try

                txtpromocode.Text = SCa.promocode
                txtzip.Text = SCa.userzip
                gv1.DataSource = SCa.orderdetail
				gv1.DataBind()
				Session("ShoppingCart") = SCa
                Me.DoTotal()

            End If
          
		Else 'is postback
			Dim SCa As ShoppingCart
			SCa = Session("ShoppingCart")


            SCa.shipmethod = ddlshipmeth1.SelectedValue
            If SCa.shipmethod = "INTERNATIONAL" Then
                SCa.International = True
            Else
                SCa.International = False
            End If

			'No longer being used left for future use
			'Try
			'	If SCa.shipmethod = "EXPRESS" Then
			'		DatePicker1.Visible = True
			'		Label3.Visible = True
			'		SCa.expectedshipdate = DatePicker1.SelectedDateString

			'	Else
			'		DatePicker1.Visible = False
			'		DatePicker1.SelectedDateString = ""
			'		Label3.Visible = False

			'	End If

			'Catch ex As Exception

			'End Try
			Session("ShoppingCart") = SCa
			Me.DoTotal()

		End If
	End Sub
	Protected Sub gv1_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles gv1.RowDeleting
		Dim lt As LookUpTable
		lt = Session("LookUp")
        Dim sca As ShoppingCart
        sca = Session("ShoppingCart")
        gv1.SelectRow(e.RowIndex()) 'get order detail id 
        Dim row As GridViewRow = gv1.SelectedRow
        Dim label1 As Label = row.FindControl("label1")
        Dim label2 As Label = row.FindControl("label2")

        sca.Delete_Item(sca.orderdetail, sca.OrderOptions, CInt(label1.Text), label2.Text, e)
        gv1.DataSource = sca.orderdetail
        gv1.DataBind()
        Session("ShoppingCart") = sca
        Me.DoTotal()

	End Sub
	Protected Sub gv1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gv1.RowDataBound
		If e.Row.RowType = DataControlRowType.DataRow Then
			If e.Row.RowIndex = 0 Then
				e.Row.Style.Add("height", "60px")

				e.Row.VerticalAlign = VerticalAlign.Bottom

			End If
		End If
		'format grid
		If e.Row.RowType = DataControlRowType.DataRow Then
			Select Case e.Row.Cells(0).Text
				Case "Graduate Package", "Scholar Package", "Achiever Package", "Milestone Package", "Learner Package"
					e.Row.Font.Bold = True
			End Select
			Select Case e.Row.Cells(3).Text
				Case "0"
					e.Row.Font.Italic = True
					e.Row.Font.Size = 9
			End Select
		End If







		'use if using individule row with button to display options
		Dim a As String = ""
		Try	'have to use try because I have paging enabled, creates rows with out cells and then bombs
			a = e.Row.Cells(3).Text
			If a = "0" Then

				e.Row.Cells(6).Enabled = False
			End If
		Catch ex As Exception

		End Try

		'use this for full time display of second grid
		If e.Row.RowType <> DataControlRowType.DataRow Then
			Return
		End If

		'use then for button selection

		Dim SCa As ShoppingCart
		SCa = Session("ShoppingCart")
		Dim lt As LookUpTable
		lt = Session("LookUp")

		Dim opd As GridView = e.Row.FindControl("opd")


		Dim DOrowView As DataRowView = CType(e.Row.DataItem, DataRowView)
		Dim vdetailid As Integer = DOrowView("detailid")
		Try
			Dim opdat As DataTable = SCa.OrderOptions.Select("detailid=" & vdetailid.ToString).CopyToDataTable
			'Dim qresults As DataTable = opdat.Select("detailid=" & vdetailid.ToString).CopyToDataTable
			opd.DataSource = opdat
			opd.DataBind()

		Catch ex As Exception

			opd.DataSource = Nothing
			opd.DataBind()
			Return
		End Try

	End Sub

	Protected Sub DoTotal()
		Dim SCa As ShoppingCart
		SCa = Session("ShoppingCart")
		Dim lt As LookUpTable
		lt = Session("LookUp")
		SCa.userzip = txtzip.Text
		'No longer being used left for future use
		'Try
		'    SCa.expectedshipdate = DatePicker1.SelectedDateString
		'Catch ex As Exception

        'End Try

		If SCa.International = True Then
			ddlshipmeth1.SelectedValue = "INTERNATIONAL"
		End If
        SCa.taxrate = lt.Gettax(txtzip.Text)


		Dim subtot As Decimal = SCa.GetItemTotal(SCa.orderdetail)
		lblsubtot.Text = "$" & subtot.ToString("N2")	'
		SCa.promocode = txtpromocode.Text


        SCa.shipmethod = ddlshipmeth1.SelectedValue
        Dim amnt As String = lt.GetPromoDiscount(txtpromocode.Text, lblsubtot.Text, SCa.shipmethod)
        lbldiscount.Text = amnt

        lblshipping.Text = "$" & lt.GetShipping(CDec(lblsubtot.Text), SCa.shipmethod).ToString("N2")

		SCa.SetShipCode(CDec(lblsubtot.Text), SCa.shipmethod)

		hftaxabletotal.Value = SCa.GetTaxableItemTotal(SCa.orderdetail, Trim(txtzip.Text), lblshipping.Text, SCa.taxexempt)
		If hftaxabletotal.Value > 0 Then
			Dim a As Decimal = hftaxabletotal.Value + CDec(lbldiscount.Text)
			If a > 1 Then
				hftaxabletotal.Value = hftaxabletotal.Value + CDec(lbldiscount.Text)
			Else
				hftaxabletotal.Value = hftaxabletotal.Value
			End If


		End If

		lbltax.Text = "$" & Math.Round(hftaxabletotal.Value * SCa.taxrate, 2).ToString("N2")
		Dim vtotal As Decimal = "$" & CDec(lblsubtot.Text) + CDec(lblshipping.Text) + CDec(lbltax.Text) + CDec(lbldiscount.Text)
		lbltotal.Text = "$" & vtotal.ToString("N2")


	End Sub
	Protected Sub gv1_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles gv1.PageIndexChanging
		Dim SCa As ShoppingCart
		SCa = Session("ShoppingCart")
		gv1.PageIndex = e.NewPageIndex
		gv1.DataSource = SCa.orderdetail
		gv1.DataBind()

	End Sub




	'Protected Sub gv1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gv1.RowCommand
	'    'use then for button selection
	'    If e.CommandName <> "Toggle" Then
	'        Return
	'    End If
	'    Dim SCa As ShoppingCart
	'    SCa = Session("ShoppingCart")
	'    Dim lt As LookUpTable
	'    lt = Session("LookUp")
	'    Dim vindex As Integer = Convert.ToInt32(e.CommandArgument)
	'    Dim selectedrow As GridViewRow = gv1.Rows(vindex)
	'    Dim btntoggle As LinkButton = selectedrow.FindControl("btnToggle")
	'    Dim opd As GridView = selectedrow.FindControl("opd")
	'    If btntoggle.Text = "Options" Then
	'        btntoggle.Text = "Close Options"
	'        Dim vdetailid As Integer = gv1.DataKeys(vindex).Value.ToString
	'        Try
	'            Dim opdat As DataTable = SCa.OrderOptions.Select("detailid=" & vdetailid.ToString).CopyToDataTable
	'            'Dim qresults As DataTable = opdat.Select("detailid=" & vdetailid.ToString).CopyToDataTable
	'            opd.DataSource = opdat
	'            opd.DataBind()

	'        Catch ex As Exception
	'            btntoggle.Text = "N/A"
	'            opd.DataSource = Nothing
	'            opd.DataBind()
	'            Return
	'        End Try


	'    Else
	'        btntoggle.Text = "Options"
	'        opd.DataSource = Nothing
	'        opd.DataBind()
	'    End If
	'End Sub





	Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
		If IsNothing(Session("ShoppingCart")) Then
			Session.Add("SessionError", "Your session has ended. Please reorder your products.")
			Response.Redirect("Error.aspx")
		Else
            Dim sc As ShoppingCart = Session("ShoppingCart")
            Session.Add("subtotal", CDec(lblsubtot.Text))
            If sc.LoggedIn = True Then

                Response.Redirect("invoice.aspx")

            Else
            Session.Add("checkout", True)
            Response.Redirect("login.aspx")
        End If
		End If



	End Sub

	Protected Sub TextBox1_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtzip.TextChanged

		Dim izip As Integer
		Try
			izip = CInt(txtzip.Text)
            If izip > 99499 And izip < 99951 Then
                ddlshipmeth1.SelectedValue = "AK/HI"
            ElseIf izip > 96699 And izip < 96899 Then
                ddlshipmeth1.SelectedValue = "AK/HI"
            Else
                If ddlshipmeth1.SelectedValue = "AK/HI" Then
					ddlshipmeth1.SelectedValue = "STANDARD"
                End If
            End If

		Catch ex As Exception

		End Try
		DoTotal()

	End Sub

	Protected Sub txtpromocode_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtpromocode.TextChanged

		DoTotal()
	End Sub
	



	Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
		DoTotal()
	End Sub

	
   

	Protected Sub ddlshipmeth1_SelectedIndexChanged1(sender As Object, e As System.EventArgs) Handles ddlshipmeth1.SelectedIndexChanged
        Dim sc As ShoppingCart = Session("ShoppingCart")
        sc.shipmethod = ddlshipmeth1.SelectedValue
        If sc.shipmethod = "INTERNATIONAL" Then
            sc.International = True
        Else
            sc.International = False
        End If
       
        Dim izip As Integer
        If txtzip.Text.Trim = "" Then
            izip = 0
        Else
            Try
                izip = CInt(txtzip.Text)
            Catch ex As Exception
                txtzip.Text = ""
                izip = 0
            End Try

        End If
        Try

            If izip > 99499 And izip < 99951 Then
                ddlshipmeth1.SelectedValue = "AK/HI"

            End If
            If izip > 96699 And izip < 96899 Then
                ddlshipmeth1.SelectedValue = "AK/HI"
            End If
        Catch ex As Exception

        End Try
        If ddlshipmeth1.SelectedValue = "express" Then
            'This is no longer used but I left it in in case it is brought back. Took out 12/08/2014
            'DatePicker1.Visible = True
            'Label3.Visible = True
            'rfdate.Enabled = True
        Else
            'DatePicker1.Visible = False
            'DatePicker1.SelectedDateString = ""
            'Label3.Visible = False
            'rfdate.Enabled = False
        End If
        Session("ShoppingCart") = sc
        DoTotal()
    End Sub

    Protected Sub txtzip_Load(sender As Object, e As System.EventArgs) Handles txtzip.Load
		Dim izip As Integer

        Try
            izip = CInt(txtzip.Text)
            If izip > 99500 And izip < 99951 Then

                ddlshipmeth1.SelectedValue = "AK/HI"
            ElseIf izip > 96700 And izip < 96899 Then

                ddlshipmeth1.SelectedValue = "AK/HI"

            End If

        Catch ex As Exception

		End Try

        DoTotal()
    End Sub

    
	Protected Sub DatePicker1_SelectionChanged(sender As Object, e As System.EventArgs) Handles DatePicker1.SelectionChanged
		'Dim SCa As ShoppingCart
		'SCa = Session("ShoppingCart")
		'SCa.expectedshipdate = DatePicker1.SelectedDateString
		'Session("ShoppingCart") = SCa

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
End Class
