<%@ Page Title="" Language="VB"  AutoEventWireup="false" CodeFile="Promotions.aspx.vb" Inherits="Promotions" %>
<%@ Register assembly="EclipseWebSolutions.DatePicker" namespace="EclipseWebSolutions.DatePicker" tagprefix="cc2" %>
<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_LayoutSubfolder.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>Promotions</title>
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
    <li><a href="../clearance.aspx" >Clearance</a></li>
   	<li><asp:LinkButton ID="LinkButton1" runat="server" Visible="False" 
		PostBackUrl="~/Admin/Admin.aspx">Administration</asp:LinkButton></li>
 </ul>
  
  	<div id="ssl"> <img src="../images/verisign.png" width="75" height="38" alt="SSL Certificate" />
    </div>
</div>

<!-- InstanceBeginEditable name="Content" -->

<div id="content" style="height: 1089px; width: 694px; top: 0px; left: -12px;">
	
		&nbsp;<br />
       
        <div style="width: 363px"> 
            <asp:TextBox ID="txtsearch" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button1" runat="server" Text="Search Code" />
            <br />
 </div>
            <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateEditButton="True" 
                AutoGenerateInsertButton="True" AutoGenerateRows="False" CellPadding="4" 
                DataKeyNames="code" DataSourceID="dspromo" ForeColor="#333333" GridLines="None" 
                Height="50px" Width="245px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <EditRowStyle BackColor="#999999" />
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="code" HeaderText="Code" ReadOnly="True" 
                        SortExpression="code" />
                    <asp:TemplateField HeaderText="Start Date" SortExpression="startdte">
                        <EditItemTemplate>
                            <cc2:DatePicker ID="DatePicker3" runat="server" CalendarPosition="DisplayRight" 
                                DateValue='<%# Bind("startdte", "{0:d}") %>' />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <cc2:DatePicker ID="DatePicker3" runat="server" CalendarPosition="DisplayRight" 
                                DateValue='<%# Bind("startdte", "{0:d}") %>' />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("startdte", "{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="End Date" SortExpression="enddte">
                        <EditItemTemplate>
                            <cc2:DatePicker ID="DatePicker4" runat="server" CalendarPosition="DisplayRight" 
                                DateValue='<%# Bind("enddte", "{0:d}") %>' />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <cc2:DatePicker ID="DatePicker4" runat="server" CalendarPosition="DisplayRight" 
                                DateValue='<%# Bind("enddte", "{0:d}") %>' />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("enddte", "{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="percentage" HeaderText="Percentage" 
                        SortExpression="percentage" />
                    <asp:BoundField DataField="amount" HeaderText="Amount" 
                        SortExpression="amount" />
                </Fields>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            </asp:DetailsView>

            <br />

	    

	<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
		CellPadding="4" DataSourceID="dspromotions0" ForeColor="#333333" GridLines="None" 
		Width="514px" AllowPaging="True" DataKeyNames="code" AllowSorting="True">
		<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
		<Columns>
			<asp:CommandField ShowSelectButton="True" />
			<asp:BoundField DataField="code" HeaderText="Code" ReadOnly="True" 
                SortExpression="code" />
			<asp:BoundField DataField="startdte" HeaderText="Start Date" 
                DataFormatString="{0:M-dd-yyyy}" SortExpression="startdte" />
			<asp:BoundField DataField="enddte" HeaderText="End Date" 
                DataFormatString="{0:M-dd-yyyy}" SortExpression="enddte" />
			<asp:BoundField DataField="percentage" HeaderText="Percentage" 
                SortExpression="percentage" />
		    <asp:BoundField DataField="amount" HeaderText="Amount" 
                SortExpression="amount" />
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
	
   
   

        </div>
  
  <eo:MsgBox ID="MsgBox1" runat="server" CloseButtonUrl="00070301" 
            ControlSkinID="None" HeaderHtml="Dialog Title" Height="216px" 
            Width="320px" BackColor="#EBEBEB">
            <HeaderStyleActive CssText="padding-right: 3px; padding-left: 8px; font-weight: bold; font-size: 10pt; background-image: url(00020213); padding-bottom: 3px; color: white; padding-top: 0px; font-family: 'trebuchet ms';height:20px;" />
            <ContentStyleActive CssText="padding-right: 4px; padding-left: 4px; font-size: 8pt; padding-bottom: 4px; padding-top: 4px; font-family: tahoma" />
            <FooterStyleActive CssText="padding-right: 4px; padding-left: 4px; font-size: 8pt; padding-bottom: 4px; padding-top: 4px; font-family: tahoma" />
            <BorderImages BottomBorder="00020212" BottomLeftCorner="00020207" 
                BottomRightCorner="00020208" LeftBorder="00020210" RightBorder="00020211" 
                TopBorder="00020209" TopLeftCorner="00020201" TopLeftCornerBottom="00020203" 
                TopLeftCornerRight="00020202" TopRightCorner="00020204" 
                TopRightCornerBottom="00020206" TopRightCornerLeft="00020205" />
        </eo:MsgBox>
 <asp:SqlDataSource ID="dspromotions0" runat="server" 
        ConnectionString="<%$ ConnectionStrings:KK5 %>" 
        ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
        SelectCommand="SELECT promotions.* FROM promotions"></asp:SqlDataSource>
 <asp:SqlDataSource 
        ID="dspromo" runat="server" ConnectionString="<%$ ConnectionStrings:KK5 %>" 
        InsertCommand="INSERT INTO promotions(amount, percentage, enddte, startdte, code) VALUES (@amount, @percentage, @enddte, @startdte, upper(@code))" 
        ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
        SelectCommand="SELECT code, startdte, enddte, percentage, amount FROM promotions WHERE (code = @code)" 
        
        
        UpdateCommand="UPDATE promotions SET  startdte = @startdte, enddte = @enddte, percentage = @percentage, amount = @amount WHERE (code = @code)">
        <InsertParameters>
            <asp:ControlParameter ControlID="DetailsView2" Name="code" 
                PropertyName="SelectedValue" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" DefaultValue="1" Name="@code" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
   

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
