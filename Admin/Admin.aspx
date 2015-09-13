<%@ Page Title="" Language="VB"  AutoEventWireup="false" CodeFile="Admin.aspx.vb" Inherits="Admin" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_LayoutSubfolder.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>Administration</title>
<link href="../css/master.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="../css/package.css" rel="stylesheet" type="text/css" media="screen"/>
<link rel="stylesheet" type="text/css" href="../css/cssverticalmenu.css" />
<link href="../css/package_cartpgs.css" rel="stylesheet" type="text/css" />
<link href="../css/productboxes.css" rel="stylesheet" type="text/css" />
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
    <li><a href="../cartpages/banners.aspx" ><span style="color:#DF0003; font-weight:500">NEW! </span> Graduation Banners</a></li>
   	<li><asp:LinkButton ID="LinkButton1" runat="server" Visible="False" 
		PostBackUrl="~/Admin/Admin.aspx">Administration</asp:LinkButton></li>
 </ul>
  
  	<div id="ssl"> <img src="../images/verisign.png" width="75" height="38" alt="SSL Certificate" />
    </div>
</div>

<!-- InstanceBeginEditable name="Content" -->
<div id="content">
	
		&nbsp;<br />
		<br />
		<asp:LinkButton ID="LinkButton2" runat="server" ForeColor="Blue" 
			PostBackUrl="~/Admin/Customers.aspx">Customers</asp:LinkButton>
		<br />
		<br />
		<asp:LinkButton ID="LinkButton3" runat="server" ForeColor="Blue" 
			PostBackUrl="~/Admin/CustomerSearch.aspx">Customer/Search</asp:LinkButton>
		<br />
		<br />
		<asp:LinkButton ID="LinkButton4" runat="server" ForeColor="Blue" 
			PostBackUrl="~/Admin/CustOrders.aspx">Customer/Orders</asp:LinkButton>
		<br />
		<br />
		<asp:LinkButton ID="LinkButton7" runat="server" ForeColor="#3333FF" 
			PostBackUrl="~/secure/OrderSearch.aspx">Order Search</asp:LinkButton>
		<br />
		<br />
		<asp:LinkButton ID="LinkButton5" runat="server" ForeColor="Blue" 
			PostBackUrl="~/Admin/Product.aspx">Products</asp:LinkButton>
		<br />
		<br />
		
		<asp:LinkButton ID="LinkButton6" runat="server" ForeColor="Blue" 
			PostBackUrl="~/Admin/Promotions.aspx">Promotions</asp:LinkButton>
		
        <br />
		<br />
		
       <asp:LinkButton ID="LinkButton8" runat="server" ForeColor="Blue" 
			PostBackUrl="~/Admin/TaxUpload.aspx">Up Load Tax Rates</asp:LinkButton>
        <br />
        <br />
		<asp:LinkButton ID="LinkButton9" runat="server" ForeColor="Blue" 
			PostBackUrl="~/secure/PaymentProcess.aspx">Process Payments</asp:LinkButton>
        <br />
        <br />
		<asp:LinkButton ID="LinkButton10" runat="server" ForeColor="Blue">Create Guest Order</asp:LinkButton>
		<br />
		<br />
		
		
		<asp:LinkButton ID="LinkButton12" runat="server" ForeColor="Blue" 
			ValidationGroup="g1">PO to Credit Card Payment</asp:LinkButton>
		&nbsp;&nbsp; Orderid:
		<asp:TextBox ID="txtorderid" runat="server" ValidationGroup="g1"></asp:TextBox>
		<br />
		<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
			ControlToValidate="txtorderid" Display="Dynamic" 
			ErrorMessage="Order Id is required" Font-Size="Smaller" ValidationGroup="g1"></asp:RequiredFieldValidator> <% Response.Write(Session("NOTPO"))%>
		<br />
		  <asp:LinkButton ID="LinkButton14" runat="server" ForeColor="Blue" 
            PostBackUrl="~/secure/CustomCharge.aspx">Custom Charge</asp:LinkButton>
        <br />
        <br />
      <asp:LinkButton ID="LinkButton13" runat="server" ForeColor="Blue" 
            PostBackUrl="~/Admin/transcheck.aspx">Transaction Check</asp:LinkButton>
            <br />
        <br />
            <asp:LinkButton ID="LinkButton11" runat="server" ForeColor="Blue">Clear Shopping Cart</asp:LinkButton>
        <br />
        <br />
        <asp:LinkButton ID="LinkButton15" runat="server" ForeColor="Blue" 
            PostBackUrl="~/Admin/csv.aspx">Export to Oracle</asp:LinkButton>
    </div>

<!-- InstanceEndEditable -->

<div id="footer">
  		<p><a href="../returns.aspx">Shipping Rates and Returns</a> &nbsp; &#124; &nbsp;  <asp:LinkButton ID="ordstatus" runat="server"  OnClick="ordstatus_Click">Order History</asp:LinkButton> &nbsp; &#124; &nbsp; 
          <a href="../ChangePassword.aspx">Change Password/User Name</a> &nbsp;  &#124; &nbsp;
          <a href="http://www.jostenskinderkraft.com/contact.html"> Contact Us</a> &nbsp; &#124; &nbsp; 
          <a href="http://www.jostenskinderkraft.com/kinderkraft_home.html">Home</a></p>
  		<p><font size="-6">©2013 Jostens, Inc • All Rights Reserved</font></p>
</div>
</div>
</form>
</body>
<!-- InstanceEnd --></html>
