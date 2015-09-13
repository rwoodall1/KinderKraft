Imports AuthorizeNet
Imports System.IO
Imports MySql.Data.MySqlClient
Imports System.Data
Imports System.Net.Mail
Imports System.Net

Partial Class CustomerCreditCard
    Inherits webformbase
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load



        Dim total As Decimal = 0
        Dim paytype As String = ""
        Dim status As String = ""
        Try
            total = CDec(DetailsView1.Rows(10).Cells(1).Text)
            paytype = DetailsView1.Rows(7).Cells(1).Text
            status = DetailsView1.Rows(8).Cells(1).Text
        Catch ex As Exception
            Session.Add("NOTPO", "<font color=red size=2>The order was not found!</font>")
            Response.Redirect("../Admin/Admin.aspx")
        End Try

        If paytype = "PO" Then

        ElseIf status = "ON HOLD" Then

        Else
            Session.Add("NOTPO", "<font color=red size=2>This order is not PO or Hold order.</font>")
            Response.Redirect("../Admin/Admin.aspx")
        End If

        x_amount.Value = total

    End Sub


    Protected Sub UpdateOrder(paytype As String)
        Dim custid As Integer = CInt(DetailsView1.Rows(1).Cells(1).Text)
        Dim orderid As Integer = CInt(DetailsView1.Rows(2).Cells(1).Text)
        If Submitbill(custid, paytype) Then
            InsertPayment()
            'update order

          

         
        Else 'submit not true
            MsgBox1.Show("Authorize.net Error", Session("paymenterror"), Nothing, New EO.Web.MsgBoxButton("Ok"))
            Session.Add("msg", Session("paymenterror")) 'comes from submit function
            sessionclear()
        End If
    End Sub
    Private Sub InsertPayment()
        Dim SC As ShoppingCart = Session("ShoppingCart")
        Dim LT As LookUpTable = Session("LookUp")
        Dim vstatus As String = ""
        Dim ccnum As String
        Dim total As String = DetailsView1.Rows(10).Cells(1).Text
        Dim orderid As String = DetailsView1.Rows(2).Cells(1).Text
        If Session("paytype") = "ECHECK" Then
            vstatus = "CAPTURE"
        Else
            vstatus = "CAPTURE"

        End If
        If IsNothing(Session("cardnum")) Then
            ccnum = Nothing
        Else
            ccnum = Session("cardnum")
            Session.Remove("cardnum")
        End If
        Dim commandtext As String
        Dim insertconnection As New MySqlConnection(dscustord.ConnectionString)
        Dim cmd As MySqlCommand = insertconnection.CreateCommand()
        commandtext = "insert into payment( orderid,paydate,amount,paytype,transid,authcode,ccnum) values(@orderid,now(),@amount,@paytype,@authnettranid,@authcode,@ccnum);"
        cmd.Parameters.Clear()
        cmd.Parameters.AddWithValue("@amount", total)
        cmd.Parameters.AddWithValue("@authnettranid", Session("authtransid"))
        cmd.Parameters.AddWithValue("@authcode", Session("authcode"))
        cmd.Parameters.AddWithValue("@ccnum", Session("cardnum"))
        cmd.Parameters.AddWithValue("@orderid", orderid)
        cmd.Parameters.AddWithValue("@paytype", ddlpaytype.SelectedValue)
        cmd.CommandText = commandtext

        Try
            insertconnection.Open()
            cmd.ExecuteNonQuery()
        Catch ex As Exception
            Dim vmsg As String = "The order was not updated with the transactionid or orderstatus" & Chr(13) & "The amount was transmitted to Authorize.net sucessfully. Take immediate action."
            MsgBox1.Show("Update Error", vmsg, Nothing, New EO.Web.MsgBoxButton("Ok"))
            Session.Add("msg", ex.Message)
            Dim handler As New XC.Web.ErrorHandler(ex)

            '' if you wish you can change the settings by now
            '' handler.EmailSettings.To = "me@domain.com";
            Dim sessionlist(1) As Object
            sessionlist(0) = Nothing
            If Not IsNothing(Session("ShoppingCart")) Then
                sessionlist(1) = Session("ShoppingCart")
            End If

            handler.HandleException(sessionlist)

            Dim objMM As New MailMessage
            Dim emailto As String
            Dim smtpclient As String
            Dim cpassword As String
            Dim cuser As String
            Dim newuser As String = ""
            Dim newuserpassword As String = ""
            smtpclient = ConfigurationManager.AppSettings("SmtpServer")
            cuser = ConfigurationManager.AppSettings("smtpuser")
            cpassword = cuser = ConfigurationManager.AppSettings("smtppassword")
            emailto = "randy@woodalldevelopment.com"

            'Set the properties

            objMM.To.Add(emailto)

            objMM.From = New MailAddress(ConfigurationManager.AppSettings("FromAddr"), ConfigurationManager.AppSettings("FromName"))

            'Send the email in text format
            objMM.IsBodyHtml = True

            'Set the subject
            objMM.Subject = "Payment Insert Error"
            Dim vbody As String = "There was an error inserting into the payment table the following Authorize.net information:</br>" _
                                  & "Order id:" & Session("orderid") & "," & "Transaction Id:" & Session("authtransid") _
                                  & "," & "Authorization Code:" & Session("authcode") & "," _
                                  & "Credit Card Number:" & Session("cardnum") & "," & "Pay Type:" & Session("paytype")
            objMM.Body = vbody

            Dim smtp As New SmtpClient(ConfigurationManager.AppSettings("smtpserver"))
            smtp.Credentials = New NetworkCredential(ConfigurationManager.AppSettings("smtpuser"), ConfigurationManager.AppSettings("smtppassword"))
            Try
                'smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some servers
                smtp.Send(objMM)
            Catch ex1 As Exception
                Dim handler1 As New XC.Web.ErrorHandler(ex1)

                '' if you wish you can change the settings by now
                '' handler.EmailSettings.To = "me@domain.com";
                Dim sessionlist1(1) As Object
                sessionlist1(0) = Nothing
                If Not IsNothing(Session("ShoppingCart")) Then
                    sessionlist1(1) = Session("ShoppingCart")
                End If

                handler1.HandleException(sessionlist1)
            Finally

            End Try

        Finally
            insertconnection.Close()
        End Try

        sessionclear()

        Response.Redirect("PaymentProcess.aspx")





    End Sub
    Private Sub sessionclear()
        Session.Remove("authtransid")
        Session.Remove("authcode")
        Session.Remove("paytype")
        Session.Remove("cardnum")
        Session.Remove("payment")
    End Sub
    Protected Sub ddlpaytype_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddlpaytype.SelectedIndexChanged

        Select Case ddlpaytype.SelectedValue
            Case "Credit Card"
                pnlCC.Visible = True
                pnlEC.Visible = False
                x_type.Value = "AUTH_CAPTURE"
            Case "E-Check"
                pnlCC.Visible = False
                pnlEC.Visible = True
                x_type.Value = "AUTH_CAPTURE"


            Case Else
                pnlCC.Visible = False
                pnlEC.Visible = False

        End Select
    End Sub
    Private Function OpenGateway() As IGateway
        ' we used the form builder so we can now just load it up
        'using the form reader
        Dim login As String = ConfigurationManager.AppSettings("ApiLogin")
        Dim transactionKey As String = ConfigurationManager.AppSettings("TransactionKey")
        Dim gate1 As New Gateway(login, transactionKey, ConfigurationManager.AppSettings("GatewayTest"))
        Return gate1
    End Function
    Private Function Submitbill(ByVal custid As Integer, ByVal paytype As String) As Boolean
        Dim retval As Boolean = False
        Select Case paytype
            Case "CC"

                ' pull from the store
                Dim gate As Object = OpenGateway()

                '  build the request from the Form post
                Me.x_exp_date.Value = ddlmonth.SelectedValue & "/" & ddlyear.SelectedValue

                Dim apiRequest As Object = New AuthorizationRequest(x_card_num.Text, Me.x_exp_date.Value, CDec(x_amount.Value), "", True).AddCardCode(x_card_code.Text).AddCustomer(custid.ToString, x_first_name.Text, x_last_name.Text, "", "", "")
                apiRequest.duplicatewindow = "420"

                'The below does not work with master forms or formviews use above
                'Dim apiRequest As Object = CheckoutFormReaders.BuildAuthAndCaptureFromPost()
                Dim cardno As String = apiRequest.CardNum.ToString
                ' set the amount - you can also set this from the page itself

                '  send to Auth.NET
                Dim response__1 As Object = gate.Send(apiRequest)
                ' We must get the whole response to get CC company, the respons only hold a certain number of properties. The CC company is not
                ' one of them. We could sub class the response and add the CC company propery but I didn't want to do this for one field.
                Dim BaseGatewayResponse As AuthorizeNet.GatewayResponse
                BaseGatewayResponse = response__1
                Dim CardComp As String = BaseGatewayResponse.CardType
                Session.Add("paytype", CardComp.ToString.ToUpper)
                Dim lgth As Integer = x_card_num.Text.Length
                Dim startpos As Integer = lgth - 4
                Dim cardnum As String = x_card_num.Text.Substring(startpos) '(this returns a wrong number when live)BaseGatewayResponse.CardNumber.Remove(0, 4)
                Session.Add("cardnum", cardnum)
                Session.Add("payment", response__1.Amount)
                retval = response__1.Approved

                If response__1.Approved Then
                    Session.Add("authtransid", response__1.TransactionID)
                    Session.Add("authcode", response__1.AuthorizationCode)
                    Dim authcode As String = response__1.AuthorizationCode
                    Dim transid As String = response__1.TransactionID

                    'below is not used but I kept it in for possible future use
                    'Session.Add("ordermessage", String.Format("Thank you! Payment has been submitted for the amount of {0}", response__1.Amount) _
                    '& "<br /> Transaction ID: " & response__1.AuthorizationCode & "/" & response__1.TransactionID & "<br />" & CardComp & ":" & response__1.CardNumber)

                Else

                    Session.Add("paymenterror", "Payment was not submitted because of the following error:<br/>" & response__1.Message)
                    retval = False
                End If



            Case "EC"


                'pull from the store
                Dim gate As Object = OpenGateway()

                'build the request from the Form post
                Dim apiRequest As Object = CheckoutFormReaders.BuildAuthAndCaptureFromPost()


                'set the amount - you can also set this from the page itself
                'you have to have a field named "x_amount"


                'send to Auth.NET
                Dim response__1 As Object = gate.Send(apiRequest)
                'We must get the whole response to get CC company, the respons only hold a certain number of properties. The CC company is not
                'one of them. We could sub class the response and add the CC company propery but I didn't want to do this for one field.
                Dim BaseGatewayResponse As AuthorizeNet.GatewayResponse
                BaseGatewayResponse = response__1
                Dim CardComp As String = BaseGatewayResponse.CardType
                Session.Add("paytype", "ECheck")
                'be sure the amount paid is not over the amount required
                'If response__1.Amount > Session("amount") Then
                '    retval = False
                '    Me.FailedVal.Text = "You have entered an amount greater than what you owe."
                '    Me.FailedVal.Validate()
                '    Return
                '    'Response.Redirect("Error.aspx")
                'End If

                'If CardComp <> Me.CCCompany.SelectedValue Then
                '    retval = False
                '    Me.FailedVal.Validate()
                '    Return
                'End If
                Session.Add("payment", response__1.Amount)
                If response__1.Approved Then
                    Session.Add("authtransid", response__1.TransactionID)
                    Session.Add("authcode", response__1.AuthorizationCode)
                    Dim transid As String = response__1.TransactionID
                    Session.Add("transid", response__1.TransactionID & "EC")
                    retval = True
                    'below is not used but I kept it in for possible future use
                    'Session.Add("ordermessage", String.Format("Thank you! Payment has been submitted for the amount of {0}", response__1.Amount) _
                    '& "<br /> Transaction ID: " & response__1.AuthorizationCode & "/" & response__1.TransactionID & "<br />" & CardComp & ":" & response__1.CardNumber)

                Else

                    Session.Add("paymenterror", "Payment was not submitted because of the following error:<br/>" & response__1.Message & "<br/> You may hit the back button and try again.")
                    retval = False
                End If



        End Select

        Return retval
    End Function
    Protected Sub ddlmonth_SelectedIndexChanged1(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlmonth.SelectedIndexChanged
        Me.x_exp_date.Value = ddlmonth.SelectedValue & "/" & ddlyear.SelectedValue
    End Sub
    Protected Sub ddlyear_SelectedIndexChanged1(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlyear.SelectedIndexChanged
        Me.x_exp_date.Value = ddlmonth.SelectedValue & "/" & ddlyear.SelectedValue
    End Sub
    Protected Sub btnEC_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEC.Click
        Me.UpdateOrder("EC")
    End Sub


    Protected Sub btncc_Click(sender As Object, e As System.EventArgs) Handles btncc.Click
        Me.UpdateOrder("CC")
    End Sub


End Class
