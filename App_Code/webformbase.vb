Imports Microsoft.VisualBasic
Imports System.IO

Public Class webformbase
    Inherits System.Web.UI.Page


    Private Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Page.MaintainScrollPositionOnPostBack = True

        If Not IsNothing(Session("ShoppingCart")) Then
            Dim SCA As ShoppingCart = Session("ShoppingCart")
            'If Not IsNothing(Session("IsCs")) Then
            '    SCA.IsCs = Session("IsCs")
            'End If
            If DoPhoneLog() = True Then
                Dim custid As Integer = SCA.custid
               
                Response.Write("<script>window.open('../admin/Phonelog.aspx?custid=" & custid.ToString & "' , '-blank' );</script>")


                'Response.Redirect("~/admin/Phonelog.aspx?custid=" & custid.ToString)
            End If
            SetLabel(SCA)
			SetAdminLink(SCA)
			SetCurrentCust(SCA)
        Else
            Dim SC As New ShoppingCart
            SC.IsCs = Session("IsCs")
            Dim lt As New LookUpTable
			


            'If Not IsNothing(Session("username")) Then 'we are logged in from another order,making second order from receipt page.
            '    SC.useremail = Session("emailaddress")
            '    SC.LoggedIn = True
            '    SC.username = Session("username")
            '    SC.userzip = Session("userzip")
            '    SC.taxexempt = Session("taxexempt")
            '    SC.state = Session("state")
            '    SC.custid = Session("id")
            '    SC.LoggedIn = True
            '    SC.taxrate = lt.Gettax(SC.userzip)
            '    SC.IsCs = Session("IsCs")
            '    Session.Remove("loggedin")
            '    Session.Remove("emailaddress")
            '    Session.Remove("userzip")
            '    Session.Remove("taxexempt")
            '    Session.Remove("state")
            '    Session.Remove("id")
            '    Session.Remove("IsCs")
            'End If
            Session.Add("ShoppingCart", SC) 'contains orderdetail table and options table and any other tables I create in the new sub of shopping cart
            Session.Add("LookUp", lt)
        End If

    End Sub
    Function DoPhoneLog() As Boolean
        Dim retval As Boolean = False
        If Not IsNothing(Session("ShoppingCart")) Then
            Dim SC As ShoppingCart = Session("ShoppingCart")
            If SC.IsCs = False Then 'only phone log if CS
                Return retval 'val =false
            Else 'not a guest

                retval = IIf(SC.DoPhonelog, True, False)

            End If
        End If
        Return retval
    End Function
	Private Sub SetLabel(ByVal Sc As ShoppingCart)
		Dim label1 As Label = Me.FindControl("Label1")
		Dim lklogin As LinkButton = Me.FindControl("lklogin")
		If Sc.LoggedIn = True Then
			lklogin.Text = "Log Out"

		Else
			lklogin.Text = "Log In"

		End If



		If Sc.username <> "GUEST" Then
			label1.Text = "Welcome, " & Sc.username
			label1.Visible = True

		Else
			label1.Visible = False
		End If

	End Sub
	Private Sub SetAdminLink(ByVal Sc As ShoppingCart)
        Dim LinkButton1 As LinkButton = Me.FindControl("LinkButton1")

        LinkButton1.Visible = Sc.IsCs


	End Sub
	Private Sub SetCurrentCust(ByVal Sc As ShoppingCart)
		Dim lblcurrentcustomer As Label = Me.FindControl("lblcurrentcustomer")
		lblcurrentcustomer.Text = "Current Customer is:" & Sc.CompanyName & "(" & Sc.custid.ToString & ")"
		lblcurrentcustomer.Visible = Sc.IsCs

	End Sub
    Protected Sub ordstatus_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("~/CustomerOrders.aspx")
	End Sub
	
	Protected Sub LogOut()
		Session.RemoveAll()
        Dim authargument As New System.Web.UI.WebControls.AuthenticateEventArgs
        'guest check out this should stop bots a button has to be clicked to set this and bots can't click buttons.
        authargument.Authenticated = False
	End Sub
	Protected Sub lklogin_Click(ByVal sender As Object, ByVal e As System.EventArgs)
		Dim lklogin As LinkButton = Me.FindControl("lklogin")
		If lklogin.Text = "Log Out" Then
			LogOut()
			Response.Redirect("~/login.aspx")
		Else
			Response.Redirect("~/login.aspx")
		End If
	End Sub
End Class
