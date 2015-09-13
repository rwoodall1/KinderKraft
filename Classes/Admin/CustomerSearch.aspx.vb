
Imports MySql.Data.MySqlClient
Partial Class Customersearch
    Inherits webformbase
    Dim cmdtext As String

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        If txtlastnamesearch.Text = Nothing Then
			dscust.SelectCommand = "SELECT * FROM cust c;"
			ViewState("custcmd") = dscust.SelectCommand
        Else
			dscust.SelectCommand = "Select * from cust where lname Like concat(@lname,'%');" '& Chr(34) & txtlastnamesearch.Text & Chr(34) & ";"
			ViewState("custcmd") = dscust.SelectCommand
        End If

    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        If txtzipsearch.Text = Nothing Then
            dscust.SelectCommand = "SELECT * FROM cust;"
            ViewState("custcmd") = dscust.SelectCommand
        Else

            dscust.SelectCommand = "Select * from cust where postalcode=@postalcode;" ' & Chr(34) & txtzipsearch.Text & Chr(34) & ";"
            ViewState("custcmd") = dscust.SelectCommand
        End If

    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        If txtcompnamesearch.Text = Nothing Then
            dscust.SelectCommand = "SELECT * FROM cust;"
            ViewState("custcmd") = dscust.SelectCommand
        Else

            dscust.SelectCommand = "Select * from cust where companyname Like concat(@companyname,'%');" ' & Chr(34) & txtcompnamesearch.Text & Chr(34) & ";"
            ViewState("custcmd") = dscust.SelectCommand
        End If

    End Sub

    Protected Sub Button1_Click1(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If txtcustidsearch.Text = Nothing Then
            dscust.SelectCommand = "SELECT * FROM cust;"
            ViewState("custcmd") = dscust.SelectCommand
        Else
            'dscust.SelectParameters.Add("@custid", txtcustidsearch.Text)
            dscust.SelectCommand = "Select * from cust where custid=@custid;" ' & txtcustidsearch.Text & ";"
            ViewState("custcmd") = dscust.SelectCommand

        End If

    End Sub

    Protected Sub Button5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button5.Click
        If txtusername.Text = Nothing Then
            dscust.SelectCommand = "SELECT * FROM cust;"
            ViewState("custcmd") = dscust.SelectCommand
        Else
            'dscust.SelectParameters.Add("@custid", txtcustidsearch.Text)
            dscust.SelectCommand = "Select * from cust where username=@username;" ' & txtcustidsearch.Text & ";"
            ViewState("custcmd") = dscust.SelectCommand

        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ViewState.Add("custcmd", "")
        Else

            dscust.SelectCommand = ViewState("custcmd")
        End If



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

   
	Protected Sub Button6_Click(sender As Object, e As System.EventArgs) Handles Button6.Click
		If txtoraclecustid.Text = Nothing Then
			dscust.SelectCommand = "SELECT * FROM cust;"
		Else

			dscust.SelectCommand = "Select * from cust where oraclecustid=@oraclecustid;"	' & txtcustidsearch.Text & ";"

		End If
	End Sub
End Class
