<%@ Page Title="" Language="VB"  AutoEventWireup="false" CodeFile="accessories.aspx.vb" Inherits="accessories" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_Layout.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>Shop Accessories</title>

<script type="text/javascript" src="../cssverticalmenu.js">

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
      <td class="auto-style3" colspan="3">
        <a href="shopjostenshome.aspx">Home</a> &gt; <a href="accessories.aspx">Accessories</a><br /><br />
        
        <img alt="" height="117" src="images/accessories/accessories heading_2.png" width="720" /><br /><br /></td></tr></table>
        
<!--<p style="color:#F00; font-weight:bold">Please Note: Our plant will be closed June 27, 2014 – July 14, 2014. Orders placed during that time frame will deliver between August 1, 2014 – August 8, 2014</p> -->
  
  <div class="products_accessories">Add the finishing touches with accessories.</div>
  
  
  
  
  <div class="products"> <a href="cartpages/ribbonscart.aspx"><img src="images/home pg images/kk_ribbons.jpg" alt="Achievement Ribbon" name="ProductPicture" width="210" height="210" id="ProductPicture" /></a>
    <div class="description">
      <h6>Achievement Ribbon</h6>
      <h2>Our Price: <asp:Label ID="LBLRIBBON" runat="server" ForeColor="#D74141" Text="KRIBBON10PK"></asp:Label></h2>
      <h3>package of 10 for each design</h3>
      </div>
    </div>
  
  <!--<div class="products"> <a href="cartpages/gradbearcart.aspx"><img src="images/home pg images/grad bear.jpg" alt="Huggable Grad Bear" name="ProductPicture" width="210" height="210" id="ProductPicture" /></a>
    <div class="description">
      <h6>Huggable Grad Bear</h6>
      <h2>Our Price: <asp:Label ID="HUGBEAR" runat="server" ForeColor="#D74141" Text="BEA"></asp:Label></h2>
      <h3>available in 4 colors</h3>
      </div>
    </div> -->
  
  <div class="products"> <a href="cartpages/gradteecart.aspx"><img src="images/home pg images/kk_gradtee.jpg" alt="Graduate Tee" name="ProductPicture" width="210" height="210" id="ProductPicture" /></a>
    <div class="description">
      <h6>Graduate Tee</h6>
      <h2>Our Price: <asp:Label ID="KTSHIRT" runat="server" ForeColor="#D74141" Text="KTSHIRT"></asp:Label></h2>
      </div>
    </div>
  
  <div class="products"> <a href="cartpages/medalcart.aspx"><img src="images/home pg images/kk_medallion.jpg" alt="Bright Future Medallion" name="ProductPicture" width="210" height="210" id="ProductPicture" /></a>
    <div class="description">
      <h6>Bright Future Medallion</h6>
      <h2>Our Price: <asp:Label ID="KMED1" runat="server" ForeColor="#D74141" Text="KMED"></asp:Label></h2>
      </div>
    </div>
  
  
  <div class="products"> <a href="cartpages/wristbandcart.aspx"><img src="images/home pg images/kk_wrist_2.jpg" alt="Graduate Wristband" name="ProductPicture" width="210" height="210" id="ProductPicture2" /></a>
    <div class="description">
      <h6>Graduate Wristband</h6>
      <h2>Our Price: <asp:Label ID="KWRIST" runat="server" ForeColor="#D74141" Text="KWRIST"></asp:Label></h2>
      </div>
    </div>
    <div class="products"> <a href="cartpages/yearcharmcart.aspx"><img src="images/yeardate2016_LG.png" alt="Graduate Wristband" name="ProductPicture" width="210" height="210" id="ProductPicture2" /></a>
    <div class="description">
      <h6>2016 Charm</h6>
      <h2>Our Price:<asp:Label ID="TYD" runat="server" 
				ForeColor="#D74141" Text="TYD"></asp:Label> </h2>
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
