<%@ Page Title="" Language="VB"  AutoEventWireup="false" CodeFile="CustomerSearch.aspx.vb" Inherits="CustomerSearch" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_LayoutSubfolder.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>Customer Search</title>
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
<div id="content" style="height: auto; width: 682px;">

	<div style="width: 662px; height: 187px;">
   <table width="660">
   <tr><td> <asp:TextBox ID="txtcustidsearch" runat="server" Width="250px" Height="26px"></asp:TextBox> </td>  <td>   
    <asp:Button ID="Button1" runat="server" 
	Text="Search Customer ID" Width="171px" Height="26px" />
<asp:Label ID="Label25" runat="server" Font-Size="6pt" 
		Text="(Leave blank to return all records.)"></asp:Label></td></tr>
   <tr><td><asp:TextBox ID="txtcompnamesearch" runat="server" Width="250px" Height="26px"></asp:TextBox> </td><td>        
       <asp:Button ID="Button2" runat="server" 
	 Text="Search Company Name" Width="171px" Height="26px" /></td></tr>
   <tr><td><asp:TextBox ID="txtzipsearch" runat="server" Width="250px" Height="26px"></asp:TextBox> </td><td>         
       <asp:Button ID="Button3" runat="server" 
	 Text="Search by Zip Code" Width="171px" Height="26px" /></td></tr>
   <tr><td> <asp:TextBox ID="txtlastnamesearch" runat="server" Width="250px" Height="26px"></asp:TextBox> </td><td>            <asp:Button ID="Button4" runat="server" 
	onclick="Button1_Click" Text="Search Last Name" Width="171px" Height="26px" /></td></tr>
   <tr><td> <asp:TextBox ID="txtusername" runat="server" Width="250px" Height="26px"></asp:TextBox></td><td> <asp:Button ID="Button5" runat="server" Text="Search User Name" Width="171px" 
            Height="26px" />       </td></tr>
   <tr><td><asp:TextBox ID="txtoraclecustid" runat="server" Height="26px" Width="248px"></asp:TextBox></td><td> <asp:Button ID="Button6" runat="server" Text="Search by Oracle Cust ID" 
			Width="174px" /></td></tr>
   </table>
   
		

		
   
	</div>
&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;
	<br />

	<br />

	<asp:GridView ID="GridView1" runat="server" CellPadding="4" 
		DataSourceID="dscust" ForeColor="#333333" GridLines="None" Width="660px" 
		AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" 
		DataKeyNames="custid">
		<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
		<Columns>
			<asp:HyperLinkField DataTextField="custid" 
				DataNavigateUrlFields="custid" 
				DataNavigateUrlFormatString="~/Admin/Customers.aspx?custid={0}" HeaderText="Cust Id" >
			<ControlStyle ForeColor="Blue" />
			</asp:HyperLinkField>
			<asp:BoundField DataField="CompanyName" HeaderText="Company Name" 
				SortExpression="CompanyName" />
			<asp:BoundField DataField="fname" HeaderText="First Name" 
				SortExpression="fname" />
			<asp:BoundField DataField="lname" HeaderText="Last Name" 
				SortExpression="lname" />
			<asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
			<asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
			<asp:BoundField DataField="postalcode" HeaderText="Zip Code" 
				SortExpression="postalcode" />
		</Columns>
		<EditRowStyle BackColor="#999999" />
		<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
		<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
		<PagerSettings Mode="NumericFirstLast" />
		<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
		<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
		<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
		<SortedAscendingCellStyle BackColor="#E9E7E2" />
		<SortedAscendingHeaderStyle BackColor="#506C8C" />
		<SortedDescendingCellStyle BackColor="#FFFDF8" />
		<SortedDescendingHeaderStyle BackColor="#6F8DAE" />
	</asp:GridView>
    <div align="center" style="height: auto; width: 682px;">
        <br />
    </div>
	</div>
	<asp:SqlDataSource ID="dscust" runat="server" 
        ConnectionString="<%$ ConnectionStrings:KK5 %>" 
        ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
        SelectCommand="SELECT custid, fname, lname, EmailAddress, password, CompanyName, billingaddr1, billingaddr2, city, state, postalcode, phonenumber, taxid, repofschool, Schname, refby, emailsubscriber, sfname, slname, scompanyname, saddr1, saddr2, scity, sstate, spostalcode, sphonenumber, sfax, residential, business, taxexempt, username, iscs, isorg, oracleshoporder, oraclecustid, holdpayment, bussagree, dollar11, dollar12, dollar13, taxexemptconfirmed FROM cust" 
        
        UpdateCommand="UPDATE cust SET fname = @fname, lname = @lname, EmailAddress = @emailaddress, password = @password, CompanyName = @companyname, billingaddr1 = @billingaddr1, billingaddr2 = @billingaddr2, city = @city, state = @state, postalcode = @postalcode, phonenumber = @phonenumber, taxid = @taxid, repofschool = @repofschool, Schname = @schname, refby = @refby, emailsubscriber = @emailsubscriber, sfname = @sfname, slname = @slname, scompanyname = @scompanyname, saddr1 = @saddr1, saddr2 = @saddr2, scity = @scity, sstate = @sstate, spostalcode = @spostalcode, sphonenumber = @sphonenumber, sfax = @sfax, residential = @residential, business = @business, taxexempt = @taxexempt, iscs = @iscs WHERE (custid = @custid)" 
        
        
        
		InsertCommand="INSERT INTO cust(fname, lname, EmailAddress, password, CompanyName, billingaddr1, billingaddr2, city, state, postalcode, phonenumber, taxid, repofschool, Schname, refby, emailsubscriber, sfname, slname, scompanyname, saddr1, saddr2, scity, sstate, spostalcode, sphonenumber, sfax, residential, business, taxexempt, username, iscs) VALUES (@fname, @lname, @emailaddress, @password, @companyname, @billingaddr1, @billingaddr2, @city, @state, @postalcode, @phonenumber, @taxid, @repofschool, @schname, @refby, @emailsubscriber, @sfname, @slname, @scompanyname, @saddr1, @saddr2, @scity, @sstate, @spostalcode, @sphonenumber, @sfax, @residential, @business, @taxexempt, @username, @iscs)">
        <InsertParameters>
            <asp:ControlParameter ControlID="FormView1" Name="custid" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="FormView1" Name="fname" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="lname" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="emailaddress" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="password" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="companyname" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="billingaddr1" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="billingaddr2" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="city" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="state" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="postalcode" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="phonenumber" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="taxid" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="repofschool" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="schname" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="refby" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="emailsubscriber" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="sfname" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="slname" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="saddr1" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="saddr2" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="scity" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="sstate" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="spostalcode" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="scompanyname" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="sfax" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="sphonenumber" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="residential" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="business" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="taxexempt" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="username" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="iscs" 
                PropertyName="SelectedValue" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtcustidsearch" DefaultValue="0" 
                Name="custid" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtcompnamesearch" DefaultValue="&quot;&quot;" 
                Name="companyname" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtzipsearch" DefaultValue="&quot;&quot;" 
                Name="postalcode" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtlastnamesearch" DefaultValue="&quot;&quot;" 
                Name="lname" PropertyName="Text" />
            <asp:ControlParameter ControlID="txtusername" DefaultValue="&quot;&quot;" 
                Name="username" PropertyName="Text" />
        	<asp:ControlParameter ControlID="txtoraclecustid" DefaultValue="0" 
				Name="oraclecustid" PropertyName="Text" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="FormView1" Name="custid" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="FormView1" Name="fname" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="lname" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="emailaddress" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="password" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="companyname" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="billingaddr1" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="billingaddr2" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="city" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="state" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="postalcode" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="phonenumber" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="taxid" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="repofschool" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="schname" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="refby" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="emailsubscriber" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="sfname" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="slname" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="saddr1" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="saddr2" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="scity" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="sstate" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="spostalcode" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="scompanyname" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="sfax" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="sphonenumber" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="residential" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="business" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="taxexempt" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="username" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="FormView1" Name="iscs" 
                PropertyName="SelectedValue" />
        </UpdateParameters>
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

