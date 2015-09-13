<%@ Page Title="" Language="VB"  AutoEventWireup="false" CodeFile="sashescart.aspx.vb" Inherits="sashescart" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_LayoutSubfolder.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>Graduate Sash</title>

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
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
</script>

<!-- InstanceEndEditable -->

<link href="../css/cssverticalmenu.css" rel="stylesheet" type="text/css" />
<link href="../css/package.css" rel="stylesheet" type="text/css" />
<link href="../css/package_cartpgs.css" rel="stylesheet" type="text/css" />
<link href="../css/master.css" rel="stylesheet" type="text/css" />
<link href="../css/productboxes.css" rel="stylesheet" type="text/css" />
</head> 

<body onload="MM_preloadImages('../images/tasselsandsashes/sashes/00000.jpg','../images/tasselsandsashes/sashes/00004.jpg','../images/tasselsandsashes/sashes/00003.jpg','../images/tasselsandsashes/sashes/00002.jpg','../images/tasselsandsashes/sashes/00001.jpg')">

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
			<a href="../shopjostenshome.aspx">Home</a> &gt; <a href="../tasselsandsashes.aspx">Tassels and Sashes</a><br /><strong><span class="style15">Graduate Sash<br /><br /></span></strong>
        </td>
		<td></td>
	</tr>
	
    <tr>
		<td rowspan="2" valign="top"><img src="../images/tasselsandsashes/sashes/kk_sashes.jpg" name="theImg" 
                id="theImg" onmouseover="MM_swapImgRestore()" />
		</td>
		
        <td height="94">
			<div id="packprice" style="height:auto">  
				<strong>Our Price: <span class="red">$</span><asp:Label ID="KSASH" runat="server" ForeColor="#D74141" Text="KSASH"></asp:Label><br /><br /></strong>A white sash makes the outfit even more special. “Graduate” on one side; yeardate on the other. Printing available in 5 colors.
            </div>
        </td>
	<tr>
	    <td valign="top" style="height:auto">
        	<div id="select_options">
				<h3>Choose your options...</h3>
					<table width="370">
						<tr>
					  		<td colspan="2">
                       			<script type="text/javascript">
                       			    var img = [,"../images/tasselsandsashes/sashes/00000.jpg",
                                 "../images/tasselsandsashes/sashes/00004.jpg",
                                  "../images/tasselsandsashes/sashes/00003.jpg",
                                  "../images/tasselsandsashes/sashes/00002.jpg",
                                   "../images/tasselsandsashes/sashes/00001.jpg"];
                                </script>
                       
                      						
						<a href="javascript:;" onclick="MM_swapImage('theImg','','../images/tasselsandsashes/sashes/00000.jpg',1)">
                          <img src="../images/tasselsandsashes/sashes/Sashes_NEW/Stole_burgundy_13.jpg" 
                              border="0" onclick="changevalue(this);" id="190"/></a>
                        <a href="javascript:;" onclick="MM_swapImage('theImg','','../images/tasselsandsashes/sashes/00004.jpg',1)">
                          <img src="../images/tasselsandsashes/sashes/Sashes_NEW/Stole_gold_13.jpg" 
                              border="0" onclick="changevalue(this);" id="194" /></a>
						<a href="javascript:;" onclick="MM_swapImage('theImg','','../images/tasselsandsashes/sashes/00003.jpg',1)">
                          <img src="../images/tasselsandsashes/sashes/Sashes_NEW/Stole_green_13.jpg" 
                              border="0" onclick="changevalue(this);" id="193" /></a>
						<a href="javascript:;" onclick="MM_swapImage('theImg','','../images/tasselsandsashes/sashes/00002.jpg',1)">
                          <img src="../images/tasselsandsashes/sashes/Sashes_NEW/Stole_purple_13.jpg" 
                              border="0" onclick="changevalue(this);" id="192" /></a>
						<a href="javascript:;" onclick="MM_swapImage('theImg','','../images/tasselsandsashes/sashes/00001.jpg',1)">
                          <img src="../images/tasselsandsashes/sashes/Sashes_NEW/Stole_blue_13.jpg" 
                              border="0" onclick="changevalue(this);" id="191" /></a></td>
						
						</tr>
						<tr>
							<td>Sash Style*:
                        	</td>
							<td><asp:DropDownList  runat="server" Height="22px" Width="171px" onchange="javascript:change(this);" ID="ddlclr" DataSourceID="dscolor" DataTextField="optiondesc" DataValueField="id"></asp:DropDownList>
                          		<script>
                                 function change(x) {
                                     var i = document.getElementById("theImg");
                                     i.src = img[x.selectedIndex];
                                 }
								</script>
							</td>
						</tr>
						<tr>
							<td class="style9" colspan="2" valign="middle">Qty: <asp:TextBox ID="txtqty" runat="server" Width="36px">1</asp:TextBox> &nbsp;&nbsp;&nbsp; <asp:Button ID="Button1" runat="server" Text="Add to Cart "/> <em><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter quantity" ControlToValidate="txtqty" ForeColor="Red"></asp:RequiredFieldValidator></em>	
							</td>
						</tr>
					</table>
			<div class="req_field_val"><asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="CustomValidator" ForeColor="Red"></asp:CustomValidator><asp:RegularExpressionValidator ID="numval" runat="server" ControlToValidate="txtqty" ErrorMessage="Enter a numeric value" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
            </div>
            </div>
</table>
<asp:SqlDataSource ID="dscolor" runat="server" 
				ConnectionString="<%$ ConnectionStrings:KK5 %>" 
				ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
				SelectCommand="SELECT id, optiondesc FROM options WHERE (optioncatid = 37) ORDER BY optiondesc">
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
