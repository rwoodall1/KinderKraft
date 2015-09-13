<%@ Page Title="" Language="VB"  AutoEventWireup="false" CodeFile="gradteecart.aspx.vb" Inherits="gradteecart" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_LayoutSubfolder.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>Graduate Tee</title>

<script type="text/javascript" src="../cssverticalmenu.js">
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
		<td height="60" valign="top" class="style13">
			<a href="../shopjostenshome.aspx">Home</a> &gt; <a href="../accessories.aspx">Accessories</a><br /><strong><span class="style15">Graduate Tee<br /><br /></span></strong>
        </td>
		<td></td>
	</tr>
	
    <tr>
		<td rowspan="2" valign="top">
        	<img id="theImg3" name="theImg" src="../images/accessories/gradtee.jpg" />
        </td>
		<td height="64">
			<div id="packprice" style="height:auto"> <strong>Our Price: <span class="red">$</span><asp:Label ID="KTSHIRT" runat="server" ForeColor="#D74141" Text="KTSHIRT"></asp:Label><br /><br /></strong>Make their graduation day last a little longer. 100% preshrunk cotton. Available in youth small (6-8) and youth medium (10-12).
            </div>
        </td>
    </tr>
			
    <tr>
      	<td height="202" valign="top" style="height:auto"> 
        	<div id="select_options">
            	<h3>Choose your options...</h3>
					<table>
						<tr>
							<td width="81">Tee Size*:
                            </td>
							<td width="273"><asp:DropDownList  runat="server" Height="19px" Width="116px" ID="ddlclr" DataSourceID="dscolor" DataTextField="optiondesc" DataValueField="id"></asp:DropDownList>
							</td>
						</tr>
						<tr>
							<td colspan="2" valign="middle">Qty: <asp:TextBox ID="txtqty" runat="server" Width="36px">1</asp:TextBox>&nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" Text="Add to Cart "/><em> <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
 ErrorMessage="Enter quantity" ControlToValidate="txtqty" ForeColor="Red"></asp:RequiredFieldValidator></em>
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
