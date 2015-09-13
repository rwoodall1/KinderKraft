<%@ Page Title="" Language="VB"  AutoEventWireup="false" CodeFile="changepassword.aspx.vb" Inherits="changepassword" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_Layout.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>Change Password</title>

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
	<table style="width: 77%;">
		<tr>
			<td align="center" colspan="2" style="font-weight: bold; font-size: large">
			
				Change User Name/Password<br />
			</td>
			
		</tr>
		<tr>
		<td align="right" class="style35">
		
			New
		
			User Name:</td>
		<td>
		
			<asp:TextBox ID="txtusrname" runat="server" Width="293px" AutoPostBack="True" 
				CausesValidation="True" ValidationGroup="g2"></asp:TextBox>
		
			<br />
			<div class="req_field_val">
				<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
					ControlToValidate="txtusrname" Display="Dynamic" 
					ErrorMessage="User Name Required" ValidationGroup="g1"></asp:RequiredFieldValidator>
				<asp:CustomValidator ID="custname" runat="server" 
					ControlToValidate="txtusrname" Display="Dynamic" 
					ErrorMessage="User name already exist, please choose another name." 
					ValidateEmptyText="True" ValidationGroup="g2"></asp:CustomValidator>
			</div></td>
		</tr>
		<tr>
		<td align="right" class="style35">
		
			Confirm New User Name:</td>
		<td>
		
					
			<asp:TextBox ID="txtconfirmuser" runat="server" Width="293px" AutoPostBack="True" 
				CausesValidation="True" ValidationGroup="g2"> </asp:TextBox>
		
			<br /><div class="req_field_val">
				<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
					ControlToValidate="txtconfirmuser" Display="Dynamic" 
					ErrorMessage="User Name Required" ValidationGroup="g1"></asp:RequiredFieldValidator>
		<asp:CompareValidator ID="CompareValidator1" runat="server" 
                                     ControlToCompare="txtusrname" 
				ControlToValidate="txtconfirmuser" Display="Dynamic" 
                                     ErrorMessage="User Name Does Not Match" ValueToCompare="txtusrname" 
									 TabIndex="60" ValidationGroup="g1"></asp:CompareValidator></div>
			</td>
		</tr>
		<tr>
		<td align="right" class="style35">
		
			&nbsp;New
		
			Password:</td>
		<td>
		
			<asp:TextBox ID="txtpassword" runat="server" Width="293px" TextMode="Password"></asp:TextBox>
		
			<br />
		<div class="req_field_val">
		<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                     ControlToValidate="txtpassword" Display="Dynamic" 
                                     ErrorMessage="Password Required" TabIndex="60" 
				ValidationGroup="g1"></asp:RequiredFieldValidator></div></td>
		</tr>
		<tr>
		<td align="right" class="style35">
		
			Confirm Password:</td>
		<td>
		
		
			<asp:TextBox ID="txtpassword2" runat="server" Width="293px" TextMode="Password"></asp:TextBox>
		
			<br />
		<div class="req_field_val">
		<asp:CompareValidator ID="CompareValidator2" runat="server" 
                                     ControlToCompare="txtpassword" 
				ControlToValidate="txtpassword2" Display="Dynamic" 
                                     ErrorMessage="Password Does Not Match" ValueToCompare="textbox4.text" 
									 TabIndex="60" ValidationGroup="g1"></asp:CompareValidator>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                     ControlToValidate="txtpassword2" Display="Dynamic" 
                                     ErrorMessage="Password Required" TabIndex="60" 
				ValidationGroup="g1"></asp:RequiredFieldValidator></div></td>
		</tr>
		<tr>
		<td class="style35">
		
			&nbsp;</td>
		<td align="right">
		
			<asp:Button ID="btnupdate" runat="server" Text="Save" Width="73px" 
				ValidationGroup="g1" />
		
		</td>
		</tr>
	</table>
	


	<asp:SqlDataSource ID="dscust" runat="server" 
		ConnectionString="<%$ ConnectionStrings:KK5 %>" 
		ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>"></asp:SqlDataSource>
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
