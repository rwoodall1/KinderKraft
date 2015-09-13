<%@ Page Language="VB" AutoEventWireup="false" CodeFile="invitecart.aspx.vb" Inherits="cartpages_invitecart" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_LayoutSubfolder.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>Invitations</title>

<script type="text/javascript" src="../cssverticalmenu.js">
</script>
<script language="javascript">
    function changevalue(obj) {
        Select_Value_Set("ddlclr", "form1", obj.id);
    }

    /* This script and many more are available free online at
    The JavaScript Source :: http://javascript.internet.com
    Created by: Francis Cocharrua :: http://scripts.franciscocharrua.com/ */

    function Select_Value_Set(SelectName, FormName, Value) {

        eval('SelectObject = document.' + FormName + '.' + SelectName + ';');


        for (index = 0; index < SelectObject.length; index++) {
            if (SelectObject[index].value == Value)
                SelectObject.selectedIndex = index;
        }
    }
    function MM_swapImgRestore() { //v3.0
        var i, x, a = document.MM_sr; for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
    }
    function MM_preloadImages() { //v3.0
        var d = document; if (d.images) {
            if (!d.MM_p) d.MM_p = new Array();
            var i, j = d.MM_p.length, a = MM_preloadImages.arguments; for (i = 0; i < a.length; i++)
                if (a[i].indexOf("#") != 0) { d.MM_p[j] = new Image; d.MM_p[j++].src = a[i]; } 
        }
    }

    function MM_findObj(n, d) { //v4.01
        var p, i, x; if (!d) d = document; if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
            d = parent.frames[n.substring(p + 1)].document; n = n.substring(0, p);
        }
        if (!(x = d[n]) && d.all) x = d.all[n]; for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
        for (i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n, d.layers[i].document);
        if (!x && d.getElementById) x = d.getElementById(n); return x;
    }

    function MM_swapImage() { //v3.0
        var i, j = 0, x, a = MM_swapImage.arguments; document.MM_sr = new Array; for (i = 0; i < (a.length - 2); i += 3)
            if ((x = MM_findObj(a[i])) != null) { document.MM_sr[j++] = x; if (!x.oSrc) x.oSrc = x.src; x.src = a[i + 2]; }
    }
    function MM_showHideLayers() { //v9.0
        var i, p, v, obj, args = MM_showHideLayers.arguments;
        for (i = 0; i < (args.length - 2); i += 3)
            with (document) if (getElementById && ((obj = getElementById(args[i])) != null)) {
                v = args[i + 2];
                if (obj.style) { obj = obj.style; v = (v == 'show') ? 'visible' : (v == 'hide') ? 'hidden' : v; }
                obj.visibility = v;
            }
    }
</script>

<!-- InstanceEndEditable -->

<link href="../css/cssverticalmenu.css" rel="stylesheet" type="text/css" />
<link href="../css/package.css" rel="stylesheet" type="text/css" />
<link href="../css/package_cartpgs.css" rel="stylesheet" type="text/css" />
<link href="../css/master.css" rel="stylesheet" type="text/css" />
<link href="../css/productboxes.css" rel="stylesheet" type="text/css" />
</head> 

<body onload="MM_preloadImages('../images/diplomasandcertificates/invites/99172 Chalkboard_Invites_LARGE.jpg','../images/diplomasandcertificates/invites/99172 LearnGrow_Invites_LARGE.jpg','../images/diplomasandcertificates/invites/99172 LearningBlocks_Invite_LARGE.jpg','../images/diplomasandcertificates/invites/99172 SmartStarts_Invites_LARGE.jpg')">

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

<table style="width: 660px; height: 405px" cellpadding="0" cellspacing="0">
	<tr>
		<td class="style13" valign="top">
			<a href="../shopjostenshome.aspx">Home</a> &gt;<a href="invitecart.aspx">Invitations</a><br /><strong><span class="style15">Invitations<br /><br /></span></strong>
        </td>
		<td></td>
	</tr>
		<tr>
			<td rowspan="2" valign="top">
				<img src="../images/diplomasandcertificates/invitesmain.jpg" name="InviteMain" id="InviteMain" onmouseover="MM_swapImgRestore()" />
            </td>
			<td height="77">
				<div id="packprice" style="height:auto"><strong>Our Price: <span class="red">$</span><font><asp:Label 
                        ID="KINVITE10PK" runat="server" ForeColor="#D74141" Text="KINVITE10PK"></asp:Label><br /><br /></font></strong>Printed on high-quality paper. Envelopes are included. 6¼&quot;  x 4½&quot;<br />Each design comes in a package of 10.
				</div>
            </td>
	    <tr>
        	<td height="202" valign="top" style="height:auto"> 
            	<div id="select_options">
					<h3>Choose your options...</h3>
						<table width="400">
                        <script>
                            var img = [, "../images/diplomasandcertificates/invites/99172 BrightBeginnings_Invites_LARGE.jpg",
                            "../images/diplomasandcertificates/invites/99172 Chalkboard_Invites_LARGE.jpg",
                             "../images/diplomasandcertificates/invites/99172 LearnGrow_Invites_LARGE.jpg",
                             "../images/diplomasandcertificates/invites/99172 LearningBlocks_Invite_LARGE.jpg",
                              "../images/diplomasandcertificates/invites/99172 SmartStarts_Invites_LARGE.jpg"];
                               </script>
							<tr>
					  			<td colspan="2">
 <a href="#" onclick="MM_swapImage('theImg','','../images/capsandgowns/gowns/08.jpg',1)">
					 <a href="javascript:;" onclick="MM_swapImage('InviteMain','','../images/diplomasandcertificates/invites/99172 BrightBeginnings_Invites_LARGE.jpg',1)">
                      <img src="../images/diplomasandcertificates/invites/99172 BrightBeginnings_Invites.jpg" 
                                        alt="Bright Beginnings Invite" name="BBInvite" width="37" height="27" id="251" 
                                        border="0" onclick="changevalue(this);" /></a>
                      <a href="javascript:;" onclick="MM_swapImage('InviteMain','','../images/diplomasandcertificates/invites/99172 Chalkboard_Invites_LARGE.jpg',1)">
                      <img src="../images/diplomasandcertificates/invites/99172 Chalkboard_Invites.jpg" 
                                        alt="Chalkboard Invite" name="CInvite" width="37" height="27" id="252" 
                                        border="0"   onclick="changevalue(this);" /></a>
                      <a href="javascript:;" onclick="MM_swapImage('InviteMain','','../images/diplomasandcertificates/invites/99172 LearnGrow_Invites_LARGE.jpg',1)">
                      <img src="../images/diplomasandcertificates/invites/99172 LearnGrow_Invites.jpg" 
                                        alt="Learn and Grow Invite" name="LGInvite" width="37" height="27" id="253" 
                                        border="0"   onclick="changevalue(this);"  /></a>
                      <a href="javascript:;" onclick="MM_swapImage('InviteMain','','../images/diplomasandcertificates/invites/99172 LearningBlocks_Invite_LARGE.jpg',1)">
                      <img src="../images/diplomasandcertificates/invites/99172 LearningBlocks_Invite.jpg" 
                                        alt="Learning Blocks Invite" name="LBInvite" width="37" height="26" id="254" 
                                        border="0" onclick="changevalue(this);" /></a>
                      <a href="javascript:;" onclick="MM_swapImage('InviteMain','','../images/diplomasandcertificates/invites/99172 SmartStarts_Invites_LARGE.jpg',1)">
                      <img src="../images/diplomasandcertificates/invites/99172 SmartStarts_Invites.jpg" 
                                        alt="Smart Starts Invite" name="SSInvite" width="37" height="27" id="255" 
                                        border="0"onclick="changevalue(this);" /></a></td></tr>
					
                    <tr>
						<td width="75">Invitation*:</td>
						<td width="303"><asp:DropDownList  runat="server" Height="27px" Width="187px" onchange="javascript:change(this);" ID="ddlclr" DataSourceID="dscolor" DataTextField="optiondesc" DataValueField="id"></asp:DropDownList>
						</td>
					</tr>
                    <script>
                        function change(x) {
                            var i = document.getElementById("InviteMain");
                            i.src = img[x.selectedIndex];
                        }
				</script>
					<tr>
						<td class="style9" colspan="2" valign="middle">Qty: <asp:TextBox ID="txtqty" runat="server" Width="36px">1</asp:TextBox>&nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" Text="Add to Cart "/><em><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter quantity" ControlToValidate="txtqty" ForeColor="Red"></asp:RequiredFieldValidator></em>
						</td>
					</tr>
				</table>
                
                	<div class="req_field_val">
                    	<asp:CustomValidator ID="CustomValidator2" runat="server" 
                            ErrorMessage="CustomValidator" ForeColor="Red" ControlToValidate="ddlclr"></asp:CustomValidator><asp:RegularExpressionValidator ID="numval" runat="server" ControlToValidate="txtqty" ErrorMessage="Enter a numeric value" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                    </div>
</div>
</table>
       			<asp:SqlDataSource ID="dscolor" runat="server" 
				ConnectionString="<%$ ConnectionStrings:KK5 %>" 
				ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
				
        SelectCommand="SELECT id, optiondesc, selectorder FROM options WHERE (optioncatid = 47) ORDER BY selectorder, optiondesc">
			</asp:SqlDataSource> 

<table width="700" border="0" cellspacing="1" cellpadding="2">
  <tr>
    <td height="100">
    	<div id="feature20"></div>
    	<div id="feature21"></div>
        <div id="feature22"></div>
        <div id="feature23"></div>
        <div id="feature24"></div>
    </td>
  </tr>
  <tr>
    <td><div class="diploma_lg"><p>Mouse over invitation to see larger image.</p>  
    <img src="../images/diplomasandcertificates/invites/99172 BrightBeginnings_Invites_LARGE.jpg" name="bright1" width="130" height="93" id="bright1" onmouseover="MM_showHideLayers('feature20','','show')" onmouseout="MM_showHideLayers('feature20','','hide')" />      
    <img src="../images/diplomasandcertificates/invites/99172 Chalkboard_Invites_LARGE.jpg" name="bright2" width="130" height="93" id="bright2" onmouseover="MM_showHideLayers('feature21','','show')" onmouseout="MM_showHideLayers('feature21','','hide')" />      
    <img src="../images/diplomasandcertificates/invites/99172 LearnGrow_Invites_LARGE.jpg" name="bright3" width="130" height="94" id="bright3" onmouseover="MM_showHideLayers('feature22','','show')" onmouseout="MM_showHideLayers('feature22','','hide')" />  
    <img src="../images/diplomasandcertificates/invites/99172 LearningBlocks_Invite_LARGE.jpg" name="bright3" width="130" height="91" id="bright3" onmouseover="MM_showHideLayers('feature23','','show')" onmouseout="MM_showHideLayers('feature23','','hide')" />    
    <img src="../images/diplomasandcertificates/invites/99172 SmartStarts_Invites_LARGE.jpg" name="flower1" width="130" height="94" id="flower1" onmouseover="MM_showHideLayers('feature24','','show')" onmouseout="MM_showHideLayers('feature24','','hide')" />      
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
