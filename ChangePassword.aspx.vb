Imports System.Data

Partial Class ChangePassword
	Inherits webformbase

	Protected Sub btnupdate_Click(sender As Object, e As System.EventArgs) Handles btnupdate.Click
		Dim SC As ShoppingCart = Session("ShoppingCart")
		Dim custid As Integer = SC.custid
		'Dim Nameexist As Boolean
		Dim username As String = txtusrname.Text
		Dim password As String = txtpassword.Text

		'If Not Nameexist And SC.IsCs = False Then
		dscust.UpdateCommand = "Update cust set username=@username,password=@password where custid=@custid"
		dscust.UpdateParameters.Add("@custid", custid)
		dscust.UpdateParameters.Add("@username", username)
		dscust.UpdateParameters.Add("@password", password)
		Try
			dscust.Update()
			SC.username = username

		Catch ex As Exception
            Session.Add("errexception", ex)
            Session.Add("SessionError", ex.Message)
			Response.Redirect("error.aspx")
		End Try
		Response.Redirect("shopjostenshome.aspx")
		'End If
	End Sub
	Function GetUsername(vusername As String) As Boolean
		Dim dvSql As New DataView
		Dim retval As Boolean = False


		Dim selectcmd As String
		selectcmd = "SELECT distinct cust.EmailAddress,custid from cust where cust.username='" & vusername & "';"
		Me.dscust.SelectCommand = selectcmd

		Try
			dvSql = CType(Me.dscust.Select(DataSourceSelectArguments.Empty), Data.DataView)
		Catch ex As Exception

			Return retval
		End Try

		If dvSql.Table.Rows.Count > 0 Then
			retval = False 'name exist choose another
		Else
			retval = True

		End If
		''-----------------------------
		Return retval
	End Function

	

	Protected Sub Page_Load1(sender As Object, e As System.EventArgs) Handles Me.Load
		'Page.Validate()
		Dim SC As ShoppingCart = Session("ShoppingCart")
		If SC.IsCs Then
			Session.Add("SessionError", "You are company personel, use customer screen to change username and password!")
			Response.Redirect("error.aspx")
		End If
		If SC.username = "GUEST" Then
			Response.Redirect("login.aspx")
		Else
			If Not IsPostBack Then
				txtusrname.Text = SC.username
			End If
		End If

	End Sub

	Protected Sub custname_ServerValidate(source As Object, args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles custname.ServerValidate
		Dim SC As ShoppingCart = Session("ShoppingCart")
		Dim custid As Integer = SC.custid
		Dim Dogo As Boolean = True

		Dim username As String = Trim(txtusrname.Text)

		Dim orgusername As String = Trim(SC.username)
		If username <> orgusername Then
			Dogo = GetUsername(username)
		End If
		If SC.IsCs = False Then
			args.IsValid = Dogo
		Else
			args.IsValid = False 'iscs
		End If

	End Sub

	

	Protected Sub txtusrname_TextChanged1(sender As Object, e As System.EventArgs) Handles txtusrname.TextChanged
		Validate("g2")
	End Sub

	
End Class
