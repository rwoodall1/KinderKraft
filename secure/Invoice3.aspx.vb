Imports Microsoft.VisualBasic
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Data
Imports System.Net.Mail
Imports System.Net
Imports MySql.Data.MySqlClient
Imports System.IO
Imports System.Activities.Statements
Imports AuthorizeNet
Imports System.Reflection

Partial Class Invoice3
    Inherits webformbase

   

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Page.Response.AppendHeader("Cache-Control", "no-store, no-cache, must-revalidate, post-check=0, pre-check=0")
        Page.MaintainScrollPositionOnPostBack = True
        LoadLic()
        hfcustid.Value = Request.QueryString("custid")
        Session.Add("mysqlinserted", False)
        If Not IsPostBack Then
            Dim SC As ShoppingCart 'if we got this far we know there is a session(shopping cart)
            Dim lt As LookUpTable
			
            If IsNothing(Session("ShoppingCart")) Then
                Session.Add("SessionError", "Your session has ended. Please return to main page to order products.")
                Dim a As String = Session("SessionError")
                Try
                    Response.Redirect("Error.aspx")
                Catch ex As Exception
                    Response.Redirect("Error.aspx")
                End Try

            Else 'may or may not be logged in
				SC = Session("ShoppingCart")
				cknoshp.Visible = SC.IsCs

				'not being use anymore
				'            If SC.expectedshipdate <> "" Then
				'                lblexpdate.Visible = True
				'                Label5.Visible = True
				'                lblexpdate.Text = SC.expectedshipdate
				'            Else
				'                lblexpdate.Visible = False
				'                Label5.Visible = False
				'End If

				If SC.International = True Then
					SC.shipmethod = "INTERNATIONAL"
				Else
					If SC.shipmethod = "INTERNATIONAL" Then
						SC.International = True
					End If
				End If
                lblpromocode.Text = SC.promocode
				lblmethod.Text = SC.shipmethod
                lt = Session("LookUp")
                Me.DoTotal()

                HFshpcode.Value = SC.ShipCode ' put after dototal so we are sure we have correct shipcode(dototal resets shipcode)
                bindgrid()
            End If
        Else 'ispostback
            If IsNothing(Session("ShoppingCart")) Then
                Session.Add("SessionError", "Your session has ended.  Please return to main page to order products.")
                Dim a As String = Session("SessionError")
                Try
                    Response.Redirect("Error.aspx")
                Catch ex As Exception
                    Response.Redirect("Error.aspx")
                End Try

            End If
        End If
    End Sub
    Protected Sub DoTotal()
        Dim SCa As ShoppingCart
        SCa = Session("ShoppingCart")
        Dim lt As LookUpTable
        lt = Session("LookUp")

		Dim taxrate As Decimal = SCa.taxrate 'rate set in invoice1
		Dim subtot As Decimal = SCa.GetItemTotal(SCa.orderdetail)
		lblsubtot.Text = "$" & subtot.ToString("N2")


        Dim amnt As String = lt.GetPromoDiscount(lblpromocode.Text, lblsubtot.Text)
       
        lbldiscount.Text = amnt
		
		If SCa.NoShipChg Then
			lblshipping.Text = "0.00"
		Else
			lblshipping.Text = "$" & lt.GetShipping(CDec(lblsubtot.Text), lblmethod.Text).ToString("N2")
		End If


		SCa.SetShipCode(CDec(lblsubtot.Text), lblmethod.Text)
		hftaxabletotal.Value = SCa.GetTaxableItemTotal(SCa.orderdetail, SCa.userzip, lblshipping.Text, SCa.taxexempt)  'we add because this value is a negative

        If hftaxabletotal.Value > 0 Then

            hftaxabletotal.Value = hftaxabletotal.Value + CDec(lbldiscount.Text)

        End If



        lbltax.Text = "$" & Math.Round(hftaxabletotal.Value * taxrate, 2).ToString("N2")
		Dim finalamt As Decimal = CDec(lblsubtot.Text) + CDec(lbldiscount.Text) + CDec(lblshipping.Text) + CDec(lbltax.Text)
        x_amount11.Text = "$" & finalamt.ToString("N2")
        x_amount.Value = finalamt

    End Sub
	Private Sub UpdateAfterSubmit()
		Dim updateconnection As New MySqlConnection(Dsmisc.ConnectionString)
		Dim commandtext As String
		Dim orderid As String = Session("orderid")
		'________________________________________
		updateconnection.Open()
		Dim updatecmd As MySqlCommand = updateconnection.CreateCommand()


        commandtext = "UPDATE orders SET onhold=@onhold,orderstatus=@orderstatus,authdate=curdate(),paymentcompleted = @paymentcompleted,paytype = @paytype WHERE (orderid = @orderid)"
		updatecmd.Parameters.Clear()
        updatecmd.Parameters.AddWithValue("@paymentcompleted", 1)
		updatecmd.Parameters.AddWithValue("@orderid", Session("orderid"))
        updatecmd.Parameters.AddWithValue("@orderstatus", "CAPTURE")
		updatecmd.Parameters.AddWithValue("@onhold", "0")

		updatecmd.Parameters.AddWithValue("@paytype", ddlpaytype.SelectedValue)

		updatecmd.CommandText = commandtext

		Try
			updatecmd.ExecuteNonQuery()


			updateconnection.Close()
		Catch ex As Exception


			'connection1.Open()' should already be open
			updatecmd.CommandText = commandtext
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
			'emailto = "kinderkraftcs@jostens.com"
			emailto = "randy@woodalldevelopment.com"

			'Set the properties


			objMM.To.Add(emailto)
			objMM.Bcc.Add("randy@woodalldevelopment.com")
			objMM.From = New MailAddress(ConfigurationManager.AppSettings("FromAddr"), ConfigurationManager.AppSettings("FromName"))

			'Send the email in text format
			objMM.IsBodyHtml = True

			'Set the subject
            objMM.Subject = "Authnet transaction update error! (UpdateAfterSubmit())"
            Dim vbody As String = "There was an error updating the order with the following Authorize.net information:</br>" _
                   & "Order id:" & orderid & "," & "Transaction Id:" & Session("authtransid") _
                   & "," & "Authorization Code:" & Session("authcode") & "," _
                   & "Credit Card Number:" & Session("cardnum") & "," & "Pay Type:" & Session("paytype")
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
			Finally

			End Try
		End Try

	End Sub
	Private Function InsertOrder(cmd As MySqlCommand, paytype1 As String) As Boolean
		Dim retval As Boolean = False
		Dim orderid As Integer
		Dim vonhold As Boolean
		Dim email As String = DetailsView1.Rows(11).Cells(1).Text
		If paytype1 <> "PO" Then
			If chkonhold.Checked = True Then
				paytype1 = "HOLD"
			End If
		End If
		'begin insert orders______________________________________________________________________________________________________________________________________

        Dim commandtext As String = "INSERT INTO orders(orderdate,customerid, scompanyname, sfname, slname, saddr, sadd2, scity, sstate, szip,scountry, sphone" _
          & ",ordernotes,subtot,shipmethod,shpchrg,tax,total,promocode,discountamt,ponumber,orderstatus,international,semailaddress,onhold,shpcode,noshp) VALUES (NOW(),@customerid,@companyname,@sfname,@slname,@saddr,@sadd2,@scity,@sstate,@szip,@scountry,@sphone," _
          & "@ordernotes,@subtot,@shipmethod,@shpchrg,@tax,@total,@promocode,@discountamt,@ponumber,@orderstatus,@international,@semailaddress,@onhold,@shpcode,@noshp);"
		cmd.CommandText = commandtext
		' order parameters this is copied from the cust table copy of shipping info that was set in step 2
        If DetailsView2.CurrentMode = DetailsViewMode.ReadOnly Then

            Dim scompany As String = IIf(DetailsView2.Rows(0).Cells(1).Text.ToUpper = "&NBSP;", "", DetailsView2.Rows(0).Cells(1).Text.ToUpper)
            Dim sfname As String = DetailsView2.Rows(1).Cells(1).Text.ToUpper
            Dim slname As String = DetailsView2.Rows(2).Cells(1).Text.ToUpper
            Dim saddr1 As String = DetailsView2.Rows(3).Cells(1).Text
            Dim saddr2 As String = IIf(DetailsView2.Rows(4).Cells(1).Text = "&nbsp;", "", DetailsView2.Rows(4).Cells(1).Text)
            Dim scity As String = DetailsView2.Rows(5).Cells(1).Text.ToUpper
            'Dim intercheckbox As CheckBox = DirectCast(DetailsView2.FindControl("chksinternational"), CheckBox)
            Dim sinternational As Boolean
            If DirectCast(DetailsView2.Rows(6).Cells(1).Controls(0), CheckBox).Checked Then
                sinternational = True
            Else
                sinternational = False
            End If
            Dim sstate As String = IIf(DetailsView2.Rows(7).Cells(1).Text.ToUpper = "&NBSP;", "", DetailsView2.Rows(7).Cells(1).Text.ToUpper)
            Dim scountry As String = DetailsView2.Rows(8).Cells(1).Text.Trim.ToUpper

            Dim spostalcode As String = IIf(DetailsView2.Rows(9).Cells(1).Text = "&nbsp;", "", DetailsView2.Rows(9).Cells(1).Text)
            Dim sphone As String = IIf(Trim(DetailsView2.Rows(10).Cells(1).Text) = "&nbsp;", "", DetailsView2.Rows(10).Cells(1).Text)
            Dim shpcode As String = HFshpcode.Value

            cmd.Parameters.AddWithValue("@customerid", hfcustid.Value) 'set at load
            cmd.Parameters.AddWithValue("@companyname", scompany)
            cmd.Parameters.AddWithValue("@sfname", sfname)
            cmd.Parameters.AddWithValue("@slname", slname)
            cmd.Parameters.AddWithValue("@saddr", saddr1)
            cmd.Parameters.AddWithValue("@sadd2", saddr2)
            cmd.Parameters.AddWithValue("@scity", scity)
            cmd.Parameters.AddWithValue("@sstate", sstate)
            cmd.Parameters.AddWithValue("@szip", spostalcode)
            cmd.Parameters.AddWithValue("@scountry", scountry)
            cmd.Parameters.AddWithValue("@sphone", sphone)
            cmd.Parameters.AddWithValue("@semailaddress", email)
            cmd.Parameters.AddWithValue("@international", sinternational)
            cmd.Parameters.AddWithValue("@shpcode", shpcode)
            cmd.Parameters.AddWithValue("@noshp", cknoshp.Checked)
            If chkonhold.Checked = True Then
                vonhold = True
            Else
                vonhold = False
            End If
            cmd.Parameters.AddWithValue("@onhold", vonhold)
            Try
                cmd.Parameters.AddWithValue("@expdeliverdate", CDate(""))
            Catch ex As Exception

            End Try
        End If
		Dim txtponumber As TextBox = Me.pnlPO.FindControl("txtpo")
		Dim ponumber As String = ""
		Try	'if ponumber panel  not visible/used then will bomb
			ponumber = txtponumber.Text
		Catch ex As Exception

		End Try
		'rest of order parameters
		cmd.Parameters.AddWithValue("@ordernotes", ordnotes.Text)
		cmd.Parameters.AddWithValue("@subtot", CDec(lblsubtot.Text))
		Dim shipmeth As String
		If lblmethod.Text = "AK/HI" Then
            shipmeth = "AK/HI"
		ElseIf lblmethod.Text = "INTERNATIONAL" Then
            shipmeth = "INTERNATIONAL"
		Else
			shipmeth = lblmethod.Text
		End If
		cmd.Parameters.AddWithValue("@shipmethod", shipmeth)
		cmd.Parameters.AddWithValue("@shpchrg", CDec(lblshipping.Text))
		cmd.Parameters.AddWithValue("@tax", CDec(lbltax.Text))
		cmd.Parameters.AddWithValue("@total", CDec(x_amount11.Text))
		cmd.Parameters.AddWithValue("@promocode", lblpromocode.Text.ToUpper)
		cmd.Parameters.AddWithValue("@discountamt", CDec(lbldiscount.Text))
		cmd.Parameters.AddWithValue("@ponumber", ponumber)

		Select Case paytype1
			Case "CC"
				cmd.Parameters.AddWithValue("@orderstatus", "CAPTURE")
			Case "PO"
				cmd.Parameters.AddWithValue("@orderstatus", "CAPTURE")
			Case "EC"
				cmd.Parameters.AddWithValue("@orderstatus", "CAPTURE")
		End Select

		'insert into orders

		Try
			cmd.ExecuteNonQuery()
			commandtext = "Select Last_Insert_ID()"
			cmd.CommandText = commandtext
			orderid = CInt(cmd.ExecuteScalar())
            Session.Add("orderid", orderid)

            ChangeBannerName(orderid) 'changes temporary file name to orderid as a name
			retval = True
		Catch ex As Exception 'orders failed
			retval = False
			cmd.Transaction.Rollback()
			cmd.Connection.Close()
			ClearSession()
			Session.Add("SessionError", "The following error occured:" & ex.Message)
			Session.Add("errexception", ex)
			Response.Redirect("~/Error.aspx")
		End Try

		Return retval


	End Function
	Private Function InsertDetails(cmd As MySqlCommand, SC As ShoppingCart) As Boolean
		Dim dr As DataRow
		Dim retval As Boolean = False
		Dim scorderdetail As Integer
		Dim commandtext As String
		Dim detailid As Integer
		Dim orderid As Integer = Session("orderid")
		Dim rcorddetail As Integer = SC.orderdetail.Rows.Count - 1
		If SC.orderdetail.Rows.Count > 0 Then
			Try
				For i = 0 To rcorddetail
					dr = SC.orderdetail.Rows(i)
					If dr.RowState <> DataRowState.Deleted Then
						' orderid value set in order insert
						Dim productcode As String = dr("PRODuctCODE")
						scorderdetail = dr("detailid")
						Dim productname As String = dr("productname")
						Dim quantity As Integer = dr("Quantity")
						Dim prodprice As Decimal = dr("ProdPrice")
						Dim totalprice As Decimal = dr("totalprice")
						Dim pkgid As String = dr("pkgid") 'pkgid
						Dim opdescdetail As String = dr("OpDesc")
						' Execute the second command in the second database.
						commandtext = "Insert into orderdetail (orderid,productcode,productname,quantity,prodprice,totalprice,pkgid,opdesc) values(" & orderid & "," & Chr(34) & productcode & Chr(34) & "," & Chr(34) & productname & Chr(34) & "," _
						 & quantity & "," & prodprice & "," & totalprice & "," & Chr(34) & pkgid & Chr(34) & "," & Chr(34) & opdescdetail & Chr(34) & ");"
						cmd.CommandText = commandtext
						cmd.ExecuteNonQuery()
						commandtext = "Select Last_Insert_ID()"
						cmd.CommandText = commandtext
						detailid = CInt(cmd.ExecuteScalar())


						' now add options for the detail record___________________________________________________________________________________________________________
						Dim ordoptioncnt As Integer = SC.OrderOptions.Rows.Count - 1
						For z = 0 To ordoptioncnt
							dr = SC.OrderOptions.Rows(z)
							If dr.RowState <> DataRowState.Deleted Then
								'orderid value set in order insert
								Dim scdetailid1 = dr("detailid")
								Dim opid As Integer = dr("opid")
								Dim opdesc As String = Trim(dr("opdesc"))
								Dim pkgid1 As String = Trim(dr("pkgid"))
								commandtext = "Insert into orderoptions (orderid,detailid,opid,opdesc,pkgid) values(" & orderid & "," & detailid & "," & opid & "," _
								 & Chr(34) & opdesc & Chr(34) & "," & Chr(34) & pkgid1 & Chr(34) & ");"
								cmd.CommandText = commandtext
								If scdetailid1 = scorderdetail Then	'makes sure mysql detail id is inserted in correct options record

									cmd.ExecuteNonQuery()


								End If
							End If
						Next
					End If
				Next
				retval = True
			Catch ex As Exception
				retval = False
				cmd.Transaction.Rollback()
				cmd.Connection.Close()
				ClearSession()
				Session.Add("SessionError", "The following error occured:" & ex.Message)
				Session.Add("errexception", ex)
				Response.Redirect("~/Error.aspx")
			End Try
		End If
		Return retval
	End Function
    Private Sub UpdateOrder(ByVal paytype1 As String)
        Dim cardinfogood As Boolean = CheckCardInfo()

        If cardinfogood = False Then
            MsgBox1.Show("Information Missing", "Please check that the expiration date,amount,credit card number and security code are entered. Please re-enter the information if this message keeps appearing.", Nothing, New EO.Web.MsgBoxButton("OK"))
            Return
        End If
        Dim SC As ShoppingCart = Session("ShoppingCart")
        Dim LT As LookUpTable = Session("LookUp")
        Dim submitfailed As Boolean = False
        gv1.DataSource = SC.orderdetail
        Dim connection1 As New MySqlConnection(Dsmisc.ConnectionString)
		Dim orderid As Integer
		Dim vonhold As Boolean = False
		Dim billed As Boolean = False
        Dim dataupdated As Boolean = False
		Dim email As String = DetailsView1.Rows(11).Cells(1).Text
		Dim OrderInserted As Boolean = False
		Dim DetailsInserted As Boolean = False
		Dim rcorddetail As Integer = SC.orderdetail.Rows.Count - 1
		If rcorddetail > -1 Then
			connection1.Open()
			Dim trans As MySqlTransaction = connection1.BeginTransaction()
			Dim cmd As MySqlCommand = connection1.CreateCommand()
			If Session("mysqlinserted") = False Then
				cmd.Transaction = trans
				OrderInserted = InsertOrder(cmd, paytype1)
				If OrderInserted = True Then
					DetailsInserted = InsertDetails(cmd, SC)
				End If

				'Make authnet payment___________________________________________________________________________________________________________________________
				If DetailsInserted = True Then
					billed = Submitbill(SC.custid, paytype1, orderid, SC.useremail)
					If billed = True Then
						submitfailed = False
						If paytype1 <> "PO" Then 'don't make a payment will be made in process payment screen
							InsertPayment()
						End If
						cmd.Transaction.Commit()
						Session("mysqlinserted") = True
						cmd.Connection.Close()	 'close this connection and use a new connecton for updates
						Session.Add("pagesubmitted", True)
						x_invoice_num.Value = orderid
						UpdateAfterSubmit()

					Else 'submission failed
						submitfailed = True
						If Session("tried") < 3 Then 'try again
							trans.Rollback()
						Else 'rollback
							submitfailed = False 'set to false to initiate last try
							Try
								trans.Rollback()
							Catch ex As Exception

							End Try

							'take user somewhere

						End If


					End If 'end if billed

				End If 'end if detailsinserted =true

			End If 'mysql insert is true or false
		Else ' no record details leave
			'	trans.Rollback()
			'	Dim errmsg As String = "There was an error updating your order. Please make sure you have items in your cart and try again."
			'	MsgBox1.Show("Order Error", errmsg, Nothing, New EO.Web.MsgBoxButton("Ok", "", "ok2"))
			'	Return

		End If 'detailrecs less than 0

		Dim cid As String = SC.custid.ToString
		Session.Add("cid", cid)
		If submitfailed = True Then
			Dim errmsg As String = "Your payment was not submitted because of the following error: " & "'" & Session("paymenterror") & "' " _
			   & "Do you wish to try submitting again?"
			MsgBox1.Show("Payment Submission Error", errmsg, Nothing, New EO.Web.MsgBoxButton("Yes", "", "yessubmit"), New EO.Web.MsgBoxButton("No", "", "nosubmit"))
		Else 'submitfailed is false
			If billed = False Then
				Dim errmsg As String = "Your payment was not submitted because of the following error: " & "'" & Session("paymenterror") & "' " _
				 & "This was your last try to submit payment. Please contact Jostens Kinderkraft support at 855-826-2355 for assistance"
				MsgBox1.Show("Payment Submission Error", errmsg, Nothing, New EO.Web.MsgBoxButton("OK", Nothing, "okerror"))


			Else  'submit is false and billed is true order and payment went through got to receipt page
				If SC.PersDiploma = True Then
					PersNotify()
				End If
				Dim newpage As String = "~/Receipt.aspx?customerid=" & cid & "&orderid=" & Session("orderid")
				ClearSession()
				Response.Redirect(newpage)
			End If

		End If


	End Sub
	Protected Sub PersNotify()

		'Now, send the email
		'Create an instance of the MailMessage class
		Dim objMM As New MailMessage()
		Dim tomail As String = ""
		Dim smtpclient As String = ""
		Dim cpassword As String = ""
		Dim cuser As String = ""
		If Directory.Exists("F:\IsDev") Then 'set dev settings
			'smtpclient = "cmain1.wdfm.net" '"mail.woodalldevelopment.com"
			'cuser = "rwoodall@wdfm.net"
			'cpassword = "Briggitte1"
			tomail = "randy@woodalldevelopment.com"
		Else 'live
			'SmtpClient = "192.168.1.245"
			'cuser = "authnet@memorybook.com"
			'cpassword = "authnet"
			'Dim email As String = DetailsView1.Rows(10).Cells(1).Text

			tomail = ConfigurationManager.AppSettings("FromAddr")


		End If

		smtpclient = ConfigurationManager.AppSettings("smtpserver")
		cuser = ConfigurationManager.AppSettings("smtpuser")
		cpassword = ConfigurationManager.AppSettings("smtppassword")
		'Set the properties
		objMM.From = New MailAddress(ConfigurationManager.AppSettings("FromAddr"), ConfigurationManager.AppSettings("FromName"))

		objMM.To.Add(tomail) 'customer address
		'Send the email in text format
		objMM.IsBodyHtml = True

		'Set the subject
		objMM.Subject = "Jostens Kinderkraft Diploma Persoalization Notification Order Id " & Session("orderid")

		objMM.Body = "An order for personalized diplomas was made. Order Id " & Session("orderid")

		Dim smtp As New SmtpClient(smtpclient)
		smtp.Credentials = New NetworkCredential(ConfigurationManager.AppSettings("smtpuser"), ConfigurationManager.AppSettings("smtppassword"))

		Try
			'smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some servers
			smtp.Send(objMM)

		Catch ex As Exception
			Try	'if this fail due to no connection go on.
				Dim objMM1 As New MailMessage
				smtpclient = ConfigurationManager.AppSettings("smtpserver")
				cuser = cuser = ConfigurationManager.AppSettings("smtpuser")
				cpassword = cpassword = ConfigurationManager.AppSettings("smtppassword")
				objMM1.From = New MailAddress(ConfigurationManager.AppSettings("FromAddr"), ConfigurationManager.AppSettings("FromName"))
				objMM1.To.Add("randy@woodalldevelopment.com")
				objMM1.Subject = "Jostens Kinderkraft Order Email Error"
				objMM1.IsBodyHtml = True
				objMM1.Body = "Jostens Cs did not receive a confirmation email because of the following error:" & ex.Message
				smtp.Send(objMM1)
			Catch ex1 As Exception

			End Try

		Finally

		End Try



	End Sub
	Private Function InsertPayment() As Boolean
		Dim retval As Boolean = False
		Dim commandtext As String
		Dim insertconnection As New MySqlConnection(Dsmisc.ConnectionString)
		Dim cmd As MySqlCommand = insertconnection.CreateCommand()
        commandtext = "insert into payment( orderid,paydate,authorizedamt,paytype,transid,authcode,ccnum,amount) values(@orderid,now(),@authorizedamt,@paytype,@authnettranid,@authcode,@ccnum,@amount);"
		cmd.Parameters.Clear()
        cmd.Parameters.AddWithValue("@authorizedamt", Session("payment"))
        cmd.Parameters.AddWithValue("@amount", Session("payment"))
		cmd.Parameters.AddWithValue("@authnettranid", Session("authtransid"))
		cmd.Parameters.AddWithValue("@authcode", Session("authcode"))
		cmd.Parameters.AddWithValue("@ccnum", Session("cardnum"))
		cmd.Parameters.AddWithValue("@orderid", Session("orderid"))
		cmd.Parameters.AddWithValue("@paytype", ddlpaytype.SelectedValue)
		cmd.CommandText = commandtext

		Try
			insertconnection.Open()
			cmd.ExecuteNonQuery()
			retval = True
		Catch ex As Exception
			retval = False
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
				Dim handler As New XC.Web.ErrorHandler(ex1)

				'' if you wish you can change the settings by now
				'' handler.EmailSettings.To = "me@domain.com";
				Dim sessionlist(1) As Object
				sessionlist(0) = Nothing
				If Not IsNothing(Session("ShoppingCart")) Then
					sessionlist(1) = Session("ShoppingCart")
				End If

				handler.HandleException(sessionlist)
			Finally

			End Try

		Finally
			insertconnection.Close()
		End Try

		Return retval




	End Function
    Private Function OpenGateway() As IGateway
        ' we used the form builder so we can now just load it up
        'using the form reader
        Dim login As String = ConfigurationManager.AppSettings("ApiLogin")
        Dim transactionKey As String = ConfigurationManager.AppSettings("TransactionKey")
        Dim gate1 As New Gateway(login, transactionKey, ConfigurationManager.AppSettings("GatewayTest")) 'set true for testing
        Return gate1

    End Function
    Private Function Submitbill(ByVal custid As Integer, ByVal paytype As String, orderid As String, email As String) As Boolean
        Dim retval As Boolean = False
        Select Case paytype
            Case "CC"

                If Not IsNothing(Session.Item("ShoppingCart")) Then
                    ' pull from the store
                    Dim gate As Object = OpenGateway()
					Dim expdate As String = ddlmonth.SelectedValue & "/" & ddlyear.SelectedValue ' x_exp_date.Value
					'  build the request from the Form post

                    'Dim apiRequest As Object = New AuthorizationRequest(x_card_num.Text, x_exp_date.Value, CDec(x_amount.Text), "", True).AddCardCode(x_card_code.Text).AddCustomer(custid.ToString, x_first_name.Text, x_last_name.Text, "", "", "")

                    'The below does not work with master forms or formviews use above
					Dim apiRequest As Object = CheckoutFormReaders.BuildAuthAndCaptureFromPost().AddInvoice(orderid).AddCustomer(custid, x_first_name.Text, x_last_name.Text, "", "", "")
					apiRequest.email = email
                    apiRequest.expdate = expdate
                    apiRequest.InvoiceNum = orderid
                    Dim cardno As String = apiRequest.CardNum.ToString
                    ' set the amount - you can also set this from the page itself

                    '  send to Auth.NET
                    Dim response__1 As Object = gate.Send(apiRequest)
                    ' We must get the whole response to get CC company, the respons only hold a certain number of properties. The CC company is not
                    ' one of them. We could sub class the response and add the CC company propery but I didn't want to do this for one field.
                    Dim BaseGatewayResponse As AuthorizeNet.GatewayResponse
                    BaseGatewayResponse = response__1
                    Dim CardComp As String = ddlcardtype.SelectedValue 'does not work in liveBaseGatewayResponse.CardType

                    Dim lgth As Integer = x_card_num.Text.Length
                    Dim startpos As Integer = lgth - 4
                    If startpos < 0 Then
                        startpos = 0
                    End If
                    Dim cardnum As String = x_card_num.Text.Substring(startpos) '(this returns a wrong number when live)BaseGatewayResponse.CardNumber.Remove(0, 4) 'take x's out of number
                    Session.Add("cardnum", cardnum)
                    Session.Add("payment", response__1.Amount)
                    retval = response__1.Approved
                    'Session.Add("paytype", CardComp)
                    Session.Add("paytype", response__1.CardType)
                    Session.Add("authtransid", response__1.TransactionID)
                    Session.Add("authcode", response__1.AuthorizationCode)
                    If response__1.Approved Then


                        'below is not used but I kept it in for possible future use
                        'Session.Add("ordermessage", String.Format("Thank you! Payment has been submitted for the amount of {0}", response__1.Amount) _
                        '& "<br /> Transaction ID: " & response__1.AuthorizationCode & "/" & response__1.TransactionID & "<br />" & CardComp & ":" & response__1.CardNumber)

                    Else

                        If IsNothing(Session("tried")) Then
                            Session.Add("tried", 1)
                        Else
                            Session("tried") = Session("tried") + 1
                        End If
                        Session.Add("paymenterror", response__1.Message)
                        retval = False
                    End If

                Else 'session empty
                    Session.Add("paymenterror", "Your session has timed out. Please close your browser and then go back to the login page and log back in.")
                End If 'session empty

            Case "EC"

                If Not IsNothing(Session.Item("ShoppingCart")) Then
                    If Page.IsValid Then
                        'pull from the store
                        Dim gate As Object = OpenGateway()

                        'build the request from the Form post
                        Dim apiRequest As Object = CheckoutFormReaders.BuildAuthAndCaptureFromPost()


                        'set the amount - you can also set this from the page itself
                        'you have to have a field named "x_amount"
                        'apiRequest.Queue(ApiFields.Amount, order.Price.ToString())

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
                            Session.Add("authtransid", response__1.TransactionID & "EC")
                            retval = True
                            'below is not used but I kept it in for possible future use
                            'Session.Add("ordermessage", String.Format("Thank you! Payment has been submitted for the amount of {0}", response__1.Amount) _
                            '& "<br /> Transaction ID: " & response__1.AuthorizationCode & "/" & response__1.TransactionID & "<br />" & CardComp & ":" & response__1.CardNumber)

                        Else

                            Session.Add("paymenterror", "Payment was not submitted because of the following error:<br/>" & response__1.Message & "<br/> You may hit the back button and try again.")
                            retval = False
                        End If

                    Else 'session empty
                        Session.Add("paymenterror", "Your session has timed out. Please close your browser and then go back to the login page and log back in.")
                        retval = False
                    End If 'session empty
                End If
            Case "PO"
                Session.Add("paytype", "PO")
                retval = True
            Case "HOLD"
                Session.Add("paytype", "HOLD")
                retval = True

        End Select

        Return retval
    End Function
    Private Sub ClearSession()
        Session.Remove("orderid")
        Session.Remove("mysqlinserted")
        Session.Remove("cid")
        Session.Remove("tried")
        Session.Remove("billed")
        Session.Remove("authtransid")
        Session.Remove("authcode")
        Session.Remove("paytype")
        Session.Remove("cardnum")
        Session.Remove("payment")

    End Sub
    Protected Sub bindgrid()
        Dim SC As ShoppingCart = Session("ShoppingCart")
        gv1.DataSource = SC.orderdetail
        gv1.DataBind()
    End Sub
	Protected Sub ddlshipmeth_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
		Me.DoTotal()
	End Sub

    Protected Sub ddlpaytype_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlpaytype.SelectedIndexChanged

        Select Case ddlpaytype.SelectedValue
            Case "Credit Card"
                pnlCC.Visible = True
                pnlEC.Visible = False
                pnlPO.Visible = False
                x_type.Value = "AUTH_CAPTURE"
            Case "E-Check"
                pnlCC.Visible = False
                pnlEC.Visible = True
                pnlPO.Visible = False
                x_type.Value = "AUTH_CAPTURE"
            Case "PO"
                pnlCC.Visible = False
                pnlEC.Visible = False
                pnlPO.Visible = True

            Case Else
                pnlCC.Visible = False
                pnlEC.Visible = False
                pnlPO.Visible = False
        End Select

    End Sub
    Protected Sub gv1_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles gv1.PageIndexChanging
        Dim SCa As ShoppingCart
        SCa = Session("ShoppingCart")
        gv1.PageIndex = e.NewPageIndex
        bindgrid()
    End Sub
    Protected Sub gv1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gv1.RowDataBound
		If e.Row.RowType = DataControlRowType.DataRow Then	'code to show first row when scrolling grid
			If e.Row.RowIndex = 0 Then
				e.Row.Style.Add("height", "60px")
				e.Row.VerticalAlign = VerticalAlign.Bottom
			End If
		End If
		'format grid
		If e.Row.RowType = DataControlRowType.DataRow Then
			Select Case e.Row.Cells(0).Text
				Case "Graduate Package", "Scholar Package", "Achiever Package", "Milestone Package", "Learner Package"
					e.Row.Font.Size = 11
					e.Row.Font.Bold = True
			End Select
			Select Case e.Row.Cells(3).Text
				Case "0"
					e.Row.Font.Italic = True
					e.Row.Font.Size = 9
			End Select
		End If
		'use if using individule row with button to display options
        Dim a As String = ""
        Try 'have to use try because I have paging enabled, creates rows with out cells and then bombs
            a = e.Row.Cells(3).Text
            If a = "0" Then

                e.Row.Cells(6).Enabled = False
            End If
        Catch ex As Exception

        End Try

        'use this for full time display of second grid
        If e.Row.RowType <> DataControlRowType.DataRow Then
            Return
        End If

        'use then for button selection

        Dim SCa As ShoppingCart
        SCa = Session("ShoppingCart")
        Dim lt As LookUpTable
        lt = Session("LookUp")

        Dim opd As GridView = e.Row.FindControl("opd")


        Dim DOrowView As DataRowView = CType(e.Row.DataItem, DataRowView)
        Dim vdetailid As Integer = DOrowView("detailid")
        Try
            Dim opdat As DataTable = SCa.OrderOptions.Select("detailid=" & vdetailid.ToString).CopyToDataTable
            'Dim qresults As DataTable = opdat.Select("detailid=" & vdetailid.ToString).CopyToDataTable
            opd.DataSource = opdat
            opd.DataBind()

        Catch ex As Exception

            opd.DataSource = Nothing
            opd.DataBind()
            Return
        End Try

    End Sub

    Protected Sub ddlmonth_SelectedIndexChanged1(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlmonth.SelectedIndexChanged
        Me.x_exp_date.Value = ddlmonth.SelectedValue & "/" & ddlyear.SelectedValue
    End Sub
    Protected Sub ddlyear_SelectedIndexChanged1(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlyear.SelectedIndexChanged
        Me.x_exp_date.Value = ddlmonth.SelectedValue & "/" & ddlyear.SelectedValue
    End Sub

    Protected Sub btnEC_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEC.Click

        Me.UpdateOrder("EC")
    End Sub

    Protected Sub btnPO_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPO.Click
		Me.UpdateOrder("PO")
    End Sub
    Protected Sub btnCC_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btncc.Click

        Me.UpdateOrder("CC")

    End Sub

    Protected Sub ddlpaytype_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlpaytype.Load
        'if customer is not a school then disable the po payment function
        Dim isorg As CheckBox = DetailsView1.FindControl("chkisorg")
        Dim sc As ShoppingCart
        sc = Session("ShoppingCart")
        If IsNothing(Session("ShoppingCart")) Then
            'no session go to login
            Response.Redirect("~/login.aspx")
       
        End If

        If sc.NewOrg = True Or isorg.Checked = "False" Then
            Dim i As ListItem = ddlpaytype.Items.FindByValue("PO")
            Try
                i.Attributes.Add("style", "color:gray;")
                i.Attributes.Add("disabled", "true")
                'i.Value = ""
            Catch ex As Exception 'already grayed out and disabled

            End Try


        End If
    End Sub

    Protected Sub MsgBox1_ButtonClick(sender As Object, e As System.Web.UI.WebControls.CommandEventArgs) Handles MsgBox1.ButtonClick
        If e.CommandName = "okcc" Then
            Dim newpage As String = "~/Receipt.aspx?customerid=" & Session("cid") & "&orderid=" & Session("orderid")
            ClearSession()
            Response.Redirect(newpage)
        End If
        If e.CommandName = "ok2" Then
           
            Response.Redirect("~/scart.aspx")
        End If
        If e.CommandName = "nosubmit" Then 'add method to roll back tranaction
			Dim newpage As String = "~/Info.aspx?customerid=" & Session("cid")
			ClearSession()
			Response.Redirect(newpage)
        End If
        If e.CommandName = "okerror" Then
			Dim newpage As String = "~/Info.aspx?customerid=" & Session("cid")
			ClearSession()
            Response.Redirect(newpage)

        End If

    End Sub

    Protected Sub Page_Unload(sender As Object, e As System.EventArgs) Handles Me.Unload
        
    End Sub
    Private Function CheckCardInfo() As Boolean
        Dim retval As Boolean = True
        If ddlpaytype.SelectedValue = "Credid Card" Then
            If x_exp_date.Value <> ddlmonth.SelectedValue & "/" & ddlyear.SelectedValue Then
                retval = False
                Return retval
            End If
            If x_amount.Value = Nothing Then
                retval = False
                Return retval
            End If
            If x_card_num.Text = Nothing Then
                retval = False
                Return retval
            End If
            If x_card_code.Text = Nothing Then
                retval = False
                Return retval
            End If
        End If
        Return retval
    End Function
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

	Protected Sub cknoshp_CheckedChanged(sender As Object, e As System.EventArgs) Handles cknoshp.CheckedChanged
		Dim sc As ShoppingCart = Session("ShoppingCart")
		sc.NoShipChg = cknoshp.Checked
		DoTotal()
    End Sub
    Private Sub ChangeBannerName(orderid As Integer)
        Dim sc As ShoppingCart = Session("ShoppingCart")
        Dim fileext As String = ""
        If IsNothing(sc) Then
            Return
        End If
        If sc.tmpBannerName = Nothing Then
            Return
        End If

        Dim filenames As String() = sc.tmpBannerName.Split(",")
        Dim thename As String
        Dim newname As String
        Dim icount As Integer = 0
        For Each thename In filenames
            icount = icount + 1
            If icount = 1 Then
                newname = orderid.ToString & thename.Substring(thename.IndexOf("~") + 1)
            Else
                fileext = thename.Substring(thename.IndexOf("."))
                newname = orderid.ToString & thename.Substring(thename.IndexOf("~") + 1, (thename.IndexOf(".") - 2) - thename.IndexOf("~") + 1) & "-" & icount.ToString & fileext
            End If
           
            Try

                My.Computer.FileSystem.RenameFile(ConfigurationManager.AppSettings("bannerunc").ToString() & thename, newname)

               
            Catch ex As Exception
             
                File.Delete(ConfigurationManager.AppSettings("bannerunc").ToString() & "\BannerImages\" & newname)
                File.Move(ConfigurationManager.AppSettings("bannerunc").ToString() & thename, ConfigurationManager.AppSettings("bannerunc").ToString() & "\BannerImages\" & newname)
            Finally
                'ftp = Nothing
            End Try
            'End If

        Next
        ''email cs that a banner order was made
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
        'emailto = "kinderkraftcs@jostens.com"
        emailto = ConfigurationManager.AppSettings("banneremail")
        'Set the properties

        objMM.To.Add(emailto)

        objMM.From = New MailAddress(ConfigurationManager.AppSettings("FromAddr"), ConfigurationManager.AppSettings("FromName"))

        'Send the email in text format
        objMM.IsBodyHtml = True

        'Set the subject
        objMM.Subject = "Banner Order (" & orderid.ToString & ")"
        Dim vbody As String = "An order for banners has been placed, check order id " & orderid.ToString & "."
        objMM.Body = vbody

        Dim smtp As New SmtpClient(ConfigurationManager.AppSettings("smtpserver"))
        smtp.Credentials = New NetworkCredential(ConfigurationManager.AppSettings("smtpuser"), ConfigurationManager.AppSettings("smtppassword"))
        Try
            'smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis 'only works on some servers
            smtp.Send(objMM)
        Catch ex1 As Exception
           

        End Try



    End Sub
  
End Class
