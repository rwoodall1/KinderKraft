
Partial Class createacapcart
    Inherits webformbase
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If Page.IsValid Then
            Dim lt As LookUpTable
            lt = Session("LookUp") 'contains product table and eventually option tables in it.
            Dim SC As ShoppingCart
            SC = Session("ShoppingCart")
            Dim detid As String = SC.AddToCart(SC.orderdetail, KCCAP10PK.ID, Me.txtqty.Text, Me.KCCAP10PK.Text, "Create A Cap", "")
            
            Session("ShoppingCart") = SC
            Response.Redirect("../scart.aspx")
        End If
    End Sub
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
    

    Protected Sub KCCAP10PK_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles KCCAP10PK.Load
        If Not IsPostBack Then
            Dim prodcode As Label = sender
            Me.KCCAP10PK.Text = Me.RetPrice(sender.text.ToString.ToUpper)
        End If
    End Sub
End Class
