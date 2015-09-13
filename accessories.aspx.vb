
Partial Class accessories
    Inherits webformbase

   

    Protected Sub LBLRIBBON_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles LBLRIBBON.Load
        Dim prodcode As Label = sender
        Me.LBLRIBBON.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
    End Sub

    Protected Sub HUGBEAR_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles HUGBEAR.Load
        Dim prodcode As Label = sender
        Me.HUGBEAR.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
    End Sub

    Protected Sub KTSHIRT_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles KTSHIRT.Load
        Dim prodcode As Label = sender
        Me.KTSHIRT.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
    End Sub

    Protected Sub KMED1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles KMED1.Load
        Dim prodcode As Label = sender
        Me.KMED1.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
    End Sub
    'Protected Sub LBLCAP_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles LBLCAP.Load
    'took out for 14
    '    Dim prodcode As Label = sender
    '    Me.LBLCAP.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
    'End Sub
    'Protected Sub KMF1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles KMF1.Load
    'took out for 14
    '    Dim prodcode As Label = sender
    '    Me.KMF1.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
    'End Sub

    Protected Sub KWRIST_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles KWRIST.Load
        Dim prodcode As Label = sender
        Me.KWRIST.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Dim LinkButton1 As LinkButton = DirectCast(Master.FindControl("LinkButton1"), LinkButton)
        If Not IsPostBack Then

            If IsNothing(Session("ShoppingCart")) Then
                Dim SC As New ShoppingCart
                Dim lt As New LookUpTable

                Session.Add("ShoppingCart", SC) 'contains orderdetail table and options table and any other tables I create in the new sub of shopping cart
                Session.Add("LookUp", lt) 'contains product table and eventually option tables in it.
           
            End If
        Else

        End If

    End Sub

	
	
    Protected Sub CHARM_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles TYD.Load
        Dim prodcode As Label = sender
        Me.TYD.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
    End Sub
End Class
