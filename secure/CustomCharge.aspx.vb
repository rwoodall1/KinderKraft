Imports MySql.Data.MySqlClient
Imports AuthorizeNet
Imports System.IO
Imports System.Net.Mail
Imports System.Net

Partial Class secure_CustomCharge
    Inherits webformbase

    Protected Sub btncc_Click(sender As Object, e As System.EventArgs) Handles btncc.Click
        Me.UpdateOrder("CC")
    End Sub
    Protected Sub UpdateOrder(paytype As String)

        If Submitbill(paytype) Then
            'update order
            Dim transid As String = ""
            Dim authcode As String = ""

            If Not IsNothing(Session("transid")) Then
                transid = Session("transid")
            End If
            If Not IsNothing(Session("authcode")) Then
                authcode = Session("authcode")
            End If


            Dim commandtext As String = "INSERT INTO customcharges(CompanyName, linkedorderid, autherr,orderdate, email, paytype, Total,transid,authcode,note,ccnum)" _
            & "VALUES (@companyname,@linkedorderid,@autherr,curdate(),@email,@paytype,@total,@transid,@authcode,@note,@ccnum)"
            dscustorder.InsertParameters.Add("@companyname", txtcompanyname.Text)
            dscustorder.InsertParameters.Add("@linkedorderid", txtlinkedorderid.Text)
            dscustorder.InsertParameters.Add("@total", x_amount.Text)
            dscustorder.InsertParameters.Add("@authcode", authcode)
            dscustorder.InsertParameters.Add("@transid", transid)
            dscustorder.InsertParameters.Add("@autherr", Session("paymenterror"))
            Dim length As Integer = x_card_num.Text.ToString.Length
            Dim startpos As Integer = length - 5 '0 based
            Dim num As String
            Try
                num = x_card_num.Text.ToString.Substring(startpos)
            Catch ex As Exception
                num = ""
            End Try
            dscustorder.InsertParameters.Add("@ccnum", num)
            dscustorder.InsertParameters.Add("@email", txtemail.Text)
            dscustorder.InsertParameters.Add("@paytype", ddlcardtype.Text)
            dscustorder.InsertParameters.Add("@note", txtnote.Text)

            dscustorder.InsertCommand = commandtext

            Try
                dscustorder.Insert()
                Session.Remove("transid")
                Session.Remove("authcode")
                Session.Remove("paymenterror")
                Session.Remove("paytype")
                Session.Remove("cardnum")
                Session.Remove("payment")
                emailcustomer()
            Catch ex As Exception
                MsgBox1.Show("Insert Error", "An error inserting record occured." & Chr(13) & ex.Message, Nothing, New EO.Web.MsgBoxButton("Ok"))

            End Try


        End If



    End Sub
    Protected Sub emailcustomer()
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
        ' emailto = "kinderkraftcs@jostens.com"
        emailto = "randy@woodalldevelopment.com"

        'Set the properties


        objMM.To.Add(emailto)
        ' objMM.Bcc.Add("kinderkraftcs@jostens.com")
        objMM.From = New MailAddress(ConfigurationManager.AppSettings("FromAddr"), ConfigurationManager.AppSettings("FromName"))

        'Send the email in text format
        objMM.IsBodyHtml = True

        'Set the subject
        objMM.Subject = "Charge On Account"
        Dim vbody As String = " <table class=style1> <tr> <td class=style2> <asp:Image ID=Image1 runat=server ImageUrl=~../images/jostenslogo.PNG/></td> <td>" _
                              & "</td></tr> <tr> <td align=right class=style2> Compnay Name:</td><td> " & txtcompanyname.Text & "</td> </tr>" _
                              & "<tr><td align=right class=style2>Email Address:</td><td> " & txtemail.Text & "</td> </tr>" _
                              & "<tr><td align=right class=style2> Orderid:</td><td>" & txtlinkedorderid.Text & "</td></tr>" _
                              & "<tr><td align=right class=style2>Amount Charged:</td><td>" & x_amount.Text & "</td></tr>" _
                              & "<tr><td align=right class=style2>Date:</td><td>" & Now & "</td></tr>" _
                              & "<tr><td align=right class=style2> Notes:</td><td>" & txtnote.Text & "</td></tr>" _
                              & "<tr><td class=style2></td><td></td></tr></table>"


        objMM.Body = vbody

        Dim smtp As New SmtpClient(ConfigurationManager.AppSettings("smtpserver"))
        smtp.Credentials = New NetworkCredential(ConfigurationManager.AppSettings("smtpuser"), ConfigurationManager.AppSettings("smtppassword"))
        Try
            'smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some servers
            smtp.Send(objMM)
        Catch ex1 As Exception
            Dim handler As New XC.Web.ErrorHandler(ex1)

            '' if you wish you can change the settings by now
            '' handler.EmailSettings.To = "me@domain.com";
            Dim sessionlist(1) As Object
            sessionlist(0) = Nothing
            If Not IsNothing(Session("ShoppingCart")) Then
                sessionlist(1) = Session("ShoppingCart")
            End If

            handler.HandleException(sessionlist)
            'Finally

        End Try
            
    End Sub

    Protected Sub ddlpaytype_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddlpaytype.SelectedIndexChanged

        Select Case ddlpaytype.SelectedValue
            Case "Credit Card"
                pnlCC.Visible = True

                x_type.Value = "AUTH_CAPTURE"

            Case Else
                pnlCC.Visible = False


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
    Private Function Submitbill(ByVal paytype As String) As Boolean
        Dim retval As Boolean = False
        Select Case paytype
            Case "CC"

                ' pull from the store
                Dim gate As Object = OpenGateway()

                '  build the request from the Form post
                Me.x_exp_date.Value = ddlmonth.SelectedValue & "/" & ddlyear.SelectedValue
                Dim apiRequest As Object = New AuthorizationRequest(x_card_num.Text, Me.x_exp_date.Value, CDec(x_amount.Text), "", True).AddCardCode(x_card_code.Text).AddCustomer("CustomCharge", x_first_name.Text, x_last_name.Text, "", "", "").AddInvoice(txtlinkedorderid.Text)
                apiRequest.email = txtemail.Text
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
                Session.Add("paytype", CardComp)
                Dim lgth As Integer = x_card_num.Text.Length
                Dim startpos As Integer = lgth - 4
                Dim cardnum As String = x_card_num.Text.Substring(startpos) '(this returns a wrong number when live)BaseGatewayResponse.CardNumber.Remove(0, 4)
                Session.Add("cardnum", cardnum)
                Session.Add("payment", response__1.Amount)
                retval = response__1.Approved
                If response__1.Approved Then
                    Session.Add("transid", response__1.TransactionID)
                    Session.Add("authcode", response__1.AuthorizationCode)


                    'below is not used but I kept it in for possible future use
                    'Session.Add("ordermessage", String.Format("Thank you! Payment has been submitted for the amount of {0}", response__1.Amount) _
                    '& "<br /> Transaction ID: " & response__1.AuthorizationCode & "/" & response__1.TransactionID & "<br />" & CardComp & ":" & response__1.CardNumber)

                Else
                    MsgBox1.Show("Payment Error", "Payment was not submitted to Authorize.net because of the following error:" & Chr(13) & response__1.Message, Nothing, New EO.Web.MsgBoxButton("Ok"))
                    Session.Add("paymenterror", response__1.Message)
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
                    Session.Add("authtransid", response__1.AuthorizationCode & "/" & response__1.TransactionID)

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



    Protected Sub ddlmonth_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddlmonth.SelectedIndexChanged
        Me.x_exp_date.Value = ddlmonth.SelectedValue & "/" & ddlyear.SelectedValue
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ddlyear_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddlyear.SelectedIndexChanged
        Me.x_exp_date.Value = ddlmonth.SelectedValue & "/" & ddlyear.SelectedValue
    End Sub
End Class
