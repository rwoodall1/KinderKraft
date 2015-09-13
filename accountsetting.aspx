<%@ Page Title="" Language="VB"  AutoEventWireup="false" CodeFile="accountsetting.aspx.vb" Inherits="accountsetting" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_Layout.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>Account Settings</title>


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
    <li><a href="cartpages/banners.aspx" ><span style="color:#DF0003; font-weight:500">NEW! </span> Graduation Banners</a></li>
    <!--<li><a href="../clearance.aspx" >Clearance</a></li> -->
   	<li><asp:LinkButton ID="LinkButton1" runat="server" Visible="False" 
		PostBackUrl="~/Admin/Admin.aspx">Administration</asp:LinkButton></li>
 </ul>
  
  	<div id="ssl"> <img src="images/verisign.png" width="75" height="38" alt="SSL Certificate" />
    </div>
</div>

<!-- InstanceBeginEditable name="Content" -->




  
	
<div id="content">

		<table width: 100%">
			<tr>
				<td colspan="2">
					<br />
					&nbsp; New to Jostens Kinderkraft Get started below...<br />
					<br />
				</td>
			</tr>
			<tr>
				<td style="width: 146px; text-align: right;">
					My email address:</td>
				<td style="width: 384px">
					<asp:TextBox ID="TextBox2" runat="server" Width="195px"></asp:TextBox>
				</td>
			</tr>
			<tr>
				<td style="width: 146px; text-align: right;">
					Confirm email:</td>
				<td style="width: 384px">
					<asp:TextBox ID="TextBox3" runat="server" Width="195px"></asp:TextBox>
				</td>
			</tr>
			<tr>
				<td bgcolor="#E6E6E6" class="tdleft" colspan="2">
					<strong>Protect your information with a Password</strong><br />
					<span style="font-size: small">This will be your only Jostens Kinderkraft 
					passwrod.</span></td>
			</tr>
			<tr>
				<td style="width: 146px; text-align: right;">
					Enter a new password:</td>
				<td style="width: 384px">
					<asp:TextBox ID="TextBox1" runat="server" Width="194px"></asp:TextBox> 
					<br />
				</td>
			</tr>
			<tr>
				<td style="width: 146px; text-align: right;">
					Confirm password:</td>
				<td style="width: 384px">
					<asp:TextBox ID="TextBox4" runat="server" Width="194px"></asp:TextBox> 
		
	  
				</td>
			</tr>
			<tr>
				<td style="width: 146px">&nbsp;
					</td>
				<td style="width: 384px">&nbsp;
					</td>
			</tr>
			<tr>
				<td style=" width: 146px">&nbsp;
					</td>
				<td style=" width: 384px">
					<asp:CheckBox ID="CheckBox1" runat="server" 
						Text="I wish to recieve emails from Jostens Kinderkraft" />
					<br />
				</td>
			</tr>
			<tr>
				<td style=" width: 146px">&nbsp;
					</td>
				<td style=" width: 384px">
					<span style="color: #FF0000">
	<asp:Button ID="Button3" runat="server" Text="Continue" BackColor="#99CCFF" 
			Font-Bold="True" Font-Size="Medium" ForeColor="White" Width="85px" 
						style="text-align: right" />
		
	  
					</span></td>
			</tr>
		</table>

	</div>





<!-- InstanceEndEditable -->

<div id="footer">
  		<p><a href="returns.aspx">Shipping Rates and Returns</a> &nbsp; &#124; &nbsp;  <asp:LinkButton ID="ordstatus" runat="server"  OnClick="ordstatus_Click">Order History</asp:LinkButton> &nbsp; &#124; &nbsp; 
          <a href="ChangePassword.aspx">Change Password/User Name</a> &nbsp;  &#124; &nbsp;
          <a href="http://www.jostenskinderkraft.com/contact.html"> Contact Us</a> &nbsp; &#124; &nbsp; 
          <a href="http://www.jostenskinderkraft.com/kinderkraft_home.html">Home</a></p>
  		<p><font size="-6">©2015 Jostens, Inc • All Rights Reserved</font></p>
</div>
</div>
</form>
</body>
<!-- InstanceEnd --></html>
