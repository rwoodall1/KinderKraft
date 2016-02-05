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
Partial Class Packages
    Inherits webformbase
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
    Protected Sub GRADUATEPACKAGE_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles GRADUATEPACKAGE.Load
        Dim prodcode As Label = sender
        Me.GRADUATEPACKAGE.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
    End Sub

    Protected Sub SCHOLARPACKAGE_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles SCHOLARPACKAGE.Load
        Dim prodcode As Label = sender
        Me.SCHOLARPACKAGE.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
    End Sub

    Protected Sub ACHIEVERPACKAGE_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles ACHIEVERPACKAGE.Load
        Dim prodcode As Label = sender
        Me.ACHIEVERPACKAGE.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
    End Sub

    Protected Sub MILESTONEPACKAGE_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles MILESTONEPACKAGE.Load
        Dim prodcode As Label = sender
        Me.MILESTONEPACKAGE.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
    End Sub

    'Protected Sub LEADERPACKAGE_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles LEADERPACKAGE.Load
    '    Dim prodcode As Label = sender
    '    Me.LEADERPACKAGE.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
    'End Sub
    Protected Sub LEARNERPACKAGE_Load(sender As Object, e As EventArgs) Handles LEARNERPACKAGE.Load
        Dim prodcode As Label = sender
        Me.LEARNERPACKAGE.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
    End Sub
End Class
