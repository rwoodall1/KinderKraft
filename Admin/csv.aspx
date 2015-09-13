<%@ Page Language="VB" AutoEventWireup="false" CodeFile="csv.aspx.vb" Inherits="Admin_csv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <asp:Button ID="Button1" runat="server" Text="Button" />
        <asp:SqlDataSource ID="dstable" runat="server" 
            ConnectionString="<%$ ConnectionStrings:KK5 %>" 
            ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
            
            
            
            
            
            
            
            SelectCommand="SELECT cust.custid, cust.oraclecustid, orders.orderid, cust.fname, cust.lname, cust.phonenumber, cust.EmailAddress, orders.total, orders.shpchrg, orders.shipmethod, orders.subtot, orders.tax, orderdetail.orderdetailid, orderdetail.productcode, orderdetail.quantity, orderdetail.prodprice, orderdetail.pkgid, orders.scompanyname, orders.sfname, orders.slname, orders.saddr, orders.scity, orders.sstate, orders.szip, orders.sphone, orders.sfax, orders.orderdate, orders.discountamt, orders.scountry, orders.international, orders.imported, orders.shpcode, orders.orderstatus, cust.taxexempt, cust.taxexemptconfirmed, orders.ponumber, cust.isorg FROM orderdetail LEFT OUTER JOIN cust INNER JOIN orders ON cust.custid = orders.customerid ON orderdetail.orderid = orders.orderid WHERE (orders.imported = 0) AND (trim(orders.orderstatus) = 'CAPTURE')">
        </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="dspayment" runat="server" 
            ConnectionString="<%$ ConnectionStrings:KK5 %>" 
            ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
            
            SelectCommand="SELECT orderid, paydate, amount, paytype, transid, authcode, ccnum, notes, payid FROM payment WHERE (orderid = @orderid)">
        </asp:SqlDataSource>
        <div align="center">
        <asp:Label ID="Label1" runat="server" Font-Size="X-Large"></asp:Label>
</div>
        <asp:SqlDataSource ID="dsstate" runat="server" 
            ConnectionString="<%$ ConnectionStrings:KK5 %>" 
            ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
            SelectCommand="SELECT abrv, name, id FROM states WHERE (name = @name)">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsOrderOptions" runat="server" 
            ConnectionString="<%$ ConnectionStrings:KK5 %>" 
            ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
            
            
            
            SelectCommand="SELECT orderoptions.OrderId, orderoptions.DetailId, orderoptions.OpId, orderoptions.opdesc, orderoptions.pkgid, orderoptions.qty, options.optioncode, options.optionvalue, options.selectorder, options.optiondesc, options.optioncatid, options.id FROM orderoptions INNER JOIN options ON orderoptions.OpId = options.id WHERE (orderoptions.OrderId = @orderid) AND (orderoptions.pkgid = @pkgid) AND (orderoptions.DetailId = @detailid)">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsorders" runat="server" 
            ConnectionString="<%$ ConnectionStrings:KK5 %>" 
            ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
            
            UpdateCommand="UPDATE orders SET imported = 1 WHERE (imported = 0) AND (orderid = @orderid)">
            <UpdateParameters>
                <asp:Parameter Name="orderid" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
