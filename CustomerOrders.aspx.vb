
Partial Class CustomerOrders
    Inherits webformbase
   


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsNothing(Session("ShoppingCart")) Then
            Dim SC As ShoppingCart = Session("ShoppingCart")
            Dim custid As String = SC.custid
            Dim cmdtext As String
            If SC.username <> "GUEST" Then
                cmdtext = "select * from cust where custid =" & custid & ";"
                dscust.SelectCommand = cmdtext
            Else 'user is guest not allowed to look at orders
                Session.Add("SessionError", "You must have an account and be logged in to view your order status.")
                Response.Redirect("Error.aspx")
            End If
        End If

    End Sub

	
End Class
