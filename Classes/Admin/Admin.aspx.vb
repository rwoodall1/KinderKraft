Partial Class Admin
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsNothing(Session("ShoppingCart")) Then
            Dim SC As ShoppingCart = Session("ShoppingCart")
            If Not IsNothing(Session("IsCs")) Then
                SC.IsCs = Session("IsCs")
            End If
            If sc.IsCs = False Then
				Response.Redirect("../shopjostenshome.aspx")
            End If
            SetLabel(SC)
			SetAdminLink(SC)
			SetCurrentCust(SC)
        Else
            Dim SCA As New ShoppingCart
            SCA.IsCs = Session("IsCs")
            Response.Redirect("../Login.aspx")
        End If
    End Sub
	Private Sub SetCurrentCust(ByVal Sc As ShoppingCart)

		lblcurrentcustomer.Text = "Current Customer is:" & Sc.CompanyName & "(" & Sc.custid.ToString & ")"
		lblcurrentcustomer.Visible = Sc.IsCs

	End Sub
  
    Private Sub SetLabel(ByVal Sc As Object)

		If Sc.LoggedIn = True Then
			lklogin.Text = "Log Out"

		Else
			lklogin.Text = "Log In"

		End If

        If SC.username <> "GUEST" Then
            label1.Text = "Welcome, " & SC.username
            label1.Visible = True
        Else
            label1.Visible = False
        End If

    End Sub
    Private Sub SetAdminLink(ByVal Sc As Object)

        If IsNothing(Session("IsCs")) Then
            LinkButton1.Visible = Sc.IsCs
        Else
            'SC session is erased after order is place I save to session so must use that to see if button is hid
            LinkButton1.Visible = Session("IsCs")
        End If
    End Sub
	Protected Sub ordstatus_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ordstatus.Click
		Response.Redirect("~/CustomerOrders.aspx")
	End Sub
	Protected Sub lklogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lklogin.Click


		If lklogin.Text = "Log Out" Then
			LogOut()
			Response.Redirect("~/login.aspx")
		Else
			Response.Redirect("~/login.aspx")
		End If
	End Sub
	Protected Sub LogOut()
		Session.RemoveAll()

	End Sub

	Protected Sub LinkButton9_Click(sender As Object, e As System.EventArgs) Handles LinkButton9.Click

	End Sub

	Protected Sub LinkButton10_Click(sender As Object, e As System.EventArgs) Handles LinkButton10.Click
		Dim SC As ShoppingCart = Session("ShoppingCart")
		Dim LT As LookUpTable = Session("LookUp")
		SC.HoldPayment = False
		SC.custid = 0
		SC.CompanyName = "GUEST"
		SC.useremail = ""
		SC.userzip = ""
		SC.taxexempt = False
		SC.taxrate = 0
		SC.state = ""
		Session("guestloggedin") = False
		SC.AdminGuest = True
		Session("ShoppingCart") = SC

		Response.Redirect("../shopjostenshome.aspx")
	End Sub

	Protected Sub LinkButton11_Click(sender As Object, e As System.EventArgs) Handles LinkButton11.Click
		Dim Sc As ShoppingCart = Session("ShoppingCart")
		Sc.ClearOrder()
	End Sub

	Protected Sub LinkButton12_Click(sender As Object, e As System.EventArgs) Handles LinkButton12.Click

		Response.Redirect("../secure/CustomerCreditCard.aspx?orderid=" & txtorderid.Text)


	End Sub
	Protected Sub Page_Unload(sender As Object, e As System.EventArgs) Handles Me.Unload
		Session.Remove("NOTPO")
	End Sub

  

   
   

    Protected Sub LinkButton7_Click(sender As Object, e As System.EventArgs) Handles LinkButton7.Click

    End Sub
End Class