Imports Microsoft.VisualBasic
Imports System.Data
Imports CrystalDecisions.CrystalReports
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.ReportSource
Imports CrystalDecisions.Reporting
Imports MySql.Data.MySqlClient

'Imports CrystalDecisions.CrystalReports.Engine
Partial Class PrintReceipt
    Inherits System.Web.UI.Page
    'Private InvoiceReport As ReportDocument
    'do not put a slash in front of directory. It makes a difference in how the server.mappathe interperts the path.
    Dim TheInvoicereport As ReportDocument
    Dim mydatamaker As New InvoiceConfig(Server.MapPath("DataSets\"))
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        ConfigureCrystalReports(Request.QueryString("orderid"))


    End Sub
    Private Sub ConfigureCrystalReports(ByVal orderid As String)

        'do not put a slash in front of directory. It makes a difference in how the server.mappathe interperts the path.

        mydatamaker.orderid = orderid
        TheInvoicereport = New ReportDocument()
        Dim reportPath As String = Server.MapPath("Reports\Invoice.rpt")
        TheInvoicereport.Load(reportPath)
        Dim myDataSet As DataSet = mydatamaker.InvoiceDataSet()


        'Dim a As String = mydatamaker.cmdString
        TheInvoicereport.SetDataSource(myDataSet)
        Invoicereport.ReportSource = TheInvoicereport
    End Sub

    Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Unload
        Try
            TheInvoicereport.Close()
            TheInvoicereport.Dispose()
        Catch ex As Exception

        End Try
    End Sub
End Class
