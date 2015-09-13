<%@ Page Title="" Language="VB"  AutoEventWireup="false" CodeFile="PaymentProcess.aspx.vb" Inherits="PaymentProcess" %>
<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>



<%@ Register assembly="EclipseWebSolutions.DatePicker" namespace="EclipseWebSolutions.DatePicker" tagprefix="cc1" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_LayoutSubfolder.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<title>Process Payments</title>
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
	  <img alt="" height="101" src="../images/jostenslogo.PNG" border="0" 
		  width="270" /></a></div>
<div id="headright" style="width: 689px"><br />
	<a href="../shopjostenshome.aspx">
	<img src="../images/Kinderkraft_2.jpg" width="160" height="34" alt="" /></a>
	<p><asp:LinkButton ID="lklogin" runat="server" OnClick="lklogin_Click" 
			>Log In </asp:LinkButton> | <a href="../scart.aspx">View Cart</a></p><br /><br />
<div class="welcome"><asp:Label ID="Label1" runat="server" Text="Welcome, GUEST" Visible="False" ></asp:Label></div>
<div align="left">
  <asp:Label ID="lblcurrentcustomer" runat="server" Text="Current Customer is:" 
        Font-Italic="True" Font-Size="Larger" Visible="False"></asp:Label>
</div>
</div>




<!-- InstanceBeginEditable name="Content" -->
<div id="customcontent"> 
	<asp:ScriptManager ID="ScriptManager1" runat="server">
	</asp:ScriptManager>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <div>
    &nbsp;<asp:TextBox ID="txtorderid" runat="server" 
        CausesValidation="True" Width="125px"></asp:TextBox>&nbsp;
    <asp:Button ID="Button1"
        runat="server" Text="Search Order Id" />	
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
        runat="server" ControlToValidate="txtorderid" Display="Dynamic" 
        ErrorMessage="Must be numeric" Font-Italic="True" Font-Size="Small" 
        ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
        &nbsp;
        <br />
&nbsp;<asp:DropDownList ID="ddlstatus" runat="server" Height="19px" 
            Width="150px">
            <asp:ListItem>PROCESSING</asp:ListItem>
            <asp:ListItem>ALL</asp:ListItem>
            <asp:ListItem>CAPTURE</asp:ListItem>
            <asp:ListItem>VOID</asp:ListItem>
            <asp:ListItem>REFUND</asp:ListItem>
            <asp:ListItem>ON HOLD</asp:ListItem>
            <asp:ListItem>PENDING</asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="Label6" runat="server" Text="Status" Font-Size="Small"></asp:Label>
    
        
        &nbsp;<cc1:DatePicker ID="DatePicker1" runat="server" />
&nbsp;
    
        
        to 
       
        <cc1:DatePicker ID="DatePicker2" runat="server" />
&nbsp;<asp:Button ID="Button2" runat="server" Text="Search Status/Order Date" 
            Width="211px" />
    
        <br />
        Orders Exported=<asp:DropDownList ID="ddlexport" runat="server">
            <asp:ListItem Value="1">True</asp:ListItem>
            <asp:ListItem Value="0">False</asp:ListItem>
        </asp:DropDownList>
&nbsp;<asp:Button ID="Button3" runat="server" Text="Search Exported" />
    
        </div>
        <div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="Small" 
                ForeColor="Blue" PostBackUrl="~/Admin/Admin.aspx">To Administration Page</asp:LinkButton>
        </div>
&nbsp;<div id="grdCharges" runat="server" style="width: 951px; overflow: auto; margin-right: 6px; margin-left: 6px;">
<div align="center"> 
    <asp:Label ID="lblreccount" runat="server" ForeColor="Red"></asp:Label></div>
	
	<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
		AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
		DataSourceID="dscustord" ForeColor="#333333" GridLines="Horizontal" Width="100%" 
            Font-Size="Small">
		<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
		<Columns>
			<asp:TemplateField HeaderText="Order#" InsertVisible="False" 
                SortExpression="orderid">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("orderid") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="lborderid" runat="server" ForeColor="Blue" 
                        onclick="lborderid_Click" Text='<%# Eval("orderid") %>'></asp:LinkButton>
                    <br />
                    <asp:Label ID="lblorderid" runat="server" Text='Order Date' Font-Bold="True" 
                        Font-Underline="True"></asp:Label>
                    <br />
                    <asp:Label ID="lblorderdate" runat="server" 
                        Text='<%# Eval("orderdate", "{0:d}") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" Width="70px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Order Total" SortExpression="total">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("total") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbltotal" runat="server" Text='<%# Bind("total") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Underline="True" 
                        Text="Payment Type"></asp:Label>
                    <br />
                    <asp:Label ID="lblpaytype" runat="server" Text='<%# Eval("paytype") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" Width="95px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Customer#" SortExpression="custid">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("custid") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("custid") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Underline="True" 
                        Text="Company Name"></asp:Label>
                    <br />
                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("CompanyName") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="225px" />
            </asp:TemplateField>
			<asp:TemplateField HeaderText="Status" SortExpression="orderstatus">
				<EditItemTemplate>
					<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("orderstatus") %>'></asp:TextBox>
				</EditItemTemplate>
				<ItemTemplate>
					<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
						Height="20px" onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
						SelectedValue='<%# Bind("orderstatus") %>' Width="157px" ondatabound="DropDownList1_DataBound" 
						>
						<asp:ListItem>PROCESSING</asp:ListItem>
						<asp:ListItem>CAPTURE</asp:ListItem>
						<asp:ListItem>VOID</asp:ListItem>
						<asp:ListItem>PENDING</asp:ListItem>
						<asp:ListItem>REFUND</asp:ListItem>
                        <asp:ListItem>ON HOLD</asp:ListItem>
					</asp:DropDownList>
					&nbsp;
				    <asp:Label ID="Label14" runat="server" Font-Italic="True" Font-Size="Smaller" 
                        ForeColor="Red" Text='<%# Eval("autherr") %>'></asp:Label>
				    
                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Underline="True" 
                        Text="Capture Date"></asp:Label>
                    <br />
                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("authdate", "{0:d}") %>'></asp:Label>
				</ItemTemplate>
				<HeaderStyle HorizontalAlign="Center" />
				<ItemStyle HorizontalAlign="Center" Width="100px" />
			</asp:TemplateField>
			<asp:TemplateField HeaderText="Transaction#" SortExpression="authnettranid">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("transid") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbltransid" runat="server" Text='<%# Bind("transid") %>'></asp:Label>
                    <br />
                    <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Underline="True" 
                        Text="Auth Code"></asp:Label>
                    <br />
                    <asp:Label ID="lblauthcode" runat="server" Text='<%# Eval("authcode") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="100px" />
            </asp:TemplateField>
			<asp:TemplateField HeaderText="CC Num" SortExpression="ccnum">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ccnum") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblcardnum" runat="server" Text='<%# Bind("ccnum") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="50px" />
            </asp:TemplateField>
			<asp:BoundField DataField="EmailAddress" HeaderText="Email" 
				SortExpression="EmailAddress"  DataFormatString="<a href=mailto:{0}>{0}</a>" 
                            HtmlEncodeFormatString="False" >
			<ControlStyle ForeColor="#6600CC" />
			<HeaderStyle HorizontalAlign="Center" />
			<ItemStyle HorizontalAlign="Center" Width="60px" Font-Bold="True" 
                ForeColor="#6600CC" />
			</asp:BoundField>
		</Columns>
		<EditRowStyle BackColor="#999999" />
		<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
		<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
		<PagerSettings FirstPageText="First" LastPageText="Last" 
			Mode="NumericFirstLast" NextPageText="Next" PageButtonCount="5" 
			PreviousPageText="Prev" />
		<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" 
			Font-Size="10pt" />
		<RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="28px" />
		<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
		<SortedAscendingCellStyle BackColor="#E9E7E2" />
		<SortedAscendingHeaderStyle BackColor="#506C8C" />
		<SortedDescendingCellStyle BackColor="#FFFDF8" />
		<SortedDescendingHeaderStyle BackColor="#6F8DAE" />
	</asp:GridView>
    
	</div>
    <%Response.Write(Session("capmsg"))%>
	<asp:SqlDataSource ID="dscustord" runat="server" 
		ConnectionString="<%$ ConnectionStrings:KK5 %>" 
		ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
		
		
		
		
		
        
        
        
        
        
        SelectCommand="SELECT cust.fname, cust.lname, cust.EmailAddress, cust.CompanyName, orders.orderid, orders.customerid, orders.orderdate, orders.total, orders.paytype, orders.orderstatus, orders.authdate, cust.custid, orders.autherr, payment.authcode, payment.ccnum, payment.transid FROM cust INNER JOIN orders ON cust.custid = orders.customerid LEFT OUTER JOIN payment ON orders.orderid = payment.orderid WHERE (orders.imported = 0) ORDER BY orders.orderdate DESC, orders.orderstatus DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dspayment" runat="server" 
        ConnectionString="<%$ ConnectionStrings:KK5 %>" 
        ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>">
    </asp:SqlDataSource>
    <eo:MsgBox ID="MsgBox1" runat="server" BackColor="#EBEBEB" ControlSkinID="None" HeaderHtml="Dialog Title" 
        Height="115px" Width="320px">
        <HeaderStyleActive CssText="padding-right: 3px; padding-left: 8px; font-weight: bold; font-size: 10pt; background-image: url(00020213); padding-bottom: 3px; color: white; padding-top: 0px; font-family: 'trebuchet ms';height:20px;" />
        <ContentStyleActive CssText="padding-right: 4px; padding-left: 4px; font-size: 8pt; padding-bottom: 4px; padding-top: 4px; font-family: tahoma" />
        <FooterStyleActive CssText="padding-right: 4px; padding-left: 4px; font-size: 8pt; padding-bottom: 4px; padding-top: 4px; font-family: tahoma" />
        <BorderImages BottomBorder="00020212" BottomLeftCorner="00020207" 
            BottomRightCorner="00020208" LeftBorder="00020210" RightBorder="00020211" 
            TopBorder="00020209" TopLeftCorner="00020201" TopLeftCornerBottom="00020203" 
            TopLeftCornerRight="00020202" TopRightCorner="00020204" 
            TopRightCornerBottom="00020206" TopRightCornerLeft="00020205" />
    </eo:MsgBox>
<asp:HiddenField ID="x_type" runat="server" Value="PRIOR_AUTH_CAPTURE" />

</div>
<!-- InstanceEndEditable -->
</div>

<div id="footer">
  <p><a href="../returns.aspx">Shipping Rates and Returns</a> &nbsp; &#124; &nbsp;  <asp:LinkButton ID="ordstatus" runat="server"  OnClick="ordstatus_Click">Order History</asp:LinkButton> 
  &nbsp; &#124; &nbsp;<a href="../ChangePassword.aspx">Change Password/User Name</a>  &nbsp; &#124; &nbsp; <a href="http://www.jostenskinderkraft.com/contact.html"> Contact Us</a> &nbsp; &#124; &nbsp; <a href="http://www.jostenskinderkraft.com/kinderkraft_home.html">Home</a></p>
  <p><font size="-6">©2013 Jostens, Inc • All Rights Reserved</font></p>
</div></div>



</form>
</body>
<!-- InstanceEnd --></html>
