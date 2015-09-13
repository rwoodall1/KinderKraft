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
Imports System.IO.File
Imports System.IO
Public Class product
    Inherits webformbase



    Protected Sub btnsearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnsearch.Click
        Dim selectcmd As String
        'selectcmd = "SELECT * FROM product WHERE (prodcode ='" & Trim(Me.txtsearch.Text) & "') order productname;"
        If txtsearch.Text <> "" Then
            selectcmd = "SELECT * FROM kinderkraft5.product p WHERE p.`prodcode` Like concat(" & Chr(34) & Trim(Me.txtsearch.Text) & Chr(34) & ",'%');"
        Else
            selectcmd = "SELECT * FROM kinderkraft5.product p"
        End If
        '"Select * from cust where companyname Like concat(@companyname,'%');"

        Me.dsProduct.SelectCommand = selectcmd

    End Sub

    Protected Sub dsProduct_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles dsProduct.Selected
        lblcount.Text = String.Format("{0}", e.AffectedRows)
    End Sub

    Protected Sub GridView1_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GridView1.RowEditing
        GridView1.EditIndex = e.NewEditIndex
        lblerror.Visible = False
        lblerror.Text = ""
    End Sub

    Protected Sub GridView1_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles GridView1.RowCancelingEdit
        lblerror.Visible = False
        lblerror.Text = ""
        e.Cancel = True
        GridView1.EditIndex = -1

    End Sub

    Protected Sub GridView1_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridView1.RowUpdating
        'Dim row As GridViewRow = GridView1.Rows(e.RowIndex)

        'Dim txtProductName As TextBox = CType(row.FindControl("txtProductName"), TextBox)
        'Dim txtUnitPrice As TextBox = CType(row.FindControl("txtUnitPrice"), TextBox)


        'Dim productID As Integer = Int32.Parse(GridView1.DataKeys(e.RowIndex).Value.ToString())

        'Dim productName As String = txtProductName.Text
        'Dim unitPrice As Decimal = Decimal.Parse(txtUnitPrice.Text)


    End Sub



    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        lblerror.Visible = False
        lblerror.Text = ""
        Dim conn As MySqlConnection
        Dim Str As String
       
        Str = ConfigurationManager.ConnectionStrings("KK5").ToString

       

        conn = New MySqlConnection(Str)

        Dim cmd As New MySqlCommand("", conn)
        '*** Get values from form
        Dim prodcodeTexbox As TextBox = DirectCast(GridView1.FooterRow.FindControl("txtprodcode"), TextBox)
        Dim vprodcode As String = prodcodeTexbox.Text

        'Dim  As DropDownList = DirectCast(FormView2.FindControl("ddlowner"), DropDownList)
        'Dim vowner As String = towner.SelectedValue

        'Dim group As DropDownList = DirectCast(FormView2.FindControl("ddlGroup"), DropDownList)
        'Dim vgroup As String = group.SelectedValue

        Dim productnametxt As TextBox = DirectCast(GridView1.FooterRow.FindControl("prodname"), TextBox)
        Dim vproductname As String = productnametxt.Text

        Dim prodpricetxt As TextBox = DirectCast(GridView1.FooterRow.FindControl("prodprice"), TextBox)
        Dim vproductprice As Integer = prodpricetxt.Text

        Dim catopidddl As DropDownList = DirectCast(GridView1.FooterRow.FindControl("ddlcatopid"), DropDownList)
        Dim vcatopid As Integer = catopidddl.SelectedValue
        'Dim vactive As CheckBox = DirectCast(FormView2.FindControl("chbActive"), CheckBox)
        'Dim f As String = vactive.Checked
        'Dim activeval As String = IIf(f = "True", "1", "0")

        'Dim vtobesold As CheckBox = DirectCast(FormView2.FindControl("chbTobesold"), CheckBox)
        'Dim g As String = vactive.Checked
        'Dim tobesoldval As String = IIf(g = "True", "1", "0")
        '*******************************************************************
        '**********************************************************

        cmd.CommandText = "INSERT INTO product(prodcode,productname,productprice,catopid) VALUES ('" & vprodcode & "','" & vproductname & "'," & vproductprice & "," & vcatopid & ")"
        cmd.Connection.Open()
        Try
            cmd.ExecuteNonQuery()
            cmd.CommandText = "SELECT last_insert_id();"
            Dim LastId As Integer = cmd.ExecuteScalar()
            cmd.Connection.Close()
        Catch ex As Exception
            lblerror.Visible = True
            lblerror.Text = ex.Message
        End Try

        GridView1.DataBind()
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
End Class