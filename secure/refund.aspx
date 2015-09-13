<%@ Page Language="VB" AutoEventWireup="false" CodeFile="refund.aspx.vb" Inherits="secure_refund" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Button ID="Button1" runat="server" Text="Button" /><asp:HiddenField ID="x_type" runat="server" Value="PRIOR_AUTH_CAPTURE" /> <% Response.Write(Session("good"))%>
    <div>
    
    </div>
    </form>
</body>
</html>
