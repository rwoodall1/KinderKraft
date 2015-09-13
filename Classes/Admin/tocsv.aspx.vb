Imports System.Data

Partial Class Admin_tocsv
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click

        Dim dvSql As New DataView
        'Dim drvSql As DataRowView
        Dim cmdstr As String = "Select  from cust where custid=5622"
        dstable.SelectCommand = cmdstr
        Try
            dvSql = CType(Me.dstable.Select(DataSourceSelectArguments.Empty), Data.DataView)
        Catch ex As Exception

        End Try
        Dim dtorder As DataTable = dvSql.Table

        '
        Dim context As HttpContext = HttpContext.Current
        context.Response.Clear()
        context.Response.ContentType = "text/csv"
        context.Response.AddHeader("Content-Disposition", "attachment; filename=Order.csv")



        For i As Integer = 0 To dtorder.Columns.Count - 1
            If i > 0 Then
                'adding comma in between columns...
                context.Response.Write("~")
            End If
            context.Response.Write(dtorder.Columns(i).ColumnName)
        Next
        context.Response.Write(Environment.NewLine)

        'Write data into context 
        For Each row As DataRow In dtorder.Rows
            '  here we are again going into loop because we want "comma" in between columns 
            For i As Integer = 0 To dtorder.Columns.Count - 1
                If i > 0 Then
                    context.Response.Write("~")
                End If
                context.Response.Write(row(i))
            Next
            context.Response.Write(Environment.NewLine)
        Next
        context.Response.[End]()

    End Sub

End Class
