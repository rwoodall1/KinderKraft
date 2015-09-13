<%@ Page Title="" Language="VB"  AutoEventWireup="false" CodeFile="returns.aspx.vb" Inherits="returns" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_Layout.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
 <title>Shipping and Returns</title>
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

		<table class="style1">
            <tr>
                <td class="style2" colspan="4">
                    <h1>Shipping and Returns</h1></td>
            </tr>
            <tr>
                <td colspan="4">
                    <strong>How do I cancel my order?</strong>
                    <br /><br />
                    To cancel your order, please call Customer Service at 855-826-2355 within three (3) business days of placing your order.  We reserve the right to reject any cancellation requests received more than three (3) business days after placing the order.<br />
                    <br /></td>
          </tr>
          <tr>
                <td colspan="4">
                    <strong>What if I ordered incorrect sizes or colors, or an incorrect quantity of product?</strong>
                    <br /><br />
                    Please review the content of your order upon receipt. If you need to exchange products due to incorrect size, color or quantity ordering, please call Customer Service at 855-826-2355 for assistance within 15 calendar days of receiving your order.   You will be responsible for shipping and handling costs for returning product to Kinderkraft, and for shipping and handling costs incurred by Kinderkraft in sending you replacement or additional product.  If you are entitled to a refund for returned product or if there is a price differential between your returned product and the replacement product, the additional charge or credit will be processed within 6-8 weeks of our receipt of the returned product. Refund cannot be provided on merchandise that has been removed from original packaging or has been worn.<br />
                    <br /></td>
          </tr>
          <tr>
                <td colspan="4">
                    <strong>What if my order contains damaged, defective or missing product?</strong>
                    <br /><br />
                    If any product arrives damaged or defective, or there are discrepancies in your order, please contact Customer Service at 855-826-2355 and we will assist you in getting your products replaced.  Claims for damaged or defective product or order discrepancies must be made within 5 calendar days of receiving your order.  We will ship replacement product to you at no additional cost in the event you make a timely claim for damaged, defective or missing product.<br />
                    <br /></td>
          </tr>
          <tr>
                <td colspan="4">
                    <strong>How do I return product to Kinderkraft?</strong>
                    <br /><br />
                    Once you have requested a return or exchange, we will mail you return information.  You must affix the provided UPS call tag to the return packaging.  Returned items must be received by Kinderkraft within 21 calendar days of your receipt of return information. Kinderkraft reserves the right to reject returns received after this date.<br />
                    <br /></td>
          </tr>
          </table>
                    <table width="665" class="shipping"><tr><td colspan="6">
                    <strong>Shipping<br />
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    Total Amount Spent</td>
                <td>
                    Standard 
                    Delivery<br />
                    <em><span class="style4">(10 business days)</span></em></td>
                <td>Rush Delivery -<br /> <span style="color:#FB0206">Not Available At This Time</span><br />
                <em><span class="style4">(6 business days)</span></em></td>
                <td>
                    Expedited Delivery -<br /> <span style="color:#FB0206">Not Available At This Time</span><br />
                    <em><span class="style4">(4 business days)</span></em></td>
                <td>
                    Alaska/Hawaii<br />
                    International
                    <br />
                    <em><span class="style4">(10 business days)</span></em></td>
                <td>International<br />
                <em><span class="style4">(20 business days)</span></em></td>
            </tr>
            <tr>
                <td class="style3">
                    <br />
                  $.01-$49.99<br />
                    <br />
              </td>
                <td>
                    $11.50
                    <br />
                </td>
                <td>$36.50</td>
                <td>
                    $46.50
                    <br />
                </td>
                <td>
                    $35.50
                    <br />
                </td>
                <td>$60.50</td>
            </tr>
            <tr>
                <td class="style3">
                    <br />
                  $50.00-$149.99<br />
                    <br />
              </td>
                <td>
                    $14.50
                    <br />
                </td>
                <td>$46.50</td>
                <td>
                    $56.50
                    <br />
                </td>
                <td>
                    $42.50
                    <br />
                </td>
                <td>$67.50</td>
            </tr>
            <tr>
                <td class="style3">
                    <br />
                  $150.00-$299.00<br />
                    <br />
              </td>
                <td>
                    $16.50
                    <br />
                </td>
                <td>$56.50</td>
                <td>
                    $66.50
                    <br />
                </td>
                <td>
                    $56.50
                    <br />
                </td>
                <td>$81.50</td>
            </tr>
            <tr>
                <td class="style3">
                    <br />
                  $300.00-$449.99<br />
                    <br />
              </td>
                <td>
                    $21.50
                    <br />
                </td>
                <td>$66.50</td>
                <td>
                    $76.50
                    <br />
                </td>
                <td>
                    $75.50
                    <br />
                </td>
                <td>$100.50</td>
            </tr>
            <tr>
                <td class="style3">
                    <br />
                  $450.00+<br />
                    <br />
              </td>
                <td>
                    $25.00
                    <br />
                </td>
                <td>$85.50</td>
                <td>
                    $125.00
                    <br />
                </td>
                <td>
                    $100.00
                    <br />
                </td>
                <td>$125.00</td>
            </tr>
        </table><br />
        *Orders placed after 12:00 p.m.(noon) central time will be processed on the next business day. Please allow 5 business days for delivery on Express orders placed after 12:00 p.m.<br /><br />
        **If you are located in Canada, please call our Canadian office at 1-800-665-7597 ext 51832
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
