
Partial Class _Error
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            If IsNothing(Session("ShoppingCart")) Then
                Dim SC As New ShoppingCart
                Dim lt As New LookUpTable
                SetLabel(SC)
				SetAdminLink(SC)
				SetCurrentCust(SC)
                Session.Add("ShoppingCart", SC) 'contains orderdetail table and options table and any other tables I create in the new sub of shopping cart
                Session.Add("LookUp", lt) 'contains product table and eventually option tables in it.
            Else

            End If
        Else

        End If
        If IsNothing(Session("SessionError")) Then
            Me.lblerror.Visible = True
        Else
            If Not IsNothing(Session("errexception")) Then 'send email and record sessionerror is displayed
                lblerror.Visible = False
                Dim handler As New XC.Web.ErrorHandler(Session("errexception"))
                Session.Remove("errexception")
                '' if you wish you can change the settings by now
                '' handler.EmailSettings.To = "me@domain.com";
                Dim sessionlist(1) As Object
                sessionlist(0) = Nothing
                If Not IsNothing(Session("ShoppingCart")) Then
                    sessionlist(1) = Session("ShoppingCart")
                End If

                handler.HandleException(sessionlist)
            Else 'errexception is nothing error is expected and info is given to user nothing is emailed or recored sessionerror is displayed


            End If


        End If
    End Sub

    Private Sub SetLabel(ByVal Sc As Object)

        If SC.username <> "GUEST" Then
            label1.Text = "Welcome, " & SC.username
            label1.Visible = True
        Else
            Label1.Visible = False

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




	Private Sub SetCurrentCust(ByVal Sc As ShoppingCart)

		lblcurrentcustomer.Text = "Current Customer is:" & Sc.CompanyName & "(" & Sc.custid.ToString & ")"
		lblcurrentcustomer.Visible = Sc.IsCs

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
End Class
