Imports System.Data

Partial Class Promotions
    Inherits webformbase
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If txtsearch.Text = Nothing Then
            dspromo.SelectCommand = "select * from promotions;"""
        Else
            dspromo.SelectCommand = "select * from promotions where code=" & Chr(34) & txtsearch.Text & Chr(34) & ";"

        End If

    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Dim LinkButton1 As LinkButton = DirectCast(Master.FindControl("LinkButton1"), LinkButton)
        If IsNothing(Session("ShoppingCart")) Then

            Response.Redirect("../login.aspx")
        Else
            Dim sc As ShoppingCart = Session("ShoppingCart")
            If sc.IsCs = False Then
				Response.Redirect("../shopjostenshome.aspx")
            Else
                LinkButton1.Visible = sc.IsCs
            End If
        End If
    End Sub

   

   
 
    Protected Sub dspromo_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles dspromo.Updated
        GridView1.DataBind()

    End Sub

   

    Protected Sub DetailsView2_ItemInserted(sender As Object, e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsView2.ItemInserted
        Dim mexcp As MySql.Data.MySqlClient.MySqlException = e.Exception
        Dim msg As String = ""
        If e.Exception Is Nothing Then
        Else
            If mexcp.Number = 1062 Then
                msg = "The promotion code entered already exist!"
            Else
                msg = mexcp.Message
            End If
            Dim a As String = e.Exception.Message
            MsgBox1.Show( _
       "Error", msg, Nothing, New EO.Web.MsgBoxButton("OK"))
            e.ExceptionHandled = True
            e.KeepInInsertMode = True
        End If
        GridView1.DataBind()
    End Sub
End Class
