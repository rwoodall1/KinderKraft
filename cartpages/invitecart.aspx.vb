
Partial Class cartpages_invitecart

    Inherits webformbase

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If IsNothing(Session("ShoppingCart")) Then
                Dim SC As New ShoppingCart
                Dim lt As New LookUpTable
                Session.Add("ShoppingCart", SC) 'contains orderdetail table and options table and any other tables I create in the new sub of shopping cart
                Session.Add("LookUp", lt) 'contains product table and eventually option tables in it.
            End If
        End If

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If Page.IsValid Then
            Dim lt As LookUpTable
            lt = Session("LookUp") 'contains product table and eventually option tables in it.
            Dim SC As ShoppingCart
            SC = Session("ShoppingCart")

			Dim detid As String = SC.AddToCart(SC.orderdetail, KINVITE10PK.ID, Me.txtqty.Text, KINVITE10PK.Text, "Invitations", Me.ddlclr.SelectedItem.Text)

            Dim arroptions(0, 4) As String
            arroptions(0, 1) = Me.ddlclr.SelectedValue
            arroptions(0, 2) = Me.ddlclr.SelectedItem.Text
			arroptions(0, 3) = KINVITE10PK.ID
            arroptions(0, 4) = detid


			SC.AddOptions(SC.OrderOptions, arroptions, KINVITE10PK.ID)
			Session("ShoppingCart") = SC
			Response.Redirect("../scart.aspx")
			'Response.Redirect("../default4.aspx")
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
	Protected Sub CAP_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles KINVITE10PK.Load
		If Not IsPostBack Then
			Dim prodcode As Label = sender
			Me.KINVITE10PK.Text = Me.RetPrice(sender.text.ToString.ToUpper)
		End If

	End Sub

    Protected Sub CustomValidator2_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles CustomValidator2.ServerValidate
        Dim retval As Boolean = True
        If Trim(Me.ddlclr.SelectedItem.Text) = "Please Select" Then
            Me.CustomValidator2.ErrorMessage = "Please select a color."
            retval = False
        End If
        args.IsValid = retval

    End Sub


    'Protected Sub dscolor_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles dscolor.Init
    '    Dim lt As LookUpTable
    '    lt = Session("LookUp")
    '    dscolor.ConnectionString = lt.ConnectStr
    'End Sub


    Protected Sub txtqty_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtqty.TextChanged

    End Sub

End Class
