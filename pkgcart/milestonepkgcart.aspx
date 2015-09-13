<%@ Page Title="" Language="VB"  AutoEventWireup="false" CodeFile="milestonepkgcart.aspx.vb" Inherits="milestonepkgcart" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_LayoutSubfolder.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>Milestone Package</title>
  
<script type="text/javascript" src="../cssverticalmenu.js">
</script>
      <script language="javascript">

          function changevalue(obj) {
              Select_Value_Set("ddlcapclr", "form1", obj.id);
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
			
		</script>
<script language="javascript">
    function changevalue(obj) {
        Select_Value_Set("ddlcapclr", "form1", obj.id);
    }
    function changevalue2(obj) {
        Select_Value_Set("ddltasclr", "form1", obj.id);
    }

    function Select_Value_Set(SelectName, FormName, Value) {

        eval('SelectObject = document.' + FormName + '.' + SelectName + ';');


        for (index = 0; index < SelectObject.length; index++) {
            if (SelectObject[index].value == Value)
                SelectObject.selectedIndex = index;
        }
    }




    function MM_popupMsg(msg) { //v1.0
        alert(msg);
    }
    



   
    function MM_preloadImages() { //v3.0
        var d = document; if (d.images) {
            if (!d.MM_p) d.MM_p = new Array();
            var i, j = d.MM_p.length, a = MM_preloadImages.arguments; for (i = 0; i < a.length; i++)
                if (a[i].indexOf("#") != 0) { d.MM_p[j] = new Image; d.MM_p[j++].src = a[i]; }
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
</script> 

    
<!-- InstanceEndEditable -->

<link href="../css/cssverticalmenu.css" rel="stylesheet" type="text/css" />
<link href="../css/package.css" rel="stylesheet" type="text/css" />
<link href="../css/package_cartpgs.css" rel="stylesheet" type="text/css" />
<link href="../css/master.css" rel="stylesheet" type="text/css" />
<link href="../css/productboxes.css" rel="stylesheet" type="text/css" />
</head> 

<body onload="MM_preloadImages('../images/capsandgowns/caps/008.jpg','../images/capsandgowns/caps/006.jpg','../images/capsandgowns/caps/003.jpg','../images/capsandgowns/caps/007.jpg','../images/capsandgowns/caps/005.jpg','../images/capsandgowns/caps/002.jpg','../images/capsandgowns/caps/001.jpg','../images/capsandgowns/caps/000.jpg','../images/capsandgowns/caps/004.jpg','../images/tasselsandsashes/tassels/0002.jpg','../images/tasselsandsashes/tassels/00011.jpg','../images/tasselsandsashes/tassels/0008.jpg','../images/tasselsandsashes/tassels/0009.jpg','../images/tasselsandsashes/tassels/00010.jpg','../images/tasselsandsashes/tassels/0003.jpg','../images/tasselsandsashes/tassels/0001.jpg','../images/tasselsandsashes/tassels/0000.jpg','../images/tasselsandsashes/tassels/0005.jpg','../images/tasselsandsashes/tassels/0006.jpg','../images/tasselsandsashes/tassels/0004.jpg','../images/tasselsandsashes/tassels/0007.jpg','../images/tasselsandsashes/tassels/00012.jpg','../images/tasselsandsashes/tassels/00013.jpg')">

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
    <li><a href="../cartpages/banners.aspx" ><span style="color:#DF0003; font-weight:500">NEW! </span> Graduation Banners</a></li>
    <!--<li><a href="../clearance.aspx" >Clearance</a></li> -->
   	<li><asp:LinkButton ID="LinkButton1" runat="server" Visible="False" 
		PostBackUrl="~/Admin/Admin.aspx">Administration</asp:LinkButton></li>
 </ul>
  
  	<div id="ssl"> <img src="../images/verisign.png" width="75" height="38" alt="SSL Certificate" />
    </div>
</div>

<!-- InstanceBeginEditable name="Content" -->

<div id="content">

	<table style="width: 673px; height: auto; margin-right: 0px;" cellpadding="0" cellspacing="0">
		<tr>
			<td class="style13" valign="top" height="30">
				<a href="../shopjostenshome.aspx">Home</a> &gt; <a href="../packages.aspx">Packages</a><br /><strong><span class="style15">Milestone Package<br /><br /></span></strong>
           	</td>
			<td></td>
		</tr>
		<tr>
			<td valign="top">
				<img src="../images/package/milestonepackage.jpg" name="theImg5"  height="339" id="theImg5" onmouseover="MM_swapImgRestore()"   /><asp:Label ID="lblprodcode" runat="server" ForeColor="Black" Text="04KMILEPKD" Visible="False"></asp:Label>
			</td>
			<td valign="top" rowspan="2">
				<div  id="packprice"> 
					<strong>Our Price: <span class="red">$</span><asp:Label ID="LBLPKG" runat="server" ForeColor="#D74141" Text="04KMILEPKD"></asp:Label></strong><br /><br />
            <p>The following items are included in this package:</p>
            <ul>
              <li>Cap</li>
              <li>Tassel</li>
              <li>Tee</li>
            </ul>
            	</div>

				<div id="select_options">
          			<h3>Choose your options</h3>
          				<table width="415" border="0" cellspacing="2" cellpadding="1">
          					<tr>
        	    				<td>
                                	<table border="0" cellspacing="2" cellpadding="1">
              							<tr>
                                        	<td colspan="2" >
                        					<script>
                            					var img5 = ["../images/capsandgowns/cap.jpg", "../images/capsandgowns/caps/008.jpg", "../images/capsandgowns/caps/006.jpg", "../images/capsandgowns/caps/003.jpg", "../images/capsandgowns/caps/007.jpg", "../images/capsandgowns/caps/005.jpg", "../images/capsandgowns/caps/002.jpg", "../images/capsandgowns/caps/001.jpg", "../images/capsandgowns/caps/000.jpg", "../images/capsandgowns/caps/004.jpg", "../images/capsandgowns/caps/008.jpg"];
                            				</script>
                      <a href="#" onclick="MM_swapImage('theImg5','','../images/capsandgowns/caps/008.jpg',1)">
                        <img src="../images/capsandgowns/caps/black1.jpg" alt="" width="37" height="40" 
                                id="246" onclick="changevalue(this);" border="0" /></a>
                       <a href="#" onclick="MM_swapImage('theImg5','','../images/capsandgowns/caps/006.jpg',1)">
                        <img src="../images/capsandgowns/caps/purple1.jpg" alt="" width="37" height="40"  border="0" id="241" onclick="changevalue(this);" /></a>
                        <a href="#" onclick="MM_swapImage('theImg5','','../images/capsandgowns/caps/003.jpg',1)" >
                        <img src="../images/capsandgowns/caps/yellow1.jpg" alt="" width="37" height="40" border="0" id="238" onclick="changevalue(this);" /></a>
                        <a href="#" onclick="MM_swapImage('theImg5','','../images/capsandgowns/caps/007.jpg',1)">
                        <img src="../images/capsandgowns/caps/green1.jpg" alt="" width="37" height="40" id="243" onclick="changevalue(this);" border="0" /></a>
                        <a href="#" onclick="MM_swapImage('theImg5','','../images/capsandgowns/caps/005.jpg',1)">
                        <img src="../images/capsandgowns/caps/lblue1.jpg" alt="" width="37" height="40" border="0" id="240" onclick="changevalue(this);" /></a>
                        <a href="#" onclick="MM_swapImage('theImg5','','../images/capsandgowns/caps/002.jpg',1)">
                        <img src="../images/capsandgowns/caps/pink1.jpg" alt="" width="37" height="40" id="237" onclick="changevalue(this);" border="0" /></a>
                        <a href="#" onclick="MM_swapImage('theImg5','','../images/capsandgowns/caps/001.jpg',1)">
                        <img src="../images/capsandgowns/caps/red1.jpg" alt="" width="37" height="40" id="236" onclick="changevalue(this);" border="0" /></a>
                        <a href="#" onclick="MM_swapImage('theImg5','','../images/capsandgowns/caps/000.jpg',1)">
                        <img src="../images/capsandgowns/caps/blue1.jpg" alt="" width="37" height="40" id="242" onclick="changevalue(this);" border="0" /></a>
                            <a href="#" onclick="MM_swapImage('theImg5','','../images/capsandgowns/caps/004.jpg',1)">
                        <img src="../images/capsandgowns/caps/white1.jpg" alt="" width="37" height="40" id="239" onclick="changevalue(this);" border="0" /></a>
                       					</td>
                      				</tr>
                    				<tr>
                        				<td width="138">Cap Color*:
                                            <asp:CustomValidator ID="CustomValidator3" runat="server" 
                                                ControlToValidate="ddlcapclr" Display="Dynamic" 
                                                ErrorMessage="Color Out Of Stock" ValidationGroup="g1" Enabled="False"></asp:CustomValidator>
                                        </td>
										<td width="267">
                                            <asp:DropDownList  runat="server" Height="23px" Width="140px" 
                                                onchange="change(this);" ID="ddlcapclr" DataSourceID="dscapclr" 
                                                DataTextField="optiondesc" DataValueField="id" AutoPostBack="True" 
                                                CausesValidation="True" ValidationGroup="g1"></asp:DropDownList>
                             				<script>
                                 				function change(x) {
                                     				var i = document.getElementById("theImg5");
                                     				i.src = img5[x.selectedIndex];
                                 				}
											</script>
										</td>
             						</tr>
              						<tr>
                						<td colspan="2">
                  									<script>  var img2 = ["../images/tasselsandsashes/tassels/00013.jpg", "../images/tasselsandsashes/tassels/00013.jpg", "../images/tasselsandsashes/tassels/0002.jpg", "../images/tasselsandsashes/tassels/00011.jpg", "../images/tasselsandsashes/tassels/0008.jpg", "../images/tasselsandsashes/tassels/0009.jpg", "../images/tasselsandsashes/tassels/00010.jpg", "../images/tasselsandsashes/tassels/0003.jpg", "../images/tasselsandsashes/tassels/0001.jpg", "../images/tasselsandsashes/tassels/0000.jpg", "../images/tasselsandsashes/tassels/0005.jpg", "../images/tasselsandsashes/tassels/0006.jpg", "../images/tasselsandsashes/tassels/0004.jpg", "../images/tasselsandsashes/tassels/0007.jpg", "../images/tasselsandsashes/tassels/00012.jpg"];
                                                    </script>
                         
                         <a href="#" onclick="MM_swapImage('theImg5','','../images/tasselsandsashes/tassels/00013.jpg',1)">
<img src="../images/tasselsandsashes/tassels/tassel_small_NEW/Tassel_black_15_SM.jpg" alt=""  id="261" onclick="changevalue2(this);" border="0" /></a>

<a href="#" onclick="MM_swapImage('theImg5','','../images/tasselsandsashes/tassels/0002.jpg','180','','../images/tasselsandsashes/tassels/0002.jpg',1)">
<img src="../images/tasselsandsashes/tassels/tassel_small_NEW/Tassel_rainbow_13_SM.jpg" alt="" width="23" height="55" border="0"id="180" onclick="changevalue2(this);" /></a>

<a href="#" onclick="MM_swapImage('theImg5','','../images/tasselsandsashes/tassels/00011.jpg',1)">
 <img src="../images/tasselsandsashes/tassels/tassel_small_NEW/Tassel_purple_13_SM.jpg" alt="" width="23" height="55" id="189" onclick="changevalue2(this);" border="0" /></a>
 
 <a href="#" onclick="MM_swapImage('theImg5','','../images/tasselsandsashes/tassels/0008.jpg',1)">
 <img src="../images/tasselsandsashes/tassels/tassel_small_NEW/Tassel_yellow_13_SM.jpg" alt="" id="186" onclick="changevalue2(this);" border="0" /></a>
 
 <a href="#" onclick="MM_swapImage('theImg5','','../images/tasselsandsashes/tassels/0009.jpg',1)">
 <img src="../images/tasselsandsashes/tassels/tassel_small_NEW/Tassel_blue_gold_13_SM.jpg" alt="" id="187" onclick="changevalue2(this);" border="0" /></a>
                
<a href="#" onclick="MM_swapImage('theImg5','','../images/tasselsandsashes/tassels/00010.jpg',1)">
<img src="../images/tasselsandsashes/tassels/tassel_small_NEW/Tassel_green_13_SM.jpg" alt="" id="188" onclick="changevalue2(this);" border="0" /></a>
                        
<a href="#" onclick="MM_swapImage('theImg5','','../images/tasselsandsashes/tassels/0003.jpg',1)">
<img src="../images/tasselsandsashes/tassels/tassel_small_NEW/Tassel_lt blue_13_SM.jpg" alt="" id="181" onclick="changevalue2(this);"  border="0" /></a>
                       
 <a href="#" onclick="MM_swapImage('theImg5','','../images/tasselsandsashes/tassels/0001.jpg',1)">
 <img src="../images/tasselsandsashes/tassels/tassel_small_NEW/Tassel_pastels_13_SM.jpg" alt="" id="179" onclick="changevalue2(this);" border="0" /></a>
                        
 <a href="#" onclick="MM_swapImage('theImg5','','../images/tasselsandsashes/tassels/0000.jpg',1)">
 <img src="../images/tasselsandsashes/tassels/tassel_small_NEW/Tassel_pink_13_SM.jpg" alt="" id="178" onclick="changevalue2(this);" border="0" /></a>
                       
 <a href="#" onclick="MM_swapImage('theImg5','','../images/tasselsandsashes/tassels/0005.jpg',1)">
<img src="../images/tasselsandsashes/tassels/tassel_small_NEW/Tassel_red_13_SM.jpg" alt="" id="183" onclick="changevalue2(this);" border="0" /></a>
                       
<a href="#" onclick="MM_swapImage('theImg5','','../images/tasselsandsashes/tassels/0006.jpg',1)">
<img  src="../images/tasselsandsashes/tassels/tassel_small_NEW/Tassel_red_white_13_SM.jpg" alt="" id="184" onclick="changevalue2(this);" border="0" /></a>
                        
<a href="#" onclick="MM_swapImage('theImg5','','../images/tasselsandsashes/tassels/0004.jpg',1)">
<img src="../images/tasselsandsashes/tassels/tassel_small_NEW/Tassel_blue_13_SM.jpg" alt=""  id="182" onclick="changevalue2(this);" border="0" /></a>
                        
<a href="#" onclick="MM_swapImage('theImg5','','../images/tasselsandsashes/tassels/0007.jpg',1)">
<img src="../images/tasselsandsashes/tassels/tassel_small_NEW/Tassel_Blue_white_13_SM.jpg" alt=""  id="185" onclick="changevalue2(this);" border="0" /></a>
                        
<a href="#" onclick="MM_swapImage('theImg5','','../images/tasselsandsashes/tassels/00012.jpg',1)">
<img src="../images/tasselsandsashes/tassels/tassel_small_NEW/Tassel_white_13_SM.jpg" alt=""  id="245" onclick="changevalue2(this);" border="0" /></a>
                							</td>
              						</tr>
             						<tr>
                						<td height="30">Tassel Color*:
                                        </td>
               							<td><asp:DropDownList  runat="server" Height="25px" Width="140px" onchange="change2(this);" ID="ddltasclr" datasourceid="tasclr" DataTextField="optiondesc" DataValueField="id"></asp:DropDownList>
                  								<script>
                      								function change2(x) {
                          								var i = document.getElementById("theImg5");
                          								i.src = img2[x.selectedIndex];
                      								}
              									</script>
                                    	</td>
              						</tr>
              					  	<tr>
    									<td>Tee Size*:
                                        </td>
    									<td><asp:DropDownList  runat="server" Height="23px" Width="163px" ID="ddlteesize" DataSourceID="dstee" DataTextField="optiondesc" DataValueField="id"></asp:DropDownList>
      									</td>
 									</tr>
  									<tr>
    									<td colspan="2">Pkg Qty:<asp:TextBox ID="txtqty" runat="server" Width="36px" causesvalidation="True">1</asp:TextBox> &nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" Text="Add to Cart " ValidationGroup="g1"/><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter quantity" ControlToValidate="txtqty" ForeColor="Red" ValidationGroup="g1"></asp:RequiredFieldValidator><br />
      										<span class="pkg_order_instr">Place orders for one cap/tassel color at a time.</span>
                    					</td>
  									</tr> 
           					 </table>
                      	</td>
                 	</tr>
         	 </table>
          		<div class="req_field_val">
                <asp:RegularExpressionValidator ID="numval" runat="server" 
                    ControlToValidate="txtqty" ErrorMessage="Enter a numeric value" ForeColor="Red" 
                    ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
				<br />
			<asp:CustomValidator ID="CustomValidator2" runat="server" 
                    ErrorMessage="CustomValidator" ForeColor="Red" ValidationGroup="g1"></asp:CustomValidator></div></div>
</table>
					
<asp:SqlDataSource ID="dscapclr" runat="server" 
				ConnectionString="<%$ ConnectionStrings:KK5 %>" 
				ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
				
                
        
        SelectCommand="SELECT id, optiondesc FROM options WHERE (optioncatid = 45) ORDER BY optiondesc">
			</asp:SqlDataSource>
			<asp:SqlDataSource ID="tasclr" runat="server" 
				ConnectionString="<%$ ConnectionStrings:KK5 %>" 
				ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
				
				
                
        SelectCommand="SELECT id, optiondesc FROM options WHERE (optioncatid = 36) ORDER BY optiondesc">
			</asp:SqlDataSource>
			<asp:SqlDataSource ID="dstee" runat="server" 
				ConnectionString="<%$ ConnectionStrings:KK5 %>" 
				ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
				
				
                
                
        SelectCommand="SELECT id, optiondesc FROM options WHERE (optioncatid = 42) ORDER BY optiondesc">
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
