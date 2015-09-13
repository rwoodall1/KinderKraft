<%@ Page Title="" Language="VB"  AutoEventWireup="false" CodeFile="receipt.aspx.vb" Inherits="receipt" %>
<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_Layout.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>Receipt</title>
<link href="css/master.css" rel="stylesheet" type="text/css" media="screen"/>
<link rel="stylesheet" type="text/css" href="css/cssverticalmenu.css" />

<script type="text/javascript" src="cssverticalmenu.js">

</script>


<link href="css/productboxes.css" rel="stylesheet" type="text/css" />
<!-- InstanceEndEditable -->




<link href="css/cssverticalmenu.css" rel="stylesheet" type="text/css" />
<link href="css/package.css" rel="stylesheet" type="text/css" />
<link href="css/package_cartpgs.css" rel="stylesheet" type="text/css" />
<link href="css/master.css" rel="stylesheet" type="text/css" />
<link href="css/productboxes.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
         .FixedHeader {
            position: absolute;
            font-weight: bold;
            vertical-align:text-bottom;
        }   
        .style35
        {
            height: 29px;
        }
        </style>

</head> 

<body>
 

<form id="form1" runat="server">

<div id="pagewrapper">
<div id="header">
  <div id="headleft"><br />
	<a href="shopjostenshome.aspx"> 
	  <img alt="" height="101" src="images/jostenslogo.PNG" border="0" 
		  width="270" /></a></div>
<div id="headright" style="width: 689px"><br />
	<a href="shopjostenshome.aspx">
	<img src="images/Kinderkraft_2.jpg" width="160" height="34" alt="" /></a>
	<p><asp:LinkButton ID="lklogin" runat="server" OnClick="lklogin_Click" 
			>Log In </asp:LinkButton> | <a href="scart.aspx">View Cart</a></p><br /><br />
<div class="welcome"><asp:Label ID="Label1" runat="server" Text="Welcome, GUEST" Visible="False" ></asp:Label></div>
<div align="left">
   <asp:Label ID="lblcurrentcustomer" runat="server" Text="Current Customer is:" 
        Font-Italic="True" Font-Size="Larger" Visible="False"></asp:Label>
</div>
</div>


<div id="menu">
  <div id="browse"> Browse Products </div>
  <ul id="verticalmenu" class="glossymenu">
	<li><a href="packages.aspx">Packages</a></li>
	<li><a href="capsandgowns.aspx" >Caps and Gowns</a></li>
	<li><a href="tasselsandsashes.aspx">Tassels and Sashes</a></li>
	<li><a href="diplomasandcertificates.aspx">Diplomas and Certificates</a></li>
	<li><a href="accessories.aspx" >Accessories</a></li>
      <li><a href="cartpages/banners.aspx" ><span style="color:#DF0003; font-weight:500">NEW! </span> Graduation Banners</a></li>
   <li><asp:LinkButton ID="LinkButton1" runat="server" Visible="False" 
		PostBackUrl="~/Admin/Admin.aspx">Administration</asp:LinkButton>  </li>
 </ul>
  <div id="ssl"> <img src="images/verisign.png" width="75" height="38" alt="SSL Certificate" /></div></div>

<!-- InstanceBeginEditable name="Content" -->




	
<div id="content" align="center">
<div style="font-size: x-large; font-weight: bold; font-family: Arial, Helvetica, sans-serif" 
        align="center">
    <br />
	<asp:Label ID="Label4" runat="server" Text="Thank you for your order #"></asp:Label>
	<br />
	<asp:Label ID="Label3" runat="server" 
		Text="Please print this information for your records." Font-Size="14pt"></asp:Label>
    
	<br />
	<br />
	</div>
<div>
	
   
   
	<table cellpadding="0" cellspacing="0" style="width: 672px">
		<tr>
			<td align="left" style="font-size: large">
				Billing Information<br />
				<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
					CellPadding="4" DataSourceID="dscust" ForeColor="#333333" GridLines="None" 
					Height="91px" Width="339px" DataKeyNames="custid,emailaddress" Font-Size="Smaller" 
                    style="margin-top: 0px">
					<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
					<CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
					<EditRowStyle BackColor="#999999" />
					<FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
					<Fields>
						<asp:BoundField DataField="CompanyName" HeaderText="Company Name" 
							SortExpression="CompanyName" />
						<asp:BoundField DataField="custid" HeaderText="Customer No." ReadOnly="True" 
							SortExpression="custid" />
						<asp:BoundField DataField="fname" HeaderText="First Name" 
							SortExpression="fname" />
						<asp:BoundField DataField="lname" HeaderText="Last Name" 
							SortExpression="lname" />
						<asp:BoundField DataField="billingaddr1" HeaderText="Address" 
							SortExpression="billingaddr1" />
						<asp:BoundField DataField="billingaddr2" HeaderText="Address 2" 
							SortExpression="billingaddr2" />
						<asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
						<asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
						<asp:BoundField DataField="postalcode" HeaderText="Zip Code" 
							SortExpression="postalcode" />
						<asp:CheckBoxField DataField="taxexempt" HeaderText="Tax Exempt" 
							SortExpression="taxexempt" />
						<asp:BoundField DataField="emailaddress" HeaderText="Email" />
						<asp:BoundField DataField="phonenumber" HeaderText="Phone#" 
							SortExpression="phonenumber" />
					</Fields>
					<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
					<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
					<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
					<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
				</asp:DetailsView>
			</td>
			<td align="left" valign="top" style="font-size: large">
				Shipping Information<br />
				<asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" 
					CellPadding="4" DataKeyNames="orderid,orderdate" DataSourceID="dsOrders" 
					ForeColor="#333333" GridLines="None" Height="91px" Width="339px" 
					Font-Size="Smaller">
					<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
					<CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
					<EditRowStyle BackColor="#999999" />
					<FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
					<Fields>
						<asp:BoundField DataField="scompanyname" HeaderText="Company Name" 
							SortExpression="scompanyname" />
						<asp:BoundField DataField="sfname" HeaderText="First Name" 
							SortExpression="sfname" />
						<asp:BoundField DataField="slname" HeaderText="Last Name" 
							SortExpression="slname" />
						<asp:BoundField DataField="saddr" HeaderText="Address" 
							SortExpression="saddr" />
						<asp:BoundField DataField="sadd2" HeaderText="Address 2" 
							SortExpression="sadd2" />
						<asp:BoundField DataField="scity" HeaderText="City" SortExpression="scity" />
						<asp:BoundField DataField="sstate" HeaderText="State" 
							SortExpression="sstate" />
						<asp:BoundField DataField="szip" HeaderText="Zip Code" 
							SortExpression="szip" />
						<asp:BoundField DataField="ponumber" HeaderText="PO#" 
							SortExpression="ponumber" />
						<asp:BoundField DataField="shipmethod" HeaderText="Shipping Method" />
						<asp:BoundField DataField="orderid" HeaderText="Order#" />
						<asp:BoundField DataField="orderdate" HeaderText="Order Date" 
                            SortExpression="orderdate" DataFormatString="{0:d}" />
					</Fields>
					<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
					<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
					<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
					<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
				</asp:DetailsView>
			</td>
		</tr>
	</table>

	</div>
   
	<br />
   <div style="height:218px; overflow: auto" align="center">
	<asp:GridView ID="gv1" runat="server" HeaderStyle-CssClass="FixedHeader" Height="16px" Width="700px" 
			AutoGenerateColumns="False" CellPadding="12" ForeColor="#333333" 
			GridLines="None" HorizontalAlign="Center" PageSize="8" 
			DataSourceID="dsorderdetail" DataKeyNames="orderdetailid,pkgid,orderid" 
        Font-Size="Smaller" >
		<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
		<Columns>
			<asp:BoundField DataField="productname" HeaderText="Item" >
			<HeaderStyle HorizontalAlign="Center" Width="130px" />
            <ItemStyle Width="130px" />
            </asp:BoundField>
			<asp:BoundField DataField="Quantity" HeaderText="Qty">
			<HeaderStyle HorizontalAlign="Center" Width="40px" />
			<ItemStyle HorizontalAlign="Center" Width="40px" />
			</asp:BoundField>
			<asp:BoundField DataField="prodprice" HeaderText="Price">
			<HeaderStyle HorizontalAlign="Center" Width="75px" />
			<ItemStyle HorizontalAlign="Center" Width="75px" />
			</asp:BoundField>
			<asp:BoundField DataField="totalprice" HeaderText="Cost">
			<HeaderStyle HorizontalAlign="Center" Width="117px" />
			<ItemStyle HorizontalAlign="Center" Width="117px" />
			</asp:BoundField>
			<asp:BoundField DataField="orderdetailid" HeaderText="OrderDetailId" 
				Visible="False">
			</asp:BoundField>    
			
			
			
				   
<asp:TemplateField HeaderText="Options">
				<ItemTemplate>
				 <asp:GridView ID="opd" runat="server" AutoGenerateColumns="False" CellPadding="4"  
						ForeColor="#333333" GridLines="None" ShowHeader="False" >
			<Columns>
			   
				<asp:BoundField DataField="opdesc" />
			   
				<asp:BoundField DataField="detailid" HeaderText="detailid" Visible="False" />
			   
				</Columns>
				 </asp:GridView>
				</ItemTemplate>
				
				<HeaderStyle HorizontalAlign="Center" Width="200px" />
				
				<ItemStyle Font-Size="7pt" Width="200px" />
				
				</asp:TemplateField>



			<asp:BoundField DataField="pkgid" HeaderText="pkgid" Visible="False" />
			<asp:BoundField DataField="orderid" HeaderText="orderid" Visible="False" />



		</Columns>
		<EditRowStyle BackColor="#999999" />
		<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
		<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
			Height="35px" HorizontalAlign="Center" />
		<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
		<RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="18px" />
		<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
		<SortedAscendingCellStyle BackColor="#E9E7E2" />
		<SortedAscendingHeaderStyle BackColor="#506C8C" />
		<SortedDescendingCellStyle BackColor="#FFFDF8" />
		<SortedDescendingHeaderStyle BackColor="#6F8DAE" />
	</asp:GridView>
  </div>
 <asp:FormView 
			ID="FormView2" runat="server" DataSourceID="dsOrders" Width="679px" 
			Height="33px" DataKeyNames="orderid" Font-Size="Smaller">
		<ItemTemplate>
	
		<table 
		style="width:100%;">
		<tr>
			<td class="style38" align="left" colspan="3">
			   
			    <asp:Label ID="Label7" runat="server" Text="Order Status"></asp:Label>
                <asp:Label ID="Label6" runat="server" Text='<%# Eval("orderstatus") %>' 
                    Font-Bold="True"></asp:Label>
               
                    &nbsp;&nbsp;&nbsp;
               
                <asp:Label ID="Label8" runat="server" Font-Italic="True" ForeColor="Red" 
                    Text='<%# Eval("autherr") %>'></asp:Label></td>
		</tr>
			<tr>
                <td align="left" class="style38">
                </td>
                <td align="right" width="650">
                    SubTotal:</td>
                <td align="right">
                    <asp:Label ID="lblsubtot" runat="server" Text='<%# Bind("subtot", "{0:C}") %>'></asp:Label>
                </td>
            </tr>
			<tr>
				<td align="right" class="style38">
					Promotion Code:
					<asp:Label ID="Label2" runat="server" Text='<%# Eval("promocode") %>'></asp:Label>
				</td>
				<td align="right" width="650">
					Discount:</td>
				<td align="right">
					<asp:Label ID="lbldiscount" runat="server" 
						Text='<%# Eval("discountamt", "{0:C}") %>'></asp:Label>
				</td>
			</tr>
		<tr>
			<td class="style38" align="right">
			    Ship Method:<asp:Label ID="Label9" runat="server" Text='<%# Eval("shipmethod") %>'></asp:Label>
                &nbsp;</td>
			<td align="right" class="style37" width="650">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Shipping:</td>
			<td align="right">
				<asp:Label  ID="lblshipping" runat="server" 
					Text='<%# Bind("shpchrg", "{0:C}") %>'></asp:Label>       
			</td>
		</tr>
		
		<tr>
			<td class="style38" rowspan="3" align="left">
				Notes:<br />
				<asp:TextBox ID="TextBox1" runat="server" 
					Text='<%# bind("ordernotes") %>' TextMode="MultiLine" Width="348px" ReadOnly="True" 
                    Height="46px"></asp:TextBox>
			</td>
			<td align="right" width="650" valign="top">
				Tax</td>
			<td align="right" valign="top">
				<asp:Label ID="lbltax" runat="server" Text='<%# Bind("tax", "{0:C}") %>' ></asp:Label>
			</td>
		</tr>
		
		    <tr>
                <td align="right" valign="top" width="650">
                    Payment Method:<asp:Label ID="Label5" runat="server" Text='<%# Eval("paytype") %>'></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Total
					
				</td>
                <td align="right" valign="top">
                    <asp:Label id="lblTotal" runat="server" Text='<%# Bind("total", "{0:C}") %>' /></td>
            </tr>
		
		<tr>
			<td class="style35" align="right" width="650" valign="top">&nbsp;
				</td>
			<td align="right" class="style35" valign="top">
				 
				</td>
		</tr>
	</table>
		</ItemTemplate>
	</asp:FormView>
    <div id="bottom" align="left">
   
   	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnemailrecpt" runat="server" Height="30px" 
            Text="Email Receipt" Width="175px" />
&nbsp;&nbsp;
   
   	 <asp:Button ID="Button3" runat="server" Text="Place Another Order" Height="30px" 
            Width="175px" />
		&nbsp;&nbsp;
		<asp:Button ID="Button2" runat="server" Text="Print Order Summary" 
            Height="30px" Width="175px" Visible="False" />

		<div align="left" style="font-size: medium; font-style: italic">
            <br />
            Thank you for shopping at jostenskinderkraft.com. Your order has been placed and 
            will be received within two weeks unless expedited shipping was selected. Orders placed after 12:00 p.m. (noon) central time will be processed on the next business day. Please allow 5 business days for delivery on Express orders placed after 12:00 p.m. If you have any questions contact customer service at 855-826-2355.
            <!--<p style="color:#F00; font-weight:bold">Our plant will be closed July 3rd - July 17th. Orders placed during this time frame will be received and processed on July 20th with processing and shipping time beginning that day. Orders placed by or before July 2nd will be shipped and delivered by the time frame given at the time the order is placed. </p>-->
		</div>
        </div>

    <asp:HiddenField ID="hftaxabletotal" runat="server" />

	<eo:MsgBox ID="MsgBox1" runat="server" BackColor="#EBEBEB" 
        CloseButtonUrl="00070301" ControlSkinID="None" HeaderHtml="Dialog Title" 
        Height="135px" Width="320px">
        <HeaderStyleActive CssText="padding-right: 3px; padding-left: 8px; font-weight: bold; font-size: 10pt; background-image: url(00020213); padding-bottom: 3px; color: white; padding-top: 0px; font-family: 'trebuchet ms';height:20px;" />
        <ContentStyleActive CssText="padding-right: 4px; padding-left: 4px; font-size: 8pt; padding-bottom: 4px; padding-top: 4px; font-family: tahoma" />
        <FooterStyleActive CssText="padding-right: 4px; padding-left: 4px; font-size: 8pt; padding-bottom: 4px; padding-top: 4px; font-family: tahoma" />
        <BorderImages BottomBorder="00020212" BottomLeftCorner="00020207" 
            BottomRightCorner="00020208" LeftBorder="00020210" RightBorder="00020211" 
            TopBorder="00020209" TopLeftCorner="00020201" TopLeftCornerBottom="00020203" 
            TopLeftCornerRight="00020202" TopRightCorner="00020204" 
            TopRightCornerBottom="00020206" TopRightCornerLeft="00020205" />
    </eo:MsgBox>

	<asp:SqlDataSource 
		ID="dscust" runat="server" 
		ConnectionString="<%$ ConnectionStrings:KK5 %>" 
		ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
		
		
		
		
		
		SelectCommand="SELECT custid, fname, lname, EmailAddress, password, CompanyName, billingaddr1, billingaddr2, city, state, postalcode, phonenumber, taxid, repofschool, Schname, refby, emailsubscriber, sfname, slname, scompanyname, saddr1, saddr2, scity, sstate, spostalcode, sphonenumber, sfax, residential, business, taxexempt, username, iscs, custid AS Expr1 FROM cust WHERE (custid = @customerid)" 
		DeleteCommand="DELETE FROM orders WHERE (orderid = @orderid)">
		<DeleteParameters>
			<asp:ControlParameter ControlID="FormView1" Name="orderid" 
				PropertyName="SelectedValue" />
		</DeleteParameters>
		<SelectParameters>
			<asp:QueryStringParameter Name="customerid" QueryStringField="customerid" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="dsOrders" runat="server" 
		ConnectionString="<%$ ConnectionStrings:KK5 %>" 
		ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
		
		
		
		
		
		SelectCommand="SELECT orderid, customerid, scompanyname, sfname, slname, saddr, sadd2, scity, sstate, szip, sphone, sfax, ponumber, shipped, orderdate, shipdate, ordernotes, subtot, shipmethod, shpchrg, tax, total, business, residential, taxexempt, semailaddress, authnettranid, orderid AS Expr1, discountamt, promocode, paytype, autherr, orderstatus, expdeliverdate FROM orders WHERE (orderid = @orderid)" 
		DeleteCommand="DELETE FROM orders WHERE (orderid = @orderid)">
		<DeleteParameters>
			<asp:ControlParameter ControlID="FormView1" Name="orderid" 
				PropertyName="SelectedValue" />
		</DeleteParameters>
		<SelectParameters>
			<asp:QueryStringParameter DefaultValue="0" Name="orderid" 
                QueryStringField="orderid" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="dsorderdetail" runat="server" 
		ConnectionString="<%$ ConnectionStrings:KK5 %>" 
		ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
		
		
		
		SelectCommand="SELECT orderid, orderdetailid, productcode, productname, quantity, prodprice, totalprice, pkgid FROM orderdetail WHERE (orderid = @orderid)" 
		DeleteCommand="DELETE FROM orderdetail WHERE (orderid = @orderid)">
		<DeleteParameters>
			<asp:ControlParameter ControlID="FormView1" Name="orderid" 
				PropertyName="SelectedValue" />
		</DeleteParameters>
		<SelectParameters>
			<asp:QueryStringParameter DefaultValue="0" Name="orderid" 
                QueryStringField="orderid" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="dsorderdetailmisc" runat="server" 
		ConnectionString="<%$ ConnectionStrings:KK5 %>" 
		ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
		
		
		
		SelectCommand="SELECT orderid, orderdetailid, productcode, productname, quantity, prodprice, totalprice, pkgid FROM orderdetail WHERE (orderid = @orderid)" 
		DeleteCommand="DELETE FROM orderdetail WHERE (pkgid = '&quot;a&quot;')">
		<SelectParameters>
			<asp:QueryStringParameter DefaultValue="0" Name="orderid" 
				QueryStringField="orderid" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="dsorderoptions" runat="server" 
		ConnectionString="<%$ ConnectionStrings:KK5 %>" 
		ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
		
		
		
		
		SelectCommand="SELECT OrderId, DetailId, OpId, opdesc, pkgid, id, qty FROM orderoptions WHERE (OrderId = @orderid)" 
		DeleteCommand="DELETE FROM orderoptions WHERE (OrderId = @orderid)">
		<DeleteParameters>
			<asp:ControlParameter ControlID="FormView1" Name="orderid" 
				PropertyName="SelectedValue" />
		</DeleteParameters>
		<SelectParameters>
			<asp:ControlParameter ControlID="DetailsView1" DefaultValue="0" Name="orderid" 
				PropertyName="SelectedValue" />
		</SelectParameters>
	</asp:SqlDataSource>
    <asp:SqlDataSource ID="dsorderdate" runat="server" 
            ConnectionString="<%$ ConnectionStrings:KK5 %>" 
            ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
            SelectCommand="SELECT orderid AS Expr1, customerid, scompanyname, sfname, slname, saddr, sadd2, scity, sstate, szip, sphone, sfax, ponumber, shipped, orderdate, shipdate, ordernotes, subtot, shipmethod, shpchrg, tax, total, business, residential, taxexempt, semailaddress, authnettranid, promocode, discountamt, paymentcompleted, ordercanceled, orderstatus, authdate, paytype, ccnum, volorderid, volcustid, country, international, onhold, bo, bodate, authcode, autherr FROM orders WHERE (orderid = @orderid)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="orderid" 
                    QueryStringField="orderid" />
            </SelectParameters>
        </asp:SqlDataSource>


<!-- InstanceEndEditable -->
</div>

<div id="footer">
  <p><a href="returns.aspx">Shipping Rates and Returns</a> &nbsp; &#124; &nbsp;  <asp:LinkButton ID="ordstatus" runat="server"  OnClick="ordstatus_Click">Order History</asp:LinkButton> 
  &nbsp; &#124; &nbsp; <a href="ChangePassword.aspx">Change Password/User Name</a> &nbsp;  &#124; &nbsp; <a href="http://www.jostenskinderkraft.com/contact.html"> Contact Us</a> &nbsp; &#124; &nbsp; <a href="http://www.jostenskinderkraft.com/kinderkraft_home.html">Home</a></p>
  <p><font size="-6">©2013 Jostens, Inc • All Rights Reserved</font></p>
</div></div>



</form>
</body>
<!-- InstanceEnd --></html>
