Imports AuthorizeNet
Imports MySql.Data.MySqlClient
Partial Class secure_refund
    Inherits System.Web.UI.Page

	Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
		'x_type.Value = "CREDIT"

		Dim cardnum As String = ""
		Dim transid As String = ""
		Dim amount As Decimal = 0

		Dim orderid As String = 0
		'Try	'test if there is not data or if buttons were pushed before getting order
		'	amount = 15.64
		'	transid = row.Cells(11).Text
		'	cardnum = row.Cells(12).Text

		'	orderid = row.Cells(0).Text
		'Catch ex As Exception

		'End Try
		Dim gate As Object = OpenGateway()
		''  build the request from the Form post
		Dim auth As CreditRequest = New AuthorizeNet.CreditRequest("4970054620", 16.54, "0326")


		''  send to Auth.NET
		Dim response__1 As Object = gate.Send(auth)
		'' We must get the whole response to get CC company, the respons only hold a certain number of properties. The CC company is not
		'' one of them. We could sub class the response and add the CC company propery but I didn't want to do this for one field.
		'Dim BaseGatewayResponse As AuthorizeNet.GatewayResponse
		'BaseGatewayResponse = response__1



		If response__1.Approved Then
			Session.Add("good", "approved")
		End If
	End Sub
	Private Function OpenGateway() As IGateway
		' we used the form builder so we can now just load it up
		'using the form reader
		Dim login As String = ConfigurationManager.AppSettings("ApiLogin")
		Dim transactionKey As String = ConfigurationManager.AppSettings("TransactionKey")


        Dim gate1 As New Gateway(login, transactionKey, ConfigurationManager.AppSettings("GatewayTest")) 'set true for testing
		Return gate1


	End Function
End Class
