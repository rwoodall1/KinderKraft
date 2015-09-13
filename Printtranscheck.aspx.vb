
Imports Microsoft.VisualBasic
Imports System.Data
Imports CrystalDecisions.CrystalReports
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.ReportSource
Imports CrystalDecisions.Reporting
'Imports CrystalDecisions.CrystalReports.Engine
Partial Class Printtranscheck
    Inherits System.Web.UI.Page
    'Private InvoiceReport As ReportDocument
    'do not put a slash in front of directory. It makes a difference in how the server.mappathe interperts the path.
    Dim TheAuthorders As ReportDocument
    Dim mydatamaker As New Authordersconfig(Server.MapPath("DataSets\"))
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        ConfigureCrystalReports()

    End Sub
    Private Sub ConfigureCrystalReports()

        'do not put a slash in front of directory. It makes a difference in how the server.mappathe interperts the path.

        mydatamaker.authorderstable = Session("AuthOrders")

        TheAuthorders = New ReportDocument()
        Dim reportPath As String = Server.MapPath("Reports\TransCheck.rpt")
        TheAuthorders.Load(reportPath)
        Dim myDataSet As DataSet = mydatamaker.AuthordersDataset

        'Dim a As String = mydatamaker.cmdString
        TheAuthorders.SetDataSource(myDataSet.Tables(1)) '0 is the unfilled dataset
        Authordersviewer.ReportSource = TheAuthorders
    End Sub

End Class
