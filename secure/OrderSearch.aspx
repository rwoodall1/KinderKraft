﻿<%@ Page Title="" Language="VB"  AutoEventWireup="false" CodeFile="OrderSearch.aspx.vb" Inherits="OrderSearch" ValidateRequest="false" %>
<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>
<%@ Register assembly="EclipseWebSolutions.DatePicker" namespace="EclipseWebSolutions.DatePicker" tagprefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_LayoutSubfolder.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>Order Search</title>

<link href="../css/master.css" rel="stylesheet" type="text/css" media="screen"/>
<link rel="stylesheet" type="text/css" href="../css/cssverticalmenu.css" />

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
    <!--<li><a href="../clearance.aspx" >Clearance</a></li> -->
   	<li><asp:LinkButton ID="LinkButton1" runat="server" Visible="False" 
		PostBackUrl="~/Admin/Admin.aspx">Administration</asp:LinkButton></li>
 </ul>
  
  	<div id="ssl"> <img src="../images/verisign.png" width="75" height="38" alt="SSL Certificate" />
    </div>
</div>

<!-- InstanceBeginEditable name="Content" -->
 <div id="content">
   <div align="center" 
         style="font-size: xx-large; font-weight: bold; text-decoration: underline; height: 45px;">
        Orders 
</div>
<div>
   
        <asp:TextBox ID="txtsearch" runat="server"></asp:TextBox>
&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Order# Search" Width="105px" />
    &nbsp;
		<asp:Button ID="Button4" runat="server" Text="Telephone Log" />
        <br />
        <asp:TextBox ID="txtbosearch" runat="server"></asp:TextBox>
&nbsp;&nbsp;
       <asp:Button ID="Button2" runat="server" Text="BO# Search" Width="105px" />
     </div>
    <table cellpadding="0" cellspacing="0" style="width: 672px">
		<tr>
			<td align="left" style="font-size: xx-large" valign="top">
				Billing Information<asp:DetailsView ID="DetailsView1" 
					runat="server" AutoGenerateRows="False" 
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
                                    Checked='<%# Bind("taxexempt") %>' Enabled="False" />
                            </ItemTemplate>
                        </asp:TemplateField>
					    <asp:BoundField DataField="emailaddress" HeaderText="Email" 
                            DataFormatString="<a href=mailto:{0}>{0}</a>" 
                            HtmlEncodeFormatString="False" SortExpression="Email" >
					    <ItemStyle Font-Bold="True" ForeColor="#6600CC" />
                        </asp:BoundField>
					    <asp:BoundField DataField="phonenumber" HeaderText="Phone#" 
							SortExpression="phonenumber" />
					    <asp:BoundField ReadOnly="True" />
					    <asp:BoundField />
					    <asp:BoundField />
                        <asp:BoundField />
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
				Shipping Information
                <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" 
					CellPadding="4" 
                    DataKeyNames="orderid,shpdate" DataSourceID="dscust" 
					ForeColor="#333333" GridLines="None" Height="91px" Width="350px" 
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
                                <asp:TextBox ID="txtorderid" runat="server" ReadOnly="True" 
                                    Text='<%# Bind("orderid") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtorderid" runat="server" ReadOnly="True" 
                                    Text='<%# Bind("orderid") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblorderid" runat="server" Text='<%# Bind("orderid") %>'></asp:Label>
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
					    <asp:TemplateField HeaderText="Shipping Method">
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("shipmethod") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <EditItemTemplate>
                            
                                <asp:DropDownList ID="ddlshipmeth" runat="server" 
                                                        Height="19px" Width="144px" 
                                                        
                                   
                                    SelectedValue='<%# bind("shipmethod") %>' AppendDataBoundItems="True"  >
                                                                <asp:ListItem Value="STANDARD"></asp:ListItem>
                                                                <asp:ListItem Value="EXPRESS"></asp:ListItem>
                                                                <asp:ListItem Value="AK/HI">Alaska/Hawaii</asp:ListItem>
                                                                <asp:ListItem Value="INTERNATIONAL">ExpeditedStandardInternational</asp:ListItem>
                                                            </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblshpmeth" runat="server" Text='<%# bind("shipmethod") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
					    <asp:TemplateField HeaderText="Transaction ID" SortExpression="transid">
                            <EditItemTemplate>
                                <asp:Label ID="lbltransid" runat="server" Text='<%# Bind("transid") %>'></asp:Label>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("transid") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("transid") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Auth Code" SortExpression="pauthcode">
                            <EditItemTemplate>
                                <asp:Label ID="lblauthcode" runat="server" Text='<%# Bind("pauthcode") %>'></asp:Label>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("pauthcode") %>' 
                                    ></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("pauthcode") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
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
                                <asp:CheckBox ID="CheckBox4" runat="server" 
                                    Checked='<%# Bind("paymentcompleted") %>' Enabled="False" />
                            </ItemTemplate>
                        </asp:TemplateField>
					    <asp:BoundField DataField="bo" HeaderText="BO#" 
                            SortExpression="bo" />
                        <asp:TemplateField HeaderText="Order Status" SortExpression="orderstatus">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlstatus" runat="server" AutoPostBack="True" 
                                    Height="26px" ondatabound="DropDownList1_DataBound" 
                                    onselectedindexchanged="ddlstatus_SelectedIndexChanged" 
                                    SelectedValue='<%# Bind("orderstatus") %>' Width="157px">
                                    <asp:ListItem>PROCESSING</asp:ListItem>
                                    <asp:ListItem>CAPTURE</asp:ListItem>
                                    <asp:ListItem>VOID</asp:ListItem>
                                    <asp:ListItem>REFUND</asp:ListItem>
                                    <asp:ListItem>ON HOLD</asp:ListItem>
                                    <asp:ListItem>PENDING</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;payment processe&#39;s
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("orderstatus") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblorderstatus" runat="server" Text='<%# Bind("orderstatus") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
					    <asp:BoundField DataField="carrier" HeaderText="Carrier" SortExpression="carrier" />
					    <asp:BoundField DataField="trknumber" HeaderText="Trk Number" SortExpression="trknumber" />
                        <asp:TemplateField HeaderText="Ship Date" SortExpression="shpdate">
                            <EditItemTemplate>
                                <cc1:DatePicker ID="DatePicker1" runat="server" CalendarPosition="DisplayRight" CollapseButtonLabel='<%# Bind("shpdate", "{0:d}") %>' DateValue='<%# Bind("shpdate") %>' />
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("shpdate", "{0:d}") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("shpdate", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
					</Fields>
					<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
					<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
					<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
					<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
				</asp:DetailsView>
			</td>
		</tr>
	</table>

 <div style="padding: 10px; height: 29px">
 <div style="float: left">
        
        &nbsp; Order Operations:
       <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            Height="18px" Width="261px" Visible="False">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem>Delete Order</asp:ListItem>
            <asp:ListItem Value="TRKINFO">Email Trk Info</asp:ListItem>
            <asp:ListItem Value="OrderHold">Put Order On Hold</asp:ListItem>
            <asp:ListItem Value="OffHold">Take Order Off Hold</asp:ListItem>
            <asp:ListItem>Pending</asp:ListItem>
            <asp:ListItem Value="orderemailcs">Send Order Email To CS</asp:ListItem>
            <asp:ListItem Value="orderemailall">Send Order Emall Customer</asp:ListItem>
            <asp:ListItem Value="TRKINFO">Email Tracking Info</asp:ListItem>
        </asp:DropDownList>
     </div>
   
     <div style="float: right; clip: rect(auto, auto, auto, auto);">  <asp:Button ID="Button3" runat="server" Visible=False Text="Print Summary"  
            Width="114px"  /> 
         <br />
     </div>
    
     </div> 
        

      
<div align="center">
   
    <asp:GridView ID="gv1" runat="server" Height="16px" Width="672px" 
            AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" 
            GridLines="None" HorizontalAlign="Center" BorderStyle="Ridge" 
            AllowPaging="True" PageSize="12" 
            DataSourceID="dsorderdetail" DataKeyNames="orderdetailid,pkgid,orderid" 
            Font-Size="10pt" >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="productname" HeaderText="Name" />
            <asp:BoundField DataField="productcode" HeaderText="Product Code" />
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
                
                </asp:TemplateField>
            <asp:TemplateField Visible="False"  >
                    <ItemTemplate>
                        <asp:LinkButton runat="server" ID="btnToggle" Text="Options" 
                            CommandName="Toggle" CommandArgument='<%# Container.DataItemIndex %>' 
                            ForeColor="Blue" />
                    </ItemTemplate>
                    </asp:TemplateField>               
                     <asp:BoundField DataField="pkgid" HeaderText="pkgid" Visible="False" />
            <asp:BoundField DataField="orderid" HeaderText="orderid" Visible="False" />

        </Columns>
        <EditRowStyle BackColor="#999999" />
        <EmptyDataTemplate>
        <div align="center">
       
            <asp:Label ID="Label36" runat="server" Font-Italic="True" Font-Size="XX-Large" 
                ForeColor="Red" Text="No Records To Display"></asp:Label> </div>
        </EmptyDataTemplate>
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
 </div>	
    <asp:FormView 
            ID="FormView2" runat="server" DataSourceID="dscust" Width="683px" 
            DataKeyNames="orderid" Font-Size="10pt" Height="153px">
            <EditItemTemplate>
				 <EditItemTemplate>
			<table style="width:100%; height: 111px;">
        <tr>
            <td class="style47" colspan="2">
                <asp:Label ID="Label37" runat="server" Text='<%# Eval("autherr") %>' 
                    Font-Italic="True" ForeColor="Red"></asp:Label>
            </td>
            <td align="right" class="style48">
                Subtotal:</td>
            <td align="right" class="style48">
                <asp:Label ID="lblsubtot" runat="server" Text='<%# Bind("subtot") %>'></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="left" valign="middle">
                Express Delivery Date:<asp:Label ID="Label38" runat="server" 
                    Text='<%# Eval("expdeliverdate", "{0:d}") %>'></asp:Label></td>
           
            <td align="right" valign="middle">
                 Shipping Method:<asp:Label ID="lblshipmeth" runat="server" 
                    Text='<%# bind("shipmethod") %>' Font-Bold="True"></asp:Label> </td>
           
            <td align="right">
                Shipping:</td>
            <td align="right">
                <asp:Label ID="lblshipping" runat="server" Text='<%# Bind("shpchrg") %>'></asp:Label>
            </td>
        </tr>
        <tr>
			<td align="right" colspan="2">
				<asp:CheckBox ID="cknoshp" runat="server" Text="No Shipping" 
                    AutoPostBack="True" ForeColor="Red" 
                    oncheckedchanged="cknoshp_CheckedChanged" Checked='<%# Bind("noshp") %>' />
				&nbsp; Promotion Code:
				<asp:TextBox ID="txtpromocode" runat="server" Height="21px" 
					Text='<%# bind("promocode") %>' Width="140px" AutoPostBack="True" 
					ontextchanged="txtpromocode_TextChanged" oninit="txtpromocode_Init"></asp:TextBox>
			</td>
			<td align="right">
				Discount:</td>
			<td align="right">
				<asp:Label ID="lblpromoamt" runat="server" Text='<%# bind("discountamt") %>'></asp:Label>
			</td>
		</tr>
        <tr>
            <td align="left" class="style37" rowspan="3" valign="top" colspan="2">
                Notes:<br />
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# bind("ordernotes") %>' 
                    TextMode="MultiLine" Width="437px" Height="43px"></asp:TextBox>
            </td>
            <td align="right" class="style49">
                Tax:</td>
            <td align="right" class="style49">
                <asp:Label ID="lbltax" runat="server" Text='<%# Bind("tax") %>'></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" class="style40">
                Total:</td>
            <td align="right" class="style40">
                <asp:Label ID="lblTotal" runat="server" Text='<%# Bind("total") %>'></asp:Label>
            </td>
        </tr>
        
        
        <tr>
            <td align="right">&nbsp;
                </td>
            <td align="right">
				<asp:Button ID="btnrefresh" runat="server" CommandArgument="Update" 
					onclick="btnrefresh_Click" Text="Refresh" />
				&nbsp;
                </td>
        </tr>
        
        
    </table>
    <asp:HiddenField ID="hforderid1" runat="server" 
                    Value='<%# Eval("orderid") %>' />
                <asp:HiddenField ID="hfpaytype" runat="server" Value='<%# Eval("paytype") %>' />
                 <asp:HiddenField ID="hfcardnum" runat="server" Value='<%# Eval("ccnum") %>' />
                 <asp:HiddenField ID="hftransid" runat="server" 
                    Value='<%# Eval("authnettranid") %>' />
                <asp:HiddenField ID="hfauthcode" runat="server" 
                    Value='<%# Eval("pauthcode") %>' />
			</EditItemTemplate>
			</EditItemTemplate>
            <ItemTemplate>
                <hr />
              
  <table style="width:100%;">
        <tr>
            <td align="left" colspan="2">
               
                <asp:Label ID="Label37" runat="server" Text='<%# Eval("autherr") %>'></asp:Label>
               
            </td>
            <td align="right" class="style46">
                Subtotal:</td>
            <td align="right" class="style46">
                <asp:Label ID="lblsubtot" runat="server" Text='<%# Bind("subtot") %>'></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="left">
                Express Delivery Date:<asp:Label ID="Label38" runat="server" 
                    Text='<%# Eval("expdeliverdate", "{0:d}") %>'></asp:Label>
            </td>
            <td align="right">
                Shipping Method: <asp:Label ID="lblshipmeth" runat="server" 
                    Text='<%# bind("shipmethod") %>' Font-Bold="True"></asp:Label></td>
            <td align="right">
                Shipping:</td>
            <td align="right">
                <asp:Label  ID="lblshipping" runat="server" 
                    Text='<%# Bind("shpchrg") %>'></asp:Label>       
            </td>
        </tr>
        <tr>
			<td align="right" colspan="2">
				
				Promotion Code:<asp:Label ID="Label35" runat="server" Text='<%# bind("promocode") %>'></asp:Label>
&nbsp;</td>
			<td align="right" class="style51">
				Discount:</td>
			<td align="right" class="style51">
				<asp:Label ID="lblpromoamt" runat="server" Text='<%# bind("discountamt") %>'></asp:Label></td>
		</tr>
        <tr>
            <td align="left" class="style42" rowspan="3" valign="top" colspan="2">
                Notes:<asp:TextBox ID="TextBox1" runat="server" Height="50px" 
                    Text='<%# bind("ordernotes") %>' TextMode="MultiLine" Width="502px" 
                    ReadOnly="True"></asp:TextBox>
            </td>
            <td align="right" class="style2">
                Tax:</td>
            <td align="right">
                <asp:Label ID="lbltax" runat="server" 
                    Text='<%# Bind("tax") %>' ></asp:Label>
                </td>
        </tr>
        <tr>
            <td align="right" class="style2">
                Total:</td>
            <td align="right">
                <asp:Label id="lblTotal" runat="server" 
                    Text='<%# Bind("total") %>' ></asp:Label>
                </td>
        </tr>
        <tr>
            <td align="right">&nbsp;
                </td>
        </tr>
    </table>
     <asp:HiddenField ID="hforderid" runat="server" Value='<%# Eval("orderid") %>' />
                <asp:HiddenField ID="hfpaytype" runat="server" Value='<%# Eval("paytype") %>' />
                <asp:HiddenField ID="hfcardnum" runat="server" Value='<%# Eval("ccnum") %>' />
                 <asp:HiddenField ID="hftransid" runat="server" 
                    Value='<%# Eval("orderid") %>' />
                <asp:HiddenField ID="hfauthcode" runat="server" 
                    Value='<%# Eval("pauthcode") %>' />
                
    </ItemTemplate>
    </asp:FormView>
    <div>
        <asp:Label ID="Label4" runat="server" Text="Payments" Font-Bold="True" 
            Font-Underline="True"></asp:Label>
    </br>
        <asp:GridView ID="gvpayments" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="dscust" ForeColor="#333333" GridLines="None" 
            Height="16px" PageSize="3" Width="689px" Font-Size="Smaller">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="paydate" HeaderText="Payment Date" 
                    SortExpression="paydate" />
                <asp:BoundField DataField="amount" HeaderText="Amount" 
                    SortExpression="amount" />
                <asp:BoundField DataField="ppaytype" HeaderText="Type" 
                    SortExpression="ppaytype" />
                <asp:BoundField DataField="transid" HeaderText="Trans Id" 
                    SortExpression="transid" />
                <asp:BoundField DataField="pauthcode" HeaderText="Auth Code" 
                    SortExpression="pauthcode" />
                <asp:BoundField DataField="pccnum" HeaderText="Ref Num" 
                    SortExpression="pccnum" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <EmptyDataTemplate>
                NO data
            </EmptyDataTemplate>
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
    </div>
<eo:MsgBox 
         ID="MsgBox1" runat="server" BackColor="#EBEBEB" CloseButtonUrl="00070301" 
         ControlSkinID="None" HeaderHtml="Dialog Title" Height="91px" Width="332px">
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
<asp:SqlDataSource ID="dsorderdetail" runat="server" 
		ConnectionString="<%$ ConnectionStrings:KK5 %>" 
		ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
		SelectCommand="SELECT orderid, orderdetailid, productcode, productname, quantity, prodprice, totalprice, pkgid FROM orderdetail WHERE (orderid = @orderid)" 
		DeleteCommand="DELETE FROM orderdetail WHERE (orderid = @orderdid)">
		<DeleteParameters>
			<asp:ControlParameter ControlID="FormView2" Name="orderid" 
				PropertyName="SelectedValue" />
		</DeleteParameters>
		<SelectParameters>
			<asp:ControlParameter ControlID="FormView2" DefaultValue="0" Name="orderid" 
                PropertyName="SelectedValue" />
		</SelectParameters>
	</asp:SqlDataSource>
    <asp:SqlDataSource ID="dspayment" runat="server" 
        ConnectionString="<%$ ConnectionStrings:KK5 %>" 
        ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>">
    </asp:SqlDataSource>
    <asp:HiddenField ID="hforderstatus" runat="server" 
                    
                    /><asp:SqlDataSource ID="dsstates" runat="server" 
        ConnectionString="<%$ ConnectionStrings:KK5 %>" 
        ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
        
        
        SelectCommand="SELECT trim(name) AS name, trim(abrv) as abrv, id FROM states ORDER BY name"></asp:SqlDataSource>
<asp:SqlDataSource ID="dsorderdetailmisc" runat="server" 
		ConnectionString="<%$ ConnectionStrings:KK5 %>" 
		ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
		SelectCommand="SELECT orderid, orderdetailid, productcode, productname, quantity, prodprice, totalprice, pkgid FROM orderdetail WHERE (orderid = @orderid)" 
		DeleteCommand="DELETE FROM orderdetail WHERE (pkgid = '&quot;a&quot;')">
		<SelectParameters>
			<asp:ControlParameter ControlID="DetailsView2" DefaultValue="0" Name="orderid" 
                PropertyName="SelectedValue" />
		</SelectParameters>
	</asp:SqlDataSource>

<asp:SqlDataSource ID="dsorderoptions" runat="server" 
		ConnectionString="<%$ ConnectionStrings:KK5 %>" 
		ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
		SelectCommand="SELECT OrderId, DetailId, OpId, opdesc, pkgid, id, qty FROM orderoptions WHERE (OrderId = @orderid)" 
		DeleteCommand="DELETE FROM orderoptions WHERE (OrderId = @orderid)">
		<DeleteParameters>
			<asp:ControlParameter ControlID="FormView2" Name="orderid" 
				PropertyName="SelectedValue" />
		</DeleteParameters>
		<SelectParameters>
			<asp:ControlParameter ControlID="DetailsView1" DefaultValue="0" Name="orderid" 
				PropertyName="SelectedValue" />
		</SelectParameters>
	</asp:SqlDataSource>
    
<asp:SqlDataSource ID="dsOrders" runat="server" 
		ConnectionString="<%$ ConnectionStrings:KK5 %>" 
		ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 		
		SelectCommand="SELECT orders.* FROM orders" 
		DeleteCommand="DELETE FROM orders WHERE (orderid = @orderid)">
	</asp:SqlDataSource>
	<asp:SqlDataSource ID="dsorders1" runat="server" 
		ConnectionString="<%$ ConnectionStrings:KK5 %>" 
		ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
		
		
		
		
		
		SelectCommand="SELECT orderid, customerid, scompanyname, sfname, slname, saddr, sadd2, scity, sstate, szip, sphone, sfax, ponumber, shipped, orderdate, shipdate, ordernotes, subtot, shipmethod, shpchrg, tax, total, business, residential, taxexempt, semailaddress, authnettranid, orderid AS Expr1, authcode, autherr, bo, onhold, country, volcustid, international, volorderid, ccnum, promocode, discountamt, paymentcompleted, ordercanceled, orderstatus, authdate, paytype FROM orders WHERE (orderid = @orderid)" 
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
<asp:SqlDataSource 
		ID="dscust" runat="server" 
		ConnectionString="<%$ ConnectionStrings:KK5 %>" 
		ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 		
		SelectCommand="SELECT cust.fname, cust.lname, cust.EmailAddress, cust.CompanyName, cust.billingaddr1, cust.billingaddr2, cust.city, cust.state, cust.postalcode, cust.phonenumber, cust.taxexempt, orders.orderid, orders.scompanyname, orders.sfname, orders.slname, orders.saddr, orders.sadd2, orders.scity, orders.sstate, orders.szip, orders.sphone, orders.sfax, orders.ponumber, orders.orderdate, orders.ordernotes, orders.subtot, orders.shipmethod, orders.shpchrg, orders.tax, orders.total, orders.authnettranid, orders.bo, orders.orderstatus, orders.promocode, orders.authdate, orders.paytype, orders.discountamt, orders.autherr, orders.ccnum, cust.custid, orders.paymentcompleted, payment.orderid AS porderid, payment.paydate, payment.amount, payment.paytype AS ppaytype, payment.transid, payment.authcode AS pauthcode, payment.ccnum AS pccnum, payment.notes, payment.payid, orders.expdeliverdate, orders.noshp, orders.shpdate, orders.carrier, orders.trknumber FROM payment RIGHT OUTER JOIN orders ON payment.orderid = orders.orderid RIGHT OUTER JOIN cust ON orders.customerid = cust.custid WHERE (orders.orderid = @orderid)" 
		DeleteCommand="DELETE FROM orders WHERE (orderid = @orderid)" UpdateCommand="UPDATE orders SET scompanyname = @scompanyname, sfname = @sfname, slname = @slname, saddr = @saddr, sadd2 = @sadd2, scity = @scity, sstate = @sstate, szip = @szip,carrier=@carrier,trknumber=@trknumber, ponumber = @ponumber,shipmethod=@shipmethod, authnettranid = @authnettranid,authcode=@authcode,bo = @bo, shpdate = @shpdate,trknumber=@trknumber,carrier=@carrier WHERE (orderid = @orderid)">
		<DeleteParameters>
			<asp:ControlParameter ControlID="FormView2" Name="orderid" 
				PropertyName="SelectedValue" />
		</DeleteParameters>
	    <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="orderid" 
                QueryStringField="orderid" />
        </SelectParameters>
	    <UpdateParameters>
            <asp:ControlParameter ControlID="DetailsView2" Name="orderid" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView2" DefaultValue="0" Name="bo" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView1" DefaultValue="" Name="custid" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="DetailsView2" DefaultValue="" Name="shpdate" PropertyName="SelectedValue" />
        </UpdateParameters>
	</asp:SqlDataSource>
 <asp:HiddenField ID="x_type" runat="server" Value="PRIOR_AUTH_CAPTURE" />
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