Imports System.IO

Partial Class leaderpkgcart
    Inherits webformbase
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Dim LinkButton1 As LinkButton = DirectCast(Master.FindControl("LinkButton1"), LinkButton)
        Page.MaintainScrollPositionOnPostBack = True
        If IsNothing(Session("ShoppingCart")) Then
            Dim SC As New ShoppingCart
            Dim lt As New LookUpTable

             lt.ConnectStr = ConfigurationManager.ConnectionStrings("KK5").ToString 

            Session.Add("ShoppingCart", SC) 'contains orderdetail table and options table and any other tables I create in the new sub of shopping cart
            Session.Add("LookUp", lt) 'contains product table and eventually option tables in it.
            Session.Add("user", "GUEST") 'logged in as guest
        Else
            Dim SC1 As ShoppingCart = Session("ShoppingCart")

            If IsNothing(Session("user")) Then
                Session.Add("user", "GUEST") 'logged in as guest
            End If
        End If
    End Sub
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If Page.IsValid Then
            Dim lt As LookUpTable
            lt = Session("LookUp") 'contains product table and eventually option tables in it.
            Dim SC As ShoppingCart
            SC = Session("ShoppingCart")
            If txtqty6.Text <> Nothing Then
                'subscript 4 is option category used in add pkgoptions, this is hard coded but located in the option catagories table
                Dim arroptions(3, 4) As String
                arroptions(0, 1) = GetCapColorId(ddlclr.SelectedValue)
                arroptions(0, 2) = Trim(Me.ddlclr.SelectedItem.Text)
                arroptions(0, 3) = "06KLEADPKD"
                arroptions(0, 4) = 45
                arroptions(1, 1) = Me.ddlclr.SelectedValue
                arroptions(1, 2) = Trim(Me.ddlclr.SelectedItem.Text)
                arroptions(1, 3) = "06KLEADPKD"
                arroptions(1, 4) = 21
                arroptions(2, 1) = Me.ddlsize.SelectedValue
                arroptions(2, 2) = Me.ddlsize.SelectedItem.Text
                arroptions(2, 3) = "06KLEADPKD"
                arroptions(2, 4) = 34
                arroptions(3, 1) = Me.ddltasclr.SelectedValue
                arroptions(3, 2) = Me.ddltasclr.SelectedItem.Text
                arroptions(3, 3) = "06KLEADPKD"
                arroptions(3, 4) = 36



                SC.AddPkgToCart(SC.orderdetail, lt, Me.lblprodcode.Text, Me.txtqty.Text, Me.LBLPKG.Text, "Leader Package", CInt(txtqty6.Text), arroptions)
                'SC.AddOptions(SC.OrderOrderOptions, arroptions, 0)
                Session("ShoppingCart") = SC
            End If
            If txtqty5.Text <> Nothing Then
                'subscript 4 is option category used in add pkgoptions, this is hard coded but located in the option catagories table
                Dim arroptions(3, 4) As String
                arroptions(0, 1) = GetCapColorId(ddlclr.SelectedValue)
				arroptions(0, 2) = Trim(Me.ddlclr.SelectedItem.Text)
                arroptions(0, 3) = "06KLEADPKD"
                arroptions(0, 4) = 45
				arroptions(1, 1) = Me.ddlclr.SelectedValue
				arroptions(1, 2) = Trim(Me.ddlclr.SelectedItem.Text)
                arroptions(1, 3) = "06KLEADPKD"
                arroptions(1, 4) = 21
				arroptions(2, 1) = Me.ddlsize0.SelectedValue
				arroptions(2, 2) = Me.ddlsize0.SelectedItem.Text
                arroptions(2, 3) = "06KLEADPKD"
                arroptions(2, 4) = 34
				arroptions(3, 1) = Me.ddltasclr.SelectedValue
				arroptions(3, 2) = Me.ddltasclr.SelectedItem.Text
                arroptions(3, 3) = "06KLEADPKD"
                arroptions(3, 4) = 36


                SC.AddPkgToCart(SC.orderdetail, lt, Me.lblprodcode.Text, Me.txtqty.Text, Me.LBLPKG.Text, "Leader Package", CInt(txtqty5.Text), arroptions)

                Session("ShoppingCart") = SC
            End If
            If txtqty4.Text <> Nothing Then
                'subscript 4 is option category used in add pkgoptions, this is hard coded but located in the option catagories table
                Dim arroptions(3, 4) As String
                arroptions(0, 1) = GetCapColorId(ddlclr.SelectedValue)
				arroptions(0, 2) = Trim(Me.ddlclr.SelectedItem.Text)
                arroptions(0, 3) = "06KLEADPKD"
                arroptions(0, 4) = 45
				arroptions(1, 1) = Me.ddlclr.SelectedValue
				arroptions(1, 2) = Trim(Me.ddlclr.SelectedItem.Text)
                arroptions(1, 3) = "06KLEADPKD"
                arroptions(1, 4) = 21
				arroptions(2, 1) = Me.ddlsize1.SelectedValue
				arroptions(2, 2) = Me.ddlsize1.SelectedItem.Text
                arroptions(2, 3) = "06KLEADPKD"
                arroptions(2, 4) = 34
				arroptions(3, 1) = Me.ddltasclr.SelectedValue
				arroptions(3, 2) = Me.ddltasclr.SelectedItem.Text
                arroptions(3, 3) = "06KLEADPKD"
                arroptions(3, 4) = 36


                SC.AddPkgToCart(SC.orderdetail, lt, Me.lblprodcode.Text, Me.txtqty.Text, Me.LBLPKG.Text, "Leader Package", CInt(txtqty4.Text), arroptions)

                Session("ShoppingCart") = SC
            End If
            If txtqty3.Text <> Nothing Then
                'subscript 4 is option category used in add pkgoptions, this is hard coded but located in the option catagories table
                Dim arroptions(3, 4) As String
                arroptions(0, 1) = GetCapColorId(ddlclr.SelectedValue)
				arroptions(0, 2) = Trim(Me.ddlclr.SelectedItem.Text)
                arroptions(0, 3) = "06KLEADPKD"
                arroptions(0, 4) = 45
				arroptions(1, 1) = Me.ddlclr.SelectedValue
				arroptions(1, 2) = Trim(Me.ddlclr.SelectedItem.Text)
                arroptions(1, 3) = "06KLEADPKD"
                arroptions(1, 4) = 21
				arroptions(2, 1) = Me.ddlsize2.SelectedValue
				arroptions(2, 2) = Me.ddlsize2.SelectedItem.Text
                arroptions(2, 3) = "06KLEADPKD"
                arroptions(2, 4) = 34
				arroptions(3, 1) = Me.ddltasclr.SelectedValue
				arroptions(3, 2) = Me.ddltasclr.SelectedItem.Text
                arroptions(3, 3) = "06KLEADPKD"
                arroptions(3, 4) = 36


                SC.AddPkgToCart(SC.orderdetail, lt, Me.lblprodcode.Text, Me.txtqty.Text, Me.LBLPKG.Text, "Leader Package", CInt(txtqty3.Text), arroptions)

                Session("ShoppingCart") = SC
            End If
            If txtqty2.Text <> Nothing Then
                'subscript 4 is option category used in add pkgoptions, this is hard coded but located in the option catagories table
                Dim arroptions(3, 4) As String
                arroptions(0, 1) = GetCapColorId(ddlclr.SelectedValue)
				arroptions(0, 2) = Trim(Me.ddlclr.SelectedItem.Text)
                arroptions(0, 3) = "06KLEADPKD"
                arroptions(0, 4) = 45
				arroptions(1, 1) = Me.ddlclr.SelectedValue
				arroptions(1, 2) = Trim(Me.ddlclr.SelectedItem.Text)
                arroptions(1, 3) = "06KLEADPKD"
                arroptions(1, 4) = 21
				arroptions(2, 1) = Me.ddlsize3.SelectedValue
				arroptions(2, 2) = Me.ddlsize3.SelectedItem.Text
                arroptions(2, 3) = "06KLEADPKD"
                arroptions(2, 4) = 34
				arroptions(3, 1) = Me.ddltasclr.SelectedValue
				arroptions(3, 2) = Me.ddltasclr.SelectedItem.Text
                arroptions(3, 3) = "06KLEADPKD"
                arroptions(3, 4) = 36


                SC.AddPkgToCart(SC.orderdetail, lt, Me.lblprodcode.Text, Me.txtqty.Text, Me.LBLPKG.Text, "Leader Package", CInt(txtqty2.Text), arroptions)

                Session("ShoppingCart") = SC
            End If
            If txtqty1.Text <> Nothing Then
                'subscript 4 is option category used in add pkgoptions, this is hard coded but located in the option catagories table
                Dim arroptions(3, 4) As String
                arroptions(0, 1) = GetCapColorId(ddlclr.SelectedValue)
				arroptions(0, 2) = Trim(Me.ddlclr.SelectedItem.Text)
                arroptions(0, 3) = "06KLEADPKD"
                arroptions(0, 4) = 45
				arroptions(1, 1) = Me.ddlclr.SelectedValue
				arroptions(1, 2) = Trim(Me.ddlclr.SelectedItem.Text)
                arroptions(1, 3) = "06KLEADPKD"
                arroptions(1, 4) = 21
				arroptions(2, 1) = Me.ddlsize4.SelectedValue
				arroptions(2, 2) = Me.ddlsize4.SelectedItem.Text
                arroptions(2, 3) = "06KLEADPKD"
                arroptions(2, 4) = 34
				arroptions(3, 1) = Me.ddltasclr.SelectedValue
				arroptions(3, 2) = Me.ddltasclr.SelectedItem.Text
                arroptions(3, 3) = "06KLEADPKD"
                arroptions(3, 4) = 36


                SC.AddPkgToCart(SC.orderdetail, lt, Me.lblprodcode.Text, Me.txtqty.Text, Me.LBLPKG.Text, "Leader Package", CInt(txtqty1.Text), arroptions)

                Session("ShoppingCart") = SC
            End If
            If txtqty0.Text <> Nothing Then
                'subscript 4 is option category used in add pkgoptions, this is hard coded but located in the option catagories table
                Dim arroptions(3, 4) As String
                arroptions(0, 1) = GetCapColorId(ddlclr.SelectedValue)
				arroptions(0, 2) = Trim(Me.ddlclr.SelectedItem.Text)
                arroptions(0, 3) = "06KLEADPKD"
                arroptions(0, 4) = 45
				arroptions(1, 1) = Me.ddlclr.SelectedValue
				arroptions(1, 2) = Trim(Me.ddlclr.SelectedItem.Text)
                arroptions(1, 3) = "06KLEADPKD"
                arroptions(1, 4) = 21
				arroptions(2, 1) = Me.ddlsize5.SelectedValue
				arroptions(2, 2) = Me.ddlsize5.SelectedItem.Text
                arroptions(2, 3) = "06KLEADPKD"
                arroptions(2, 4) = 34
				arroptions(3, 1) = Me.ddltasclr.SelectedValue
				arroptions(3, 2) = Me.ddltasclr.SelectedItem.Text
                arroptions(3, 3) = "06KLEADPKD"
                arroptions(3, 4) = 36


                SC.AddPkgToCart(SC.orderdetail, lt, Me.lblprodcode.Text, Me.txtqty.Text, Me.LBLPKG.Text, "Leader Package", CInt(txtqty0.Text), arroptions)

                Session("ShoppingCart") = SC
            End If

            Response.Redirect("../scart.aspx")
        End If
    End Sub
    Function RetPrice(ByVal prodcode As String) As Decimal
        Dim lt As LookUpTable = Session("LookUp")
        Dim dprice As Decimal = 0
        Dim a As String
        Dim rowcount As Integer = lt.ProductTable.Rows.Count - 1
        Do While rowcount <> -1
            a = RTrim(lt.ProductTable.Rows(rowcount).Item("ProdCode").ToString.ToUpper)
            If RTrim(lt.ProductTable.Rows(rowcount).Item("ProdCode").ToString.ToUpper) = RTrim(prodcode.ToUpper) Then
                dprice = lt.ProductTable.Rows(rowcount).Item("Price")
                Exit Do
            End If
            rowcount = rowcount - 1
        Loop
        Return dprice
    End Function



    Protected Sub LBLPKG_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles LBLPKG.Load
        If Not IsPostBack Then
            Dim prodcode As Label = sender
            Me.LBLPKG.Text = Me.RetPrice(sender.text.ToString.ToUpper)
        End If
    End Sub
    Private Sub SumPkg()
        Dim a As Integer = Integer.Parse(IIf(txtqty6.Text = Nothing, "0", txtqty6.Text)) + Integer.Parse(IIf(txtqty5.Text = Nothing, "0", txtqty5.Text)) + CInt(IIf(txtqty4.Text = Nothing, "0", txtqty4.Text)) + CInt(IIf(txtqty3.Text = Nothing, "0", txtqty3.Text)) + CInt(IIf(txtqty2.Text = Nothing, "0", txtqty2.Text)) + CInt(IIf(txtqty1.Text = Nothing, "0", txtqty1.Text)) + CInt(IIf(txtqty0.Text = Nothing, "0", txtqty0.Text))
        txtqty.Text = a.ToString
    End Sub

    Protected Sub txtqty6_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtqty6.TextChanged
        Me.SumPkg()
    End Sub

    Protected Sub txtqty5_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtqty5.TextChanged
        Me.SumPkg()
    End Sub

    Protected Sub txtqty4_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtqty4.TextChanged
        Me.SumPkg()
    End Sub

    Protected Sub txtqty3_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtqty3.TextChanged
        Me.SumPkg()
    End Sub

    Protected Sub txtqty2_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtqty2.TextChanged
        Me.SumPkg()
    End Sub

    Protected Sub txtqty1_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtqty1.TextChanged
        Me.SumPkg()
    End Sub

    Protected Sub txtqty0_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtqty0.TextChanged
        Me.SumPkg()
    End Sub


    Protected Sub CustomValidator2_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles CustomValidator2.ServerValidate
        Dim retval As Boolean = True
        If Trim(Me.ddlclr.SelectedItem.Text) = "Please Select" Then
            Me.CustomValidator2.ErrorMessage = "Please select a gown/cap color."
            retval = False
        ElseIf Trim(Me.ddlsize.SelectedItem.Text) = "Please Select" Then
            Me.CustomValidator2.ErrorMessage = "Please select a gown size."
            retval = False
        ElseIf Trim(ddltasclr.SelectedItem.Text) = "Please Select" Then
            Me.CustomValidator2.ErrorMessage = "Please select a tassel color."
            retval = False

        End If


		If txtqty5.Text <> Nothing And Trim(ddlsize0.SelectedItem.Text) = "Please Select" Then
			Me.CustomValidator2.ErrorMessage = "Please select a gown size for row 2."
			retval = False
		ElseIf txtqty4.Text <> Nothing And Trim(ddlsize1.SelectedItem.Text) = "Please Select" Then
			Me.CustomValidator2.ErrorMessage = "Please select a gown size for row 3."
			retval = False
		ElseIf txtqty3.Text <> Nothing And Trim(ddlsize2.SelectedItem.Text) = "Please Select" Then
			Me.CustomValidator2.ErrorMessage = "Please select a gown size for row 4."
			retval = False
		ElseIf txtqty2.Text <> Nothing And Trim(ddlsize3.SelectedItem.Text) = "Please Select" Then
			Me.CustomValidator2.ErrorMessage = "Please select a gown size for row 5."
			retval = False
		ElseIf txtqty1.Text <> Nothing And Trim(ddlsize4.SelectedItem.Text) = "Please Select" Then
			Me.CustomValidator2.ErrorMessage = "Please select a gown size for row 6."
			retval = False
		ElseIf txtqty0.Text <> Nothing And Trim(ddlsize5.SelectedItem.Text) = "Please Select" Then
			Me.CustomValidator2.ErrorMessage = "Please select a gown size for row 7."
			retval = False
		End If
        args.IsValid = retval

    End Sub
    Protected Sub CustomValidator5_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles CustomValidator5.ServerValidate
        Dim retval As Boolean = True
        If txtqty6.Text = "0" Or txtqty6.Text = "" Then
            retval = False
        End If
        args.IsValid = retval
    End Sub
    Private Function GetCapColorId(clrval As Integer) As Integer
        Dim retval As Integer = 0
        Select Case clrval
            Case 170 'red
                retval = 236
            Case 171 'pink
                retval = 237
            Case 172 'gold
                retval = 238
            Case 173 'white
                retval = 239
            Case 174 'light blue
                retval = 240
            Case 175 'egg plant
                retval = 241
            Case 176 'royal blue
                retval = 242
            Case 177 'hunter Green
                retval = 243
            Case 247 'black
                retval = 246

        End Select
        Return retval
    End Function

    Protected Sub CustomValidator6_ServerValidate(source As Object, args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles CustomValidator6.ServerValidate
        Dim retval As Boolean = True
        Select Case ddlclr.SelectedItem.Value
            Case 170
                retval = False

            Case 176
                retval = False

        End Select


        args.IsValid = retval
    End Sub
End Class
