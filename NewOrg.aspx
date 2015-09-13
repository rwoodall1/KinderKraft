<%@ Page Title="" Language="VB"  AutoEventWireup="false" CodeFile="NewOrg.aspx.vb" Inherits="NewOrg" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_Layout.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>New Customer-School/Organization</title>

<link href="css/master.css" rel="stylesheet" type="text/css" media="screen"/>
<link rel="stylesheet" type="text/css" href="css/cssverticalmenu.css" />

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
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
		<asp:FormView ID="FormView1" runat="server" Height="200px" Width="704px" 
			DataSourceID="DSCust" DataKeyNames="Custid" DefaultMode="Insert" 
            style="margin-right: 34px" >
		<EditItemTemplate>
        
				<h3>Edit your Jostens Kinderkraft account...</h3>
				<hr /> 
              <p class="req_field_val">*Required Fields</p> 
             <div class="invoice">   
               
               <table width="700px">
                    
                    
                    <tr align="left" valign="baseline">
                        <td class="invoice_heading" colspan="2" >
                            Contact Information</td>
                    </tr>
                    
                    <tr align="left">
                        <td align="right" valign="baseline" class="field_label">
                            <asp:Label ID="Label1" runat="server" Text="*First Name:"></asp:Label>
                        
                           
                      </td>
                        <td align="left" valign="top" class="field_label"> <asp:TextBox ID="txtfname" 
								runat="server" Text='<%# bind("fname") %>'  style="text-transform:uppercase;"
                                Width="265px" Height="22px" TabIndex="3">  </asp:TextBox>
                        <div class="req_field_val">   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtfname" ErrorMessage="First Name Required" 
                                Display="Dynamic"></asp:RequiredFieldValidator></div></td>
                    </tr>
                    
                    <tr align="left">
                        <td align="right" valign="baseline" class="field_label">
                            <asp:Label ID="Label2" runat="server" Text="*Last Name:"></asp:Label></td>
                        <td align="left" valign="top" class="field_label"><asp:TextBox ID="txtlname" 
								runat="server" Text='<%# bind("lname") %>' 
                                Width="265px" Height="22px" TabIndex="4"></asp:TextBox>
                        <div class="req_field_val">    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="txtlname" ErrorMessage="Last Name Required" 
                                Display="Dynamic"></asp:RequiredFieldValidator></div></td>
                    </tr>
                    
                    <tr align="left">
                        <td align="right" valign="baseline" class="field_label">
                            *Email Address:
                            </td>
                        <td align="left" valign="top" class="field_label"><asp:TextBox ID="txtemail" 
								runat="server" Height="22px" 
                                Text='<%# Bind("emailaddress") %>' Width="255px" 
                                ontextchanged="txtusername_TextChanged" TabIndex="5"></asp:TextBox>
                                <div class="req_field_val"><asp:RequiredFieldValidator ID="RequiredFieldValidator19999" runat="server" 
                                ControlToValidate="txtemail" Display="Dynamic" 
                                ErrorMessage="Email Address Is Required"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="emailvalidator" runat="server" 
                                ControlToValidate="txtemail" Display="Dynamic" 
                                ErrorMessage="Invalid Format For Email Address" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                SetFocusOnError="True"></asp:RegularExpressionValidator></div></td>
                    </tr>
                    <tr align="left">
                      <td align="right" valign="baseline" class="field_label">&nbsp;</td>
                      <td align="left" valign="top" class="field_label">
						  <asp:CheckBox ID="chkemailsubscriber" runat="server" 
                                Checked='<%# bind("emailsubscriber") %>' 
                                Text="I wish to receive emails from Jostens Kinderkraft" TabIndex="6" /></td>
                    </tr>
                    
                    <tr align="left" valign="baseline">
                        <td class="invoice_heading" colspan="2" >
                            Billing Information</td>
                    </tr>
                    <tr align="left">
                        <td align="right" valign="baseline" class="field_label">
                            <asp:Label ID="Label7" runat="server" Text="*School or Business:"></asp:Label></td>
                        <td align="left" valign="top" class="field_label">
							<asp:TextBox ID="txtcompanyname" runat="server" 
                                Text='<%# bind("companyname") %>' Width="263px" Height="22px" TabIndex="7" 
                                MaxLength="45"></asp:TextBox>
							<br />
							<div class="req_field_val"><asp:RequiredFieldValidator ID="RequiredFieldValidator20000" runat="server" 
								ErrorMessage="Business Name Required" ControlToValidate="txtcompanyname"></asp:RequiredFieldValidator></div></td>
                    </tr>
                    <tr align="left">
                        <td align="right" valign="baseline" class="field_label">
                            <asp:Label ID="Label8" runat="server" Text="*Address:"></asp:Label></td>
                        <td align="left" valign="top" class="field_label"><asp:TextBox ID="txtaddr1" 
								runat="server" Height="22px" 
                                Text='<%# bind("billingaddr1") %>' Width="265px" TabIndex="8"></asp:TextBox>
                       <div class="req_field_val">    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="txtaddr1" ErrorMessage="Address Required" 
                                Display="Dynamic" Height="22px"></asp:RequiredFieldValidator></div></td>
                    </tr>
                    
                    <tr align="left">
                        <td align="right" valign="baseline" class="field_label">Address 2: </td>
                        <td align="left" valign="top" class="field_label"><asp:TextBox ID="txtaddr2" 
								runat="server" Height="22px" 
                                Text='<%# bind("billingaddr2") %>' Width="265px" TabIndex="9"></asp:TextBox></td>
                    </tr>
                    <tr align="right" valign="baseline">
                        <td class="field_label">
                            <asp:Label ID="Label9" runat="server" Text="*City:"></asp:Label>
                      
                      </td>
                        <td align="left" class="field_label">
							<asp:TextBox ID="txtcity" runat="server" Height="24px" 
                                Text='<%# bind("city") %>' Width="150px" TabIndex="10"></asp:TextBox>
                        <div class="req_field_val">    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="txtcity" ErrorMessage="City Required" 
                                Display="Dynamic"></asp:RequiredFieldValidator></div></td>
                    </tr>
                    <tr align="right" valign="baseline">
                        <td class="field_label">
                            Country:</td>
                        <td align="left" class="field_label">
                            <asp:DropDownList ID="ddlcountryedt" runat="server" AppendDataBoundItems="True" 
                            Height="25px" DataSourceID="dscountry" 
                            DataTextField="name" DataValueField="abbrev" Width="173px" 
                            AutoPostBack="True"   SelectedValue='<%# Bind("country") %>' 
                            onselectedindexchanged="ddlcountryins_SelectedIndexChanged" >
                            <asp:ListItem Value="US">UNITED STATES</asp:ListItem>
                        </asp:DropDownList> &nbsp; <asp:CheckBox ID="CheckBox112" runat="server" 
                                Checked='<%# Bind("international") %>' Text="International Address" 
                                AutoPostBack="True" oncheckedchanged="CheckBox112_CheckedChanged" />
                        </td>
                    </tr>

                    <tr align="right" valign="baseline">
                      <td class="field_label"><asp:Label ID="Label10" runat="server" Text="*State:"></asp:Label></td>
                      <td align="left" class="field_label">
						  <asp:DropDownList ID="ddlStateedt" runat="server" DataSourceID="dsstates" 
                                DataTextField="name" DataValueField="abrv" Height="24px" 
                                SelectedValue='<%# bind("state") %>' Width="148px" TabIndex="11">
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                          <asp:TextBox ID="txtstateedt" runat="server"></asp:TextBox>
                       <div class="req_field_val">    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ControlToValidate="ddlState" ErrorMessage="Select State" 
                                Display="Dynamic"></asp:RequiredFieldValidator></div></td>
                    </tr>
                    
                    <tr>
                        <td align="right" valign="baseline" class="field_label">
                            
                              <asp:Label ID="Label11" runat="server" Text="*Zip Code:"></asp:Label>
                              
                           
                      </td>
                        <td align="left" valign="top" class="field_label">
                            <asp:TextBox ID="txtzip" 
								runat="server" Height="22px" 
                                Text='<%# bind("postalcode") %>' Width="161px" TabIndex="12" MaxLength="15"></asp:TextBox><div class="req_field_val"><asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                ControlToValidate="txtzip" Display="Dynamic" 
                                ErrorMessage="Zip Code Required"></asp:RequiredFieldValidator></div></td>
                    </tr>
                    
                    <tr>
                        <td align="right" valign="baseline" class="field_label">
                            <asp:Label ID="Label122" runat="server" Text="*Phone Number:"></asp:Label>
                            
                        </td>
                        <td align="left" valign="top" class="field_label"><asp:TextBox ID="txtphone" 
								runat="server" Height="22px" 
                                Text='<%# bind("phonenumber") %>' Width="265px" TabIndex="13" 
                                MaxLength="15"></asp:TextBox>
                      <div class="req_field_val">    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                ControlToValidate="txtphone" Enabled="true" 
                                ErrorMessage="Valid Phone Number Required" Display="Dynamic"></asp:RequiredFieldValidator></div></td>
                    </tr>
                   <tr align="left" valign="baseline">
                        <td colspan="2" class="invoice_heading">
                            Account Security</td>
                    </tr>
                    <tr align="left">
                        <td width="214" align="right" valign="baseline" class="auto-style8">
                            <asp:Label ID="Label131" runat="server" Text="*Enter a Username:"></asp:Label>
                        
                          
                      
                      </td>
                        <td width="474" align="left" valign="top" class="auto-style8"><asp:TextBox ID="txtusername1" runat="server" CausesValidation="True" 
                                Height="22px" 
                                Text='<%# bind("username") %>' Width="255px" >
                          </asp:TextBox>
                        <div class="req_field_val">    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                ControlToValidate="txtusername1" Display="Dynamic" 
                                ErrorMessage="Username Is Required"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="valName" runat="server" 
                                ControlToValidate="txtusername1" Display="Dynamic" 
                                ErrorMessage="This name is being used, please choose another name." 
                                onservervalidate="valName_ServerValidate"></asp:CustomValidator></div></td>
                 </tr>
                    
                    <tr align="left">
                        <td align="right" valign="baseline" class="field_label">
                            <asp:Label ID="Label3" runat="server" Text="*Enter a Password:"></asp:Label>
                        </td>
                        <td align="left" valign="top" class="field_label">
                        
                          <asp:TextBox ID="txtpassword" runat="server" Height="22px" 
                                Text='<%# Bind("password") %>' TextMode="Password" Width="255px" 
								TabIndex="1"></asp:TextBox>
                          <div class="req_field_val">  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtpassword" Display="Dynamic" 
                                ErrorMessage="Password Required"></asp:RequiredFieldValidator></div></td>
                    </tr>
                    
                    <tr align="left">
                        <td align="right" valign="baseline" class="field_label">
                            <asp:Label ID="Label4" runat="server" Text="*Confirm Password:"></asp:Label>
                        
                            </td>
                        <td align="left" valign="top" class="field_label">
							<asp:TextBox ID="txtpassword2" 
								runat="server" Height="22px" TextMode="Password" 
                                Width="255px" TabIndex="2"></asp:TextBox>
                       <div class="req_field_val"> 
						   <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                ControlToCompare="txtpassword" ControlToValidate="txtpassword2" 
                                ErrorMessage="Password Does Not Match" ValueToCompare="textbox4.text" 
                                Display="Dynamic"></asp:CompareValidator></div></td>
                    </tr>
                    <tr>
						<td align="left" class="field_label" valign="baseline">
							<asp:CheckBox ID="CheckBox111" runat="server" 
								Checked='<%# Bind("repofschool") %>' Text="Representative of School" /></td>
						<td align="left" class="field_label" valign="top">&nbsp;
							</td>
					</tr>
                    <tr>
                        <td align="left" class="field_label" colspan="1" valign="baseline">
						<updatepanel>  <contenttemplate>
                            <asp:CheckBox ID="chktaxexempt" runat="server" 
                                Checked='<%# bind("taxexempt") %>' Text="Check if you are tax exempt" 
								AutoPostBack="True" /></td>
                        <td align="left" valign="top" class="field_label">
                            Tax ID:
                              <asp:TextBox ID="TextBox5" runat="server" Height="22px" Width="188px" 
                                Text='<%# bind("taxid") %>' TabIndex="14"></asp:TextBox> </contenttemplate></updatepanel>
                        </td>
                    </tr>
                    <tr align="right" valign="baseline">
                        <td class="style36" colspan="2" align="left">&nbsp; Select tax document to upload&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:FileUpload ID="FileUpload1" runat="server"  
                                Height="36px" Width="384px" size="30" TabIndex="15" />
                            <br />
                      </td>
                    </tr>
                    <tr>
                      <td colspan="2" align="left" valign="baseline" class="pkg_order_instr"><strong>Tax Exempt Information-</strong> If you are a tax exempt organization and have not ordered with us before, create an account as a School/Organization where you can upload your tax exempt certificate online. You may also fax it to 660-827-4252. Please be sure to include your customer number on the faxed copy. Allow 2-3 business days for tax exemption to be verified on your account. Once it is verified, you may then place your order. If you are tax exempt and already have an account with us, please log in to your account where tax exemption is already verified.</td>
                    </tr>
                    <tr>
                        <td align="right" class="style37" valign="baseline">&nbsp;
                      </td>
                        <td align="right" valign="top" class="style37"><asp:HiddenField ID="HiddenField1" runat="server" Value='<%# eval("custid") %>' />
                                
								<asp:HiddenField ID="hfholdpayment" runat="server" 
								Value='<%# Bind("holdpayment") %>' />
                           <asp:Button ID="Button1" runat="server" CommandName="update" 
                                 Text="Continue" TabIndex="16"  /></td>
                    </tr>
               </table></div>
                
			
        </EditItemTemplate>
			<InsertItemTemplate>
				<h3>New to Jostens Kinderkraft? Get started below...</h3>
				<hr /> 
             <p class="req_field_val">*Required Fields</p>  
             <div class="invoice">   
               
               <table width="700px">
                    
                    
                    <tr align="left" valign="baseline">
                        <td class="invoice_heading" colspan="2" >
                            Contact Information</td>
                    </tr>
                    
                    <tr align="left">
                        <td align="right" valign="baseline" class="field_label"><asp:Label ID="Label1" runat="server" Text="*First Name:"></asp:Label>
                        
                           
                      </td>
                        <td align="left" valign="top" class="field_label"> <asp:TextBox ID="txtfname" 
								runat="server" Text='<%# bind("fname") %>' 
                                 style="text-transform:uppercase;" Width="265px" Height="22px" 
                                TabIndex="3" MaxLength="45"></asp:TextBox>
                        <div class="req_field_val">   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtfname" ErrorMessage="First Name Required" 
                                Display="Dynamic"></asp:RequiredFieldValidator></div></td>
                    </tr>
                    
                    <tr align="left">
                        <td align="right" valign="baseline" class="field_label"><asp:Label ID="Label2" runat="server" Text="*Last Name:"></asp:Label></td>
                        <td align="left" valign="top" class="field_label"><asp:TextBox ID="txtlname" 
								runat="server" Text='<%# bind("lname") %>' 
                                style="text-transform:uppercase;"  Width="265px" Height="22px" 
                                TabIndex="4" MaxLength="45"></asp:TextBox>
                        <div class="req_field_val">    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="txtlname" ErrorMessage="Last Name Required" 
                                Display="Dynamic"></asp:RequiredFieldValidator></div></td>
                    </tr>
                    
                    <tr align="left">
                        <td align="right" valign="baseline" class="field_label">
                            *Email Address:
                            </td>
                        <td align="left" valign="top" class="field_label">
                            <asp:TextBox ID="txtemail" 
								runat="server" Height="22px" 
                                Text='<%# Bind("emailaddress") %>' Width="265px" 
                                ontextchanged="txtusername_TextChanged" TabIndex="5" MaxLength="45"></asp:TextBox>
                                <div class="req_field_val"><asp:RequiredFieldValidator ID="RequiredFieldValidator19999" runat="server" 
                                ControlToValidate="txtemail" Display="Dynamic" 
                                ErrorMessage="Email Address Is Required"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="emailvalidator" runat="server" 
                                ControlToValidate="txtemail" Display="Dynamic" 
                                ErrorMessage="Invalid Format For Email Address" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                SetFocusOnError="True"></asp:RegularExpressionValidator></div></td>
                    </tr>
                    <tr align="left">
                      <td align="right" valign="baseline" class="field_label">&nbsp;</td>
                      <td align="left" valign="top" class="field_label">
						  <asp:CheckBox ID="chkemailsubscriber" runat="server" 
                                Checked='<%# Bind("emailsubscriber") %>' 
                                Text="I wish to receive emails from Jostens Kinderkraft" 
                              oncheckedchanged="chkemailsubscriber_CheckedChanged" /></td>
                    </tr>
                    
                    <tr align="left" valign="baseline">
                        <td class="invoice_heading" colspan="2" >
                            Billing Information</td>
                    </tr>
                    <tr align="left">
                        <td align="right" valign="baseline" class="field_label">
                            <asp:Label ID="Label7" runat="server" Text="*School or Business:"></asp:Label></td>
                        <td align="left" valign="top" class="field_label">
							<asp:TextBox ID="txtcompanyname" runat="server" 
                                Text='<%# bind("companyname") %>'  style="text-transform:uppercase;" 
                                Width="265px" Height="22px" TabIndex="6" MaxLength="45"></asp:TextBox>
							<br />
							<div class="req_field_val">
								<asp:RequiredFieldValidator ID="RequiredFieldValidator20000" runat="server" 
								ErrorMessage="Business Name Required" ControlToValidate="txtcompanyname"></asp:RequiredFieldValidator></div>
							</td>
                    </tr>
                    <tr align="left">
                        <td align="right" valign="baseline" class="field_label"><asp:Label ID="Label8" runat="server" Text="*Address:"></asp:Label></td>

                        <td align="left" valign="top" class="field_label"><asp:TextBox ID="txtaddr1" 
								runat="server" Height="22px" 
                                Text='<%# bind("billingaddr1") %>'  style="text-transform:uppercase;" 
                                Width="265px" TabIndex="7" MaxLength="45"></asp:TextBox>
                       <div class="req_field_val">    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="txtaddr1" ErrorMessage="Address Required" 
                                Display="Dynamic" Height="22px"></asp:RequiredFieldValidator></div></td>
                    </tr>
                    
                    <tr align="left">
                        <td align="right" valign="baseline" class="field_label">Address 2: </td>
                        <td align="left" valign="top" class="field_label"><asp:TextBox ID="txtaddr2" 
								runat="server" Height="22px" 
                                Text='<%# bind("billingaddr2") %>'  style="text-transform:uppercase;" 
                                Width="265px" TabIndex="8" MaxLength="45"></asp:TextBox></td>
                    </tr>
                    <tr align="right" valign="baseline">
                        <td class="field_label"><asp:Label ID="Label9" runat="server" Text="*City:"></asp:Label>
                      
                      </td>
                        <td align="left" class="field_label">
							<asp:TextBox ID="txtcity" runat="server" Height="24px" 
                                Text='<%# bind("city") %>'  style="text-transform:uppercase;" 
                                Width="265px" TabIndex="9" MaxLength="45"></asp:TextBox>
                        <div class="req_field_val">    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="txtcity" ErrorMessage="City Required" 
                                Display="Dynamic"></asp:RequiredFieldValidator></div></td>
                    </tr>
                    <tr align="right" valign="baseline">
                        <td class="field_label">&nbsp;
                            </td>
                        <td align="left" class="field_label">
                            
                        </td>
                    </tr>
                    <tr align="right" valign="baseline">
                        <td class="field_label">
                            Country:</td>
                        <td align="left" class="field_label">
                            <asp:DropDownList ID="ddlcountryins" runat="server" AppendDataBoundItems="True" 
                            Height="25px" DataSourceID="dscountry" 
                            DataTextField="name" DataValueField="abbrev" Width="173px" 
                            AutoPostBack="True"   SelectedValue='<%# Bind("country") %>' 
                            onselectedindexchanged="ddlcountryins_SelectedIndexChanged" >
                            <asp:ListItem Value="US">UNITED STATES</asp:ListItem>
                        </asp:DropDownList> &nbsp; <asp:CheckBox ID="CheckBox112" runat="server" 
                                Checked='<%# Bind("international") %>' Text="International Address" 
                                AutoPostBack="True" oncheckedchanged="CheckBox112_CheckedChanged" />
                            <div class="req_field_val">    
                                <asp:CustomValidator ID="cvcountry" runat="server" ErrorMessage="Not An International Country" OnServerValidate="cvcountry_ServerValidate"></asp:CustomValidator>
                            </div>
                        </td>
                         
                    </tr>

                    <tr align="right" valign="baseline">
                      <td class="field_label"><asp:Label ID="Label10" runat="server" Text="*State:"></asp:Label></td>
                      <td align="left" class="field_label">
                          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                         <ContentTemplate>

						  <asp:DropDownList ID="ddlState" runat="server" DataSourceID="dsstates" 
                                DataTextField="name" DataValueField="abrv" Height="24px" 
                                SelectedValue='<%# bind("state") %>' Width="148px" TabIndex="10" 
                              AppendDataBoundItems="True" 
                           AutoPostBack="True" 
                             >
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                          <asp:TextBox ID="txtstate" runat="server" Height="25px" Visible="False"  
                              style="text-transform:uppercase;" WidthWidth="211px" 
                              AutoPostBack="True"></asp:TextBox>
                       <div class="req_field_val">    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ControlToValidate="ddlState" ErrorMessage="Select State" 
                                Display="Dynamic"></asp:RequiredFieldValidator></div> </ContentTemplate></asp:UpdatePanel></td>
                    </tr>
                    
                    
                    <tr>
                        <td align="right" valign="baseline" class="field_label"><asp:Label ID="Label11" runat="server" Text="*Zip Code:"></asp:Label>
                              
                           
                      </td>
                        <td align="left" valign="top" class="field_label">
                            <asp:TextBox ID="txtzip" 
								runat="server" Height="22px" 
                                Text='<%# bind("postalcode") %>' Width="265px" TabIndex="11" MaxLength="15"></asp:TextBox><div class="req_field_val"><asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                ControlToValidate="txtzip" Display="Dynamic" 
                                ErrorMessage="Zip Code Required"></asp:RequiredFieldValidator></div></td>
                    </tr>
                    
                    <tr>
                        <td align="right" valign="baseline" class="field_label">
  <asp:Label ID="Label12" runat="server" Text="*Phone Number:"></asp:Label>
                            
                        </td>
                        <td align="left" valign="top" class="field_label">
                            <asp:TextBox ID="txtphone" 
								runat="server" Height="22px" 
                                Text='<%# bind("phonenumber") %>' Width="265px" TabIndex="12" 
                                MaxLength="15"></asp:TextBox>
                      <div class="req_field_val">    
						  <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                ControlToValidate="txtphone" 
                                ErrorMessage="Valid Phone Number Required" Display="Dynamic"></asp:RequiredFieldValidator></div></td>
                    </tr>
                   <tr align="left" valign="baseline">
                        <td colspan="2" class="invoice_heading">
                            Account Security</td>
                    </tr>
                    <tr align="left">
                        <td width="214" align="right" valign="baseline" class="field_label"><asp:Label ID="Label13" runat="server" Text="*Enter a Username:"></asp:Label></td>
                        <td width="474" align="left" valign="top" class="field_label">
							<asp:TextBox ID="txtusername1" runat="server" CausesValidation="True" 
                                Height="22px" 
                                Text='<%# bind("username") %>' Width="265px" TabIndex="1" ></asp:TextBox>
                        <div class="req_field_val">    
							<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                ControlToValidate="txtusername1" Display="Dynamic" 
                                ErrorMessage="Username Is Required" TabIndex="60"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="valName" runat="server" 
                                ControlToValidate="txtusername1" Display="Dynamic" 
                                ErrorMessage="This name is being used, please choose another name." 
                                onservervalidate="valName_ServerValidate" TabIndex="60"></asp:CustomValidator></div></td>
                 </tr>
                    
                    <tr align="left">
                        <td align="right" valign="baseline" class="field_label"><asp:Label ID="Label3" runat="server" Text="*Enter a Password:"></asp:Label>
                        </td>
                        <td align="left" valign="top" class="field_label">
                        
                          <asp:TextBox ID="txtpassword" runat="server" Height="22px" 
                                Text='<%# Bind("password") %>' TextMode="Password" Width="265px" 
								TabIndex="1"></asp:TextBox>
                          <div class="req_field_val">  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtpassword" Display="Dynamic" 
                                ErrorMessage="Password Required"></asp:RequiredFieldValidator></div></td>
                    </tr>
                    
                    <tr align="left">
                        <td align="right" valign="baseline" class="field_label"><asp:Label ID="Label4" runat="server" Text="*Confirm Password:"></asp:Label>
                        
                            </td>
                        <td align="left" valign="top" class="field_label">
							<asp:TextBox ID="txtpassword2" 
								runat="server" Height="22px" TextMode="Password" 
                                Width="265px" TabIndex="2"></asp:TextBox>
                       <div class="req_field_val"> 
						   <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                ControlToCompare="txtpassword" ControlToValidate="txtpassword2" 
                                ErrorMessage="Password Does Not Match" ValueToCompare="textbox4.text" 
                                Display="Dynamic"></asp:CompareValidator></div></td>
                    </tr>
                    <tr>
						<td align="left" class="field_label" valign="baseline">
							<asp:CheckBox ID="CheckBox1" runat="server" 
								Checked='<%# Bind("repofschool") %>' Text="Representative of School" />
						</td>
						<td align="left" class="field_label" valign="top">&nbsp;
							</td>
					</tr>
                    <tr>
                        <td align="left" class="field_label" colspan="1" valign="baseline">
						<updatepanel>  <contenttemplate>
                            <asp:CheckBox ID="chktaxexempt" runat="server" 
                                Checked='<%# bind("taxexempt") %>' Text="Check if you are tax exempt" 
								oncheckedchanged="chktaxexempt_CheckedChanged1" AutoPostBack="True" /></td>
                        <td align="left" valign="top" class="field_label">
                            Tax ID:
                              <asp:TextBox ID="TextBox5" runat="server" Height="22px" Width="188px" 
                                Text='<%# bind("taxid") %>' TabIndex="13"></asp:TextBox></ContentTemplate></updatepanel>
                        	
						
                        </td>
                    </tr>
                    <tr align="right" valign="baseline">
                        <td class="style38" colspan="2" align="left" valign="top">&nbsp; Select image of tax 
							document to upload:<asp:FileUpload 
                                ID="FileUpload1" runat="server"  
                                Height="29px" Width="384px" size="45" TabIndex="14" />
                            <br />
                      </td>
                    </tr>
                    <tr>
                      <td colspan="2" align="left" valign="baseline" class="pkg_order_instr"><strong>Tax Exempt Information-</strong> If you are a tax exempt organization and have not ordered with us before, create an account as a School/Organization where you can upload your tax exempt certificate online. You may also fax it to 660-827-4252. Please be sure to include your customer number on the faxed copy. Allow 2-3 business days for tax exemption to be verified on your account. Once it is verified, you may then place your order. If you are tax exempt and already have an account with us, please log in to your account where tax exemption is already verified.</td>
                    </tr>
                    <tr>
                        <td align="right" class="style36" valign="baseline">&nbsp;
                      </td>
                        <td align="right" valign="top" class="style9">
							<asp:HiddenField ID="hfholdpayment" runat="server" 
								Value='<%# Bind("holdpayment") %>' />
							<asp:HiddenField ID="HiddenField1" runat="server" 
                                Value='<%# eval("custid") %>' />
                           <asp:Button ID="Button1" runat="server" CommandName="insert" 
                                 Text="Continue" TabIndex="15"   /></td>
                    </tr>
               </table></div>
                
			</InsertItemTemplate>
	</asp:FormView >
       
	</div>
    <asp:SqlDataSource ID="dscountry" runat="server" 
        ConnectionString="<%$ ConnectionStrings:KK5 %>" 
        ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
        
        SelectCommand="SELECT upper(name) as name, abbrev FROM country ORDER BY name"></asp:SqlDataSource>	
     <asp:SqlDataSource ID="DSSQLCUST" runat="server"  
        ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
        ConnectionString="<%$ ConnectionStrings:KK5 %>">
      </asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="dsstates" runat="server" 
        ConnectionString="<%$ ConnectionStrings:KK5 %>" 
        ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
        
        
        
        SelectCommand="SELECT trim(name) AS name, trim(abrv) as abrv, id, selectval FROM states ORDER BY selectval, name"></asp:SqlDataSource>
        <asp:SqlDataSource ID="ddsstates1" runat="server" 
		ConnectionString="<%$ ConnectionStrings:KK5 %>" 
		ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
		
        
        SelectCommand="SELECT trim(name) AS name,trim( abrv) as abrv, id, selectval FROM states ORDER BY selectval, name"></asp:SqlDataSource>
	<asp:SqlDataSource 
	ID="DSCust" runat="server" 
	ConnectionString="<%$ ConnectionStrings:KK5 %>" 
	DeleteCommand="DELETE FROM [cust] WHERE [custid] = ?" 
	InsertCommand="INSERT INTO cust(EmailAddress, password, emailsubscriber, fname, lname, CompanyName, billingaddr1, billingaddr2, city, state, postalcode, phonenumber, taxid, taxexempt, username, repofschool, isorg, holdpayment, country, international) VALUES (@emailaddress, @password, @emailsubscriber, upper(@fname), upper(@lname), upper(@companyname), upper(@billingaddr1), upper(@billingaddr2), upper(@city), @state, @postalcode, @phonenumber, @taxid, @taxexempt, @username, @repofschool, 1, @holdpayment, upper(@country), @international)" 
	ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
        
        UpdateCommand="UPDATE cust SET fname = @fname, lname = @laname, EmailAddress = @emailaddress, password = @password, CompanyName = @companyname, billingaddr1 = @billingaddr1, billingaddr2 = @billingaddr2, city = @city, state = @state, postalcode = @postalcode, phonenumber = @phonenumber, taxid = @taxid, repofschool = @repofschool, emailsubscriber = @emailsubscriber, taxexempt = @taxexempt, isorg = 1, holdpayment = @holdpayment WHERE (custid = @custid)" 
        
        
		
		
		
        
        SelectCommand="SELECT custid, fname, lname, EmailAddress, password, CompanyName, billingaddr1, billingaddr2, city, state, postalcode, phonenumber, taxid, repofschool, Schname, refby, emailsubscriber, sfname, slname, scompanyname, saddr1, saddr2, scity, sstate, spostalcode, sphonenumber, sfax, residential, business, taxexempt, username, iscs, custid AS Expr1, holdpayment, isorg, country, international FROM cust WHERE (custid = @custid)">
			<DeleteParameters>
				<asp:Parameter Name="custid" Type="Int32" />
			</DeleteParameters>
			<InsertParameters>
			   
				<asp:ControlParameter ControlID="FormView1" Name="emailaddress" 
					PropertyName="SelectedValue" Type="String" />
				<asp:ControlParameter ControlID="FormView1" Name="password" 
					PropertyName="SelectedValue" Type="String" />
				<asp:ControlParameter ControlID="FormView1" Name="custid" 
					PropertyName="SelectedValue" Type="Int32" />
			    <asp:ControlParameter ControlID="FormView1" Name="fname" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="FormView1" Name="lname" 
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
                <asp:ControlParameter ControlID="FormView1" Name="taxexempt" 
                    PropertyName="SelectedValue" />
			    <asp:ControlParameter ControlID="FormView1" Name="username" 
                    PropertyName="SelectedValue" />
			    <asp:ControlParameter ControlID="FormView1" Name="repofschool" 
                    PropertyName="SelectedValue" />
				<asp:ControlParameter ControlID="FormView1" DefaultValue="0" Name="holdpayment" 
					PropertyName="SelectedValue" />
			    <asp:ControlParameter ControlID="FormView1" Name="country" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="FormView1" Name="international" 
                    PropertyName="SelectedValue" />
				<asp:ControlParameter ControlID="FormView1" Name="emailsubscriber" 
					PropertyName="SelectedValue" />
			</InsertParameters>
			<SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="custid" 
                    QueryStringField="custid" />
            </SelectParameters>
			<UpdateParameters>
				<asp:Parameter Name="fname" Type="String" />
				<asp:ControlParameter ControlID="FormView1" Name="lname" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="FormView1" Name="emailaddress" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="FormView1" Name="password" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="FormView1" Name="companyname" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="FormView1" Name="username" 
                    PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="FormView1" Name="billingaddr1" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="FormView1" Name="billlingaddr2" 
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
                <asp:ControlParameter ControlID="FormView1" Name="emailsubscriber" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="FormView1" Name="taxexempt" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="FormView1" Name="custid" 
                    PropertyName="SelectedValue" Type="Int32" />
				<asp:ControlParameter ControlID="FormView1" Name="holdpayment" 
					PropertyName="SelectedValue" DefaultValue="0" />
			</UpdateParameters>
		</asp:SqlDataSource>
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
