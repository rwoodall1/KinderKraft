
<%@ Page Title="" Language="VB"  AutoEventWireup="false" CodeFile="gowncart.aspx.vb" Inherits="gowncart" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_LayoutSubfolder.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>Gown</title>
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
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
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
function MM_popupMsg(msg) { //v1.0
  alert(msg);
}
</script>

<!-- InstanceEndEditable -->

<link href="../css/cssverticalmenu.css" rel="stylesheet" type="text/css" />
<link href="../css/package.css" rel="stylesheet" type="text/css" />
<link href="../css/package_cartpgs.css" rel="stylesheet" type="text/css" />
<link href="../css/master.css" rel="stylesheet" type="text/css" />
<link href="../css/productboxes.css" rel="stylesheet" type="text/css" />
</head> 

<body onload="MM_preloadImages('../images/capsandgowns/gowns/08.jpg','../images/capsandgowns/gowns/06.jpg','../images/capsandgowns/gowns/03.jpg','../images/capsandgowns/gowns/07.jpg','../images/capsandgowns/gowns/05.jpg','../images/capsandgowns/gowns/02.jpg','../images/capsandgowns/gowns/01.jpg','../images/capsandgowns/gowns/00.jpg','../images/capsandgowns/gowns/04.jpg')">

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
	<table style="width: 660px; height: auto" cellpadding="0" cellspacing="0" >
		<tr>
			<td class="style13" valign="top">
				<a href="../shopjostenshome.aspx">Home</a> &gt; <a href="../capsandgowns.aspx">Caps and Gowns</a><br /><strong><span class="style15">Gown<br /><br /></span></strong>
            </td>
			<td></td>
		</tr>
		
        <tr>
			<td rowspan="2" valign="top"><img src="../images/capsandgowns/gowns/GWN-2T.jpg" alt="Gowns" name="theImg" id="theImg" onmouseover="MM_swapImgRestore()" name:="theImg" />
            </td>
			<td height="79">
				<div id="packprice" style="height:auto"><strong>Our Price: <span class="red">$</span><asp:Label ID="GWN" runat="server" ForeColor="#D74141" Text="GWN"></asp:Label><br /><br /></strong>
Kids will stay cool and comfortable in our lightweight fabric. Gowns are sized according to height. Available in 9 colors</div>
			</td>

	  	<tr>
		  	<td height="413" valign="top" style="height:auto">
            	<div id="select_options">
			  		<h3>Choose your options...</h3>
              			<span class="pkg_order_instr">If ordering two different colors, choose all sizes for one color and add to cart. Then return to the page, choose all sizes for the next color and add to cart.</span>
			  			<table width="385">
				  			<tr>
				    			<td colspan="2">
					  				<script>
										var img = ["GWN-2T","../images/capsandgowns/gowns/08.jpg", "../images/capsandgowns/gowns/06.jpg", "../images/capsandgowns/gowns/03.jpg", "../images/capsandgowns/gowns/07.jpg", "../images/capsandgowns/gowns/05.jpg", "../images/capsandgowns/gowns/02.jpg", "../images/capsandgowns/gowns/01.jpg", "../images/capsandgowns/gowns/00.jpg", "../images/capsandgowns/gowns/04.jpg"];</script>
					 <a href="#" onclick="MM_swapImage('theImg','','../images/capsandgowns/gowns/08.jpg',1)">
					  <img src="../images/capsandgowns/gowns/kk_gown_royal_black_swatch.jpg" alt="" width="37" height="40" border="0" id="247" onclick="changevalue(this);" /></a>
                      <a href="#" onclick="MM_swapImage('theImg','','../images/capsandgowns/gowns/06.jpg',1)">
					  <img src="../images/capsandgowns/gowns/kk_regalia_eggplant_swatch.jpg" alt="" width="37" height="40" id="175" onclick="changevalue(this);" border="0" /></a>
					  <a href="#" onclick="MM_swapImage('theImg','','../images/capsandgowns/gowns/03.jpg',1)">
					  <img src="../images/capsandgowns/gowns/kk_regalia_gold_swatch.jpg" alt="" width="37" height="40" id="172" onclick="changevalue(this);" border="0" /></a>
					  <a href="#" onclick="MM_swapImage('theImg','','../images/capsandgowns/gowns/07.jpg',1)">
					  <img src="../images/capsandgowns/gowns/kk_regalia_hunter_green_swatch.jpg" alt="" width="37" height="40" id="177" onclick="changevalue(this);" border="0" /></a>
					  <a href="#" onclick="MM_swapImage('theImg','','../images/capsandgowns/gowns/05.jpg',1)">
					  <img src="../images/capsandgowns/gowns/kk_regalia_light_blue_swatch.jpg" alt="" width="37" height="40" id="174" onclick="changevalue(this);" border="0" /></a>
					  <a href="#" onclick="MM_swapImage('theImg','','../images/capsandgowns/gowns/02.jpg',1)">
					  <img src="../images/capsandgowns/gowns/kk_regalia_pink_swatch.jpg" alt="" width="37" height="40" id="171" onclick="changevalue(this);" border="0" /></a>
					  <a href="#" onclick="MM_swapImage('theImg','','../images/capsandgowns/gowns/01.jpg',1)">
					  <img src="../images/capsandgowns/gowns/kk_regalia_red_swatch.jpg" alt="" width="37" height="40" id="170" onclick="changevalue(this);" border="0" /></a>
					  <a href="#" onclick="MM_swapImage('theImg','','../images/capsandgowns/gowns/00.jpg',1)">
					  <img src="../images/capsandgowns/gowns/kk_gown_royal_blue_swatch.jpg" alt="" width="37" height="40" id="176" onclick="changevalue(this);" border="0" /></a>
					  <a href="#" onclick="MM_swapImage('theImg','','../images/capsandgowns/gowns/04.jpg',1)">
					  <img src="../images/capsandgowns/gowns/kk_regalia_white_swatch.jpg" alt="" width="37" height="40" border="0" id="173" onclick="changevalue(this);" /></a>
                     			</td>
				  		</tr>
				<script>
						function change(x) {
							var i = document.getElementById("theImg");
							i.src = img[x.selectedIndex];
						}
				</script>
				  		<tr>
					  		<td width="291">Gown Color*:
                                <asp:CustomValidator ID="CustomValidator6" runat="server" 
                                    ErrorMessage="Color Out Of Stock" ControlToValidate="ddlclr" 
                                    Display="Dynamic" Enabled="False"></asp:CustomValidator>
                            </td>
					  		<td width="82"><asp:DropDownList  runat="server" Height="19px" Width="116px" 
                                    onchange="javascript:change(this);" DataSourceID="dscolor" 
                                    DataTextField="optiondesc" DataValueField="id" ID="ddlclr" 
                                    CausesValidation="True" AutoPostBack="True"></asp:DropDownList>
					  		</td>
				  		</tr>
				  
				  		<tr>
                			<td>Gown Size/Height*:<br /><font size="-3"><em>Enter QTY of each size needed</em></font>						
                            </td>
     					<td class="floatleft">
                        	<a href="javascript:;" onclick="MM_popupMsg('Measure from the top of the child\'s head to the floor.')"><img src="../images/capsandgowns/measure_quest.png" alt="" width="15" height="15" border="0" /></a>	
                            </td>
                     	</tr>
    					
                        <tr>
							<td align="right" valign="top">
         						<asp:RegularExpressionValidator ID="numval" runat="server" ControlToValidate="txtqty6" ErrorMessage="Enter a numeric value" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator> <asp:TextBox ID="txtqty6" runat="server" Width="36px" CausesValidation="True" AutoPostBack="True">1</asp:TextBox>
        					</td>
							<td class="floatleft" valign="top">
								<asp:DropDownList ID="ddlsize" runat="server" Height="20px" Width="116px" DataSourceID="dsgwnsize" DataTextField="optiondesc" DataValueField="id" CausesValidation="True"></asp:DropDownList><br />
                            </td>
                       	</tr>
						<tr>
							<td align="right">
           						<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtqty5" ErrorMessage="Enter a numeric value" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator> <asp:TextBox ID="txtqty5" runat="server" Width="36px" CausesValidation="True" AutoPostBack="True"></asp:TextBox>
                           	</td>
							<td class="floatleft">
								<asp:DropDownList ID="ddlsize0" runat="server" Height="20px" Width="116px" DataSourceID="dsgwnsize" DataTextField="optiondesc" DataValueField="id" CausesValidation="True"></asp:DropDownList>
                            </td>
                       	</tr>
	
    					<tr>
							<td align="right">
  								<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtqty4" ErrorMessage="Enter a numeric value" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator> <asp:TextBox ID="txtqty4" runat="server" Width="36px" CausesValidation="True" AutoPostBack="True"></asp:TextBox>
                          	</td>
							<td class="floatleft">
								<asp:DropDownList ID="ddlsize1" runat="server" Height="20px" Width="116px" DataSourceID="dsgwnsize" DataTextField="optiondesc" DataValueField="id" CausesValidation="True"></asp:DropDownList>
							</td>
                    	</tr>
						
                        <tr>
							<td align="right">
								<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtqty3" ErrorMessage="Enter a numeric value" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator> <asp:TextBox ID="txtqty3" runat="server" Width="36px" CausesValidation="True" AutoPostBack="True"></asp:TextBox>
                          	</td>
							<td class="floatleft">
        						<asp:DropDownList ID="ddlsize2" runat="server" Height="20px" Width="116px" 			DataSourceID="dsgwnsize" DataTextField="optiondesc" DataValueField="id" CausesValidation="True"></asp:DropDownList>
                           	</td>
                    	</tr>
						<tr>
							<td align="right">
           						<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtqty2" ErrorMessage="Enter a numeric value" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator> <asp:TextBox ID="txtqty2" runat="server" Width="36px" CausesValidation="True" AutoPostBack="True"></asp:TextBox>
                           	</td>
							<td class="floatleft">
								<asp:DropDownList ID="ddlsize3" runat="server" Height="20px" Width="116px" DataSourceID="dsgwnsize" DataTextField="optiondesc" DataValueField="id" CausesValidation="True"></asp:DropDownList>
                           	</td>
                    	</tr>
						<tr>
							<td align="right">
								<asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtqty1" ErrorMessage="Enter a numeric value" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator> <asp:TextBox ID="txtqty1" runat="server" Width="36px" CausesValidation="True" AutoPostBack="True"></asp:TextBox>
                            </td>
							<td class="floatleft">
        						<asp:DropDownList ID="ddlsize4" runat="server" Height="20px" Width="116px" DataSourceID="dsgwnsize" DataTextField="optiondesc" DataValueField="id" CausesValidation="True"></asp:DropDownList>
                            </td>
                       	</tr>
						<tr>
							<td align="right">
        						<asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtqty6" ErrorMessage="Enter a numeric value" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator> <asp:TextBox ID="txtqty0" runat="server" Width="36px" CausesValidation="True" AutoPostBack="True"></asp:TextBox>
                           	</td>
							<td class="floatleft">
        						<asp:DropDownList ID="ddlsize5" runat="server" Height="20px" Width="116px" DataSourceID="dsgwnsize" DataTextField="optiondesc" DataValueField="id" CausesValidation="True"> </asp:DropDownList>
        	<span class="style32"></span></td></tr>
				 	 	<tr>
					  		<td colspan="2" valign="middle">
						  		Total quantity: <em><asp:TextBox ID="txtqty" runat="server" Width="36px" CausesValidation="True" ReadOnly="True">1</asp:TextBox></em>
						  		<asp:Button ID="Button1" runat="server" Text="Add to Cart "/><br /><span class="pkg_order_instr">Place orders for one gown color at a time.</span><br /><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter a quantity" ControlToValidate="txtqty6" ForeColor="Red"></asp:RequiredFieldValidator>
							<div class="req_field_val"> 
                            	<asp:CustomValidator ID="CustomValidator5" runat="server" ErrorMessage="Qty field 1 must be 1 or greater."></asp:CustomValidator><br />
                                <asp:CustomValidator ID="CustomValidator4" runat="server" ErrorMessage="Please select a color" ControlToValidate="ddlclr" Display="Dynamic"></asp:CustomValidator>
                          	</div>
						  	</td>
                 		</tr>
				</table>
</div>
</table>


<asp:SqlDataSource ID="dssize" runat="server" 
				ConnectionString="<%$ ConnectionStrings:KK5 %>" 
				ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
				
				
        SelectCommand="SELECT id, optiondesc FROM options WHERE (optioncatid = 34) ORDER BY optiondesc">
			</asp:SqlDataSource>
            <br />
            <asp:SqlDataSource ID="dscolor" runat="server" 
				ConnectionString="<%$ ConnectionStrings:KK5 %>" 
				ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
				
        SelectCommand="SELECT id, optiondesc FROM options WHERE (optioncatid = 21) ORDER BY optiondesc">
			</asp:SqlDataSource>
			<asp:SqlDataSource ID="dsgwnsize" runat="server" 
				ConnectionString="<%$ ConnectionStrings:KK5 %>" 
				ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
				
				
        
		SelectCommand="SELECT id, optiondesc FROM options WHERE (optioncatid = 34) ORDER BY selectorder">
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
