<%@ Page Title="" Language="VB"  AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_Layout.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>Shop Kinderkraft Log In</title>


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
  <div class="login">
    <table width="703" border="0" >
    <tr>
      <td height="87" valign="top" class="border"><h3>Returning Customers</h3><p>If you&#39;ve purchased from us before, please login with your username and password.</p></td>
      <td valign="top" class="padding"><h3>New Customers</h3>
        <p>If this is your <strong>first</strong> purchase with us, please proceed by clicking the following button to continue first-time registration.</p></td>
      </tr>
    <tr>
      <td class="border">
   <asp:Login ID="Login1" runat="server" BackColor="#F7F6F3" BorderColor="#E6E2D8" 
                        BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
                        Font-Size="0.8em" ForeColor="#333333" Height="145px" 
                        DestinationPageUrl="~/shopjostenshome.aspx">
                        <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                        <LayoutTemplate>
      <table cellpadding="0" style="height:145px;width:auto;">
    <tr><td align="center" colspan="2" style="color:White;background-color:#666666;font-size:0.9em;font-weight:bold;">Log In</td></tr>
    <tr>
      <td width="138" align="right"><div class="name_password">
        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Username:</asp:Label>
      </div></td>
       <td width="173"><asp:TextBox ID="UserName" runat="server" Font-Size="Small" Width="234px" Height="22px"></asp:TextBox><asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator></td></tr>
    <tr><td align="right"><div class="name_password"><asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label></div></td>
       <td><asp:TextBox ID="Password" runat="server" Font-Size="Small" TextMode="Password" Width="236px" Height="22px"></asp:TextBox><asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator></td></tr>
    <tr><td colspan="2"></td></tr>
    <tr><td align="center" colspan="2" style="color:Red;"> <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal></td></tr>
    <tr><td align="right" colspan="2">
		<asp:Button ID="LoginButton" runat="server" 
            BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
            CommandName="Login" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" 
            Text="Log In" ValidationGroup="Login1" onclick="LoginButton_Click" 
            style="height: 18px"  /></td></tr></table>   
    </LayoutTemplate>
                        <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" 
                            BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
                        <TextBoxStyle Font-Size="0.8em" />
                        <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" 
                            ForeColor="White" /></asp:Login><br /><br />
<span class="cont_guest">If you are having trouble logging in, please contact a customer service representative at 1-855-826-2355.</span></td>
      <td class="padding" valign="top"><asp:Button ID="Button1" runat="server" Height="23px" Text="School/Organization" Width="150px" /><br /><asp:Button ID="Button2" runat="server" Height="23px" Text="Individual/Parent" Width="150px" /><br />
        <div class="cont_guest">
          <asp:LinkButton ID="lbguestchkout" runat="server" PostBackUrl="~/invoice.aspx" ForeColor="#333333" Font-Size="Small" Font-Italic="true">Continue Without Registering</asp:LinkButton>
        </div><br />

       <span class="cont_guest"> If you are located in Canada, please call our Canadian office at 1-800-665-7597 ext 51832</span><br /><br />

<!--<p style="color:#F00; font-weight:bold">Please Note: Our plant will be closed June 27, currentyr – July 14, currentyr. Orders placed during that time frame will deliver between August 1, currentyr – August 8, currentyr</p> -->
</td>
      </tr>
       <tr>
      <td class="tax_info" colspan="2"><p><font color="#FF0000"><strong>Tax Exempt Information-</strong></font> <span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;
mso-fareast-font-family:Calibri;mso-fareast-theme-font:minor-latin;mso-bidi-font-family:
&quot;Times New Roman&quot;;mso-ansi-language:EN-US;mso-fareast-language:EN-US;
mso-bidi-language:AR-SA">If you are a tax exempt organization and have not ordered with us before, create an account as a School/Organization where you can upload your tax exempt certificate online. You may also fax it to 660-827-4252. Please be sure to include your customer number on the faxed copy. Allow 2-3 business days for tax exemption to be verified on your account. Once it is verified, you may then place your order. If you are tax exempt and already have an account with us, please log in to your account where tax exemption is already verified.</span></p></td>
      </tr>
    <tr>
      <td class="style36" colspan="2" valign="top">
          Name:<asp:TextBox 
              ID="txtname" runat="server" ValidationGroup="tx" 
              Width="246px"></asp:TextBox>
          &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
              ControlToValidate="txtname" Display="Dynamic" ErrorMessage="Name is required" 
              Font-Italic="True" Font-Size="Small" ValidationGroup="tx"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          </td>
      </tr>
   
    <tr>
      <td class="style36" colspan="2" valign="top">
         Select image of tax document to upload:<asp:FileUpload 
                                ID="FileUpload1" runat="server"  
                                Height="29px" Width="384px" size="45" TabIndex="14" />
                 
        </td>
      </tr>
   
    <tr>
      <td class="style36" colspan="2" valign="top" align="right">
          <asp:Button ID="Button3" runat="server" Text="Submit Tax Document" 
              ValidationGroup="tx" />
      </tr>
   
  </table>
  <asp:SqlDataSource ID="DSSQLCUST" runat="server" 
                        ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
          ConnectionString="<%$ ConnectionStrings:KK5 %>"></asp:SqlDataSource>  
    
    
    
    
    
    
    
</div>
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

