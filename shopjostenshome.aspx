<%@ Page Title="Home" Language="VB" AutoEventWireup="false" CodeFile="shopjostenshome.aspx.vb" Inherits="shopjostenshome" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_Layout.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>Shop Kinderkraft</title>

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
<img alt="Kinderkraft 2013 Collection" height="50" src="images/kinderkraft.jpg" width="400" /><br />
  
<!--<p style="color:#F00; font-weight:bold">Our plant will be closed July 3rd  - July 17th. Orders placed during this time frame will be received and processed on July 20th with processing and shipping time beginning that day. Orders placed by or before July 2nd will be shipped and delivered by the time frame given at the time the order is placed.</p>-->
  
  <div class="products_accessories">Packages</div>           
  
  <div class="packages"> 
    <a href="pkgcart/gpcart.aspx"> 
      <img src="images/home pg images/Graduate package2014_web.jpg" 
        alt="Graduate Package" name="ProductPicture" width="210" height="210" 
        id="ProductPicture" /></a>
    <div class="description">
      <h6>Graduate Package</h6>
      <h2>Our Price: 
        <asp:Label id="lblgradpkg" runat="server" ForeColor="#D74141" 
                  Text="01KGRADPKD"></asp:Label></h2>
      <p>Total Package<br />
        <font color="#FF6600">S</font><font color="#0099CC">A</font>V<font color="#3333FF">I</font><font color="#FF6600">N</font><font color="#0099CC">G</font>S $11.50</p>
      </div>
  </div>
  <div class="packages"> <a href="pkgcart/scholarpkgcart.aspx"> <img src="images/home pg images/Scholar package2014_web.jpg" alt="Scholar Package" name="ProductPicture" width="210" height="210" id="ProductPicture" /></a>
    <div class="description">
      <h6>Scholar Package</h6>
      <h2>Our Price: <asp:Label id="lblscholar" runat="server" ForeColor="#D74141" Text="02KSCHPKD"></asp:Label></h2>
      <p>Total Package<br />
        <font color="#FF6600">S</font><font color="#0099CC">A</font>V<font color="#3333FF">I</font><font color="#FF6600">N</font><font color="#0099CC">G</font>S $6.55</p>
      </div>
  </div>
  <div class="packages"> <a href="pkgcart/achieverpkgcart.aspx"> <img src="images/home pg images/Achiever  package2014_web.jpg" alt="Achiever Package" name="ProductPicture" width="210" height="210" id="ProductPicture2" /></a>
    <div class="description">
      <h6>Achiever Package</h6>
      <h2>Our Price: <asp:Label id="lblachiever" runat="server" ForeColor="#D74141" Text="03KACHPKD"></asp:Label></h2>
      <p>Total Package<br />
        <font color="#FF6600">S</font><font color="#0099CC">A</font>V<font color="#3333FF">I</font><font color="#FF6600">N</font><font color="#0099CC">G</font>S $4.00</p>
      </div>
  </div>
  <div class="packages"> <a href="pkgcart/milestonepkgcart.aspx"> <img src="images/home pg images/Milestone package2014_web.jpg" alt="Milestone Package" name="ProductPicture" width="210" height="210" id="ProductPicture3" /></a>
    <div class="description">
      <h6>Milestone Package</h6>
      <h2>Our Price: <asp:Label ID="lblmilestone" runat="server" ForeColor="#D74141" 
                Text="04KMILEPKD"></asp:Label>
        </h2>
      <p>Total Package<br />
        <font color="#FF6600">S</font><font color="#0099CC">A</font>V<font color="#3333FF">I</font><font color="#FF6600">N</font><font color="#0099CC">G</font>S $3.50</p>
      </div>
  </div>
  <div class="packagesend"> <a href="pkgcart/learnerpkgcart.aspx"> <img src="images/home pg images/Learner package2014_web.jpg" alt="Learner Package" name="ProductPicture" width="210" height="210" id="ProductPicture4" /></a>
    <div class="description">
      <h6>Learner Package</h6>
      <h2>Our Price: <asp:Label ID="lbllearner" runat="server" ForeColor="#D74141" Text="05KLEAPKD"></asp:Label></h2>
      <p>Total Package<br />
        <font color="#FF6600">S</font><font color="#0099CC">A</font>V<font color="#3333FF">I</font><font color="#FF6600">N</font><font color="#0099CC">G</font>S $1.00</p>
      </div>
  </div>
  
  <div class="products_accessories">Caps, Gowns, and Tassels</div>
  <div class="products"> <a href="cartpages/capcart.aspx"><img src="images/home pg images/kk_cap.jpg" alt="Caps" name="ProductPicture" width="210" height="210" id="ProductPicture" /></a>
    <div class="description">
      <h6>Caps</h6>
      <h2>Our Price: <asp:Label ID="CAP" runat="server" ForeColor="#D74141" Text="CAP"></asp:Label></h2>
      </div>
  </div> 
  
  <div class="products"> <a href="cartpages/gowncart.aspx"><img src="images/home pg images/kk_gown.jpg" alt="Gowns" name="ProductPicture" width="210" height="210" id="ProductPicture" /></a>
    <div class="description">

      <h6>Gowns</h6>
      <h2>Our Price: <asp:Label ID="GWN" runat="server" ForeColor="#D74141" Text="GWN"></asp:Label></h2>
      </div>
  </div>    
  
  <div class="products"> <a href="cartpages/tasselcart.aspx"><img src="images/home pg images/kk_tassels.jpg" alt="Tassels" name="ProductPicture" width="210" height="210" id="ProductPicture5" /></a>
    <div class="description">
      <h6>Tassels</h6>
      <h2>Our Price: <asp:Label ID="TAS" runat="server" ForeColor="#D74141" Text="TAS"></asp:Label></h2>
      </div>
  </div>
  
  <div class="products_accessories">Accessories</div>
  <div class="products"> <a href="tasselsandsashes.aspx"><img src="images/home pg images/kk_sashes.jpg" alt="Sashes" name="ProductPicture" width="210" height="210" id="ProductPicture6" /></a>
    <div class="description">
      <h6>Sashes</h6>
      <h2>Our Price: <asp:Label ID="KSASH" runat="server" ForeColor="#D74141" Text="KSASH"></asp:Label></h2>
      </div>
  </div>
  
  <div class="products"> <a href="cartpages/diplomacart.aspx"><img src="images/home pg images/kk_certificates.jpg" alt="Diplomas and Certificates" name="ProductPicture" width="210" height="210" id="ProductPicture7" /></a>
    <div class="description">
      <h6>Diplomas and Certificates</h6>
      <h2>Our Price: <asp:Label ID="KDIP" runat="server" ForeColor="#D74141" Text="KDIP"></asp:Label></h2>
      </div>
  </div>
  
  <div class="products"> <a href="cartpages/invitecart.aspx"><img src="images/home pg images/kk_invites_NEW.jpg" alt="Diplomas and Certificates" name="ProductPicture" width="210" height="210" id="ProductPicture7" /></a>
    <div class="description">
      <h6>Invitations</h6>
      <h2>Our Price: <asp:Label ID="KINVITE10PK" runat="server" ForeColor="#D74141" 
              Text="KINVITE10PK"></asp:Label></h2>
      </div>
  </div>
  
  <div class="products"> <a href="cartpages/diplomacovercart.aspx"><img src="images/home pg images/diploma cover.jpg" alt="Diploma Cover" name="ProductPicture" width="210" height="210" id="ProductPicture8" /></a>
    <div class="description">
      <h6>Diploma Cover</h6>
      <h2>Our Price: <asp:Label ID="KDIPC" runat="server" ForeColor="#D74141" Text="KDIPC"></asp:Label></h2>
      </div>
  </div>
  
  <div class="products"> <a href="cartpages/diplomaframecart.aspx"><img src="images/home pg images/kk_paper_frame_NEW.jpg" alt="Magnetic Keepsake Frame" name="ProductPicture" width="210" height="210" id="ProductPicture" /></a>
    <div class="description">
      <h6>Diploma Frame</h6>
      <h2>Our Price: <asp:Label ID="KDIPF" runat="server" ForeColor="#D74141" 
              Text="KDIPF"></asp:Label>
            </h2><br /><br />
      </div>
  </div>
  
  <div class="products"> <a href="cartpages/ribbonscart.aspx"><img src="images/home pg images/kk_ribbons.jpg" alt="Achievement Ribbons" name="ProductPicture" width="210" height="210" id="ProductPicture" /></a>
    <div class="description">
      <h6>Achievement Ribbons</h6>
      <h2>Our Price: <asp:Label ID="KRIBBON10PK" runat="server" ForeColor="#D74141" Text="KRIBBON10PK"></asp:Label></h2> 
      <h3>package of 10 for each design </h3>
    </div>
  </div>
  
  <div class="products"> <a href="cartpages/medalcart.aspx"><img src="images/home pg images/kk_medallion.jpg" alt="Bright Future Medallions" name="ProductPicture" width="210" height="210" id="ProductPicture" /></a>
    <div class="description">
      <h6>Bright Future Medallions</h6>
      <h2>Our Price: <asp:Label ID="KMED" runat="server" ForeColor="#D74141" Text="KMED"></asp:Label></h2><br /><br />


      </div>
  </div>
  
  
  <div class="products"> <a href="cartpages/gradteecart.aspx"><img src="images/home pg images/kk_gradtee.jpg" alt="Graduate Tee" name="ProductPicture" width="210" height="210" id="ProductPicture" /></a>
    <div class="description">
      <h6>Graduate Tee</h6>
      <h2>Our Price: <asp:Label ID="KTSHIRT" runat="server" ForeColor="#D74141" Text="KTSHIRT"></asp:Label></h2><br /><br />

      </div>
  </div>
  
 
  
  <div class="products"> <a href="cartpages/wristbandcart.aspx"><img src="images/home pg images/kk_wrist_2.jpg" alt="Graduate Wristband" name="ProductPicture" width="210" height="210" id="ProductPicture" /></a>
    <div class="description">
      <h6>Graduate Wristband</h6>
      <h2>Our Price: <asp:Label ID="KWRIST" runat="server" ForeColor="#D74141" Text="KWRIST"></asp:Label></h2>
      
      
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
