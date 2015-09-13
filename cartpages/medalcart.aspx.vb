Imports System.IO

Partial Class cartpages_medalcart
    Inherits webformbase
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If Page.IsValid Then
            Dim lt As LookUpTable
            lt = Session("LookUp") 'contains product table and eventually option tables in it.
            Dim SC As ShoppingCart
            SC = Session("ShoppingCart")
            Dim detid As String = SC.AddToCart(SC.orderdetail, KMED.ID, Me.txtqty.Text, Me.KMED.Text, "Bright Future Medallion", "")

            'Dim arroptions(0, 4) As String
            'arroptions(0, 1) = Me.ddlclr.SelectedValue
            'arroptions(0, 2) = Me.ddlclr.SelectedItem.Text
            'arroptions(0, 3) = "0"
            'arroptions(0, 4) = detid


            'SC.AddOptions(SC.OrderOptions, arroptions, 0)
            Session("ShoppingCart") = SC
            Response.Redirect("../scart.aspx")
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNothing(Session("ShoppingCart")) Then
            Dim SC As New ShoppingCart
            Dim lt As New LookUpTable
             lt.ConnectStr = ConfigurationManager.ConnectionStrings("KK5").ToString 

            Session.Add("ShoppingCart", SC) 'contains orderdetail table and options table and any other tables I create in the new sub of shopping cart
            Session.Add("LookUp", lt) 'contains product table and eventually option tables in it.
            Session.Add("user", "GUEST") 'logged in as guest
        Else
            If IsNothing(Session("user")) Then
                Session.Add("user", "GUEST") 'logged in as guest
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

    Protected Sub KMED_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles KMED.Load
        If Not IsPostBack Then
            Dim prodcode As Label = sender
            Me.KMED.Text = Me.RetPrice(sender.text.ToString.ToUpper)
        End If
    End Sub
End Class
