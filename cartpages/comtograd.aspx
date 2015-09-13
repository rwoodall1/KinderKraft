<%@ Page Title="" Language="VB"  AutoEventWireup="false" CodeFile="comtograd.aspx.vb" Inherits="comtograd" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_LayoutSubfolder.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>Commitment To Graduate Certificate</title>
<link href="../css/master.css" rel="stylesheet" type="text/css" media="screen"/>
<link rel="stylesheet" type="text/css" href="../css/cssverticalmenu.css" />



<style type="text/css">
.auto-style2 {
	border-width: thin;
	border-color: #C0C0C0;
	text-align: center;
	border-right-style: solid;
}
.auto-style4 {
	border-color: #C0C0C0;
	border-width: thin;
	border-right-style: solid;
	border-bottom-style: solid;
	margin-left: 5px;
	margin-right: 5px;
	margin-top: 20px;
}
.auto-style5 {
	margin-left: 0px;
}
.auto-style7 {
	margin-right: 0px;
}
	.style12
	{
		height: 189px;
	}
	.style13
	{
		width: 304px;
		height: 36px;
	}
	.style15
	{
		font-size: large;
		text-decoration: underline;
	}
	.style17
	{
		height: 36px;
	}
	.style18
	{
		height: 319px;
	}
	#ima1
	{
		height:inherit;
		width: inherit;
	}
		.style11
	{
		width: 203px;
		height: 166px;
		text-align: center;
		margin-right: 0px;
	}
	.style19
    {
        color: #CC3300;
    }
	</style>
<link href="../css/package.css" rel="stylesheet" type="text/css" />
<link href="../css/package_cartpgs.css" rel="stylesheet" type="text/css" />
<!-- InstanceEndEditable -->

<link href="../css/cssverticalmenu.css" rel="stylesheet" type="text/css" />
<link href="../css/package.css" rel="stylesheet" type="text/css" />
<link href="../css/package_cartpgs.css" rel="stylesheet" type="text/css" />
<link href="../css/master.css" rel="stylesheet" type="text/css" />
<link href="../css/productboxes.css" rel="stylesheet" type="text/css" />
</head> 

<body>

<form id="form1" runat="server">

<div id="pagewrapper">
	<div id="header">
  		<div id="headleft"><br />
			<a href="../shopjostenshome.aspx"> 
	  			<img alt="" height="101" src="../images/jostenslogo.PNG" border="0" width="270" /></a>
</div>
			<div id="headright" style="width: 689px"><br />
				<a href="../shopjostenshome.aspx">
						<img src="../images/Kinderkraft_2.jpg" width="160" height="34" alt="" /></a>
							<p><asp:LinkButton ID="lklogin" runat="server" OnClick="lklogin_Click">Log In </asp:LinkButton> | <a href="../scart.aspx">View Cart</a>
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
	<li><a href="../packages.aspx">Packages</a></li>
	<li><a href="../capsandgowns.aspx" >Caps and Gowns</a></li>
	<li><a href="../tasselsandsashes.aspx">Tassels and Sashes</a></li>
	<li><a href="../diplomasandcertificates.aspx">Diplomas and Certificates</a></li>
	<li><a href="../accessories.aspx" >Accessories</a></li>
    <li><a href="banners.aspx" ><span style="color:#DF0003; font-weight:500">NEW! </span> Graduation Banners</a></li>
    <!--<li><a href="../clearance.aspx" >Clearance</a></li> -->
   	<li><asp:LinkButton ID="LinkButton1" runat="server" Visible="False" 
		PostBackUrl="~/Admin/Admin.aspx">Administration</asp:LinkButton></li>
 </ul>
  
  	<div id="ssl"> <img src="../images/verisign.png" width="75" height="38" alt="SSL Certificate" />
    </div>
</div>

<!-- InstanceBeginEditable name="Content" -->




   
<div id="content">

<table style="width: 660px; height: auto" cellpadding="0" cellspacing="0">
	<tr>
		<td class="style13" valign="top">
		<a href="../shopjostenshome.aspx">Home</a> &gt;<br />
			<strong><span class="style15">Commitment to Graduate<br />
			<br />
			</span></strong></td>
		<td  valign="top" >
			<br />
		</td>
	</tr>
	<tr>
		<td valign="top">
			
			<img src="../images/package/comtograd.jpg" width="339" height="257" />
			</td>
		<td class="style18" valign="top">
		<div id="packprice" style="width: 337px; height: auto"> 
			<p><strong>Only Available In A Grad Package</strong><font><em><br />
			  <span class="style19">Free W/A Grad Package</span></em></font></p>
			Commitment to Graduate certificate and marker to sign their gown in every 
			  Graduate, Scholar and Achiever Package!
			  
		</div>
			
			</td>
	</tr>
	</table>

	</div>





<!-- InstanceEndEditable -->

<div id="footer">
  		<p><a href="../returns.aspx">Shipping Rates and Returns</a> &nbsp; &#124; &nbsp;  <asp:LinkButton ID="ordstatus" runat="server"  OnClick="ordstatus_Click">Order History</asp:LinkButton> &nbsp; &#124; &nbsp; 
          <a href="../ChangePassword.aspx">Change Password/User Name</a> &nbsp;  &#124; &nbsp;
          <a href="http://www.jostenskinderkraft.com/contact.html"> Contact Us</a> &nbsp; &#124; &nbsp; 
          <a href="http://www.jostenskinderkraft.com/kinderkraft_home.html">Home</a></p>
  		<p><font size="-6">©2015 Jostens, Inc • All Rights Reserved</font></p>
</div>
</div>
</form>
</body>
<!-- InstanceEnd --></html>
