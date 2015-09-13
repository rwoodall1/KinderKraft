Imports System.IO

Partial Class yearcharmcart
    Inherits webformbase
   
    Protected Sub Page_Load1(sender As Object, e As System.EventArgs) Handles Me.Load
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

    Protected Sub CHARM_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles TYD.Load
        Dim prodcode As Label = sender
        If Not IsPostBack Then
            Me.TYD.Text = Me.RetPrice(sender.text.ToString.ToUpper)
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If Page.IsValid Then
            Dim lt As LookUpTable
            lt = Session("LookUp") 'contains product table and eventually option tables in it.
            Dim SC As ShoppingCart
            SC = Session("ShoppingCart")
            Dim detid As String = SC.AddToCart(SC.orderdetail, TYD.ID, Me.txtqty.Text, Me.TYD.Text, "Tassel Charm", "")

            Dim arroptions(0, 4) As String
            arroptions(0, 1) = 258
            arroptions(0, 2) = "2015"
            arroptions(0, 3) = TYD.ID
            arroptions(0, 4) = detid
            SC.AddOptions(SC.OrderOptions, arroptions, 0)



            Session("ShoppingCart") = SC
            Response.Redirect("../scart.aspx")
        End If
    End Sub
End Class
