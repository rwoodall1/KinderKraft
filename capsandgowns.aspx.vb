
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
Partial Class capsandgowns
    Inherits webformbase

    '1 will alway be the orderid for the cart. The database will issue a new order id when it is inserted.
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Dim LinkButton1 As LinkButton = DirectCast(Master.FindControl("LinkButton1"), LinkButton)
        If Not IsPostBack Then
            If IsNothing(Session("ShoppingCart")) Then
                Dim SC As New ShoppingCart
                Dim lt As New LookUpTable

                Session.Add("ShoppingCart", SC) 'contains orderdetail table and options table and any other tables I create in the new sub of shopping cart
                Session.Add("LookUp", lt) 'contains product table and eventually option tables in it.
            Else
               
            End If
        Else

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
#Region "SetLabelPrices"

    Protected Sub CAP_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles CAP.Load
        Dim prodcode As Label = sender
        Me.CAP.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
    End Sub

    Protected Sub GWN_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles GWN.Load
        Dim prodcode As Label = sender
        Me.GWN.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
    End Sub




#End Region

End Class
