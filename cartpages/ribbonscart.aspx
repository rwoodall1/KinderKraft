<%@ Page Title="" Language="VB"  AutoEventWireup="false" CodeFile="ribbonscart.aspx.vb" Inherits="ribbonscart" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_LayoutSubfolder.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>Achievement Ribbon</title>

<script type="text/javascript" src="../cssverticalmenu.js">
</script>

<script type="text/javascript">
    function changevalue(obj) {
        Select_Value_Set("ddlclr1", "form1", obj.id);
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
    function MM_preloadImages() { //v3.0
        var d = document; if (d.images) {
            if (!d.MM_p) d.MM_p = new Array();
            var i, j = d.MM_p.length, a = MM_preloadImages.arguments; for (i = 0; i < a.length; i++)
                if (a[i].indexOf("#") != 0) { d.MM_p[j] = new Image; d.MM_p[j++].src = a[i]; } 
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
			<a href="../shopjostenshome.aspx">Home</a> &gt; <a href="../accessories.aspx">Accessories</a><br /><strong><span class="style15">Achievement Ribbon<br /><br /></span></strong>
        </td>
		<td></td>
	</tr>
	<tr>
		<td rowspan="2" valign="top">
        <img src="../images/accessories/achievementribbions.jpg"  name="theImg" id="theImg3" onmouseout="MM_swapImgRestore()"/>
		</td>
        		
		<td height="64" valign="top">
			<div id="packprice" style="height:auto"> 
				<strong>Our Price: <span class="red">$</span><asp:Label ID="KRIBBON10PK" runat="server" ForeColor="#D74141" Text="KRIBBON10PK"></asp:Label>(package of 10 for each design)<br /></strong><br />Celebrate their accomplishment with these colorful and fun ribbons. 6 unique designs to choose from: Graduate, Great Job,&nbsp; I Know My Numbers, I Know My ABCs, I Know My Colors or Attendance. 1.6” x 6”. Each design available in packs of 10.
			</div>
        </td>
            
            
      <tr>
      	<td height="202" valign="top" style="height:auto">
        	<div id="select_options">
				<h3>Choose your options...</h3>
					<table width="400">
							<tr>
					  			<td class="style9" colspan="2">
                          			<script type="text/javascript"> var img =  ["../images/accessories/ribbions/ribbon.jpg", "../images/accessories/ribbions/00000006.jpg", "../images/accessories/ribbions/00000000.jpg", "../images/accessories/ribbions/00000001.jpg", "../images/accessories/ribbions/00000004.jpg", "../images/accessories/ribbions/00000005.jpg", "../images/accessories/ribbions/00000003.jpg"];
                                    </script>
                          
                          <a href="javascript:;" onclick="MM_swapImage('theImg3','','../images/accessories/ribbions/00000006.jpg',1)"><img src="../images/accessories/ribbions/attendance.jpg" alt="" id="219" border="0" onclick="changevalue(this);" /></a>
                          
                          <a href="javascript:;" onclick="MM_swapImage('theImg3','','../images/accessories/ribbions/00000000.jpg',1)"><img src="../images/accessories/ribbions/whitegrad.jpg" alt="" id="213"border="0" onclick="changevalue(this);"/></a><a href="javascript:;" onclick="MM_swapImage('theImg3','','../images/accessories/ribbions/00000001.jpg',1)"><img src="../images/accessories/ribbions/greatjob.jpg" alt="" id="214" border="0" onclick="changevalue(this);"/></a>
                          
                          <a href="javascript:;" onclick="MM_swapImage('theImg3','','../images/accessories/ribbions/00000004.jpg',1)"><img src="../images/accessories/ribbions/knoabc.jpg" alt="" id="217" border="0" onclick="changevalue(this);"/></a>
                          
                          
                          <a href="javascript:;" onclick="MM_swapImage('theImg3','','../images/accessories/ribbions/00000005.jpg',1)"><img src="../images/accessories/ribbions/knowcolors.jpg" alt="" id="218" border="0" onclick="changevalue(this);" /></a>
                          
                          <a href="javascript:;" onclick="MM_swapImage('theImg3','','../images/accessories/ribbions/00000003.jpg',1)"><img src="../images/accessories/ribbions/knownum.jpg" alt="" id="216" border="0" onclick="changevalue(this);" /></a></td>
						</tr>
						
                        <tr>
							<td>Ribbon Options*:</td>
						
                        	<td><asp:DropDownList  runat="server" Height="20px" Width="188px" onchange="change(this);" ID="ddlclr1" DataSourceID="dscolor" DataTextField="optiondesc" DataValueField="id"></asp:DropDownList>
                          
						  <script type="text/javascript">
                              function change(x) {
                                  var i = document.getElementById("theImg3");
                                  i.src = img[x.selectedIndex];
                              }
						</script>
							</td>
					</tr>
					
                    <tr>
						<td colspan="2" valign="middle">Qty: <asp:TextBox ID="txtqty" runat="server" Width="36px">1</asp:TextBox> &nbsp;&nbsp;&nbsp; <asp:Button ID="Button1" runat="server" Text="Add to Cart "/> <font><em> <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter quantity" ControlToValidate="txtqty" ForeColor="Red"></asp:RequiredFieldValidator></em></font> 
						</td>
					</tr>
			  </table>
					
                    <div class="req_field_val">
                    	<asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="CustomValidator" ForeColor="Red"></asp:CustomValidator><asp:RegularExpressionValidator ID="numval" runat="server" ControlToValidate="txtqty" ErrorMessage="Enter a numeric value" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
					</div>
          </div>
          	
</table>
			<asp:SqlDataSource ID="dscolor" runat="server" 
				ConnectionString="<%$ ConnectionStrings:KK5 %>" 
				ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 	
                SelectCommand="SELECT id, optiondesc FROM options WHERE (optioncatid = 43) ORDER BY optiondesc">
			</asp:SqlDataSource>
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
