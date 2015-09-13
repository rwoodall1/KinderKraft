<%@ Page Title="" Language="VB"  AutoEventWireup="false" CodeFile="tasselsandsashes.aspx.vb" Inherits="tasselsandsashes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_Layout.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>Shop Tassels and Sashes</title>


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

    <table style="width: 685px; cellpadding="0" cellspacing="0" height: 540px;">
        <tr>
            <td height="173" colspan="3" class="auto-style3">
		<a href="shopjostenshome.aspx">Home</a> &gt; <a href="tasselsandsashes.aspx">Tassels and Sashes</a><br />
		<br />
  
 <img alt="" height="117" src="images/tasselsandsashes/tassel heading_2.png" width="720" /><br /><br /></td></tr></table>
  <!-- <p style="color:#F00; font-weight:bold">Please Note: Our plant will be closed June 27, 2014 – July 14, 2014. Orders placed during that time frame will deliver between August 1, 2014 – August 8, 2014</p> -->
    
<div class="products_accessories"> Tassels and sashes make their ceremony regalia official. Get them in our grad packages or&nbsp; à la carte.</div>

<div class="products">
  <a href="cartpages/tasselcart.aspx"> <img src="images/home pg images/kk_tassels.jpg" alt="Tassels" name="ProductPicture" width="210" height="210" id="ProductPicture" /></a>
  <div class="description">
   	<h6>Tassels</h6>
    <h2>Our Price: <asp:Label id="TAS" runat="server" Text="TAS" ForeColor="#D74141"></asp:Label></h2>
    <h3>&nbsp;</h3>
    </div>
 </div>
 
 
 <div class="products"> <a href="cartpages/sashescart.aspx"><img src="images/tasselsandsashes/sashes/kk_sashes_2.jpg" alt="Graduate/&quot;Class of&quot; Sashes" name="ProductPicture" width="210" height="210" id="ProductPicture" /></a>
  <div class="description">
   	<h6>Graduate Sashes</h6>
    <h2>Our Price:<asp:Label id="KSASH" runat="server" Text="KSASH" ForeColor="#D74141"></asp:Label></h2>
     <h3>&nbsp;</h3>
   </div>
</div>

<div class="products"> <a href="cartpages/csashescart.aspx"><img src="images/tasselsandsashes/sashes/kk_sashes_choir.jpg" alt="Choir Sashes" name="ProductPicture" width="210" height="210" id="ProductPicture" /></a>
  <div class="description">
   	<h6>Choir Sashes</h6>
    <h2>Our Price: <asp:Label id="KCHOIRSASH" runat="server" Text="KCHOIRSASH" ForeColor="#D74141"></asp:Label></h2>
    <h3>available &aacute; la carte only</h3>
   </div>
</div></div>





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
