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
Partial Class gowncart
    Inherits webformbase
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If Page.IsValid Then
            Dim lt As LookUpTable
            lt = Session("LookUp") 'contains product table and eventually option tables in it.
            Dim SC As ShoppingCart
            SC = Session("ShoppingCart")
            Dim detid As String
            If txtqty6.Text <> Nothing Then
                detid = SC.AddToCart(SC.orderdetail, GWN.ID, Me.txtqty6.Text, Me.GWN.Text, "Gowns", Trim(Me.ddlclr.SelectedItem.Text) & "," & Trim(Me.ddlsize.SelectedItem.Text))
                Dim arroptions(1, 4) As String
                arroptions(0, 1) = Me.ddlclr.SelectedValue
                arroptions(0, 2) = Me.ddlclr.SelectedItem.Text
                arroptions(0, 3) = GWN.ID
                arroptions(0, 4) = detid
                arroptions(1, 1) = Me.ddlsize.SelectedValue
                arroptions(1, 2) = Me.ddlsize.SelectedItem.Text
                arroptions(1, 3) = GWN.ID
                arroptions(1, 4) = detid
                SC.AddOptions(SC.OrderOptions, arroptions, 0)
                Session("ShoppingCart") = SC

            End If
            If txtqty5.Text <> Nothing Then
                detid = SC.AddToCart(SC.orderdetail, GWN.ID, Me.txtqty5.Text, Me.GWN.Text, "Gowns", Trim(Me.ddlclr.SelectedItem.Text) & "," & Trim(Me.ddlsize0.SelectedItem.Text))
                Dim arroptions(1, 4) As String
                arroptions(0, 1) = Me.ddlclr.SelectedValue
                arroptions(0, 2) = Me.ddlclr.SelectedItem.Text
                arroptions(0, 3) = GWN.ID
                arroptions(0, 4) = detid
                arroptions(1, 1) = Me.ddlsize0.SelectedValue
                arroptions(1, 2) = Me.ddlsize0.SelectedItem.Text
                arroptions(1, 3) = GWN.ID
                arroptions(1, 4) = detid
                SC.AddOptions(SC.OrderOptions, arroptions, 0)
                Session("ShoppingCart") = SC

            End If
            If txtqty4.Text <> Nothing Then
                detid = SC.AddToCart(SC.orderdetail, GWN.ID, Me.txtqty4.Text, Me.GWN.Text, "Gowns", Trim(Me.ddlclr.SelectedItem.Text) & "," & Trim(Me.ddlsize1.SelectedItem.Text))
                Dim arroptions(1, 4) As String
                arroptions(0, 1) = Me.ddlclr.SelectedValue
                arroptions(0, 2) = Me.ddlclr.SelectedItem.Text
                arroptions(0, 3) = GWN.ID
                arroptions(0, 4) = detid
                arroptions(1, 1) = Me.ddlsize1.SelectedValue
                arroptions(1, 2) = Me.ddlsize1.SelectedItem.Text
                arroptions(1, 3) = GWN.ID
                arroptions(1, 4) = detid
                SC.AddOptions(SC.OrderOptions, arroptions, 0)
                Session("ShoppingCart") = SC

            End If
            If txtqty3.Text <> Nothing Then
                detid = SC.AddToCart(SC.orderdetail, GWN.ID, Me.txtqty3.Text, Me.GWN.Text, "Gowns", Trim(Me.ddlclr.SelectedItem.Text) & "," & Trim(Me.ddlsize2.SelectedItem.Text))
                Dim arroptions(1, 4) As String
                arroptions(0, 1) = Me.ddlclr.SelectedValue
                arroptions(0, 2) = Me.ddlclr.SelectedItem.Text
                arroptions(0, 3) = GWN.ID
                arroptions(0, 4) = detid
                arroptions(1, 1) = Me.ddlsize2.SelectedValue
                arroptions(1, 2) = Me.ddlsize2.SelectedItem.Text
                arroptions(1, 3) = GWN.ID
                arroptions(1, 4) = detid
                SC.AddOptions(SC.OrderOptions, arroptions, 0)
                Session("ShoppingCart") = SC

            End If
            If txtqty2.Text <> Nothing Then
                detid = SC.AddToCart(SC.orderdetail, GWN.ID, Me.txtqty2.Text, Me.GWN.Text, "Gowns", Trim(Me.ddlclr.SelectedItem.Text) & "," & Trim(Me.ddlsize3.SelectedItem.Text))
                Dim arroptions(1, 4) As String
                arroptions(0, 1) = Me.ddlclr.SelectedValue
                arroptions(0, 2) = Me.ddlclr.SelectedItem.Text
                arroptions(0, 3) = GWN.ID
                arroptions(0, 4) = detid
                arroptions(1, 1) = Me.ddlsize3.SelectedValue
                arroptions(1, 2) = Me.ddlsize3.SelectedItem.Text
                arroptions(1, 3) = GWN.ID
                arroptions(1, 4) = detid
                SC.AddOptions(SC.OrderOptions, arroptions, 0)
                Session("ShoppingCart") = SC

            End If
            If txtqty1.Text <> Nothing Then
                detid = SC.AddToCart(SC.orderdetail, GWN.ID, Me.txtqty1.Text, Me.GWN.Text, "Gowns", Trim(Me.ddlclr.SelectedItem.Text) & "," & Trim(Me.ddlsize4.SelectedItem.Text))
                Dim arroptions(1, 4) As String
                arroptions(0, 1) = Me.ddlclr.SelectedValue
                arroptions(0, 2) = Me.ddlclr.SelectedItem.Text
                arroptions(0, 3) = GWN.ID
                arroptions(0, 4) = detid
                arroptions(1, 1) = Me.ddlsize4.SelectedValue
                arroptions(1, 2) = Me.ddlsize4.SelectedItem.Text
                arroptions(1, 3) = GWN.ID
                arroptions(1, 4) = detid
                SC.AddOptions(SC.OrderOptions, arroptions, 0)
                Session("ShoppingCart") = SC

            End If
            If txtqty0.Text <> Nothing Then
                detid = SC.AddToCart(SC.orderdetail, GWN.ID, Me.txtqty0.Text, Me.GWN.Text, "Gowns", Trim(Me.ddlclr.SelectedItem.Text) & "," & Trim(Me.ddlsize5.SelectedItem.Text))
                Dim arroptions(1, 4) As String
                arroptions(0, 1) = Me.ddlclr.SelectedValue
                arroptions(0, 2) = Me.ddlclr.SelectedItem.Text
                arroptions(0, 3) = GWN.ID
                arroptions(0, 4) = detid
                arroptions(1, 1) = Me.ddlsize5.SelectedValue
                arroptions(1, 2) = Me.ddlsize5.SelectedItem.Text
                arroptions(1, 3) = GWN.ID
                arroptions(1, 4) = detid
                SC.AddOptions(SC.OrderOptions, arroptions, 0)
                Session("ShoppingCart") = SC

            End If
            Response.Redirect("../scart.aspx")
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNothing(Session("ShoppingCart")) Then
            Dim SC As New ShoppingCart
            Dim lt As New LookUpTable
              lt.ConnectStr = ConfigurationManager.ConnectionStrings("KK5").ToString 

            Session.Add("ShoppingCart", SC) 'contains orderdetail table and options table and any other tables I create in the new sub of shopping cart
            Session.Add("LookUp", lt) 'contains product table and eventually option tables in it.
            Session.Add("user", "GUEST") 'logged in as guest
        Else
            If IsNothing(Session("user")) Then
                Session.Add("user", "GUEST") 'logged in as guest
            End If
        End If
    End Sub

   
    Function RetPrice(ByVal prodcode As String) As Decimal
        Dim lt As LookUpTable = Session("LookUp")
        Dim dprice As Decimal = 0
        Dim a As String
        Dim rowcount As Integer = lt.ProductTable.Rows.Count - 1
        Do While rowcount <> -1
            a = RTrim(lt.ProductTable.Rows(rowcount).Item("ProdCode").ToString.ToUpper)
            If RTrim(lt.ProductTable.Rows(rowcount).Item("ProdCode").ToString.ToUpper) = RTrim(prodcode.ToUpper) Then
                dprice = lt.ProductTable.Rows(rowcount).Item("Price")
                Exit Do
            End If
            rowcount = rowcount - 1
        Loop
        Return dprice
    End Function
    Protected Sub GWN_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles GWN.Load
        If Not IsPostBack Then
            Dim prodcode As Label = sender
            Me.GWN.Text = Me.RetPrice(sender.text.ToString.ToUpper)
        End If
    End Sub

    Protected Sub CustomValidator4_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles CustomValidator4.ServerValidate
        Dim retval As Boolean = True
        If Trim(Me.ddlclr.SelectedItem.Text) = "Please Select" Then
            Me.CustomValidator4.ErrorMessage = "Please select a color."
			retval = False
		ElseIf Trim(Me.ddlsize.SelectedItem.Text) = "Please Select" Then
			Me.CustomValidator4.ErrorMessage = "Please select a gown size for row 1."
			retval = False
		End If

        
        If txtqty5.Text <> Nothing And Trim(ddlsize0.SelectedItem.Text) = "Please Select" Then
            Me.CustomValidator4.ErrorMessage = "Please select a gown size for row 2."
            retval = False
        ElseIf txtqty4.Text <> Nothing And Trim(ddlsize1.SelectedItem.Text) = "Please Select" Then
            Me.CustomValidator4.ErrorMessage = "Please select a gown size for row 3."
            retval = False
        ElseIf txtqty3.Text <> Nothing And Trim(ddlsize2.SelectedItem.Text) = "Please Select" Then
            Me.CustomValidator4.ErrorMessage = "Please select a gown size for row 4."
            retval = False
        ElseIf txtqty2.Text <> Nothing And Trim(ddlsize3.SelectedItem.Text) = "Please Select" Then
            Me.CustomValidator4.ErrorMessage = "Please select a gown size for row 5."
            retval = False
        ElseIf txtqty1.Text <> Nothing And Trim(ddlsize4.SelectedItem.Text) = "Please Select" Then
            Me.CustomValidator4.ErrorMessage = "Please select a gown size for row 6."
            retval = False
        ElseIf txtqty0.Text <> Nothing And Trim(ddlsize5.SelectedItem.Text) = "Please Select" Then
            Me.CustomValidator4.ErrorMessage = "Please select a gown size for row 7."
            retval = False
        End If
        args.IsValid = retval
    End Sub

    'Protected Sub CustomValidator3_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles CustomValidator3.ServerValidate
    'Dim retval As Boolean = True

    '    If txtqty6.Text <> Nothing And Not IsNumeric(txtqty6.Text) Then
    '        Me.CustomValidator3.ErrorMessage = "Qty must be numeric"
    '        retval = False
    '    Else
    '        If Trim(Me.ddlsize.SelectedItem.Text) = "Please Select" And txtqty6.Text <> Nothing Then
    '            Me.CustomValidator3.ErrorMessage = "Please select a size."
    '            retval = False
    '        End If
    '    End If

    '    If txtqty5.Text <> Nothing And Not IsNumeric(txtqty5.Text) Then
    '        Me.CustomValidator3.ErrorMessage = "Qty must be numeric"
    '        retval = False
    '    Else
    '        If Trim(Me.ddlsize0.SelectedItem.Text) = "Please Select" And txtqty5.Text <> Nothing Then
    '            Me.CustomValidator3.ErrorMessage = "Please select a size."
    '            retval = False
    '        End If
    '    End If

    '    If txtqty4.Text <> Nothing And Not IsNumeric(txtqty4.Text) Then
    '        Me.CustomValidator3.ErrorMessage = "Qty must be numeric"
    '        retval = False
    '    Else
    '        If Trim(Me.ddlsize1.SelectedItem.Text) = "Please Select" And txtqty4.Text <> Nothing Then
    '            Me.CustomValidator3.ErrorMessage = "Please select a size."
    '            retval = False
    '        End If
    '    End If
    '    If txtqty3.Text <> Nothing And Not IsNumeric(txtqty3.Text) Then
    '        Me.CustomValidator3.ErrorMessage = "Qty must be numeric"
    '    retval = False
    '    If Trim(Me.ddlsize2.SelectedItem.Text) = "Please Select" And txtqty3.Text <> Nothing Then
    '        Me.CustomValidator3.ErrorMessage = "Please select a size."
    '        retval = False
    '    End If
    'End If

    'If txtqty2.Text <> Nothing And Not IsNumeric(txtqty2.Text) Then
    '    Me.CustomValidator3.ErrorMessage = "Qty must be numeric"
    '    retval = False
    '    If Trim(Me.ddlsize3.SelectedItem.Text) = "Please Select" And txtqty2.Text <> Nothing Then
    '        Me.CustomValidator3.ErrorMessage = "Please select a size."
    '        retval = False
    '    End If
    'End If
    'If txtqty1.Text <> Nothing And Not IsNumeric(txtqty1.Text) Then
    '    Me.CustomValidator3.ErrorMessage = "Qty must be numeric"
    '    retval = False
    '    If Trim(Me.ddlsize4.SelectedItem.Text) = "Please Select" And txtqty1.Text <> Nothing Then
    '        Me.CustomValidator3.ErrorMessage = "Please select a size."
    '        retval = False
    '    End If
    'End If
    'If txtqty0.Text <> Nothing And Not IsNumeric(txtqty0.Text) Then
    '    Me.CustomValidator3.ErrorMessage = "Qty must be numeric"
    '    retval = False
    '    If Trim(Me.ddlsize5.SelectedItem.Text) = "Please Select" And txtqty0.Text <> Nothing Then
    '        Me.CustomValidator3.ErrorMessage = "Please select a size."
    '        retval = False
    '    End If
    '    End If
    '    args.IsValid = retval
    'End Sub
    Private Sub SumPkg()
        Dim a As Integer = Integer.Parse(IIf(txtqty6.Text = Nothing, "0", txtqty6.Text)) + Integer.Parse(IIf(txtqty5.Text = Nothing, "0", txtqty5.Text)) + CInt(IIf(txtqty4.Text = Nothing, "0", txtqty4.Text)) + CInt(IIf(txtqty3.Text = Nothing, "0", txtqty3.Text)) + CInt(IIf(txtqty2.Text = Nothing, "0", txtqty2.Text)) + CInt(IIf(txtqty1.Text = Nothing, "0", txtqty1.Text)) + CInt(IIf(txtqty0.Text = Nothing, "0", txtqty0.Text))
        txtqty.Text = a.ToString
    End Sub

    Protected Sub txtqty6_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtqty6.TextChanged
        Me.SumPkg()
    End Sub

    Protected Sub txtqty5_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtqty5.TextChanged
        Me.SumPkg()
    End Sub

    Protected Sub txtqty4_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtqty4.TextChanged
        Me.SumPkg()
    End Sub

    Protected Sub txtqty3_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtqty3.TextChanged
        Me.SumPkg()
    End Sub

    Protected Sub txtqty2_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtqty2.TextChanged
        Me.SumPkg()
    End Sub

    Protected Sub txtqty1_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtqty1.TextChanged
        Me.SumPkg()
    End Sub

    Protected Sub txtqty0_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtqty0.TextChanged
        Me.SumPkg()
    End Sub

    'Protected Sub dscolor_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles dscolor.Init
    '    Dim lt As LookUpTable
    '    lt = Session("LookUp")
    '    dscolor.ConnectionString = lt.ConnectStr
    'End Sub

    'Protected Sub dssize_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles dssize.Init
    '    Dim lt As LookUpTable
    '    lt = Session("LookUp")
    '    dssize.ConnectionString = lt.ConnectStr
    'End Sub

  
    Protected Sub CustomValidator5_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles CustomValidator5.ServerValidate
        Dim retval As Boolean = True
        If txtqty6.Text = "0" Or txtqty6.Text = "" Then
            retval = False
        End If
        args.IsValid = retval
    End Sub

    Protected Sub CustomValidator6_ServerValidate(source As Object, args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles CustomValidator6.ServerValidate
        Dim retval As Boolean = True
        Select Case ddlclr.SelectedItem.Value
            Case 170
                retval = False

            Case 176
                retval = False

        End Select


        args.IsValid = retval
    End Sub
End Class
