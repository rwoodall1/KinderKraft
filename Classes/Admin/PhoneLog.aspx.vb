Imports MySql.Data.MySqlClient
Partial Class PhoneLog
    Inherits System.Web.UI.Page


    Protected Sub dscust_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles dscust.Selecting

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim sc As ShoppingCart = Session("ShoppingCart")
        Dim custid As Integer = Request.QueryString("custid")
        Dim commandtext As String = " SELECT COUNT(*) FROM datecont where custid=" & custid & ";"
        Dim connection1 As New MySqlConnection(dscust.ConnectionString)
        Dim reccount As Integer = 0
        If Not IsNothing(custid) Then
            connection1.Open()
            Dim cmd As MySqlCommand = connection1.CreateCommand()
            cmd.CommandText = commandtext
            Try
                reccount = CInt(cmd.ExecuteScalar())
                If reccount < 1 Then
                    'insert a 1st time phone log record
                    commandtext = "INSERT INTO datecont(custid, datecont, reason, csperson)" _
                    & "VALUES (" & custid & ", now(),'New customer added.','" & sc.username & "');"
                    cmd.CommandText = commandtext
                    cmd.ExecuteNonQuery()
					'GridView1.ShowFooter = True
					GridView1.ShowHeader = True
                Else 'already has records just show footer
					'GridView1.ShowFooter = True
					GridView1.ShowHeader = True
                End If
            Catch ex As Exception

            Finally
                connection1.Close()
            End Try
        Else 'custid is not there

        End If
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs)

       
        '*** Get values from form
		Dim checkbox1 As CheckBox = DirectCast(GridView1.HeaderRow.FindControl("checkbox1"), CheckBox)
        Dim vcallstr As Boolean = checkbox1.Checked
        Dim f As String = vcallstr
        Dim vcall As String = IIf(f = "True", "1", "0")
        dsPhoneLog.InsertParameters.Add("@callcont", vcall)
		Dim textbox16 As TextBox = DirectCast(GridView1.HeaderRow.FindControl("textbox16"), TextBox)
        Dim vpriority As String = textbox16.Text
        dsPhoneLog.InsertParameters.Add("@priority", vpriority)

        'Dim textbox2 As TextBox = DirectCast(GridView1.FooterRow.FindControl("textbox2"), TextBox)
        'Dim vdatcont As String = textbox2.Text
        'Dim a As String = Date.Now.ToString
        'dsPhoneLog.InsertParameters.Add("@datecont", Date.Now.ToString)
		Dim textbox17 As TextBox = DirectCast(GridView1.HeaderRow.FindControl("textbox17"), TextBox)
        Dim vcsperson As String = textbox17.Text
        dsPhoneLog.InsertParameters.Add("@csperson", vcsperson)
		Dim textbox5 As TextBox = DirectCast(GridView1.HeaderRow.FindControl("textbox5"), TextBox)
        Dim vpercontact As String = textbox5.Text
        dsPhoneLog.InsertParameters.Add("@percontact", vpercontact)
		Dim textbox18 As TextBox = DirectCast(GridView1.HeaderRow.FindControl("textbox18"), TextBox)
        Dim vcaltime As String = textbox18.Text

        dsPhoneLog.InsertParameters.Add("@caltime", vcaltime)
		Dim textbox10 As TextBox = DirectCast(GridView1.HeaderRow.FindControl("textbox10"), TextBox)
        Dim vreason As String = textbox10.Text
        dsPhoneLog.InsertParameters.Add("@reason", vreason)
		Dim textbox15 As TextBox = DirectCast(GridView1.HeaderRow.FindControl("textbox15"), TextBox)
        Dim vtypecont As String = textbox15.Text
        dsPhoneLog.InsertParameters.Add("@typecont", vtypecont)
        Dim custid As Integer = DetailsView1.DataKey("custid")
        dsPhoneLog.InsertParameters.Add("@custid", custid)
        '*******************************************************************
        '**********************************************************
        dsPhoneLog.InsertCommand = "INSERT INTO datecont(custid, datecont, reason, csperson, typecont, nxtdays, ` nxdate`, callcont, caltime, priority, percontact)" _
            & "VALUES (@custid, now(), @reason, @csperson, @typecont, @nxtdays, @nxdate, @callcont, @caltime, @priority, @percontact)"

        dsPhoneLog.Insert()
		'GridView1.ShowFooter = False
		GridView1.ShowHeader = False
    End Sub

   
    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs)
		'GridView1.ShowFooter = False
		GridView1.ShowHeader = False
    End Sub

    Protected Sub dsPhoneLog_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles dsPhoneLog.Inserted
        Dim sc As ShoppingCart = Session("ShoppingCart")
        sc.DoPhonelog = False
    End Sub

    Protected Sub dsPhoneLog_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles dsPhoneLog.Updated
        Dim sc As ShoppingCart = Session("ShoppingCart")
        sc.DoPhonelog = False
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsNothing(Session("ShoppingCart")) Then
            Dim Sc As ShoppingCart = Session("ShoppingCart")
            Dim LinkButton1 As LinkButton = Me.FindControl("LinkButton1")
            If Sc.IsCs = True Then
                LinkButton1.Visible = Sc.IsCs
            Else
                If IsNothing(Session("IsCs")) Then
                    Sc.DoPhonelog = False
					Response.Redirect("../shopjostenshome.aspx")
                Else
                    'SC session is erased after order is place I save to session so must use that to see if button is hid
                    LinkButton1.Visible = Session("IsCs")
                    If LinkButton1.Visible = False Then
                        Sc.DoPhonelog = False
						Response.Redirect("../shopjostenshome.aspx")
                    End If
                End If

            End If
        Else 'no shopping cart session


        End If


    End Sub

   

    Private Sub SetUserName()
        Dim textbox17 As TextBox = GridView1.FooterRow.FindControl("Textbox17")
        Dim sc As ShoppingCart
        If Not IsNothing(Session("ShoppingCart")) Then
            sc = Session("ShoppingCart")
            textbox17.Text = sc.username
        End If
    End Sub

    Protected Sub TextBox17_PreRender(ByVal sender As Object, ByVal e As System.EventArgs)
        SetUserName()
    End Sub

	Protected Sub DetailsView1_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.DetailsViewPageEventArgs) Handles DetailsView1.PageIndexChanging

	End Sub
End Class
