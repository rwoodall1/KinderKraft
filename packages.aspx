<%@ Page Title="" Language="VB"  AutoEventWireup="false" CodeFile="packages.aspx.vb" Inherits="packages" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_Layout.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


<title>Shop Packages</title>


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

<table style="width: 660px; height: 150px" cellpadding="0" cellspacing="0">
	<tr>
		<td class="auto-style1" colspan="3" style="height: 26px" valign="top">
		<a href="shopjostenshome.aspx">Home</a> &gt; <a href="packages.aspx">Packages</a></td>
	</tr>
	<tr><td class="auto-style1" colspan="3" style="height: 106px" valign="top"><img alt="" height="117" src="images/package/packages heading_2.png" width="720" /></td></tr></table>

<!--<p style="color:#F00; font-weight:bold">Please Note: Our plant will be closed June 27, 2014 – July 14, 2014. Orders placed during that time frame will deliver between August 1, 2014 – August 8, 2014</p> -->
  
<div class="products_accessories">Packages save time and money. They include everything a young grad needs for the big day, with options for every budget. Starting at </span>
		<span style="color: rgb(128, 0, 0);">$</span><span style="color: rgb(0, 0, 128)">8</span><span style="color: rgb(255, 165, 0)">.5</span><span style="color: rgb(128, 0, 0)">0</span></div>


<div class="packages">
    <a href="pkgcart/gpcart.aspx">
    <img src="images/home pg images/Graduate package2014_web.jpg" 
        alt="Graduate Package" name="ProductPicture" width="210" height="210" 
        id="ProductPicture" /></a>
  <div class="description">
   	<h6>Graduate Package</h6>
    <h2>Our Price: <asp:Label id="GRADUATEPACKAGE" runat="server" Text="01KGRADPKD" ForeColor="#D74141"></asp:Label></h2>
    <p>Total Package <font color="#FF6600">S</font><font color="#0099CC">A</font>V<font color="#3333FF">I</font><font color="#FF6600">N</font><font color="#0099CC">G</font>S $11.50</p>
      <p><i>This package includes cap and gown, tassel, sash, medallion, diploma or certificate, diploma frame. Free wristband and Free Graduate Ribbon. Cap and gown included in the packages will be the same color.</i></p>
    </div>
</div>		

<div class="packages">
    <a href="pkgcart/scholarpkgcart.aspx">
    <img src="images/home pg images/Scholar package2014_web.jpg" alt="Achiever Package" name="ProductPicture" width="210" height="210" id="ProductPicture" /></a>
  <div class="description">
   	<h6>Scholar Package</h6>
    <h2>Our Price: <asp:Label id="SCHOLARPACKAGE" runat="server" Text="02KSCHPKD " ForeColor="#D74141"></asp:Label></h2>
    <p>Total Package <font color="#FF6600">S</font><font color="#0099CC">A</font>V<font color="#3333FF">I</font><font color="#FF6600">N</font><font color="#0099CC">G</font>S $6.55</p>
      <p><i>This package includes cap and gown, 
		tassel, sash, diploma or certificate. Free wristband. Cap and gown included in the packages will be the same color.</i></p><br /><br />


    </div>
</div>		        
        
<div class="packages">
    <a href="pkgcart/achieverpkgcart.aspx">
    <img src="images/home pg images/Achiever  package2014_web.jpg" alt="Achiever Package" name="ProductPicture" width="210" height="210" id="ProductPicture" /></a>
  <div class="description">
   	<h6>Achiever Package</h6>
    <h2>Our Price: <asp:Label id="ACHIEVERPACKAGE" runat="server" Text="03KACHPKD " ForeColor="#D74141"></asp:Label></h2>
    <p>Total Package <font color="#FF6600">S</font><font color="#0099CC">A</font>V<font color="#3333FF">I</font><font color="#FF6600">N</font><font color="#0099CC">G</font>S $4.00</p>
      <p><i>This package includes our best basics: cap and gown, tassel and diploma or certificate. Free Graduate Ribbon. Cap and gown included in the packages will be the same color.</i></p><br />

    </div>
</div>		      
        
<div class="packages">
    <a href="pkgcart/milestonepkgcart.aspx">
    <img src="images/home pg images/Milestone package2014_web.jpg" alt="Achiever Package" name="ProductPicture" width="210" height="210" id="ProductPicture" /></a>
  <div class="description">
   	<h6>&nbsp;Milestone Package</h6>
    <h2>Our Price: <asp:Label id="MILESTONEPACKAGE" runat="server" 
Text="04KMILEPKD " ForeColor="#D74141"></asp:Label></h2>
    <p>Total Package <font color="#FF6600">S</font><font color="#0099CC">A</font>V<font color="#3333FF">I</font><font color="#FF6600">N</font><font color="#0099CC">G</font>S $3.50</p>
      <p><i>Includes tee, cap and tassel.</i></p><br />

    </div>
</div>		

<div class="packages">
    <a href="pkgcart/learnerpkgcart.aspx">
    <img src="images/home pg images/Learner package2014_web.jpg" alt="Achiever Package" name="ProductPicture" width="210" height="210" id="ProductPicture" /></a>
  <div class="description">
   	<h6>Learner Package</h6>
    <h2>Our Price: <asp:Label id="LEARNERPACKAGE" runat="server" 
                Text="05KLEAPKD" ForeColor="#D74141"></asp:Label></h2>
    <p>Total Package <font color="#FF6600">S</font><font color="#0099CC">A</font>V<font color="#3333FF">I</font><font color="#FF6600">N</font><font color="#0099CC">G</font>S $1.00</p>
      <p><i>Includes cap, tassel, diploma or certificate and diploma frame.</i></p>
    </div>
</div>		        
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
