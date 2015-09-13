<%@ Page Title="" Language="VB"  AutoEventWireup="false" CodeFile="Order.aspx.vb" Inherits="Order" %>
<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>
<%@ Register assembly="EclipseWebSolutions.DatePicker" namespace="EclipseWebSolutions.DatePicker" tagprefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_Layout.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>Kinderkraft Order</title>

<link href="css/master.css" rel="stylesheet" type="text/css" media="screen"/>
<link rel="stylesheet" type="text/css" href="css/cssverticalmenu.css" />

<script type="text/javascript" src="cssverticalmenu.js">

</script>

<style type="text/css">
.auto-style2 {
	border-width: thin;
	border-color: #C0C0C0;
	text-align: center;
	border-right-style: solid;
}
.auto-style4 {
	border-color: #C0C0C0;
	border-width: thin;
	border-right-style: solid;
	border-bottom-style: solid;
	margin-left: 5px;
	margin-right: 5px;
	margin-top: 20px;
}
.auto-style5 {
	margin-left: 0px;
}
.auto-style7 {
	margin-right: 0px;
}
	.style36
	{
		width: 108px;
	}
	.style37
	{
		width: 154px;
	}
	.style41
	{
		width: 108px;
		height: 22px;
	}
	.style42
	{
		width: 114px;
		height: 22px;
	}
	.style43
	{
		width: 114px;
	}
	.style44
	{
		width: 476px;
		height: 22px;
	}
	.style45
	{
		width: 476px;
	}
	</style>

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

	<div id="content">
	<div align="center" 
         style="font-size: xx-large; font-weight: bold; text-decoration: underline; height: 45px;">
        Orders 
</div>
	<table cellpadding="0" cellspacing="0" style="width: 672px">
		<tr>
			<td align="left" style="font-size: xx-large" valign="top">
				Billing Information<br />
				<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
					CellPadding="4" DataSourceID="dscust" ForeColor="#333333" GridLines="None" 
					Height="91px" Width="350px" DataKeyNames="custid" Font-Size="10pt">
					<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
					<CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
					<EditRowStyle BackColor="#999999" />
					<FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
					<Fields>
						<asp:BoundField DataField="CompanyName" HeaderText="Company Name" 
							SortExpression="CompanyName" />
						<asp:BoundField DataField="custid" HeaderText="Customer No." ReadOnly="True" 
							SortExpression="custid" />
						<asp:TemplateField HeaderText="First Name" SortExpression="fname">
							<InsertItemTemplate>
								<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fname") %>'></asp:TextBox>
							</InsertItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fname") %>'></asp:TextBox>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="Label1" runat="server" Text='<%# Bind("fname") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:BoundField DataField="lname" HeaderText="Last Name" 
							SortExpression="lname" />
						<asp:BoundField DataField="billingaddr1" HeaderText="Address" 
							SortExpression="billingaddr1" />
						<asp:BoundField DataField="billingaddr2" HeaderText="Address 2" 
							SortExpression="billingaddr2" />
						<asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
						<asp:TemplateField HeaderText="State" SortExpression="state">
							<InsertItemTemplate>
								<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("state") %>'></asp:TextBox>
							</InsertItemTemplate>
							<EditItemTemplate>
								<asp:DropDownList ID="bddlstate" runat="server" Width="150px" 
					DataSourceID="dsstates" DataTextField="name" DataValueField="abrv" 
									SelectedValue='<%# bind("state") %>' >
							<asp:ListItem></asp:ListItem>
				 
						</asp:DropDownList>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="Label2" runat="server" Text='<%# Bind("state") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:BoundField DataField="postalcode" HeaderText="Zip Code" 
							SortExpression="postalcode" />
						<asp:TemplateField HeaderText="Tax Exempt" SortExpression="taxexempt">
							<InsertItemTemplate>
								<asp:CheckBox ID="CheckBox1" runat="server" 
									Checked='<%# Bind("taxexempt") %>' />
							</InsertItemTemplate>
							<EditItemTemplate>
								<asp:CheckBox ID="chktaxexempt1" runat="server" 
									Checked='<%# Bind("taxexempt") %>' />
							</EditItemTemplate>
							<ItemTemplate>
								<asp:CheckBox ID="chktaxexempt0" runat="server" 
									Checked='<%# Bind("taxexempt") %>' Enabled="false" />
							</ItemTemplate>
						</asp:TemplateField>
						<asp:BoundField DataField="emailaddress" HeaderText="Email" 
                            DataFormatString="&lt;a href=mailto:{0}&gt;{0}&lt;/a&gt;" 
                            HtmlEncodeFormatString="False" >
						<ItemStyle Font-Bold="True" />
                        </asp:BoundField>
						<asp:BoundField DataField="phonenumber" HeaderText="Phone#" 
							SortExpression="phonenumber" />
						<asp:BoundField ReadOnly="True" />
						<asp:BoundField />
					    <asp:BoundField />
                        <asp:BoundField />
					    <asp:BoundField />
					</Fields>
					<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
					<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
					<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
					<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
				</asp:DetailsView>
			</td>
			<td align="left" valign="top" style="font-size: xx-large">
				Shipping Information<br />
				
				<asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" 
					CellPadding="4" 
					DataKeyNames="orderid" DataSourceID="dsOrders" 
					ForeColor="#333333" GridLines="None" Height="67px" Width="350px" 
					Font-Size="10pt">
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
						<asp:TemplateField HeaderText="State" SortExpression="sstate">
							<InsertItemTemplate>
								<asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("sstate") %>'></asp:TextBox>
							</InsertItemTemplate>
							<EditItemTemplate>
							   <asp:DropDownList ID="bddlstate" runat="server" Width="150px" 
					DataSourceID="dsstates" DataTextField="name" 
	DataValueField="abrv" 
	SelectedValue='<%# bind("sstate") %>' >
	<asp:ListItem></asp:ListItem>
</asp:DropDownList>

							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="Label2" runat="server" Text='<%# Bind("sstate") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Zip Code" SortExpression="szip">
							<InsertItemTemplate>
								<asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("szip") %>'></asp:TextBox>
							</InsertItemTemplate>
							<EditItemTemplate>
								<asp:TextBox ID="txtshipzip" runat="server" Text='<%# Bind("szip") %>'></asp:TextBox>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="lblshipzip" runat="server" Text='<%# Bind("szip") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:BoundField DataField="ponumber" HeaderText="PO#" 
							SortExpression="ponumber" />
						<asp:TemplateField HeaderText="Order#">
							<EditItemTemplate>
								<asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" 
									Text='<%# Bind("orderid") %>'></asp:TextBox>
							</EditItemTemplate>
							<InsertItemTemplate>
								<asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" 
									Text='<%# Bind("orderid") %>'></asp:TextBox>
							</InsertItemTemplate>
							<ItemTemplate>
								<asp:Label ID="Label1" runat="server" Text='<%# Bind("orderid") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Order Date" SortExpression="orderdate">
							<ItemTemplate>
								<asp:Label ID="Label3" runat="server" Text='<%# Bind("orderdate", "{0:d}") %>'></asp:Label>
							</ItemTemplate>
							<EditItemTemplate>
								 <asp:Label ID="Label33" runat="server" Text='<%# Bind("orderdate", "{0:d}") %>'></asp:Label>
							</EditItemTemplate>
							<InsertItemTemplate>
								<asp:TextBox ID="TextBox4" runat="server" 
									Text='<%# Bind("orderdate", "{0:d}") %>'></asp:TextBox>
							</InsertItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField HeaderText="Shipping Method" SortExpression="shipmethod">
							<InsertItemTemplate>
								<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("shipmethod") %>'></asp:TextBox>
							</InsertItemTemplate>
							<EditItemTemplate>
							<asp:DropDownList ID="ddlshipmeth" runat="server" AutoPostBack="True" 
														Height="19px" Width="144px" 
														
								   
									SelectedValue='<%# bind("shipmethod") %>'>
																<asp:ListItem Value="STANDARD">Standard</asp:ListItem>
																<asp:ListItem Value="EXPRESS">Expedited</asp:ListItem>
																<asp:ListItem Value="AK/HI">Alaska/Hawaii</asp:ListItem>
															  
															</asp:DropDownList>
							</EditItemTemplate>
							<ItemTemplate>
								<asp:Label ID="lblshpmeth" runat="server" Text='<%# bind("shipmethod") %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						<asp:BoundField DataField="authnettranid" 
							HeaderText="Transaction ID" SortExpression="authnettranid" />
						<asp:TemplateField HeaderText="Payment Made" SortExpression="paymentcompleted">
							<EditItemTemplate>
								<asp:CheckBox ID="CheckBox1" runat="server" 
									Checked='<%# Bind("paymentcompleted") %>' Enabled="False" />
							</EditItemTemplate>
							<InsertItemTemplate>
								<asp:CheckBox ID="CheckBox1" runat="server" 
									Checked='<%# Bind("paymentcompleted") %>' Enabled="False" />
							</InsertItemTemplate>
							<ItemTemplate>
								<asp:CheckBox ID="CheckBox1" runat="server" 
									Checked='<%# Bind("paymentcompleted") %>' Enabled="False" />
							</ItemTemplate>
						</asp:TemplateField>
					    <asp:BoundField DataField="bo" HeaderText="BO#" SortExpression="bo" />
                        <asp:TemplateField HeaderText="BO Date" SortExpression="bodate">
                            <EditItemTemplate>
                                <cc1:DatePicker ID="DatePicker1" runat="server" CalendarPosition="DisplayRight" 
                                    CollapseButtonLabel='<%# Bind("bodate", "{0:d}") %>' 
                                    DateValue='<%# Bind("bodate") %>' />
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("bodate") %>' 
                                    Visible='<%# Bind("bodate") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("bodate", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
					    <asp:BoundField DataField="orderstatus" HeaderText="Status" 
                            SortExpression="orderstatus" />
					</Fields>
					<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
					<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
					<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
					<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
				</asp:DetailsView>
				
			</td>
		</tr>
	</table>

	

	 <div style="padding: 10px; height: 21px">
 <div style="float: left">
         </div><div style="float: right">  
             <asp:Button ID="Button2" runat="server" Text="Print Summary"  
            Width="108px" Visible="False" /> </div></div> 

	&nbsp;&nbsp;&nbsp;<asp:GridView ID="gv1" runat="server" Height="16px" Width="648px" 
			AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
			GridLines="None" HorizontalAlign="Center" BorderStyle="Ridge" 
			AllowPaging="True" PageSize="12" 
			DataSourceID="dsorderdetail" DataKeyNames="orderdetailid,pkgid,orderid" 
			Font-Size="10pt" >
		<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
		<Columns>
			<asp:BoundField DataField="productname" HeaderText="Item" />
			<asp:BoundField DataField="Quantity" HeaderText="Qty">
			<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="prodprice" HeaderText="Price">
			<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField DataField="totalprice" HeaderText="Cost">
			<ItemStyle HorizontalAlign="Center" />
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
				
				<ItemStyle HorizontalAlign="Center" />
				
				</asp:TemplateField>



			<asp:BoundField DataField="pkgid" HeaderText="pkgid" Visible="False" />
			<asp:BoundField DataField="orderid" HeaderText="orderid" Visible="False" />



		</Columns>
		<EditRowStyle BackColor="#999999" />
		<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
		<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
			Height="25px" HorizontalAlign="Center" />
		<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
		<RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="18px" />
		<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
		<SortedAscendingCellStyle BackColor="#E9E7E2" />
		<SortedAscendingHeaderStyle BackColor="#506C8C" />
		<SortedDescendingCellStyle BackColor="#FFFDF8" />
		<SortedDescendingHeaderStyle BackColor="#6F8DAE" />
	</asp:GridView>
	&nbsp;	
	<asp:FormView 
			ID="FormView1" runat="server" DataSourceID="dsOrders" Width="544px" 
		DataKeyNames="orderid" HorizontalAlign="Center" Height="144px" 
			Font-Size="10pt">
			<EditItemTemplate>
			<table style="width:100%; height: 96px;">
		<tr>
			<td class="style44" colspan="2">&nbsp;</td>
			<td align="right" class="style41">
				Subtotal:</td>
			<td align="right" class="style42">
				<asp:Label ID="lblsubtot" runat="server" Text='<%# Bind("subtot") %>'></asp:Label>
			</td>
		</tr>
		<tr>
			<td align="left" class="style45">&nbsp;
				</td>
		   
			<td align="right" class="style45">
               Shipping Method:<asp:Label ID="lblshipmeth" runat="server" 
					Text='<%# bind("shipmethod") %>' Font-Bold="True"></asp:Label></td>
		   
			<td align="right" class="style35">
				Shipping:</td>
			<td align="right" class="style43">
				<asp:Label ID="lblshipping" runat="server" Text='<%# Bind("shpchrg") %>'></asp:Label>
			</td>
		</tr>
		<tr>
			<td align="right" class="style45" colspan="2">
				Promotion Code:
				<asp:TextBox ID="txtpromocode" runat="server" Height="21px" 
					Text='<%# bind("promocode") %>' Width="140px" ontextchanged="txtpromocode_TextChanged" 
					AutoPostBack="True" oninit="txtpromocode_Init1"></asp:TextBox>
				&nbsp;</td>
			<td align="right" class="style35">
				Discount:</td>
			<td align="right" class="style43">
				<asp:Label ID="lblpromoamt" runat="server" Text='<%# bind("discountamt") %>'></asp:Label>
			</td>
		</tr>
		<tr>
			<td align="left" class="style45" rowspan="3" valign="top" colspan="2">
				Notes:<br />
				<asp:TextBox ID="TextBox1" runat="server" Text='<%# bind("ordernotes") %>' 
					TextMode="MultiLine" Width="437px" Height="43px"></asp:TextBox>
			</td>
			<td align="right" class="style36">
				Tax:</td>
			<td align="right" class="style43">
				<asp:Label ID="lbltax" runat="server" Text='<%# Bind("tax") %>'></asp:Label>
			</td>
		</tr>
		<tr>
			<td align="right" class="style36">
				Total:</td>
			<td align="right" class="style43">
				<asp:Label ID="lblTotal" runat="server" Text='<%# Bind("total") %>'></asp:Label>
			</td>
		</tr>
		
		
		<tr>
			<td align="right" class="style36">&nbsp;
				</td>
			<td align="right" class="style43">
				<asp:Button ID="Button3" runat="server" CommandArgument="Update" 
					onclick="Button3_Click1" Text="Refresh" />
				&nbsp;
				</td>
		</tr>
		
		
	</table>
			</EditItemTemplate>
			<ItemTemplate>
				<hr style="width: 649px; height: -12px" />
  <table style="width:100%; height: 96px;">
		<tr>
			<td class="style8" colspan="2">&nbsp;</td>
			<td align="right" class="style36">
				Subtotal:</td>
			<td align="right">
				<asp:Label ID="lblsubtot" runat="server" Text='<%# Bind("subtot", "{0:C}") %>'></asp:Label>
			</td>
		</tr>
		<tr>
			<td align="left" class="style35">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                
			</td>
		   
			<td align="right" class="style35">
              Shipping Method:<asp:Label ID="lblshipmeth" runat="server" 
					Text='<%# bind("shipmethod") %>' Font-Bold="False"></asp:Label></td>
		   
			<td align="right" class="style35">
				Shipping:</td>
			<td align="right" class="style35">
				<asp:Label ID="lblshipping" runat="server" 
					Text='<%# Bind("shpchrg", "{0:C}") %>'></asp:Label>
			</td>
		</tr>
		<tr>
			<td align="right" class="style35" colspan="2">
				Promotion Code:
				<asp:Label ID="Label35" runat="server" Text='<%# bind("promocode") %>'></asp:Label>
				&nbsp;</td>
			<td align="right" class="style35">
				Discount:</td>
			<td align="right" class="style35">
				<asp:Label ID="Label34" runat="server" 
					Text='<%# Bind("discountamt", "{0:C}") %>'></asp:Label>
			</td>
		</tr>
		<tr>
			<td align="left" class="style37" rowspan="3" valign="top" colspan="2">
				Notes:<br />
				<asp:TextBox ID="TextBox1" runat="server" Text='<%# bind("ordernotes") %>' 
					TextMode="MultiLine" Width="437px" Height="43px" ReadOnly="True"></asp:TextBox>
			</td>
			<td align="right" class="style36">
				Tax:</td>
			<td align="right">
				<asp:Label ID="lbltax" runat="server" Text='<%# Bind("tax", "{0:C}") %>'></asp:Label>
			</td>
		</tr>
		<tr>
			<td align="right" class="style36">
				Total:</td>
			<td align="right">
				<asp:Label ID="lblTotal" runat="server" Text='<%# Bind("total", "{0:C}") %>'></asp:Label>
			</td>
		</tr>
		
		
		<tr>
			<td align="right" class="style36">&nbsp;
				</td>
			<td align="right">&nbsp;
				</td>
		</tr>
		
		
	</table>
	</ItemTemplate>
	</asp:FormView>

	<br />
	<div align="right">
	<asp:Button ID="Button1" runat="server" Text="Back To History" /></div>
	<eo:MsgBox ID="MsgBox1" runat="server" BackColor="#EBEBEB" 
        CloseButtonUrl="00070301" ControlSkinID="None" HeaderHtml="Dialog Title" 
        Height="122px" Width="320px">
        <HeaderStyleActive CssText="padding-right: 3px; padding-left: 8px; font-weight: bold; font-size: 10pt; background-image: url(00020213); padding-bottom: 3px; color: white; padding-top: 0px; font-family: 'trebuchet ms';height:20px;" />
        <ContentStyleActive CssText="padding-right: 4px; padding-left: 4px; font-size: 8pt; padding-bottom: 4px; padding-top: 4px; font-family: tahoma" />
        <FooterStyleActive CssText="padding-right: 4px; padding-left: 4px; font-size: 8pt; padding-bottom: 4px; padding-top: 4px; font-family: tahoma" />
        <BorderImages BottomBorder="00020212" BottomLeftCorner="00020207" 
            BottomRightCorner="00020208" LeftBorder="00020210" RightBorder="00020211" 
            TopBorder="00020209" TopLeftCorner="00020201" TopLeftCornerBottom="00020203" 
            TopLeftCornerRight="00020202" TopRightCorner="00020204" 
            TopRightCornerBottom="00020206" TopRightCornerLeft="00020205" />
    </eo:MsgBox>
	</div>
	
<asp:SqlDataSource 
		ID="dscust" runat="server" 
		ConnectionString="<%$ ConnectionStrings:KK5 %>" 
		ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
		
		
		
		
		
		SelectCommand="SELECT custid, fname, lname, EmailAddress, password, CompanyName, billingaddr1, billingaddr2, city, state, postalcode, phonenumber, taxid, repofschool, Schname, refby, emailsubscriber, sfname, slname, scompanyname, saddr1, saddr2, scity, sstate, spostalcode, sphonenumber, sfax, residential, business, taxexempt, username, iscs, custid AS Expr1 FROM cust WHERE (custid = @customerid)" 
		DeleteCommand="DELETE FROM orders WHERE (orderid = @orderid)" 
		
		
		UpdateCommand="UPDATE cust SET fname = @fname, lname = @lname, EmailAddress = @emailaddress, CompanyName = @companyname, billingaddr1 = @billingaddr1, billingaddr2 = @billingaddr2, city = @city, state = @state, postalcode = @postalcode, taxexempt = @taxexempt WHERE (custid = @custid)">
		<DeleteParameters>
			<asp:ControlParameter ControlID="FormView1" Name="orderid" 
				PropertyName="SelectedValue" />
		</DeleteParameters>
		<SelectParameters>
			<asp:QueryStringParameter Name="customerid" QueryStringField="customerid" 
				DefaultValue="0" />
		</SelectParameters>
	</asp:SqlDataSource>

	<asp:SqlDataSource ID="dsOrders" runat="server" 
		ConnectionString="<%$ ConnectionStrings:KK5 %>" 
		ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
		
		
		
		
		
		SelectCommand="SELECT orderid, customerid, scompanyname, sfname, slname, saddr, sadd2, scity, sstate, szip, sphone, sfax, ponumber, shipped, orderdate, shipdate, ordernotes, subtot, shipmethod, shpchrg, tax, total, business, residential, taxexempt, semailaddress, authnettranid, paymentcompleted, ordercanceled, promocode, discountamt, onhold, bo, bodate, orderstatus FROM orders WHERE (orderid = @orderid)" 
		DeleteCommand="DELETE FROM orders WHERE (orderid = @orderid)" 
		
		
		
		
		
		
        
        
        UpdateCommand="UPDATE orders SET scompanyname = @scompanyname, sfname = @sfname, slname = @slname, saddr = @saddr, sadd2 = @sadd2, scity = @scity, sstate = @sstate, szip = @szip, ponumber = @ponumber, authnettranid = @authnettranid, paymentcompleted = @paymentcompleted, shipmethod = @shipmethod, bo = @bo, bodate = @bodate WHERE (orderid = @orderid)">
		<DeleteParameters>
			<asp:ControlParameter ControlID="FormView1" Name="orderid" 
				PropertyName="SelectedValue" />
		</DeleteParameters>
		<SelectParameters>
			<asp:QueryStringParameter DefaultValue="0" Name="orderid" 
				QueryStringField="orderid" />
		</SelectParameters>
	</asp:SqlDataSource>
	<asp:SqlDataSource ID="dsorders1" runat="server" 
		ConnectionString="<%$ ConnectionStrings:KK5 %>" 
		ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
		
		
		
		
		
		SelectCommand="SELECT orderid, customerid, scompanyname, sfname, slname, saddr, sadd2, scity, sstate, szip, sphone, sfax, ponumber, shipped, orderdate, shipdate, ordernotes, subtot, shipmethod, shpchrg, tax, total, business, residential, taxexempt, semailaddress, authnettranid, orderid AS Expr1 FROM orders WHERE (orderid = @orderid)" 
		DeleteCommand="DELETE FROM orders WHERE (orderid = @orderid)" 
		UpdateCommand="UPDATE orders SET scompanyname = @scompanyname, sfname = @sfname, slname = @slname, saddr = @saddr, sadd2 = @saddr2, scity = @scity, sstate = @sstate, szip = @szip WHERE (orderid = @orderid)">
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
			<asp:ControlParameter ControlID="FormView1" Name="orderdid" 
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
	<asp:SqlDataSource ID="dsstates" runat="server" 
		ConnectionString="<%$ ConnectionStrings:KK5 %>" 
		ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
		
		SelectCommand="SELECT trim(name) AS name, abrv, id FROM states ORDER BY name"></asp:SqlDataSource>
<asp:HiddenField ID="x_type" runat="server" Value="PRIOR_AUTH_CAPTURE" />


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
