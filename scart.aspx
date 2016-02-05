<%@ Page Title="" Language="VB"  AutoEventWireup="false" CodeFile="scart.aspx.vb" Inherits="scart" %>
<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_Layout.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->
   <%-- Randy's style for grid--%>
<style type="text/css">
        .FixedHeader {
            position: absolute;
            font-weight: bold;
        }     
    </style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>Shopping Cart</title>


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


<div id="content">
    <div class="step_one"><img src="images/KK_shoppingcart.jpg" alt="" width="600" height="50" /></div>
      <div class="floatright">  
          <br />
    </div>
    <p>
    <div align="right">
    <asp:Button ID="btnshop0" runat="server" 
              PostBackUrl="~/shopjostenshome.aspx" Text="Continue Shopping" Height="28px" 
              Width="138px" />
        <br />
        <br />
    </div>
<div style="height:218px; overflow: auto" align="center">
    <asp:GridView ID="gv1" runat="server"   HeaderStyle-CssClass="FixedHeader" Height="31px" Width="648px" 
           AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
            GridLines="None" HorizontalAlign="Center" BorderStyle="None" 
        DataKeyNames="DetailId" PageSize="16" >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="ProductName" HeaderText="Item" >
            <HeaderStyle HorizontalAlign="Center" Width="200px" />
            <ItemStyle Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="Quantity" HeaderText="Qty">
            <HeaderStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="prodprice" HeaderText="Price">
            <HeaderStyle HorizontalAlign="Center" Width="60px" />
            <ItemStyle Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="totalprice" HeaderText="Total">
            <HeaderStyle HorizontalAlign="Center" Width="100px" />
            <ItemStyle Width="100px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="DetailId" Visible="False">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DetailId") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("DetailId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
            
            
                   
<asp:TemplateField HeaderText="Options">
                <ItemTemplate>
                 <asp:GridView ID="opd" runat="server" AutoGenerateColumns="False" CellPadding="4"  
                        ForeColor="#333333" GridLines="None" ShowHeader="False" 
                        >
            <Columns>
               
                <asp:BoundField DataField="opdesc" HeaderText="op" >
               
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
               
                </Columns>
                 </asp:GridView>
                </ItemTemplate>
                
                <HeaderStyle HorizontalAlign="Center" Width="100px" />
                
                <ItemStyle Font-Italic="True" Font-Size="8pt" />
                
                </asp:TemplateField>
            <asp:TemplateField >
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Remove Item"> </asp:LinkButton>
                </ItemTemplate>
                <HeaderStyle Width="107px" />
                <ItemStyle Width="85px" Wrap="False" Font-Size="6pt" ForeColor="Silver" />
            </asp:TemplateField>



            <asp:TemplateField HeaderText="ProdCode" Visible="False">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("productcode") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("productcode") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>



        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
            Height="30px" HorizontalAlign="Center" CssClass="FixedHeader" />
        <PagerSettings Mode="NextPreviousFirstLast" NextPageText="Next Page" 
            PreviousPageText="Previous Page" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" 
            Font-Size="6pt" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="18px" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

<SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

<SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

<SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

<SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
    </asp:GridView>
    </div>
    </p>


    <hr />	

  <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div style="padding: 2px">
    <span class="pkg_order_instr"> *If you are located in Canada, please call our Canadian office at 1-800-665-7597 ext 51832</span>
     </div>  
<div class="invoice">
  
 
<table style="width:700px;">
        <tr>
            <td class="style1" colspan="2">&nbsp;
                </td>
            <td align="right" class="style49">
                &nbsp;Subtotal:</td>
            <td width="26%" align="right">
           
              <asp:Label ID="lblsubtot" runat="server">0</asp:Label>
              
            </td>
        </tr>
        <tr>
            <td align="right" class="style39">
                Promotion Code:</td>
            <td class="style46">
           
              <asp:TextBox ID="txtpromocode" runat="server" AutoPostBack="True" 
                                                                MaxLength="20" 
                    style="margin-left: 0px" Width="137px" TabIndex="28"></asp:TextBox>
                    
                          </td>
            <td align="right" class="style40">Discount:</td>
            <td align="right" class="style41">
               
              <asp:Label ID="lbldiscount" runat="server" Text="0"></asp:Label> 
              
            </td>
        </tr>

        <tr>
            <td align="right" class="style39">
                *Shipping Method:<br />
                <asp:Label ID="Label3" runat="server" Text="Expedited delivery by:" 
                    Visible="False"></asp:Label>
            </td>
            <td class="style46">
           
            <asp:DropDownList ID="ddlshipmeth1" runat="server" 
                                                        Height="24px" Width="232px" 
                                                        
                                   
                                    SelectedValue='<%# bind("shipmethod") %>' 
                    AppendDataBoundItems="True" AutoPostBack="True" 
                                    >
                                                                <asp:ListItem Value="STANDARD" Selected="True">Standard - 10 Business Days</asp:ListItem>
                                                                <asp:ListItem Value="RUSH">Rush Delivery </asp:ListItem> 
                                                                <asp:ListItem Value="EXPRESS">Express</asp:ListItem> 
                                                                <asp:ListItem Value="AK/HI">Alaska/Hawaii - 10 Business Days</asp:ListItem>
                                                                <asp:ListItem Value="INTERNATIONAL">International - 20 Business Days</asp:ListItem>
                                                            </asp:DropDownList>
                
                
                
                <eo:DatePicker ID="DatePicker1" runat="server" ControlSkinID="None" 
                    DayCellHeight="16" DayCellWidth="22" DayHeaderFormat="Short" DisabledDates="" 
                    MonthSelectorVisible="True" SelectedDates="" 
                    TitleLeftArrowDownImageUrl="00040103" TitleLeftArrowImageUrl="00040101" 
                    TitleRightArrowDownImageUrl="00040104" TitleRightArrowImageUrl="00040102" 
                    VisibleDate="2013-12-01" WeekSelectorVisible="True" 
                       Visible="False" AllowMultiSelect="False" AutoPostbackOnSelect="True">
                    <CalendarStyle CssText="border-bottom-color:Black;border-bottom-style:solid;border-bottom-width:1px;border-left-color:Black;border-left-style:solid;border-left-width:1px;border-right-color:Black;border-right-style:solid;border-right-width:1px;border-top-color:Black;border-top-style:solid;border-top-width:1px;padding-bottom:5px;padding-left:5px;padding-right:5px;padding-top:5px;background-color:white" />
                    <TitleStyle CssText="PADDING-RIGHT: 3px; PADDING-LEFT: 3px; FONT-WEIGHT: bold; FONT-SIZE: 8pt; PADDING-BOTTOM: 3px; COLOR: white; PADDING-TOP: 3px; FONT-FAMILY: Tahoma; BACKGROUND-COLOR: #0054e3" />
                    <MonthStyle CssText="MARGIN: 0px 4px; cursor:hand" />
                    <DayHeaderStyle CssText="FONT-SIZE: 11px; COLOR: #0054e3; BORDER-BOTTOM: black 1px solid; FONT-FAMILY: Tahoma" />
                    <DayStyle CssText="FONT-SIZE: 8pt; FONT-FAMILY: Tahoma; text-decoration:none" />
                    <DayHoverStyle CssText="FONT-SIZE: 8pt; FONT-FAMILY: Tahoma; text-decoration:underline" />
                    <TodayStyle CssText="background-image:url('00040106');" />
                    <SelectedDayStyle CssText="FONT-SIZE: 8pt; FONT-FAMILY: Tahoma; background-image:url('00040105');color:white;" />
                    <DisabledDayStyle CssText="FONT-SIZE: 8pt; FONT-FAMILY: Tahoma; COLOR: gray" />
                    <FooterTemplate>
                        <div style="FONT-WEIGHT: bold; FONT-SIZE: 11px; FONT-FAMILY: Tahoma&quot;">
                            <img src="{img:00040106}" />
                            Today: {var:today:MM/dd/yyyy}
                        </div>
                    </FooterTemplate>
                </eo:DatePicker>
             
                <asp:RequiredFieldValidator ID="rfdate" runat="server" 
                    ControlToValidate="DatePicker1" Display="Dynamic" Enabled="False" 
                    ErrorMessage="Please enter a date"></asp:RequiredFieldValidator>
             
            </td>
            <td align="right" class="style40">Shipping:
            </td>
            <td align="right" class="style41">
           
              <asp:Label ID="lblshipping" runat="server" Text="0"></asp:Label>
               
            </td>
        </tr>
        <tr>
            <td align="right" class="style39">
                **Enter a zip code to update sales tax:</td>
            <td class="style46">
             
              <asp:TextBox ID="txtzip" runat="server" AutoPostBack="True" MaxLength="15" 
                    Width="138px" CausesValidation="True"></asp:TextBox>

                
            </td>
            <td align="right" class="style40">Tax:</td>
            <td align="right" class="style41">
            
              <asp:Label ID="lbltax" runat="server" Text="0"></asp:Label>
             

            </td>
        </tr>
        <tr>
            <td class="style51"></td>
            <td class="style45">
            <asp:Button ID="Button2" runat="server" Height="24px" Text="Refresh" 
                    UseSubmitBehavior="False" Width="87px" />
            </td>
            <td align="right" class="style40"><strong>Total:</strong></td>
            <td align="right" class="style41">
            
              <asp:Label ID="lbltotal" runat="server" Text="0"></asp:Label>
            

            </td>
        </tr>
        <tr>
            <td class="style1" colspan="4" align="right">
    <asp:Button ID="Button1" runat="server" 
        Text="Check Out" Height="23px" />
            </td>
        </tr>
        
    </table>
    <div style="padding: 10px">
    <span class="pkg_order_instr"> *Orders placed after 12:00 p.m.(noon) central time will be processed on the next business day. Please allow 5 business days for delivery on Express orders placed after 12:00 p.m.</span><br /><br />
    <span class="pkg_order_instr"> **If you are tax exempt, please note that tax will be charged when order is placed online, and then refunded once certificate is verified. Create an account to upload tax certificate online.</span>
     </div>         
        <asp:HiddenField ID="hftaxabletotal" runat="server" />
</div>
<!--<p style="color:#F00; font-weight:bold">Our plant will be closed July 3rd - July 17th. Orders placed during this time frame will be received and processed on July 20th with processing and shipping time beginning that day. Orders placed by or before July 2nd will be shipped and delivered by the time frame given at the time the order is placed. </p>-->
</div>





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
