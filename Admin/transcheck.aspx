<%@ Page Language="VB" AutoEventWireup="false" CodeFile="transcheck.aspx.vb" Inherits="Admin_transcheck" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- InstanceBeginEditable name="head" -->


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>Transaction Check</title>
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


<div id="menu">
  <div id="browse"> Browse Products </div>
  <ul id="verticalmenu" class="glossymenu">
	<li><a href="../packages.aspx">Packages</a></li>
	<li><a href="../capsandgowns.aspx" >Caps and Gowns</a></li>
	<li><a href="../tasselsandsashes.aspx">Tassels and Sashes</a></li>
	<li><a href="../diplomasandcertificates.aspx">Diplomas and Certificates</a></li>
	<li><a href="../accessories.aspx" >Accessories</a></li>
       <li><a href="../cartpages/banners.aspx" ><span style="color:#DF0003; font-weight:500">NEW! </span> Graduation Banners</a></li>
   <li><asp:LinkButton ID="LinkButton1" runat="server" Visible="False" 
		PostBackUrl="~/Admin/Admin.aspx">Administration</asp:LinkButton>  </li>
	  
  </ul>
 <div id="ssl"> <img src="../images/verisign.png" width="75" height="38" alt="SSL Certificate" /></div></div>

<!-- InstanceBeginEditable name="Content" -->
<div id="content">
	<div style="height: 83px">   
        <asp:FileUpload ID="FileUpload1" runat="server"  Height="29px" Width="384px" 
            size="45" TabIndex="14" /> 
       <asp:Label ID="Label2" runat="server" Text="Authorize.net downloaded file." 
            Font-Italic="True" Font-Size="Smaller"></asp:Label>
       
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Run Check" Width="175px" />       
    &nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Print Report" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblcount" runat="server" Font-Italic="True" Font-Size="Small" 
            ForeColor="Red"></asp:Label>
    </div>
	
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
                GridLines="None" Width="700px" AutoGenerateColumns="False" 
        Height="165px" AllowPaging="True">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField HeaderText="Order Id">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("invoicenum") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("invoicenum") %>'></asp:Label>
                            <br />
                           
                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Underline="True" 
                                Text="Card Number"></asp:Label>
                            <br />
                            <asp:Label ID="Label6" runat="server" Text='<%# eval("CardNum") %>'></asp:Label>
                           
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Transaction #">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TransactionId") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("TransactionId") %>'></asp:Label><br />
                             <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Underline="True" 
                                Text="Auth Code"></asp:Label>
                            <br />
                            <asp:Label ID="Label4" runat="server" Text='<%# eval("authcode") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="First Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("fname") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("fname") %>'></asp:Label>
                            <br />
                         <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Underline="True" 
                                Text="Last Name"></asp:Label>
                            <br />
                            <asp:Label ID="Label8" runat="server" Text='<%# eval("lname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Amount">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("amount") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("amount") %>'></asp:Label>
                            <br />
                            <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Underline="True" 
                                Text="Status"></asp:Label>
                            <br />
                            <asp:Label ID="Label11" runat="server" Text='<%# eval("status") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="email" HeaderText="Email" 
                        DataFormatString="&lt;a href=mailto:{0}&gt;{0}&lt;/a&gt;" 
                        HtmlEncodeFormatString="False" />
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
<asp:SqlDataSource ID="dsorders" runat="server" 
        ConnectionString="<%$ ConnectionStrings:KK5 %>" 
        ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
        SelectCommand="SELECT orderid, customerid, SUBSTRING(authnettranid FROM -10) AS Expr1 FROM orders"></asp:SqlDataSource>
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
