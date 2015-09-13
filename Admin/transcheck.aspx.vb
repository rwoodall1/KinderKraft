Imports System.IO
Imports System.Data

Partial Class Admin_transcheck
    Inherits webformbase

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Dim filepath As String
        Dim i As Integer = 0
        Dim reccount As Integer = 0
        Dim goodtogo As Boolean = False
        Dim AuthOrders As System.Data.DataTable
        Dim AuthOrderDR As System.Data.DataRow
        AuthOrders = New System.Data.DataTable("AuthOrders")
        AuthOrders.Columns.Add("Authcode", GetType(String))
        AuthOrders.Columns.Add("TransactionId", GetType(String))
        AuthOrders.Columns.Add("CardNum", GetType(String))
        AuthOrders.Columns.Add("invoicenum", GetType(String))
        AuthOrders.Columns.Add("amount", GetType(String))
        AuthOrders.Columns.Add("status", GetType(String))
        AuthOrders.Columns.Add("fname", GetType(String))
        AuthOrders.Columns.Add("lname", GetType(String))
        AuthOrders.Columns.Add("email", GetType(String))
        If FileUpload1.HasFile Then
            Try
                Dim filename As String = Path.GetFileName(FileUpload1.FileName)
                FileUpload1.SaveAs(Server.MapPath("~/tmp/") & filename)
                filepath = Server.MapPath("~/tmp/") & filename
                goodtogo = True
            Catch ex As Exception

            End Try
        End If
        If goodtogo = True Then

            Dim anerror As Boolean = False
            Dim authcode As String = ""
            Dim transactionid As String = ""
            Dim cardnum As String = ""
            Dim invoicenum As String = ""
            Dim amount As String = ""
            Dim status As String = ""
            Dim fname As String = ""
            Dim lname As String = ""
            Dim email As String = ""
            Dim dvSql As New DataView

            Dim sr As IO.StreamReader = New StreamReader(filepath)
            Dim line, vals() As String
            

            Do While Not sr.EndOfStream
                Dim a As DateTime = Now()

                line = sr.ReadLine
                If i > 0 Then

                    If line Is Nothing Then
                        Exit Do
                    End If

                    Try
                        vals = line.Split(vbTab)
                        authcode = vals(1)
                        transactionid = vals(3)
                        cardnum = vals(5)
                        invoicenum = vals(39)
                        amount = vals(9)
                        status = vals(11)
                        fname = vals(13)
                        lname = vals(14)
                        email = vals(23)

                        Dim cmdtext As String = "Select * from orders where authnettranid =" & transactionid
                        dsorders.SelectCommand = cmdtext
                        Try
                            dvSql = CType(dsorders.Select(DataSourceSelectArguments.Empty), Data.DataView)
                            If dvSql.Count = 0 Then

                                AuthOrderDR = AuthOrders.NewRow
                                AuthOrderDR("Authcode") = authcode
                                AuthOrderDR("TransactionId") = transactionid
                                AuthOrderDR("CardNum") = cardnum
                                AuthOrderDR("invoicenum") = invoicenum
                                AuthOrderDR("amount") = amount
                                AuthOrderDR("status") = status
                                AuthOrderDR("fname") = fname
                                AuthOrderDR("lname") = lname
                                AuthOrderDR("email") = email
                                AuthOrders.Rows.Add(AuthOrderDR)
                                reccount = reccount + 1
                            End If
                        Catch ex As Exception


                        End Try
                    Catch ex As Exception

                    End Try



                End If

                i = i + 1

            Loop
            sr.Close()
            sr = Nothing

        Else

        End If
        lblcount.Text = reccount.ToString & " records returned"
        Session.Add("AuthOrders", AuthOrders)
        GridView1.DataSource = AuthOrders
        GridView1.DataBind()

    End Sub

    Protected Sub Button2_PreRender(sender As Object, e As System.EventArgs) Handles Button2.PreRender
        Try
            Dim url As String = "~/PrintTranscheck.aspx"
            url = Page.ResolveClientUrl(url)
            Button2.OnClientClick = "window.open('" & url & "')"
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub GridView1_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridView1.PageIndexChanging
        GridView1.PageIndex = e.NewPageIndex

        GridView1.DataSource = Session("AuthOrders")
        GridView1.DataBind()
    End Sub

   
End Class
