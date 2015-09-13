Imports AuthorizeNet
Imports MySql.Data.MySqlClient

Partial Class PaymentProcess
    Inherits webformbase

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim dropdownlist1 As DropDownList = sender
        Dim row As GridViewRow = dropdownlist1.NamingContainer
        Session.Add("currow", row)
        GridView1.SelectedIndex = row.RowIndex
        Session.Remove("capmsg")
        Select Case dropdownlist1.SelectedValue
            Case "PROCESSING"
                'do nothing
            Case "CAPTURE"
                MsgBox1.Show("Capture", "Are you sure you want to capture this transaction?", Nothing, New EO.Web.MsgBoxButton("Yes", "", "yescapture"), New EO.Web.MsgBoxButton("No", "", "no"))
			
			Case "REFUND"
				MsgBox1.Show("Capture", "Are you sure you want to refund this transaction?", Nothing, New EO.Web.MsgBoxButton("Yes", "", "yesrefund"), New EO.Web.MsgBoxButton("No", "", "no"))

            Case "VOID"
                MsgBox1.Show("Capture", "Are you sure you want to void this transaction?", Nothing, New EO.Web.MsgBoxButton("Yes", "", "yesvoid"), New EO.Web.MsgBoxButton("No", "", "no"))
            Case "ON HOLD"
                MsgBox1.Show("Hold", "Use order screen to put or take off hold. This shows the status only.", Nothing, New EO.Web.MsgBoxButton("OK"))
        End Select
    End Sub
    Protected Sub Capture()
        Dim row As GridViewRow = Session("currow")
        Session.Remove("currow")
        'Dim paymenttype As String = row.Cells(3).Text
        Dim lblorderid As LinkButton = row.FindControl("lborderid")
        GridView1.SelectedIndex = row.RowIndex
        Dim orderid As String = lblorderid.Text
        Dim connection1 As New MySqlConnection(dscustord.ConnectionString)
        Dim lblpaytype As Label = row.FindControl("lblpaytype")
        Dim paymenttype As String = lblpaytype.Text
        If paymenttype = "PO" Then
            Dim commandtext As String = "UPDATE orders SET paymentcompleted = @paymentcompleted,orderstatus=@orderstatus,authdate=curdate() WHERE (orderid =" & orderid.ToString & ");"
            dscustord.UpdateParameters.Add("@paymentcompleted", "1")
            dscustord.UpdateParameters.Add("@orderstatus", "CAPTURE")

            dscustord.UpdateCommand = commandtext
            Try
                dscustord.Update()
				'UpdatePayment(row) 'if po insert a payment	  commented out payment needs to be blank to send no payment to jostens for po should mark as captured though
            Catch ex As Exception
                MsgBox1.Show("Update Error", "The following error happened updating the local database. " & Chr(13) & ex.Message, Nothing, New EO.Web.MsgBoxButton("Ok"))
                Session.Add("capmsg", "The following error happened updating the local database. " & ex.Message)
            End Try
            'Response.Redirect("CustomerCreditCard.aspx?orderid=" & orderid)
        Else
            x_type.Value = "PRIOR_AUTH_CAPTURE"
            GridView1.DataBind()
            Dim amount As Decimal
            Dim lbltotal As Label = row.FindControl("lbltotal")
            Dim transid As String
            Dim lbltransid As Label = row.FindControl("lbltransid")
            Dim lblauthcode As Label = row.FindControl("lblauthcode")
			Dim authcode As String


            Try 'test if there is not data or if buttons were pushed before getting order

                amount = CDec(lbltotal.Text)
                transid = lbltransid.Text
                authcode = lblauthcode.Text
                'transid = Gettransid(row)
                'authcode = GetAuthCode(row)
                If IsNothing(transid) Then
                    MsgBox1.Show("Update Error", "Transaction Id is not available,capture not complete.", Nothing, New EO.Web.MsgBoxButton("Ok"))
                    Return
                End If
            Catch ex As Exception
                Return
            End Try
            Dim gate As Object = OpenGateway()
            ''  build the request from the Form post
            Dim auth As CaptureRequest = New AuthorizeNet.CaptureRequest(amount, transid, authcode)

            ''  send to Auth.NET
            Dim response__1 As Object = gate.Send(auth)
            '' We must get the whole response to get CC company, the respons only hold a certain number of properties. The CC company is not
            '' one of them. We could sub class the response and add the CC company propery but I didn't want to do this for one field.
            'Dim BaseGatewayResponse As AuthorizeNet.GatewayResponse
            'BaseGatewayResponse = response__1



            If response__1.Approved Then


				Dim commandtext As String = "UPDATE orders SET paymentcompleted = @paymentcompleted,orderstatus=@orderstatus,authdate=curdate() WHERE (orderid =" & orderid.ToString & ");"
                dscustord.UpdateParameters.Add("@paymentcompleted", "1")
				dscustord.UpdateParameters.Add("@orderstatus", "CAPTURE")

				Dim commandtext1 As String = "update payment Set amount=@amount,capdate=now() WHERE (orderid =" & orderid.ToString & ");"
				dspayment.UpdateParameters.Add("@amount", amount)


				dspayment.UpdateCommand = commandtext1
                dscustord.UpdateCommand = commandtext
                Try
                    dscustord.Update()
					dspayment.Update()
                Catch ex As Exception
                    MsgBox1.Show("Update Error", "The order has been processed for the customer by Authorize.net but the following error happened updating the local database. " & ex.Message, Nothing, New EO.Web.MsgBoxButton("Ok"))
                    Session.Add("capmsg", "The order has been processed for the customer but the following error happened updating the local database. " & ex.Message)
                End Try
            Else
                MsgBox1.Show("Authorize.net Error", "The capture of this order did not succeed because of the following error:" & Chr(13) & response__1.message, Nothing, New EO.Web.MsgBoxButton("Ok"))
                Session.Add("capmsg", response__1.message)
            End If
        End If
	End Sub
	
    Protected Sub Void()
        'If you are not sure whether a transaction is settled, you can attempt to submit a
        'Void first. If the Void transaction results in an error, the original transaction is
        'likely settled and you can submit a Credit for the transaction.
        Dim row As GridViewRow = Session("currow")
        Session.Remove("currow")
        x_type.Value = "VOID"
        GridView1.DataBind()
        Dim amount As Decimal
        Dim transid As String
        Dim lbltotal As Label = row.FindControl("lbltotal")
        Dim authcode As String
        Dim lbltransid As Label = row.FindControl("lbltransid")
        Dim lblauthcode As Label = row.FindControl("lblauthcode")
        Try 'test if there is no data or if buttons were pushed before getting order

            amount = CDec(lbltotal.Text)
            transid = lbltransid.Text
            authcode = lblauthcode.Text
            'transid = Gettransid(row)
            'authcode = GetAuthCode(row)
            If IsNothing(transid) Then
                Return
            End If
        Catch ex As Exception

        End Try
        Dim lblpaytype As Label = row.FindControl("lblpaytype")
        Dim paymenttype As String = lblpaytype.Text
        If paymenttype <> "PO" Then
            Dim gate As Object = OpenGateway()
            ''  build the request from the Form post
            Dim auth As VoidRequest = New AuthorizeNet.VoidRequest(transid)

            ''  send to Auth.NET
            Dim response__1 As Object = gate.Send(auth)
            '' We must get the whole response to get CC company, the respons only hold a certain number of properties. The CC company is not
            '' one of them. We could sub class the response and add the CC company propery but I didn't want to do this for one field.
            'Dim BaseGatewayResponse As AuthorizeNet.GatewayResponse
            'BaseGatewayResponse = response__1



            If response__1.Approved Then
                Dim lblorderid As LinkButton = row.FindControl("lborderid")
                Dim orderid As String = lblorderid.Text
                Dim connection1 As New MySqlConnection(dscustord.ConnectionString)
				'imported=true so it dosen't show up on payment process screen when first opening.
				Dim commandtext As String = "UPDATE orders SET paymentcompleted = @paymentcompleted,orderstatus=@orderstatus,imported=1,authdate=curdate() WHERE (orderid =" & orderid.ToString & ");"
                dscustord.UpdateParameters.Add("@paymentcompleted", "1")
                dscustord.UpdateParameters.Add("@orderstatus", "VOID")



                dscustord.UpdateCommand = commandtext
                Try
                    dscustord.Update()
                Catch ex As Exception
                    Session.Add("capmsg", "The order has been processed for the customer but the following error happened updating the local database. " & ex.Message)
                End Try
            Else
                ''Dim a As String = response__1.message
                MsgBox1.Show("Authorize.net Error", "The void for this order was not completed because of the following error:" & Chr(13) & response__1.message, Nothing, New EO.Web.MsgBoxButton("Ok"))
                Session.Add("capmsg", response__1.message)
            End If
        Else 'is a PO
            Dim lblorderid As LinkButton = row.FindControl("lborderid")
            Dim orderid As String = lblorderid.Text
            Dim connection1 As New MySqlConnection(dscustord.ConnectionString)

            Dim commandtext As String = "UPDATE orders SET paymentcompleted = @paymentcompleted,orderstatus=@orderstatus,authdate=curdate() WHERE (orderid =" & orderid.ToString & ");"
            dscustord.UpdateParameters.Add("@paymentcompleted", "1")
            dscustord.UpdateParameters.Add("@orderstatus", "VOID")



            dscustord.UpdateCommand = commandtext
            Try
                dscustord.Update()
            Catch ex As Exception
                MsgBox1.Show("Update Error", "The update for this order was not completed because of the following error:" & Chr(13) & ex.Message, Nothing, New EO.Web.MsgBoxButton("Ok"))
                Session.Add("capmsg", "The following error happened updating the local database. " & ex.Message)
            End Try
        End If
    End Sub
    Protected Sub Refund()
        Dim row As GridViewRow = Session("currow")
        Session.Remove("currow")
        x_type.Value = "CREDIT"
        GridView1.DataBind()
        Dim lblpaytype As Label = row.FindControl("lblpaytype")
        Dim paymenttype As String = lblpaytype.Text
        Dim lblcardnum1 As Label = row.FindControl("lblcardnum")

        If paymenttype = "PO" Then

        Else
            Dim cardnum As String = ""

            Dim transid As String = ""
            Dim lblorderid As LinkButton = row.FindControl("lborderid")


            Dim amount As Decimal = 0
            Dim lbltotal As Label = row.FindControl("lbltotal")
            Dim orderid As String = 0
            Dim lbltransid As Label = row.FindControl("lbltransid")
            Dim lblauthcode As Label = row.FindControl("lblauthcode")
            Try 'test if there is no data or if buttons were pushed before getting order
                amount = lbltotal.Text
                'transid = row.Cells(11).Text
                transid = lbltransid.Text
                cardnum = lblcardnum1.Text

                orderid = lblorderid.Text
            Catch ex As Exception

            End Try

            If paymenttype <> "PO" Then
                Dim gate As Object = OpenGateway()
                ''  build the request from the Form post
                Dim auth As CreditRequest = New AuthorizeNet.CreditRequest(transid, CDec(amount), cardnum)


                ''  send to Auth.NET
                Dim response__1 As Object = gate.Send(auth)
                '' We must get the whole response to get CC company, the respons only hold a certain number of properties. The CC company is not
                '' one of them. We could sub class the response and add the CC company propery but I didn't want to do this for one field.
                'Dim BaseGatewayResponse As AuthorizeNet.GatewayResponse
                'BaseGatewayResponse = response__1



                If response__1.Approved Then


                    Dim connection1 As New MySqlConnection(dscustord.ConnectionString)

                    Dim commandtext As String = "UPDATE orders SET paymentcompleted = @paymentcompleted,orderstatus=@orderstatus,authdate=curdate() WHERE (orderid =" & orderid.ToString & ");"
                    dscustord.UpdateParameters.Add("@paymentcompleted", "1")
                    dscustord.UpdateParameters.Add("@orderstatus", "REFUND")



                    dscustord.UpdateCommand = commandtext
                    Try
                        dscustord.Update()
                    Catch ex As Exception
                        MsgBox1.Show("Update Error", "The order has been processed for the customer but the following error happened updating the local database." & Chr(13) & ex.Message, Nothing, New EO.Web.MsgBoxButton("Ok"))
                        Return
                        Session.Add("capmsg", "The order has been processed for the customer but the following error happened updating the local database. " & ex.Message)
                    End Try
                Else
                    ''Dim a As String = response__1.message
                    MsgBox1.Show("Authorize.net Error", "The refund of this order did not succeed because of the following error:" & Chr(13) & response__1.message, Nothing, New EO.Web.MsgBoxButton("Ok"))
                    Session.Add("capmsg", response__1.message)
                End If
            Else 'paytype is PO
                Dim connection1 As New MySqlConnection(dscustord.ConnectionString)

                Dim commandtext As String = "UPDATE orders SET paymentcompleted = @paymentcompleted,orderstatus=@orderstatus,authdate=curdate() WHERE (orderid =" & orderid.ToString & ");"
                dscustord.UpdateParameters.Add("@paymentcompleted", "1")
                dscustord.UpdateParameters.Add("@orderstatus", "REFUND")
                dscustord.UpdateCommand = commandtext
                Try
                    dscustord.Update()
                Catch ex As Exception
                    MsgBox1.Show("Update Error", "The update of the local database did not succeed because of the following error:" & Chr(13) & ex.Message, Nothing, New EO.Web.MsgBoxButton("Ok"))
                    Session.Add("capmsg", "The following error happened updating the local database. " & ex.Message)
                End Try

            End If
        End If 'end if po
    End Sub
    Protected Sub UpdatePayment(ByVal row As GridViewRow)
        Dim lblpaytype, lbltransid, lblauthcode, lblcardnum, lbltotal As Label
        Dim lborderid As LinkButton
        lborderid = row.FindControl("lborderid")
        lblpaytype = row.FindControl("lblpaytype")
        lbltransid = row.FindControl("lbltransid")
        lblauthcode = row.FindControl("lblauthcode")
        lblcardnum = row.FindControl("lblcardnum")
        lbltotal = row.FindControl("lbltotal")

        Dim commandtext As String = "insert into payment (amount,transid,paytype,ccnum,authcode,orderid,paydate) values(@amount,@transid,@paytype,@ccnum,@authcode,@orderid,Now());"
        Dim connection1 As New MySqlConnection(dscustord.ConnectionString)
        connection1.Open()
        Dim cmd As MySqlCommand = connection1.CreateCommand()
        cmd.Parameters.Clear()
        cmd.Parameters.AddWithValue("@transid", lbltransid.Text)
        cmd.Parameters.AddWithValue("@authcode", lblauthcode.Text)
        cmd.Parameters.AddWithValue("@ccnum", lblcardnum.Text)
        cmd.Parameters.AddWithValue("@orderid", lborderid.Text)
        cmd.Parameters.AddWithValue("@paytype", lblpaytype.Text)
        cmd.Parameters.AddWithValue("@amount", lbltotal.Text)
        cmd.CommandText = commandtext
        Try 'insert payment
            cmd.ExecuteNonQuery()


        Catch ex As Exception

        Finally
            connection1.Close()

        End Try

    End Sub

    'took the below button out, will put in if need be later
    'Protected Sub Button1_Click(sender As Object, e As System.EventArgs)
    '	'get proper row
    '	Session.Remove("capmsg")
    '	Dim submitbtn As Button = sender
    '	Dim row As GridViewRow = submitbtn.NamingContainer
    '	GridView1.SelectedIndex = row.RowIndex
    '	Dim process As DropDownList = row.FindControl("DropDownList1")
    '	'process order
    '	Select Case process.SelectedValue
    '		Case "PROCESSING"
    '			'do nothing
    '		Case "CAPTURE"
    '			'x_type.Value = "PRIOR_AUTH_CAPTURE" aready set in selected index changed funtion
    '			Dim amount As Decimal
    '			Dim transid As String
    '			Dim authcode As String
    '			Try	'test if there is not data or if buttons were pushed before getting order

    '				amount = CDec(row.Cells(2).Text)
    '				transid = Gettransid(row)
    '				authcode = GetAuthCode(row)
    '				If IsNothing(transid) Then
    '					Return
    '				End If
    '			Catch ex As Exception
    '				Return
    '			End Try


    '			Dim gate As Object = OpenGateway()
    '			''  build the request from the Form post
    '			Dim auth As CaptureRequest = New AuthorizeNet.CaptureRequest(amount, transid, authcode)

    '			''  send to Auth.NET
    '			Dim response__1 As Object = gate.Send(auth)
    '			'' We must get the whole response to get CC company, the respons only hold a certain number of properties. The CC company is not
    '			'' one of them. We could sub class the response and add the CC company propery but I didn't want to do this for one field.
    '			'Dim BaseGatewayResponse As AuthorizeNet.GatewayResponse
    '			'BaseGatewayResponse = response__1



    '			If response__1.Approved Then
    '				Dim orderid As String = row.Cells(0).Text
    '				Dim connection1 As New MySqlConnection(dscustord.ConnectionString)

    '				Dim commandtext As String = "UPDATE orders SET paymentcompleted = @paymentcompleted,orderstatus=@orderstatus,authdate=curdate() WHERE (orderid =" & orderid.ToString & ");"
    '				dscustord.UpdateParameters.Add("@paymentcompleted", "1")
    '				dscustord.UpdateParameters.Add("@orderstatus", "CAPTURE")



    '				dscustord.UpdateCommand = commandtext
    '				Try
    '					dscustord.Update()
    '				Catch ex As Exception

    '				End Try
    '			Else
    '				''Dim a As String = response__1.message
    '				Session.Add("capmsg", response__1.message)
    '			End If
    '		Case "REFUND"
    '			'x_type.Value = "CREDIT" aready set in selected index changed funtion


    '		Case "VOID"
    '			'x_type.Value = "VOID" aready set in selected index changed funtion

    '	End Select

    '	'reset index
    '	GridView1.SelectedIndex = -1
    'End Sub

    Private Function OpenGateway() As IGateway
        ' we used the form builder so we can now just load it up
        'using the form reader
        Dim login As String = ConfigurationManager.AppSettings("ApiLogin")
        Dim transactionKey As String = ConfigurationManager.AppSettings("TransactionKey")
        Dim gate1 As New Gateway(login, transactionKey, ConfigurationManager.AppSettings("GatewayTest")) 'set true for testing
        Return gate1
    End Function



    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
		LoadLic()
        Page.MaintainScrollPositionOnPostBack = True
        If IsNothing(Session("ShoppingCart")) Then

            Response.Redirect("../login.aspx")
        Else
            Dim sc As ShoppingCart = Session("ShoppingCart")
            If sc.IsCs = False Then
                Response.Redirect("../shopjostenshome.aspx")
            Else
                'LinkButton1.Visible = sc.IsCs
            End If
        End If




        Dim orderid As String = ""
        If Not IsPostBack Then
            Session.Remove("capmsg")
        End If
        Try
            If IsNothing(ViewState("cmdtext")) Then
                'do nothing 
                'ViewState.Add("orderid", Request.QueryString("orderid"))
                'orderid = ViewState("orderid")
            Else
                dscustord.SelectCommand = ViewState("cmdtext")
            End If
        Catch ex As Exception

        End Try


        'If orderid = "" Then
        '    'do nothing
        'Else
        '    cmdtext = "SELECT cust.fname, cust.lname, cust.EmailAddress, cust.CompanyName, orders.orderid, orders.customerid, orders.orderdate, orders.total, orders.paytype, orders.orderstatus, orders.authdate, orders.authnettranid, cust.custid, orders.ccnum FROM cust INNER JOIN orders ON cust.custid = orders.customerid WHERE(orders.orderid =" & orderid & ") ORDER BY orders.orderdate DESC;"
        '    dscustord.SelectCommand = cmdtext
        'End If



    End Sub





    Protected Sub DropDownList1_DataBound(sender As Object, e As System.EventArgs)
        'if customer is not a school then disable the po payment function
        Dim dropdownlist1 As DropDownList = sender


        If dropdownlist1.SelectedValue = "PROCESSING" Then
            Dim ai As ListItem = dropdownlist1.Items.FindByValue("REFUND")
            Try
                ai.Attributes.Add("style", "color:gray;")
                ai.Attributes.Add("disabled", "true")
                'i.Value = ""
            Catch ex As Exception 'already grayed out and disabled

            End Try
        End If
        If dropdownlist1.SelectedValue = "CAPTURE" Then
            Dim aii As ListItem = dropdownlist1.Items.FindByValue("PROCESSING")
            Try
                aii.Attributes.Add("style", "color:gray;")
                aii.Attributes.Add("disabled", "true")
                'i.Value = ""
            Catch ex As Exception 'already grayed out and disabled

            End Try
        End If
        Dim aiii As ListItem = dropdownlist1.Items.FindByValue("ON HOLD")
        Try
            aiii.Attributes.Add("style", "color:gray;")
            aiii.Attributes.Add("disabled", "true")
            'i.Value = ""
        Catch ex As Exception 'already grayed out and disabled

        End Try
        Dim aiiii As ListItem = dropdownlist1.Items.FindByValue("PENDING")
        Try
            aiiii.Attributes.Add("style", "color:gray;")
            aiiii.Attributes.Add("disabled", "true")
            'i.Value = ""
        Catch ex As Exception 'already grayed out and disabled

        End Try



        If dropdownlist1.SelectedValue = "REFUND" Then
            Dim bi As ListItem = dropdownlist1.Items.FindByValue("PROCESSING")
            Try
                bi.Attributes.Add("style", "color:gray;")
                bi.Attributes.Add("disabled", "true")
                'i.Value = ""
            Catch ex As Exception 'already grayed out and disabled

            End Try
            Dim bii As ListItem = dropdownlist1.Items.FindByValue("VOID")
            Try
                bii.Attributes.Add("style", "color:gray;")
                bii.Attributes.Add("disabled", "true")
                'i.Value = ""
            Catch ex As Exception 'already grayed out and disabled

            End Try

            Dim biii As ListItem = dropdownlist1.Items.FindByValue("CAPTURE")
            Try
                biii.Attributes.Add("style", "color:gray;")
                biii.Attributes.Add("disabled", "true")
                'i.Value = ""
            Catch ex As Exception 'already grayed out and disabled

            End Try
            Dim biiii As ListItem = dropdownlist1.Items.FindByValue("REFUND")
            Try
                biiii.Attributes.Add("style", "color:gray;")
                biiii.Attributes.Add("disabled", "true")
                'i.Value = ""
            Catch ex As Exception 'already grayed out and disabled

            End Try

            Dim biiiii As ListItem = dropdownlist1.Items.FindByValue("ON HOLD")
            Try
                biiiii.Attributes.Add("style", "color:gray;")
                biiiii.Attributes.Add("disabled", "true")
                'i.Value = ""
            Catch ex As Exception 'already grayed out and disabled

            End Try
            Dim biiiiii As ListItem = dropdownlist1.Items.FindByValue("PENDING")
            Try
                biiiiii.Attributes.Add("style", "color:gray;")
                biiiiii.Attributes.Add("disabled", "true")
                'i.Value = ""
            Catch ex As Exception 'already grayed out and disabled

            End Try
        End If
        If dropdownlist1.SelectedValue = "VOID" Then
            Dim ci As ListItem = dropdownlist1.Items.FindByValue("PROCESSING")
            Try
                ci.Attributes.Add("style", "color:gray;")
                ci.Attributes.Add("disabled", "true")
                'i.Value = ""
            Catch ex As Exception 'already grayed out and disabled

            End Try
            Dim cii As ListItem = dropdownlist1.Items.FindByValue("REFUND")
            Try
                cii.Attributes.Add("style", "color:gray;")
                cii.Attributes.Add("disabled", "true")
                'i.Value = ""
            Catch ex As Exception 'already grayed out and disabled

            End Try

            Dim ciii As ListItem = dropdownlist1.Items.FindByValue("CAPTURE")
            Try
                ciii.Attributes.Add("style", "color:gray;")
                ciii.Attributes.Add("disabled", "true")
                'i.Value = ""
            Catch ex As Exception 'already grayed out and disabled

            End Try
            Dim ciiii As ListItem = dropdownlist1.Items.FindByValue("ON HOLD")
            Try
                ciiii.Attributes.Add("style", "color:gray;")
                ciiii.Attributes.Add("disabled", "true")
                'i.Value = ""
            Catch ex As Exception 'already grayed out and disabled

            End Try
            Dim ciiiii As ListItem = dropdownlist1.Items.FindByValue("PENDING")
            Try
                ciiii.Attributes.Add("style", "color:gray;")
                ciiii.Attributes.Add("disabled", "true")
                'i.Value = ""
            Catch ex As Exception 'already grayed out and disabled

            End Try
        End If





        If dropdownlist1.SelectedValue = "ON HOLD" Then
            Dim di As ListItem = dropdownlist1.Items.FindByValue("PROCESSING")
            Try
                di.Attributes.Add("style", "color:gray;")
                di.Attributes.Add("disabled", "true")
                'i.Value = ""
            Catch ex As Exception 'already grayed out and disabled

            End Try
            Dim dii As ListItem = dropdownlist1.Items.FindByValue("REFUND")
            Try
                dii.Attributes.Add("style", "color:gray;")
                dii.Attributes.Add("disabled", "true")
                'i.Value = ""
            Catch ex As Exception 'already grayed out and disabled

            End Try
            Dim diii As ListItem = dropdownlist1.Items.FindByValue("CAPTURE")
            Try
                diii.Attributes.Add("style", "color:gray;")
                diii.Attributes.Add("disabled", "true")
                'i.Value = ""
            Catch ex As Exception 'already grayed out and disabled

            End Try
            Dim diiii As ListItem = dropdownlist1.Items.FindByValue("VOID")
            Try
                diiii.Attributes.Add("style", "color:gray;")
                diiii.Attributes.Add("disabled", "true")
                'i.Value = ""
            Catch ex As Exception 'already grayed out and disabled

            End Try
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Dim orderid As String = txtorderid.Text
        Dim cmdtext As String
        If orderid = "" Then
          

            cmdtext = "SELECT cust.fname, cust.lname, cust.EmailAddress, cust.CompanyName, orders.orderid, orders.customerid, orders.orderdate, orders.total, orders.paytype, orders.orderstatus, orders.authdate, cust.custid, orders.autherr, payment.authcode, payment.ccnum, payment.transid FROM cust INNER JOIN orders ON cust.custid = orders.customerid LEFT OUTER JOIN payment ON orders.orderid = payment.orderid WHERE (orders.orderstatus = 'PROCESSING') OR (orders.orderstatus = 'PENDING') OR (orders.orderstatus = 'HOLD') ORDER BY orders.orderdate DESC"


            dscustord.SelectCommand = cmdtext
        Else
		


            cmdtext = "SELECT cust.fname, cust.lname, cust.EmailAddress, cust.CompanyName, orders.orderid, orders.customerid, orders.orderdate, orders.total, orders.paytype, orders.orderstatus, " _
            & "orders.authdate, cust.custid, orders.autherr, payment.authcode, payment.ccnum, payment.transid" _
            & " FROM cust INNER JOIN orders ON cust.custid = orders.customerid LEFT JOIN  payment ON orders.orderid = payment.orderid" _
            & " WHERE(orders.orderid =" & orderid & ") ORDER BY orders.orderdate DESC;"


			dscustord.SelectCommand = cmdtext
            ViewState.Add("cmdtext", cmdtext)
        End If
    End Sub

	Protected Sub Button2_Click(sender As Object, e As System.EventArgs) Handles Button2.Click

		Dim status As String = ddlstatus.SelectedValue
		Dim firstdate As String = DatePicker1.DateValue.ToShortDateString
		Dim seconddate As String = DatePicker2.DateValue.ToShortDateString
		Dim cmdtext As String

		If DatePicker1.DateValue > DatePicker2.DateValue Then

			If seconddate <> "1/1/0001" Then
				MsgBox1.Show("Invalid Second Date", "The second date must be greater than the first date!", Nothing, New EO.Web.MsgBoxButton("Ok"))
				Return
			End If
		End If
		dscustord.SelectParameters.Add("@firstdate", firstdate)
		dscustord.SelectParameters.Add("@seconddate", seconddate)
		Select Case status
			Case "ALL"
				If seconddate = "1/1/0001" Then
					dscustord.SelectParameters.Clear()
					dscustord.SelectParameters.Add("@status", status)
                    cmdtext = "SELECT cust.fname, cust.lname, cust.EmailAddress, cust.CompanyName, orders.orderid, orders.customerid, orders.orderdate, orders.total, orders.paytype, orders.orderstatus, " _
                     & "orders.authdate, cust.custid, orders.autherr, payment.authcode, payment.ccnum, payment.transid  FROM cust INNER JOIN orders ON cust.custid = orders.customerid " _
                      & "LEFT JOIN payment ON orders.orderid = payment.orderid  ORDER BY orders.orderdate DESC;"
				Else
					dscustord.SelectParameters.Clear()
					dscustord.SelectParameters.Add("@status", status)
                    cmdtext = "SELECT cust.fname, cust.lname, cust.EmailAddress, cust.CompanyName, orders.orderid, orders.customerid, orders.orderdate, orders.total, orders.paytype, orders.orderstatus, " _
                     & "orders.authdate, cust.custid, orders.autherr, payment.authcode, payment.ccnum, payment.transid FROM cust INNER JOIN orders ON cust.custid = orders.customerid " _
                      & "LEFT JOIN payment ON orders.orderid = payment.orderid WHERE(date(orders.orderdate) between " & TransFormDate(CDate(firstdate)) & "and" & TransFormDate(CDate(seconddate)) & ") ORDER BY orders.orderdate DESC;"
				End If
			Case Else
				If seconddate = "1/1/0001" Then
					dscustord.SelectParameters.Clear()
					dscustord.SelectParameters.Add("@status", status)
                    cmdtext = "SELECT cust.fname, cust.lname, cust.EmailAddress, cust.CompanyName, orders.orderid, orders.customerid, orders.orderdate, orders.total, orders.paytype, orders.orderstatus, " _
                    & "orders.authdate, cust.custid, orders.autherr, payment.authcode, payment.ccnum, payment.transid FROM cust INNER JOIN orders ON cust.custid = orders.customerid " _
                    & "LEFT JOIN payment ON orders.orderid = payment.orderid WHERE (orders.orderstatus=@status) ORDER BY orders.orderdate DESC;"
				Else 'two dates
					dscustord.SelectParameters.Clear()
					dscustord.SelectParameters.Add("@status", status)
                    cmdtext = "SELECT cust.fname, cust.lname, cust.EmailAddress, cust.CompanyName, orders.orderid, orders.customerid, orders.orderdate, orders.total, orders.paytype, orders.orderstatus, " _
                     & "orders.authdate, cust.custid, orders.autherr, payment.authcode, payment.ccnum, payment.transid FROM cust INNER JOIN orders ON cust.custid = orders.customerid " _
                     & "LEFT JOIN payment ON orders.orderid = payment.orderid WHERE(orders.orderstatus=@status and date(orders.orderdate) between " & TransFormDate(CDate(firstdate)) & "and" & TransFormDate(CDate(seconddate)) & ") ORDER BY orders.orderdate DESC;"

				End If
		End Select

		dscustord.SelectCommand = cmdtext
		ViewState.Add("cmdtext", cmdtext)
	End Sub
	Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
		Dim exval As String = ddlexport.SelectedValue
		Dim cmdtext As String

		dscustord.SelectParameters.Clear()
		dscustord.SelectParameters.Add("@imported", exval)
		cmdtext = "SELECT cust.fname, cust.lname, cust.EmailAddress, cust.CompanyName, orders.orderid, orders.customerid, orders.orderdate, orders.total, orders.paytype, orders.orderstatus, " _
					& "orders.authdate, cust.custid, orders.autherr, payment.authcode, payment.ccnum, payment.transid FROM cust INNER JOIN orders ON cust.custid = orders.customerid " _
					 & "LEFT JOIN payment ON orders.orderid = payment.orderid WHERE(imported=@imported) ORDER BY orders.orderdate DESC;"
		dscustord.SelectCommand = cmdtext
		ViewState.Add("cmdtext", cmdtext)
	End Sub
    Private Function TransFormDate(tdate As Date) As String
        'Dim year As String = tdatetime.Year.ToString
        'Dim month As String = tdatetime.Month.ToString
        'Dim day As String = tdatetime.Day
        Dim Transformeddate As String = "'" & tdate.Year.ToString & "/" & tdate.Month.ToString & "/" & tdate.Day & "'"

        'm.MySQLDateTimeTransForm="'"+allt(str(year(tDateTime))) + '/' + padl(allt(str(month(tDateTime))),2,'0') + '/' + padl(allt(str(day(tDateTime))),2,'0') +"'"

        Return Transformeddate
    End Function

    Protected Sub dscustord_Selected(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles dscustord.Selected
        lblreccount.Text = e.AffectedRows.ToString & " Records Selected"

    End Sub

    Protected Sub MsgBox1_ButtonClick(sender As Object, e As System.Web.UI.WebControls.CommandEventArgs) Handles MsgBox1.ButtonClick
        Select Case e.CommandName
            Case "yescapture"
                Me.Capture()
            Case "yesrefund"
                Me.Refund()
            Case "yesvoid"
                Me.Void()
            Case Else
				'Dim row As GridViewRow = Session("currow")
				'Session.Remove("currow")
				'Dim dropdownlist1 As DropDownList = row.FindControl("DropDownList1")
				'If Not IsNothing(dropdownlist1) Then
				'dropdownlist1.SelectedValue = "PROCESSING"
				GridView1.DataBind()
				'End If
		End Select
    End Sub



    Protected Sub lborderid_Click(sender As Object, e As System.EventArgs)
        Dim lborderid As LinkButton = sender

        Response.Redirect("~/secure/OrderSearch.aspx?orderid=" & lborderid.Text)

    End Sub
	Private Sub LoadLic()
		EO.Web.Runtime.AddLicense( _
		 "b/8goVnt6QMe6KjlwbPcsGenprHavUaBpLHLn1mXpLHn4J3bpAUk7560puQX" + _
		 "6J3c0fYZ9FuX+vYd8qLm8s7NsGqltLPLrneEjrHLn1mXpLHLu5rb6LEf+Knc" + _
		 "wbP/4JvK+AMU71uX+vYd8qLm8s7NsGqltLPLrneEjrHLn1mXpLHLu5rb6LEf" + _
		 "+KncwbP/8Z7c2voQ9luX+vYd8qLm8s7NsGqltLPLrneEjrHLn1mXpLHLu5rb" + _
		 "6LEf+KncwbP49KXr7eEM5p6ZpAcQ8azg8//ooWqossHNn2i1kZvLn1mXpLHL" + _
		 "n3XY6PXL87Ln6c7Nwprj6f8P4KuZpAcQ8azg8//ooWqossHNn2i1kZvLn1mX" + _
		 "pLHLn3XY6PXL87Ln6c7Nwprj8PMM4qSZpAcQ8azg8//ooWqossHNn2i1kZvL" + _
		 "n1mXpLHLn3XY6PXL87Ln6c7NwIO43OYb66jY6PYdoVnt6QMe6KjlwbPcsGen" + _
		 "prHavUaBpLHLn1mXpLHn4J3bpAUk7560ptUU4KXm67PL9Z7p9/oa7XaZtcLZ" + _
		 "r1uXs8+4iVmXpLHLn1mXwPIP41nr/QEQvFvK9P0U863c9rPL9Z7p9/oa7XaZ" + _
		 "tcLZr1uXs8+4iVmXpLHLn1mXwPIP41nr/QEQvFvE5QQW5J286PofoVnt6QMe" + _
		 "6KjlwbPcsGenprHavUaBpLHLn1mXpLHn4J3bpAUk7560ptgd6J2ZpAcQ8azg" + _
		 "8//ooWqossHNn2i1kZvLn1mXpLHLn3XY6PXL87Ln6c7Nwqjj8wP76Jzi6QPN" + _
		 "n6/c9gQU7qe0psLcrWmZpMDpjEOXpLHLn1mXpM0M452X+Aob5HaZ1wEQ66W6" + _
		 "7PYO6p7pprEh5Kvq7QAZvFuotb/boVmmwp61n1mXpLHLn1mz5fUPn63w9Pbo" + _
		 "oX7b7QUa8VuX+vYd8qLm8s7NsGqltLPLrneEjrHLn1mXpLHLu5rb6LEf+Knc" + _
		 "wbP07Jre6esa7qaZpAcQ8azg8//ooWqossHNn2i1kZvLn1mXpLHLn3XY6PXL" + _
		 "87Ln6c7Nw6ju8v0a4J3c9rPL9Z7p9/oa7XaZtcLZr1uXs8+4iVmXpLHLn1mX" + _
		 "wPIP41nr/QEQvFu98AAM857pprEh5Kvq7QAZvFuotb/boVmmwp61n1mXpLHL" + _
		 "n1mz5fUPn63w9PbooYzj7fUQoVnt6QMe6KjlwbPcsGenprHavUaBpLHLn1mX" + _
		 "pLHn4J3bpAUk7560ptcX+Kjs+LPL9Z7p9/oa7XaZtcLZr1uXs8+4iVmXpLHL" + _
		 "n1mXwPIP41nr/QEQvFu86Pof4Jvj6d0M4Z7jprEh5Kvq7QAZvFuotb/boVmm" + _
		 "wp61n1mXpLHLn1mz5fUPn63w9PbooYXg9wXt7rGZpAcQ8azg8//ooWqossHN" + _
		 "n2i1kZvLn1mXpLHLn3XY6PXL87Ln6c7Nwqjk5gDt7rGZpAcQ8azg8//ooWqo" + _
		 "ssHNn2i1kZvLn1mXpLHLn3XY6PXL87Ln6c7Nwprn+PQT4FuX+vYd8qLm8s7N" + _
		 "sGqltLPLrneEjrHLn1mXpLHLu5rb6LEf+KncwbP/7qjj2PoboVnt6QMe6Kjl" + _
		 "wbPcsGenprHavUaBpLHLn1mXpLHn4J3bpAUk7560puMM86Ll67PL9Z7p9/oa" + _
		 "7XaZtcLZr1uXs8+4iVmXpLHLn1mXwPIP41nr/QEQvFvK8PoP5KuZpAcQ8azg" + _
		 "8//ooWqossHNn2i1kZvLn1mXwMAM66Xm+8+4iVmXpLHn7qvb6QP07Z/mpPUM" + _
		 "8560psPasXCmtsHcsluX+vYd8qLm8s7NsGmZpMDpjEOXpLHLu6zg6/8M867p" + _
		 "6c8a2HDs8bzi56PFt9wU12nQ0QAl4pvewc7nrqzg6/8M867p6c+4iXWm8PoO" + _
		 "5Kfq6c+4iXXj7fQQ7azcwp61n1mXpM0X6Jzc8gQQyJ21ucHfsW+vtMjgtnWm" + _
		 "8PoO5Kfq6doPvUaBpLHLn3Xj7fQQ7azc6c/nrqXg5/YZ8p7cwp61n1mXpM0M" + _
		 "66Xm+8+4iVmXpLHLn1mXwPIP41nr/QEQvFvE6Q==")
	End Sub
	
	
	
End Class
