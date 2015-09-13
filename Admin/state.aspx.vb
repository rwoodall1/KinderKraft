Imports MySql.Data.MySqlClient
Imports System.IO

Partial Class Admin_state
    Inherits webformbase

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
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

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs)

        Dim conn As MySqlConnection
        Dim Str As String
        
        Str = ConfigurationManager.ConnectionStrings("KK5").ToString
      

        conn = New MySqlConnection(Str)

        Dim cmd As New MySqlCommand("", conn)
        '*** Get values from form
        Dim statename As TextBox = DirectCast(GridView1.FooterRow.FindControl("txtstatename"), TextBox)
        Dim vname As String = statename.Text

       

        Dim stateabrv As TextBox = DirectCast(GridView1.FooterRow.FindControl("txtstateabrv"), TextBox)
        Dim vabrvname As String = stateabrv.Text

       

        '*******************************************************************
        '**********************************************************

        cmd.CommandText = "INSERT INTO states(name,abrv) VALUES ('" & vname & "','" & vabrvname & "')"
        cmd.Connection.Open()
        Try
            cmd.ExecuteNonQuery()
           
            cmd.Connection.Close()
        Catch ex As Exception
          
        End Try

        GridView1.DataBind()
    End Sub
End Class
