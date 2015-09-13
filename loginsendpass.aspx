<%@ Page Title="" Language="VB"  AutoEventWireup="false" CodeFile="loginsendpass.aspx.vb" Inherits="loginsendpass" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_Layout.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>Password Assistance</title>

<link href="css/master.css" rel="stylesheet" type="text/css" media="screen"/>
<link rel="stylesheet" type="text/css" href="css/cssverticalmenu.css" />

<script type="text/javascript" src="cssverticalmenu.js">

</script>

<!-- InstanceEndEditable -->

<link href="css/cssverticalmenu.css" rel="stylesheet" type="text/css" />
<link href="css/package.css" rel="stylesheet" type="text/css" />
<link href="css/package_cartpgs.css" rel="stylesheet" type="text/css" />
<link href="css/master.css" rel="stylesheet" type="text/css" />
<link href="css/productboxes.css" rel="stylesheet" type="text/css" />
</head> 

<body>

<form id="form1" runat="server">

<div id="pagewrapper">
	<div id="header">
  		<div id="headleft"><br />
			<a href="shopjostenshome.aspx"> 
	  			<img alt="" height="101" src="images/jostenslogo.PNG" border="0" width="270" /></a>
</div>
			<div id="headright" style="width: 689px"><br />
				<a href="shopjostenshome.aspx">
						<img src="images/Kinderkraft_2.jpg" width="160" height="34" alt="" /></a>
							<p><asp:LinkButton ID="lklogin" runat="server" OnClick="lklogin_Click">Log In </asp:LinkButton> | <a href="scart.aspx">View Cart</a>
                            </p>
                            <br />
                            <br />
						<div class="welcome"><asp:Label ID="Label1" runat="server" Text="Welcome, GUEST" Visible="False" ></asp:Label>
                        </div>
							<div align="left">
   								<asp:Label ID="lblcurrentcustomer" runat="server" Text="Current Customer is:" Font-Italic="True" Font-Size="Larger" Visible="False"></asp:Label>
	</div>
		</div>
			</div>

<div id="menu">
  <div id="browse"> Browse Products 
  </div>
  
  <ul id="verticalmenu" class="glossymenu">
	<li><a href="packages.aspx">Packages</a></li>
	<li><a href="capsandgowns.aspx" >Caps and Gowns</a></li>
	<li><a href="tasselsandsashes.aspx">Tassels and Sashes</a></li>
	<li><a href="diplomasandcertificates.aspx">Diplomas and Certificates</a></li>
	<li><a href="accessories.aspx" >Accessories</a></li>
    <!--<li><a href="../clearance.aspx" >Clearance</a></li> -->
   	<li><asp:LinkButton ID="LinkButton1" runat="server" Visible="False" 
		PostBackUrl="~/Admin/Admin.aspx">Administration</asp:LinkButton></li>
 </ul>
  
  	<div id="ssl"> <img src="images/verisign.png" width="75" height="38" alt="SSL Certificate" />
    </div>
</div>

<!-- InstanceBeginEditable name="Content" -->




   
<div id="content">

		<table width: 100%" cellpadding="0" cellspacing="0">
			<tr>
				<td colspan="2">
					Password Assistance<br />
					<br />
					<br />
				</td>
			</tr>
			<tr>
				<td colspan="2" bgcolor="#E6E6E6">
					&nbsp;&nbsp;
					<br />
&nbsp;
					Please enter the email address you use to sign in to your account.<br />
					<br />
				</td>
			</tr>
			<tr>
				<td style="width: 137px" bgcolor="#E6E6E6">
			&nbsp;&nbsp;
			Email Address:</td>
				<td style="width: 384px" bgcolor="#E6E6E6">
					<asp:TextBox ID="TextBox2" runat="server" Width="195px"></asp:TextBox>
				</td>
			</tr>
			<tr>
				<td style="width: 137px" bgcolor="#E6E6E6">&nbsp;
					</td>
				<td style="width: 384px" bgcolor="#E6E6E6">
					<br />
	<asp:Button ID="Button2" runat="server" Text="Submit" BackColor="#99CCFF" 
			Font-Bold="True" Font-Size="Medium" ForeColor="White" Width="85px" />
		
	  
				</td>
			</tr>
			<tr>
				<td style="width: 137px">&nbsp;
					</td>
				<td style="width: 384px">&nbsp;
					</td>
			</tr>
			<tr>
				<td style="border-bottom: thin #E3E3E3 solid; width: 137px">&nbsp;
					</td>
				<td style="border-bottom: thin #E3E3E3 solid; width: 384px">&nbsp;
					</td>
			</tr>
			<tr>
				<td style=" width: 137px">&nbsp;
					</td>
				<td style=" width: 384px">&nbsp;
					</td>
			</tr>
		</table>

	</div>
<!-- InstanceEndEditable -->

<div id="footer">
  		<p><a href="returns.aspx">Shipping Rates and Returns</a> &nbsp; &#124; &nbsp;  <asp:LinkButton ID="ordstatus" runat="server"  OnClick="ordstatus_Click">Order History</asp:LinkButton> &nbsp; &#124; &nbsp; 
          <a href="ChangePassword.aspx">Change Password/User Name</a> &nbsp;  &#124; &nbsp;
          <a href="http://www.jostenskinderkraft.com/contact.html"> Contact Us</a> &nbsp; &#124; &nbsp; 
          <a href="http://www.jostenskinderkraft.com/kinderkraft_home.html">Home</a></p>
  		<p><font size="-6">©2013 Jostens, Inc • All Rights Reserved</font></p>
</div>
</div>
</form>
</body>
<!-- InstanceEnd --></html>
