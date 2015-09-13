
Partial Class Info
	Inherits webformbase

	Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

		Dim msg As String = "Your payment was not submitted because of the following error: " & "'" & Session("paymenterror") & "' "

		lblinfo.Text = msg & " Please contact Jostens Kinderkraft support at 855-826-2355 for assistance"

		Dim SC As ShoppingCart
		If Not IsNothing(Session("ShoppingCart")) Then
			SC = Session("ShoppingCart")
		Else
			SC = New ShoppingCart
		End If
		SC.ClearOrder()
		Session.Remove("paymetnerror")
	End Sub
End Class
