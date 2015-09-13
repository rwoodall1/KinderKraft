<%@ Page Title="" Language="VB" AutoEventWireup="false" CodeFile="CustomerOrders.aspx.vb" Inherits="CustomerOrders" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_Layout.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>Customer Orders</title>

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
<div id="content" 
		style="height: 847px; width: 682px; ">
	<asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Larger" 
        Font-Underline="True" Text="Account Summary"></asp:Label>
    <br />
	<br />
	
   
	<asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
        AutoGenerateRows="False" CellPadding="4" DataKeyNames="custid" 
        DataSourceID="dscust" ForeColor="#333333" GridLines="None" Height="50px" 
        Width="648px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" Width="150px" />
        <Fields>
            <asp:BoundField DataField="CompanyName" HeaderText="Company Name" 
                SortExpression="CompanyName" />
            <asp:BoundField DataField="custid" HeaderText="Customer No." ReadOnly="True" 
                SortExpression="custid" />
            <asp:BoundField DataField="fname" HeaderText="First Name" 
                SortExpression="fname" />
            <asp:BoundField DataField="lname" HeaderText="Last Name" 
                SortExpression="lname" />
            <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
            <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
            <asp:BoundField DataField="postalcode" HeaderText="Zip" 
                SortExpression="postalcode" />
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerSettings Mode="NumericFirstLast" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>

	    <br />

	<asp:Label ID="Label3" runat="server" Text="Orders" Font-Bold="True" 
		Font-Size="Larger" Font-Underline="True"></asp:Label>

	<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
		CellPadding="4" DataSourceID="dsOrders" ForeColor="#333333" GridLines="None" 
		Width="657px" AllowPaging="True">
		<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
		<Columns>
			<asp:HyperLinkField DataTextField="orderid" HeaderText="Order ID" 
                DataNavigateUrlFields="orderid,customerid"                 
                
                DataNavigateUrlFormatString="~/Order.aspx?orderid={0}&amp;customerid={1}">
			<ControlStyle ForeColor="Blue" />
            </asp:HyperLinkField>
			<asp:BoundField DataField="orderdate" HeaderText="Order Date" 
                DataFormatString="{0:d}" />
			<asp:BoundField DataField="total" HeaderText="Order Total" 
				DataFormatString="{0:c}" />
			<asp:BoundField DataField="ponumber" HeaderText="PO#" />
		    <asp:BoundField DataField="customerid" HeaderText="customerid" 
                Visible="False" />
		</Columns>
		<EditRowStyle BackColor="#999999" />
		<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
		<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
		<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
		<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
		<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
		<SortedAscendingCellStyle BackColor="#E9E7E2" />
		<SortedAscendingHeaderStyle BackColor="#506C8C" />
		<SortedDescendingCellStyle BackColor="#FFFDF8" />
		<SortedDescendingHeaderStyle BackColor="#6F8DAE" />
	</asp:GridView>
	<div align="center">
        <br />
        <br />
    </div>
  	</div>
    <asp:SqlDataSource ID="dscust" runat="server" 
		ConnectionString="<%$ ConnectionStrings:KK5 %>" 
		ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
		
		
        SelectCommand="SELECT cust.* FROM cust">
	</asp:SqlDataSource>

	

	<asp:SqlDataSource ID="dsOrders" runat="server" 
		ConnectionString="<%$ ConnectionStrings:KK5 %>" 
		ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
        SelectCommand="SELECT orderid, customerid, scompanyname, sfname, slname, saddr, sadd2, scity, sstate, szip, sphone, sfax, ponumber, shipped, orderdate, shipdate, ordernotes, subtot, shipmethod, shpchrg, tax, total, business, residential, taxexempt, semailaddress, authnettranid FROM orders WHERE (customerid = @custid)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DetailsView1" Name="custid" 
                PropertyName="SelectedValue" />
        </SelectParameters>
	</asp:SqlDataSource>

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
