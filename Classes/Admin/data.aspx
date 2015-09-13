<%@ Page Language="VB" AutoEventWireup="false" CodeFile="data.aspx.vb" Inherits="Admin_data" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<asp:Button ID="Button1" runat="server" Text="Import" />		
		<asp:Button ID="Button2" runat="server" Text="change state" />
    
		<asp:Button ID="Button3" runat="server" Text="username" />
    
    	<asp:Button ID="Button4" runat="server" Text="Import volusion orders" />
    
    	<asp:Button ID="Button5" runat="server" Text="Import volusion order details" />
    
    </div>
    <asp:SqlDataSource ID="dscust" runat="server" 
		ConnectionString="<%$ ConnectionStrings:KK5 %>" 
		InsertCommand="INSERT INTO cust(fname, lname, EmailAddress, billingaddr1, billingaddr2, city, phonenumber, emailsubscriber, CompanyName, state, postalcode, oraclshoporder, oraclecustid) VALUES (@fname, @lname, @EmailAddress, @billingaddr1, @billingaddr2, @city, @phonenumber, @emailsubscriber, @CompanyName, @state, @postalcode, @oracleshoporder, @oraclecustid)" 
		ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>"></asp:SqlDataSource>

		<asp:SqlDataSource ID="DSSTATE" runat="server" 
		ConnectionString="<%$ ConnectionStrings:KK5 %>" 
		InsertCommand="INSERT INTO cust(fname, lname, EmailAddress, billingaddr1, billingaddr2, city, phonenumber, emailsubscriber, CompanyName, state, postalcode, oraclshoporder, oraclecustid) VALUES (@fname, @lname, @EmailAddress, @billingaddr1, @billingaddr2, @city, @phonenumber, @emailsubscriber, @CompanyName, @state, @postalcode, @oracleshoporder, @oraclecustid)" 
		ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>"></asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="dsorders" runat="server" 
		ConnectionString="<%$ ConnectionStrings:KK5 %>" 
		InsertCommand="INSERT INTO cust(fname, lname, EmailAddress, billingaddr1, billingaddr2, city, phonenumber, emailsubscriber, CompanyName, state, postalcode, oraclshoporder, oraclecustid) VALUES (@fname, @lname, @EmailAddress, @billingaddr1, @billingaddr2, @city, @phonenumber, @emailsubscriber, @CompanyName, @state, @postalcode, @oracleshoporder, @oraclecustid)" 
		ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>"></asp:SqlDataSource>

    <asp:SqlDataSource ID="dsorderdetail" runat="server" 
		ConnectionString="<%$ ConnectionStrings:KK5 %>" 
		InsertCommand="INSERT INTO cust(fname, lname, EmailAddress, billingaddr1, billingaddr2, city, phonenumber, emailsubscriber, CompanyName, state, postalcode, oraclshoporder, oraclecustid) VALUES (@fname, @lname, @EmailAddress, @billingaddr1, @billingaddr2, @city, @phonenumber, @emailsubscriber, @CompanyName, @state, @postalcode, @oracleshoporder, @oraclecustid)" 
		ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>"></asp:SqlDataSource>

		<br />
    </form>
</body>
</html>
