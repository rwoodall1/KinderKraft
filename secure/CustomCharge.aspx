<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CustomCharge.aspx.vb" Inherits="secure_CustomCharge" %>

<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_LayoutSubfolder.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>Custom Charge</title>
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
    <style type="text/css">
        .style35
        {
            width: 100%;
        }
        .style36
        {
            width: 131px;
        }
        .style79
        {
            font-size: 90%;
            width: 71%;
        }
        .style82
        {
            font-size: 90%;
            width: 135px;
        }
        .style83
        {
            width: 135px;
        }
        .style93
        {
            font-size: 70%;
            font-style: italic;
            color: #F00;
            width: 71%;
        }
        .style94
        {
            width: 71%;
        }
        .style100
        {
            width: 206px;
        }
        .style101
        {
            font-size: 90%;
            width: 206px;
        }
        .style102
        {
            font-size: 70%;
            font-style: italic;
            color: #F00;
        }
        .style103
        {
            font-size: 90%;
            width: 135px;
            height: 25px;
        }
        .style104
        {
            font-size: 70%;
            font-style: italic;
            color: #F00;
            height: 25px;
        }
        .style105
        {
            font-size: 70%;
            font-style: italic;
            color: #F00;
            width: 71%;
            height: 25px;
        }
    </style>
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
	<asp:ScriptManager ID="ScriptManager1" runat="server">
	</asp:ScriptManager>
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
   <li><asp:LinkButton ID="LinkButton1" runat="server" Visible="False" 
		PostBackUrl="~/Admin/Admin.aspx">Administration</asp:LinkButton>  </li>
	  
  </ul>
 <div id="ssl"> <a href="https://www.volusion.com/ssl.asp?url=shop.jostenskinderkraft.com">
	 <img src="../images/verisign.png" alt="SSL Certificate" /></a></div></div>

<!-- TemplateBeginEditable name="Content" -->
<div id="content">
<div>
	<table class="style35">
                <tr>
                    <td align="right" class="style36">
                        Company Name:</td>
                    <td>
                        <asp:TextBox ID="txtcompanyname" runat="server" Height="20px" Width="198px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style36">
                        Email Address:</td>
                    <td>
                        <asp:TextBox ID="txtemail" runat="server" Width="203px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style36">
                        Linked Order Id:</td>
                    <td>
                        <asp:TextBox ID="txtlinkedorderid" runat="server" Width="196px"></asp:TextBox>
                    &nbsp;<asp:Label ID="Label5" runat="server" Font-Italic="True" Font-Size="Smaller" 
                            Text="Order number this goes back to."></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style36">
                        Amount:</td>
                    <td>
                        <asp:TextBox ID="x_amount" runat="server" Width="164px" CausesValidation="True" 
                            ValidationGroup="g1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                            ControlToValidate="x_amount" Display="Dynamic" 
                            ErrorMessage="RequiredFieldValidator" Font-Italic="True" Font-Size="Smaller" 
                            ValidationGroup="g1">Amount is required</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style36" valign="top">
                        Note:</td>
                    <td>
                        <asp:TextBox ID="txtnote" runat="server" Height="46px" TextMode="MultiLine" 
                            Width="442px"></asp:TextBox>
                    </td>
                </tr>
            </table>

</div>
<div>
  Payment Method :<asp:DropDownList ID="ddlpaytype" runat="server" Height="22px" Width="149px" AutoPostBack="True" >
            <asp:ListItem Selected="True">Credit Card</asp:ListItem>
            </asp:DropDownList>
          
   
      
      <hr/>
    <eo:MsgBox ID="MsgBox1" runat="server" BackColor="#EBEBEB" 
        CloseButtonUrl="00070301" ControlSkinID="None" HeaderHtml="Dialog Title" 
        Height="216px" Width="320px">
        <HeaderStyleActive CssText="padding-right: 3px; padding-left: 8px; font-weight: bold; font-size: 10pt; background-image: url(00020213); padding-bottom: 3px; color: white; padding-top: 0px; font-family: 'trebuchet ms';height:20px;" />
        <ContentStyleActive CssText="padding-right: 4px; padding-left: 4px; font-size: 8pt; padding-bottom: 4px; padding-top: 4px; font-family: tahoma" />
        <FooterStyleActive CssText="padding-right: 4px; padding-left: 4px; font-size: 8pt; padding-bottom: 4px; padding-top: 4px; font-family: tahoma" />
        <BorderImages BottomBorder="00020212" BottomLeftCorner="00020207" 
            BottomRightCorner="00020208" LeftBorder="00020210" RightBorder="00020211" 
            TopBorder="00020209" TopLeftCorner="00020201" TopLeftCornerBottom="00020203" 
            TopLeftCornerRight="00020202" TopRightCorner="00020204" 
            TopRightCornerBottom="00020206" TopRightCornerLeft="00020205" />
    </eo:MsgBox>   
                          
 <asp:Panel ID="pnlCC" runat="server" Width="701px" Height="298px">
   <div class="invoice">  
   
  <table style="height: 215px; width: 692px;">
        <tr>
            <td valign="baseline" class="style83"></td>
            <td align="left" class="style100">
                <img alt="Visa" border="0" height="23" 
                    src="../images/visa1_37x23_a.gif" />
                <img alt="Master Card" border="0" height="23" 
                    src="../images/mc_accpt_023_gif.gif" />
                <img alt="Discover" border="0" 
                    src="../images/Discover.jpg" 
                    style="width: 36px; height: 20px" />
                <img border="0" 
                    height="21" 
                    src="../images/pay_logo_amex.gif" 
                    width="33" /></td>
            <td align="left" class="style94">&nbsp;</td>
        </tr>
        <tr>
            <td align="right" valign="baseline" class="style83" >
                Card Type:</td>
            <td align="left" class="style100">
                <asp:DropDownList ID="ddlcardtype" runat="server" Height="22px" Width="152px">
					<asp:ListItem></asp:ListItem>
					<asp:ListItem>VISA</asp:ListItem>
					<asp:ListItem>MASTER CARD</asp:ListItem>
					<asp:ListItem>AMERICAN EXPRESS</asp:ListItem>
					<asp:ListItem>DISCOVER</asp:ListItem>
				</asp:DropDownList>
			</td>
            <td align="left"  class="style93">
				<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
					ControlToValidate="ddlpaytype" Display="Dynamic" 
					ErrorMessage="Card Name Required" ValidationGroup="g1"></asp:RequiredFieldValidator></td>
            
        </tr>
        <tr>
			<td align="right" class="style82" valign="baseline">
				Card Number:</td>
			<td align="left" class="style101">
				<asp:TextBox ID="x_card_num" runat="server" CausesValidation="True" 
					Height="22px" MaxLength="16" TabIndex="31" ValidationGroup="g1" Width="130px"></asp:TextBox>
			</td>
			<td align="left" class="style93">
				<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
					ControlToValidate="x_card_num" Display="Dynamic" 
					ErrorMessage="Card Number Required" ValidationGroup="g1"></asp:RequiredFieldValidator>
			</td>
		</tr>
        <tr>
            <td align="right" valign="baseline" class="style82">
                Security Code:</td>
            <td align="left" class="style100">
                <asp:TextBox ID="x_card_code" runat="server" MaxLength="16" Width="51px" ValidationGroup="g1" TabIndex="32" CausesValidation="True"></asp:TextBox>
             </td>
            <td align="left" class="style93"><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
ControlToValidate="x_card_code" ErrorMessage="Security Code Required" Display="Dynamic" ValidationGroup="g1"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" class="style82" valign="bottom">
                <asp:Label ID="Label4" runat="server" Height="22px" Text="Name On Card:" 
                    Width="146px"></asp:Label></td>
            <td align="left" valign="bottom" class="style101">

                <asp:Label ID="Label2" runat="server" Height="22px" Text="First:"></asp:Label>&nbsp;<asp:TextBox 
					ID="x_first_name" runat="server" CausesValidation="True" 
                    Height="22px" Width="100px" TabIndex="33"></asp:TextBox>
                


            </td>
            <td align="left" valign="bottom" class="style79"><asp:Label ID="Label3" runat="server" Height="22px" Text="Last:"></asp:Label> 
				<asp:TextBox ID="x_last_name" runat="server" CausesValidation="True" 
					Height="22px" Width="127px" TabIndex="34"></asp:TextBox></td>
        </tr>
        <tr>
          <td align="right" valign="baseline" class="style103"></td>
          <td class="style104"><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
ControlToValidate="x_first_name" ErrorMessage="First Name Required" Display="Dynamic" ValidationGroup="g1"></asp:RequiredFieldValidator></td>
          <td valign="top" class="style105"><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
ControlToValidate="x_last_name" ErrorMessage="Last Name Required" Display="Dynamic" ValidationGroup="g1"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" valign="baseline" class="style82">
                Expiration Date:</td>
            <td colspan="1" align="left" valign="top" class="style101">
              
              <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                  
                  <asp:DropDownList ID="ddlmonth" runat="server" 
                    causesvalidation="True" CssClass="Text" validationgroup="g2" 
                    AutoPostBack="True" TabIndex="35">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem>04</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    </asp:DropDownList>&nbsp; Month&nbsp;
                  </ContentTemplate></asp:UpdatePanel>                 
                  <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                   <ContentTemplate>             
                     <asp:DropDownList ID="ddlyear" runat="server" 
                    causesvalidation="True" CssClass="Text" validationgroup="g2" 
                    AutoPostBack="True" TabIndex="36">
                       <asp:ListItem></asp:ListItem>
                       <asp:ListItem>2012</asp:ListItem>
                       <asp:ListItem>2013</asp:ListItem>
                       <asp:ListItem>2014</asp:ListItem>
                       <asp:ListItem>2015</asp:ListItem>
                       <asp:ListItem>2016</asp:ListItem>
                       <asp:ListItem>2017</asp:ListItem>
                       <asp:ListItem>2018</asp:ListItem>
                       <asp:ListItem>2019</asp:ListItem>
                       <asp:ListItem>2020</asp:ListItem>
                       <asp:ListItem>2021</asp:ListItem>
                </asp:DropDownList>&nbsp; Year</ContentTemplate></asp:UpdatePanel></td><td></td>
            </tr>
        <tr>
          <td align="right" valign="baseline" class="style83"></td>
          <td colspan="2" align="left" valign="top" class="style102">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    candrag="error_text" ControlToValidate="ddlmonth" 
                    ErrorMessage="Expiration Month Required" Display="Dynamic" 
                  ValidationGroup="g1"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    candrag="error_text" ControlToValidate="ddlyear" 
                    ErrorMessage="Expiration Year Required" Display="Dynamic" 
                  ValidationGroup="g1"></asp:RequiredFieldValidator></td>
        <tr>
            <td valign="baseline" class="style83"></td>
            <td class="style100"></td>
            <td align="right" class="style94"><asp:Button ID="btncc" runat="server" Text="Submit Order" 
                    ValidationGroup="g1" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
        </tr>
    
    </table>
    </div>
     </asp:Panel>
     
    <%Response.Write(Session("msg"))%>

</div>







<!-- TemplateEndEditable -->
</div>
<!-- InstanceEndEditable -->
</div>
<asp:HiddenField ID="x_duplicate_window" runat="server" Value="420" />
<asp:HiddenField ID="x_echeck_type" 
                  runat="server" Value="WEB" /><asp:HiddenField ID="x_recurring_billing" runat="server" Value="FALSE" />
            <asp:HiddenField ID="x_relay_response" runat="server" Value="FALSE" />
            <asp:HiddenField ID="x_delim_data" runat="server" Value="TRUE" />
			<asp:HiddenField ID="x_method" runat="server" Value="CC" />
			<asp:HiddenField ID="x_exp_date" runat="server" />
			<asp:SqlDataSource ID="dscustorder" runat="server" 
        ConnectionString="<%$ ConnectionStrings:KK5 %>" 
        ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
        SelectCommand="SELECT * FROM [country]"></asp:SqlDataSource>
			<asp:HiddenField ID="x_type" runat="server" Value="AUTH_CAPTURE" />
<div id="footer">
  <p><a href="../returns.aspx">Shipping Rates and Returns

<!-- TemplateEndEditable -->
</div>
<!-- InstanceEndEditable -->
</div>

<div id="footer">
  <p><a href="../returns.aspx">Shipping Rates and Returns</a> &nbsp; &#124; &nbsp;  <asp:LinkButton ID="ordstatus" runat="server"  OnClick="ordstatus_Click">Order History</asp:LinkButton> 
  &nbsp; &#124; &nbsp;<a href="../ChangePassword.aspx">Change Password/User Name</a>  &nbsp; &#124; &nbsp; <a href="http://www.jostenskinderkraft.com/contact.html"> Contact Us</a> &nbsp; &#124; &nbsp; <a href="http://www.jostenskinderkraft.com/kinderkraft_home.html">Home</a></p>
  <p><font size="-6">©2013 Jostens, Inc • All Rights Reserved</font></p>
</div>
</div>



</form>
</body>
<!-- InstanceEnd --></html>