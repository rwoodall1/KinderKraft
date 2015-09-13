Imports System.IO

Partial Class learnerpkgcart
    Inherits webformbase


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Dim LinkButton1 As LinkButton = DirectCast(Master.FindControl("LinkButton1"), LinkButton)
        Page.MaintainScrollPositionOnPostBack = True
        If IsNothing(Session("ShoppingCart")) Then
            Dim SC As New ShoppingCart
            Dim lt As New LookUpTable

            lt.ConnectStr = ConfigurationManager.ConnectionStrings("KK5").ToString 

            Session.Add("ShoppingCart", SC) 'contains orderdetail table and options table and any other tables I create in the new sub of shopping cart
            Session.Add("LookUp", lt) 'contains product table and eventually option tables in it.
            Session.Add("user", "GUEST") 'logged in as guest
        Else
            Dim SC1 As ShoppingCart = Session("ShoppingCart")

            If IsNothing(Session("user")) Then
                Session.Add("user", "GUEST") 'logged in as guest
            End If
        End If
    End Sub
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If Page.IsValid Then
            Dim lt As LookUpTable
            lt = Session("LookUp") 'contains product table and eventually option tables in it.
            Dim SC As ShoppingCart
            SC = Session("ShoppingCart")

            'subscript 4 is option category used in add pkgoptions, this is hard coded but located in the option catagories table
			Dim arroptions(3, 4) As String
            arroptions(0, 1) = Me.ddlcert.SelectedValue
            arroptions(0, 2) = Me.ddlcert.SelectedItem.Text
            arroptions(0, 3) = "05KLEAPKD"
            arroptions(0, 4) = 39
            arroptions(1, 1) = Me.ddlcapclr.SelectedValue
            arroptions(1, 2) = Me.ddlcapclr.SelectedItem.Text
            arroptions(1, 3) = "05KLEAPKD"
            arroptions(1, 4) = 45
            arroptions(2, 1) = Me.ddltasclr.SelectedValue
            arroptions(2, 2) = Me.ddltasclr.SelectedItem.Text
            arroptions(2, 3) = "05KLEAPKD"
            arroptions(2, 4) = 36

            arroptions(3, 1) = Me.ddlframe.SelectedValue
            arroptions(3, 2) = Me.ddlframe.SelectedItem.Text
            arroptions(3, 3) = "05KLEAPKD"
            arroptions(3, 4) = 46

           

            SC.AddPkgToCart(SC.orderdetail, lt, Me.lblprodcode.Text, Me.txtqty.Text, Me.LBLPKG.Text, "Learner Package", CInt(Me.txtqty.Text), arroptions)
            'SC.AddOptions(SC.OrderOrderOptions, arroptions, 0)
            Session("ShoppingCart") = SC
            'Response.Redirect("../carttotal.aspx")
            Response.Redirect("../scart.aspx")
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

    Protected Sub LBLPKG_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles LBLPKG.Load
        If Not IsPostBack Then
            Dim prodcode As Label = sender
            Me.LBLPKG.Text = Me.RetPrice(sender.text.ToString.ToUpper)
        End If
    End Sub
    Protected Sub CustomValidator2_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles CustomValidator2.ServerValidate
        Dim retval As Boolean = True

		If Trim(Me.ddlcapclr.SelectedItem.Text) = "Please Select" Then
			Me.CustomValidator2.ErrorMessage = "Please select a cap color."
			retval = False
		ElseIf Trim(ddltasclr.SelectedItem.Text) = "Please Select" Then
			Me.CustomValidator2.ErrorMessage = "Please select a tassel color."
			retval = False
		ElseIf Trim(Me.ddlcert.SelectedItem.Text) = "Please Select" Then
			Me.CustomValidator2.ErrorMessage = "Please select a diploma."
			retval = False
		End If
		args.IsValid = retval

    End Sub
    Private Function GetCapColorId(clrval As Integer) As Integer
        Dim retval As Integer = 0
        Select Case clrval
            Case 170 'red
                retval = 236
            Case 171 'pink
                retval = 237
            Case 172 'gold
                retval = 238
            Case 173 'white
                retval = 239
            Case 174 'light blue
                retval = 240
            Case 175 'egg plant
                retval = 241
            Case 176 'royal blue
                retval = 242
            Case 177 'hunter Green
                retval = 243
            Case 247 'black
                retval = 246

        End Select
        Return retval
    End Function
   

   



    Protected Sub dscertificate_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles dscertificate.Selecting
        'Dim lt As LookUpTable
        'lt = Session("LookUp")
        'dscertificate.ConnectionString = lt.ConnectStr
    End Sub

    Protected Sub ddlcapclr_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddlcapclr.SelectedIndexChanged

    End Sub

    Protected Sub CustomValidator3_ServerValidate(source As Object, args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles CustomValidator3.ServerValidate
        Dim retval As Boolean = True
        Select Case ddlcapclr.SelectedItem.Value
            Case 236
                retval = False

            Case 242
                retval = False

        End Select


        args.IsValid = retval
    End Sub
End Class
