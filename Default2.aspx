<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default2.aspx.vb" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:SqlDataSource ID="dsorderdate" runat="server" 
            ConnectionString="<%$ ConnectionStrings:KK5 %>" 
            ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
            SelectCommand="SELECT orderid AS Expr1, customerid, scompanyname, sfname, slname, saddr, sadd2, scity, sstate, szip, sphone, sfax, ponumber, shipped, orderdate, shipdate, ordernotes, subtot, shipmethod, shpchrg, tax, total, business, residential, taxexempt, semailaddress, authnettranid, promocode, discountamt, paymentcompleted, ordercanceled, orderstatus, authdate, paytype, ccnum, volorderid, volcustid, country, international, onhold, bo, bodate, authcode, autherr FROM orders WHERE (orderid = @orderid)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="orderid" 
                    QueryStringField="orderid" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
