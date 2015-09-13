<%@ Page Title="" Language="VB"  AutoEventWireup="false" CodeFile="gownmarker.aspx.vb" Inherits="gownmarker" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_LayoutSubfolder.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>Gown Signing Marker</title>

<link href="../css/master.css" rel="stylesheet" type="text/css" media="screen"/>
<link rel="stylesheet" type="text/css" href="../css/cssverticalmenu.css" />

<script type="text/javascript" src="../cssverticalmenu.js">

</script>
<script language="JavaScript" type="text/JavaScript">
    function showT(q) {
        document.getElementById('theImg3').setAttribute('src', '0000' + q + '.jpg')
    } 
</script>


<script type="text/javascript">
<!--
    function diva_imgBySel(objId, theValue) { //v0.1 divaHTML.com

        var imgs = ["TEST.JPG", "00005.jpg", "00006.jpg", "00007.jpg", "00000.jpg", "00004.jpg", "00003.jpg", "00002.jpg", "00001.jpg"];

        var d = document;
        theValue = imgs[theValue];
        if (!theValue || !d.getElementById) return;
        var obj = d.getElementById(objId);
        if (obj) obj.src = theValue;
    }
</script>




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
			<strong><span class="style15">Gown Signing Marker<br />
			<br />
			</span></strong></td>
		<td  valign="top" class="style17">
			<br />
		</td>
	</tr>
	<tr>
		<td height="229" valign="top" class="style18">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<img id="theImg3" class="style11" name="theImg"
				src="../images/package/marker.jpg" /><br />
			<br />
			&nbsp;&nbsp;
			&nbsp;&nbsp;
			</td>
		<td class="style18" valign="top">
		<div  class="productcodebox" style="width: 337px; height: 65px"> 
			<strong>Only Available In A Grad Package</strong><font><em><br />
			<span class="style19">Free W/A Grad Package</span><br />
			<br />
			</em></font></div>
			</td>
	</tr>
	<tr>
		<td height="65" colspan="2" valign="top">
			<div class="sashcart">
			<div class="sashcartdark">
				<em>Description</em></div>
				Commitment to Graduate certificate and marker to sign their gown in every 
                Graduate, Scholar and Achiever Package!</div></td>
	</tr>
	<tr>
		
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
