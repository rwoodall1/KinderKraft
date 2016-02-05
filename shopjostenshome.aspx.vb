'Imports Microsoft.VisualBasic
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
Partial Class shopjostenshome
	Inherits webformbase



	'1 will alway be the orderid for the cart. The database will issue a new order id when it is inserted.
'test
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Response.Redirect("underConstruction.aspx")
		If IsNothing(Session("ShoppingCart")) Then
			Dim SC As New ShoppingCart
			Dim lt As New LookUpTable
			  lt.ConnectStr = ConfigurationManager.ConnectionStrings("KK5").ToString 



			Session.Add("ShoppingCart", SC)	'contains orderdetail table and options table and any other tables I create in the new sub of shopping cart
			Session.Add("LookUp", lt) 'contains product table and eventually option tables in it.
			'Session.Add("user", "GUEST") 'logged in as guest don't need this the default sc.username is guest
		Else ' value set with shoppingcart

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
#Region "SetLabelPrices"
	



    Protected Sub KWRIST_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles KWRIST.Load

        Dim prodcode As Label = sender
        Me.KWRIST.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
    End Sub

    Protected Sub CAP_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles CAP.Load

        Dim prodcode As Label = sender
        Me.CAP.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
    End Sub

    Protected Sub TSHIRT_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles KTSHIRT.Load

        Dim prodcode As Label = sender
        Me.KTSHIRT.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
    End Sub

   

	Protected Sub KMED_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles KMED.Load
		Dim prodcode As Label = sender
		Me.KMED.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
	End Sub



	Protected Sub TAS_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles TAS.Load
		Dim prodcode As Label = sender
		Me.TAS.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
	End Sub

	Protected Sub KSASH_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles KSASH.Load
		Dim prodcode As Label = sender
		Me.KSASH.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
	End Sub

	

	Protected Sub KDIP_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles KDIP.Load
		Dim prodcode As Label = sender
		Me.KDIP.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
	End Sub

	Protected Sub GWN_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles GWN.Load
		Dim prodcode As Label = sender
		Me.GWN.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
	End Sub
    'These were took out
    'Protected Sub gradribbon_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles gradribbon.Load
    '    Dim prodcode As Label = sender
    '    Me.gradribbon.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
    'End Sub
    'Protected Sub KCCAP10PK_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles KCCAP10PK.Load
    '    Dim prodcode As Label = sender
    '    Me.KCCAP10PK.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
    'End Sub
    'Protected Sub KMF_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles KMF.Load
    '	Dim prodcode As Label = sender
    '	Me.KMF.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
    'End Sub

	'Protected Sub KLEAPKD_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles KLEAPKD.Load
	'    Dim prodcode As Label = sender
	'    Me.KLEAPKD.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
	'End Sub

	'Protected Sub KSASH1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles KSASH1.Load
	'    Dim prodcode As Label = sender
	'    Me.KSASH1.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
	'End Sub

	'Protected Sub KMILEPKD_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles KMILEPKD.Load
	'    Dim prodcode As Label = sender
	'    Me.KMILEPKD.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
	'End Sub

	Protected Sub KDIPC_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles KDIPC.Load
		Dim prodcode As Label = sender
		Me.KDIPC.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
	End Sub

	Protected Sub lblgradpkg_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles lblgradpkg.Load
		Dim prodcode As Label = sender
		Me.lblgradpkg.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
	End Sub

	Protected Sub lblscholar_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles lblscholar.Load
		Dim prodcode As Label = sender
		Me.lblscholar.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
	End Sub

	Protected Sub lblachiever_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles lblachiever.Load
		Dim prodcode As Label = sender
		Me.lblachiever.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
	End Sub

	Protected Sub lblmilestone_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles lblmilestone.Load
		Dim prodcode As Label = sender
		Me.lblmilestone.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
	End Sub

    Protected Sub lblleader_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles lblleader.Load
        Dim prodcode As Label = sender
        Me.lblleader.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
    End Sub

    Protected Sub KRIBBON10PK_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles KRIBBON10PK.Load
		Dim prodcode As Label = sender
		Me.KRIBBON10PK.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
	End Sub
    Protected Sub KINV_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles KINVITE10PK.Load
        Dim prodcode As Label = sender
        Me.KINVITE10PK.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
    End Sub

    Protected Sub KDF_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles KDIPF.Load
        Dim prodcode As Label = sender
        Me.KDIPF.Text = "$" & Me.RetPrice(sender.text.ToString.ToUpper)
    End Sub

#End Region






End Class
