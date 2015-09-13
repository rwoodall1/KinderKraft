<%@ Page Title="Place Order" Language="VB"  AutoEventWireup="false" CodeFile="intinvoice.aspx.vb" Inherits="intinvoice" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_Layout.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->

    <style type="text/css">
        #container
        {
            height: 48px;
            width: 671px;
        }
        .style42
        {
            font-size: 90%;
            width: 238px;
        }
        .style44
        {
            font-size: 90%;
            width: 313px;
        }
        .style45
        {
            font-size: 90%;
            width: 313px;
            height: 27px;
        }
        .style47
        {
            font-size: 90%;
            height: 28px;
        }
        .style48
        {
            font-size: 90%;
            height: 27px;
        }
        .style49
        {
            font-size: 90%;
            width: 313px;
            height: 31px;
        }
        .style50
        {
            font-size: 90%;
            height: 31px;
        }
        .style51
        {
            font-size: 90%;
            width: 313px;
            height: 24px;
        }
        .style52
        {
            font-size: 90%;
            height: 24px;
        }
        .auto-style8 {
            font-size: 90%;
            height: 47px;
        }
        .auto-style9 {
            font-size: 90%;
            width: 238px;
            height: 47px;
        }
        .auto-style10 {
            font-size: 90%;
            height: 51px;
        }
        .auto-style11 {
            font-size: 90%;
            height: 26px;
        }
        .auto-style12 {
            font-family: "Arial Black", Gadget, sans-serif;
            font-size: 100%;
            font-weight: bolder;
            padding-top: 10px;
            padding-left: 15px;
            height: 41px;
        }
        </style>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>Check Out</title>
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

<div id="content" style="height: auto; ">

    <asp:FormView ID="FormView1" runat="server" Height="493px" Width="694px" 
        DataSourceID="DSCust" DefaultMode="Edit" DataKeyNames="custid">
 <ItemTemplate>
           
   </ItemTemplate>
 <InsertItemTemplate>
         
          <div class="step_one">
              <img src="images/KK_billing.jpg" alt="" width="600" height="50" /><br />
          </div>
       <p style="font-size:small;color:blue">If you are located in Canada, please call our Canadian office at 1-800-665-7597 ext 51832</p>
          <p class="req_field_val">*Required Fields</p> 
          <div class="invoice">
            <table width="700" border="0" cellspacing="1" cellpadding="2">
              <tr align="left" valign="baseline">
                <td colspan="2" class="auto-style12">Billing Information...</td>
              </tr>
                <tr>
                    <td align="right" class="style45" valign="baseline">
                      <asp:CheckBox ID="chkinterins" runat="server" Text="US Address" AutoPostBack="True"  Enabled="False" Visible="False" 
                       />  &nbsp;&nbsp; Country:</td>
                    <td align="left" class="style48" valign="top">
                        <asp:DropDownList ID="ddlcountryins" runat="server" AppendDataBoundItems="True" 
                            Height="25px" DataSourceID="dscountry" 
                            DataTextField="name" DataValueField="abbrev" Width="173px" 
                            AutoPostBack="True"   SelectedValue='<%# Bind("country") %>' 
                            >
                        </asp:DropDownList>
                        <div class="req_field_val">
                            <asp:CustomValidator ID="cvcountryins" runat="server" ErrorMessage="Country Not International"  Enabled="False"></asp:CustomValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11113" runat="server" ControlToValidate="ddlcountryins" ErrorMessage="Country Required" ValidationGroup="g2"></asp:RequiredFieldValidator>
                        </div>
                    </td>
                </tr>
              <tr>
                <td align="right" valign="baseline" class="style44">*First Name:</td>
                <td width="445" align="left" valign="top" class="field_label">
					<asp:TextBox ID="fnameins" runat="server" Height="24px" 
						Text='<%# Bind("fname") %>'  style="text-transform:uppercase;" Width="244px" 
                        CausesValidation="True" TabIndex="1" ></asp:TextBox> <div class="req_field_val">
						<asp:RequiredFieldValidator ControlToValidate="fnameins" Display="Dynamic" 
							ErrorMessage="First Name Required" ID="vfnameins" runat="server" 
							ValidationGroup="g2" TabIndex="60" ></asp:RequiredFieldValidator></div>
                    </td>
              </tr>
              <tr>
                <td align="right" valign="baseline" class="style44">*Last Name:</td>
                <td align="left" valign="top" class="field_label"><asp:TextBox ID="lnameins" 
                        runat="server" TabIndex="1" Height="24px" Text='<%# Bind("lname") %>'  
                        style="text-transform:uppercase;"  Width="244px" CausesValidation="True" ></asp:TextBox>
               <div class="req_field_val"> 
				   <asp:RequiredFieldValidator ID="vlnameins" runat="server" 
					   ControlToValidate="lnameins" Display="Dynamic" ErrorMessage="Last Name Required" 
					   validationgroup="g2" TabIndex="60"></asp:RequiredFieldValidator></div></td>
              </tr>
              <tr>
                <td align="right" valign="baseline" class="style44">School or Business Name: </td>
                <td align="left" valign="top" class="field_label"><asp:TextBox ID="companyins" runat="server" TabIndex="2" Height="24px" Text='<%# Bind("CompanyName") %>'  style="text-transform:uppercase;" Width="244px" CausesValidation="True" ></asp:TextBox></td>
              </tr>
              
              <tr>
                <td align="right" valign="baseline" class="style44">*Address:
           </td>
                <td align="left" valign="top" class="field_label"><asp:TextBox ID="addr1ins" 
                        runat="server" TabIndex="3" Width="244px" Height="23px" 
                        Text='<%# Bind("billingaddr1") %>'  style="text-transform:uppercase;" 
                        CausesValidation="True" ></asp:TextBox>
                   <div class="req_field_val"><asp:RequiredFieldValidator ID="vadd1ins" 
						   runat="server" ControlToValidate="addr1ins" Display="Dynamic" 
						   ErrorMessage="Address Required" ValidationGroup="g2" TabIndex="60"></asp:RequiredFieldValidator></div></td>
              </tr>
              <tr>
                <td align="right" valign="baseline" class="style44">Address2:
           </td>
                <td align="left" valign="top" class="field_label"><asp:TextBox ID="addr2ins" 
                        runat="server" TabIndex="4" Width="244px" Height="24px" 
                        Text='<%# Bind("billingaddr2") %>'  style="text-transform:uppercase;" 
                        CausesValidation="True" ></asp:TextBox></td>
              </tr>
              <tr>
                <td align="right" valign="baseline" class="style44">*City:</td>
                <td align="left" valign="top" class="field_label"><asp:TextBox ID="cityins" 
                        runat="server" TabIndex="5" Height="24px" Text='<%# Bind("city") %>' 
                        Width="244px"  style="text-transform:uppercase;" CausesValidation="True" ></asp:TextBox>
               <div class="req_field_val"> 
				   <asp:RequiredFieldValidator ID="vcityins" runat="server" 
					   ControlToValidate="cityins" Display="Dynamic" ErrorMessage="City Required" 
					   ValidationGroup="g2" TabIndex="60"></asp:RequiredFieldValidator></div></td>
              </tr>
              <tr>
                <td align="right" valign="baseline" class="style44">
                    
                    &nbsp;&nbsp;&nbsp; *State/Province:</td>
                <td align="left" valign="top" class="field_label">
               
                    <asp:TextBox ID="txtstateins" runat="server" Height="21px"  
                        style="text-transform:uppercase;" Width="203px" 
                        AutoPostBack="True" ></asp:TextBox>
                <div class="req_field_val">
					</div> 
                       
                        </td>
              </tr>
              <tr>
                <td align="right" valign="baseline" class="style49">*Zip Code:</td>
                <td align="left" valign="top" class="style50">
                    <asp:TextBox ID="zipins" 
                        runat="server" TabIndex="7" Height="23px" Text='<%# Bind("postalcode") %>' 
                        CausesValidation="True" Width="244px" MaxLength="15" ></asp:TextBox><div class="req_field_val">
						</div></td>
              </tr>
              <tr>
                <td align="right" valign="baseline" class="style51"> *Phone Number:</td>
                <td align="left" valign="top" class="style52"> 
                    <asp:TextBox ID="phonenumberins" runat="server" 
                        TabIndex="8" Height="24px" CausesValidation="True" 
                        Text='<%# bind("phonenumber") %>' Width="244px" MaxLength="15"></asp:TextBox>
                        <div class="req_field_val">
                            <asp:RequiredFieldValidator ID="vphoneins" runat="server" 
                        ErrorMessage="Phone# Required" ControlToValidate="phonenumberins" 
                        Display="Dynamic" ValidationGroup="g2"></asp:RequiredFieldValidator></div></td>
              </tr>
              <tr>
                <td align="right" valign="baseline" class="style44">*Email Address:</td>
                <td align="left" valign="top" class="field_label">
                    <asp:TextBox ID="emailaddressins" 
                        runat="server" CausesValidation="True" Text='<%# Bind("EmailAddress") %>' 
                        Height="22px" Width="244px" TabIndex="9" MaxLength="45"></asp:TextBox>
                <div class="req_field_val"><asp:RequiredFieldValidator ID="vemailins" runat="server" ErrorMessage="Email Required" ControlToValidate="emailaddressins" ValidationGroup="g2"></asp:RequiredFieldValidator></div></td>
              </tr>
              
                <tr align="left" valign="baseline">
                    <td colspan="2" class="field_label">
                         How did you hear about us?&nbsp; 
                        <asp:DropDownList ID="ddlhearins" runat="server" 
           TabIndex="10" Height="22px" Width="259px" 
           SelectedValue='<%# Bind("refby") %>'   >
        <asp:ListItem></asp:ListItem>
        <asp:ListItem>Internet Search</asp:ListItem>
        <asp:ListItem>Email</asp:ListItem>
        <asp:ListItem>Word of Mouth</asp:ListItem>
        <asp:ListItem>Returning Customer</asp:ListItem>
        					<asp:ListItem>Catolog Mailing</asp:ListItem>
							<asp:ListItem>Other Direct Mail</asp:ListItem>
							<asp:ListItem>Jostens.com</asp:ListItem>
        					<asp:ListItem> Other Direct Mail</asp:ListItem>
        </asp:DropDownList>                      <asp:Button ID="btninsertcopy" runat="server" 
							 Height="31px" Text="Copy Information To Shipping" 
                            Width="194px" onclick="btninsertcopy_Click" TabIndex="11"  /></td>
                </tr>
  </table>
          </div>

       <hr />
       
      
            
       <div class="invoice"> <table width="700" border="0" cellspacing="1" cellpadding="2">
              <tr align="right" valign="baseline">
                <td colspan="2" align="left" class="invoice_heading">Shipping Information...
                    </td>
              </tr>
              <tr><td colspan="2">
              <font size="1" color="red"><strong>Note: We can not accept PO Boxes for shipping.</strong></font>
              </td></tr>
           <tr>
                  <td align="right" class="field_label" valign="baseline">
                      <asp:CheckBox ID="chkintshpins" runat="server" Text="US Address" AutoPostBack="True" OnCheckedChanged="chkintshpins_CheckedChanged" 
                        />&nbsp;&nbsp; Country:</td>
                  <td class="field_label">
                     <asp:DropDownList ID="ddlcountryshpins" runat="server" AppendDataBoundItems="True" 
                            Height="25px" DataSourceID="dscountry" 
                            DataTextField="name" DataValueField="abbrev" Width="173px" 
                          AutoPostBack="True" SelectedValue='<%# Bind("scountry") %>' 
                         >
                        </asp:DropDownList> <div class="req_field_val">
                            <asp:CustomValidator ID="cvcountryinsshp" runat="server" ErrorMessage="Country Not International" OnServerValidate="cvcountryinsshp_ServerValidate"></asp:CustomValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11114" runat="server" ControlToValidate="ddlcountryshpins" Display="Dynamic" ErrorMessage="Country Required" ValidationGroup="g2"></asp:RequiredFieldValidator>
                        </div></td>
              </tr>
              <tr>
                <td width="244" align="right" valign="baseline" class="field_label">*First Name: 
               </td>
                <td width="445" class="field_label">
                    <asp:TextBox ID="sfnameshpins" runat="server" 
						Height="22px" Text='<%# Bind("sfname") %>'  style="text-transform:uppercase;"
                        Width="244px" CausesValidation="True" ValidationGroup="g2" TabIndex="12" ></asp:TextBox>
                    <div class="req_field_val"><asp:RequiredFieldValidator ID="fvfnameshpins" runat="server" 
                        ControlToValidate="sfnameshpins" Display="Dynamic" 
                        ErrorMessage="First Name Required" ValidationGroup="g2"></asp:RequiredFieldValidator></div></td>
                  <tr>
                      <td align="right" class="field_label" valign="baseline">*Last Name:</td>
                      <td class="field_label">
                          <asp:TextBox ID="slnameshpins" runat="server" CausesValidation="True" Height="22px" style="text-transform:uppercase;" TabIndex="13" Text='<%# Bind("slname") %>' Width="244px"></asp:TextBox>
                          <div class="req_field_val">
                              <asp:RequiredFieldValidator ID="fvlnameshpins" runat="server" ControlToValidate="slnameshpins" Display="Dynamic" ErrorMessage="Last Name Required" ValidationGroup="g2"></asp:RequiredFieldValidator>
                          </div>
                      </td>
                      <tr>
                          <td align="right" class="field_label" valign="baseline">School or Business Name: </td>
                          <td class="field_label">
                              <asp:TextBox ID="scompanyshpins" runat="server" Height="22px" style="text-transform:uppercase;" TabIndex="14" Text='<%# Bind("scompanyname") %>' Width="244px"></asp:TextBox>
                          </td>
                      </tr>
                      <tr>
                          <td align="right" class="field_label" valign="baseline">*Address: </td>
                          <td class="field_label">
                              <asp:TextBox ID="saddr1shpins" runat="server" CausesValidation="True" Height="22px" style="text-transform:uppercase;" TabIndex="15" Text='<%# Bind("saddr1") %>' Width="244px"></asp:TextBox>
                              <div class="req_field_val">
                                  <asp:RequiredFieldValidator ID="fvaddrshpins" runat="server" ControlToValidate="saddr1shpins" Display="Dynamic" ErrorMessage="Address Required" ValidationGroup="g2"></asp:RequiredFieldValidator>
                                  <asp:CustomValidator ID="vpoboxshpins" runat="server" ControlToValidate="saddr1shpins" ErrorMessage="PO Not allowed" onservervalidate="vpoboxshpins_ServerValidate" ValidationGroup="g2"></asp:CustomValidator>
                              </div>
                          </td>
                      </tr>
                      <tr>
                          <td align="right" class="field_label" valign="baseline">Address2:</td>
                          <td class="field_label">
                              <asp:TextBox ID="saddr2shpins" runat="server" Height="22px" style="text-transform:uppercase;" TabIndex="16" Text='<%# Bind("saddr2") %>' Width="244px"></asp:TextBox>
                              <div class="req_field_val ">
                                  <asp:CustomValidator ID="vpobox2shpins" runat="server" ControlToValidate="saddr2shpins" ErrorMessage="PO Not allowed" onservervalidate="vpobox2shpins_ServerValidate" ValidationGroup="g2"></asp:CustomValidator>
                              </div>
                          </td>
                      </tr>
                      <tr>
                          <td align="right" class="field_label" valign="baseline">City: </td>
                          <td class="style42">
                              <asp:TextBox ID="scityshpins" runat="server" CausesValidation="True" Height="22px" style="text-transform:uppercase;" TabIndex="17" Text='<%# Bind("scity") %>' Width="244px"></asp:TextBox>
                              <div class="req_field_val">
                                  <asp:RequiredFieldValidator ID="vcityshpins" runat="server" ControlToValidate="scityshpins" Display="Dynamic" ErrorMessage="City Required" ValidationGroup="g2"></asp:RequiredFieldValidator>
                              </div>
                          </td>
                      </tr>
                      <tr>
                          <td align="right" class="style44" valign="baseline">&nbsp;&nbsp;&nbsp; *State/Province:</td>
                          <td class="field_label">
                              <asp:TextBox ID="txtsstateshpins" runat="server" AutoPostBack="True" Height="25px"  style="text-transform:uppercase;" Text='<%# Bind("sstate", "{0}") %>' Width="225px"></asp:TextBox>
                              <div class="req_field_val">
                              </div>
                          </td>
                      </tr>
                      <tr>
                          <td align="right" class="auto-style8" valign="baseline">*Zip Code:</td>
                          <td class="auto-style9">
                              <asp:TextBox ID="szipshpins" runat="server" CausesValidation="True" Height="20px" MaxLength="15" TabIndex="19" Text='<%# Bind("spostalcode") %>' Width="244px"></asp:TextBox>
                              <div class="req_field_val">
                              </div>
                          </td>
                      </tr>
                      <tr>
                          <td align="right" class="field_label" valign="baseline">Phone Number: </td>
                          <td class="field_label">
                              <asp:TextBox ID="sphoneshpins" runat="server" Height="22px" MaxLength="15" TabIndex="20" Text='<%# Bind("sphonenumber") %>' Width="244px"></asp:TextBox>
                          </td>
                      </tr>
                      <tr align="right" valign="baseline">
                          <td class="auto-style11" colspan="2">&nbsp; </td>
                      </tr>
                      <tr align="right" valign="baseline">
                          <td colspan="2">
                              <asp:HiddenField ID="hfcustid" runat="server" Value='<%# eval("custid") %>' />
                              <asp:Button ID="btninsert" runat="server" onclick="Button1_Click2" TabIndex="21" Text="Continue" />
                          </td>
                      </tr>
                  </tr>
              </tr>
  </table></div>
  
  
</InsertItemTemplate>


<EditItemTemplate>
          <div class="step_one">
              <img src="images/KK_billing.jpg" alt="" width="600" height="50" /></div>
     <p style="font-size:small;color:blue">If you are located in Canada, please call our Canadian office at 1-800-665-7597 ext 51832</p>
              <p class="req_field_val">*Required Fields</p> 
           <div class="invoice">
            <table width="700" border="0" cellspacing="1" cellpadding="2">
              <tr align="left" valign="baseline">
                <td colspan="2" class="invoice_heading">Billing Information<asp:Label ID="Label2" 
                        runat="server" Text="e" Font-Size="1pt"></asp:Label></td>
              </tr>
              <tr>
                <td width="293" align="right" valign="baseline" class="field_label"> <asp:CheckBox ID="chkint2edt" runat="server" Text="US Address" 
                      AutoPostBack="True" oncheckedchanged="chkint2edt_CheckedChanged1"  />&nbsp;&nbsp;&nbsp;&nbsp; Country:</td>
                <td width="396" align="left" valign="top" class="field_label">
					 <asp:DropDownList ID="ddlcountryedt" runat="server" AppendDataBoundItems="True" 
                            Height="25px" DataSourceID="dscountry" 
                            DataTextField="name" DataValueField="abbrev" Width="173px" 
                            AutoPostBack="True" SelectedValue='<%# Bind("country") %>' 
                            >
                          <asp:ListItem Value="US">UNITED STATES</asp:ListItem>
                        </asp:DropDownList>
                    <div class="req_field_val"> 
                     <asp:CustomValidator ID="cvcountry" runat="server" ErrorMessage="Country Not International"  Enabled="False"></asp:CustomValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11115" runat="server" ControlToValidate="ddlcountryedt" Display="Dynamic" ErrorMessage="Country Required" ValidationGroup="g2"></asp:RequiredFieldValidator>
                     </div>
                        </div></td>
              </tr>
                <tr>
                    <td align="right" class="field_label" valign="baseline" width="293">*First Name:</td>
                    <td align="left" class="field_label" valign="top" width="396">
                        <asp:TextBox ID="fnameedt" runat="server" CausesValidation="True" Height="24px" style="text-transform:uppercase;" TabIndex="1" Text='<%# Bind("fname") %>' Width="170px"></asp:TextBox>
                        <div class="req_field_val">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fnameedt" Display="Dynamic" ErrorMessage="First Name Required" TabIndex="60" ValidationGroup="g2"></asp:RequiredFieldValidator>
                        </div>
                    </td>
                </tr>
              <tr>
                <td align="right" valign="baseline" class="auto-style10">*Last Name:</td>
                <td align="left" valign="top" class="auto-style10"><asp:TextBox ID="lnameedt" runat="server" TabIndex="1" Height="24px" Text='<%# Bind("lname") %>'  style="text-transform:uppercase;" Width="173px" CausesValidation="True" ></asp:TextBox>
               <div class="req_field_val"> 
				   <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
					   ControlToValidate="lnameedt" Display="Dynamic" ErrorMessage="Last Name Required" 
					   validationgroup="g2" TabIndex="60"></asp:RequiredFieldValidator></div></td>
              </tr>
              <tr>
                <td align="right" valign="baseline" class="field_label">School or Business Name: </td>
                <td align="left" valign="top" class="field_label"><asp:TextBox ID="companyedt" runat="server" TabIndex="2" Height="24px" Text='<%# Bind("CompanyName") %>'  style="text-transform:uppercase;" Width="244px" CausesValidation="True" ></asp:TextBox></td>
              </tr>
              
              <tr>
                <td align="right" valign="baseline" class="field_label">*Address:
           </td>
                <td align="left" valign="top" class="field_label"><asp:TextBox ID="addr1edt" runat="server" TabIndex="3" Width="178px" Height="23px" 
                        Text='<%# Bind("billingaddr1") %>'  style="text-transform:uppercase;" CausesValidation="True" ></asp:TextBox>
                   <div class="req_field_val"><asp:RequiredFieldValidator ID="RequiredFieldValidator4" 
						   runat="server" ControlToValidate="addr1edt" Display="Dynamic" 
						   ErrorMessage="Address Required" ValidationGroup="g2" TabIndex="60"></asp:RequiredFieldValidator></div></td>
              </tr>
              <tr>
                <td align="right" valign="baseline" class="field_label">Address2:
           </td>
                <td align="left" valign="top" class="field_label"><asp:TextBox ID="addr2edt" runat="server" TabIndex="4" Width="176px" Height="24px" Text='<%# Bind("billingaddr2") %>'  style="text-transform:uppercase;" CausesValidation="True" ></asp:TextBox></td>
              </tr>
              <tr>
                <td align="right" valign="baseline" class="field_label">*City:</td>
                <td align="left" valign="top" class="field_label"><asp:TextBox ID="cityedt" runat="server" TabIndex="5" Height="24px" Text='<%# Bind("city") %>'  style="text-transform:uppercase;" Width="138px" CausesValidation="True" ></asp:TextBox>
               <div class="req_field_val"> 
				   <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
					   ControlToValidate="cityedt" Display="Dynamic" ErrorMessage="City Required" 
					   ValidationGroup="g2" TabIndex="50"></asp:RequiredFieldValidator></div></td>
              </tr>
              <tr>
                <td align="right" valign="baseline" class="style44">
                    
                    &nbsp;&nbsp;&nbsp; *State/Province:</td>
                <td align="left" valign="top" class="field_label">
                
                    <asp:TextBox ID="txtstateedt" runat="server" Height="23px"   
                        style="text-transform:uppercase;" Width="179px" 
                        AutoPostBack="True" 
                        Text='<%# Bind("state") %>'></asp:TextBox>
                <div class="req_field_val"></div> 
                </td>
              </tr>
              <tr>
                <td align="right" valign="baseline" class="field_label">*Zip Code:</td>
                <td align="left" valign="top" class="field_label">
                    <asp:TextBox ID="zipedt" 
                        runat="server" TabIndex="7" Height="25px" Text='<%# Bind("postalcode") %>' 
                        CausesValidation="True" Width="139px" MaxLength="15" ></asp:TextBox><div class="req_field_val"></div></td>
              </tr>
              <tr>
                <td align="right" valign="baseline" class="field_label"> *Phone Number:</td>
                <td align="left" valign="top" class="field_label"> 
                    <asp:TextBox ID="phonenumberedt" runat="server" 
                        TabIndex="8" Height="24px" CausesValidation="True" 
                        Text='<%# bind("phonenumber") %>' MaxLength="15"></asp:TextBox>
                        <div class="req_field_val"><asp:RequiredFieldValidator ID="RequiredFieldValidator11112" runat="server" 
                        ErrorMessage="Phone# Required" ControlToValidate="phonenumberedt" 
                        Display="Dynamic" ValidationGroup="g2"></asp:RequiredFieldValidator></div></td>
              </tr>
              <tr>
                <td align="right" valign="baseline" class="field_label">*Email Address:</td>
                <td align="left" valign="top" class="field_label"><asp:TextBox ID="emailaddressedt" 
                        runat="server" CausesValidation="True" Text='<%# Bind("EmailAddress") %>' 
                        Height="22px" Width="223px" TabIndex="9" MaxLength="45"></asp:TextBox>
                <div class="req_field_val"><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Email Required" ControlToValidate="emailaddressedt" ValidationGroup="g2"></asp:RequiredFieldValidator></div></td>
              </tr>
              
                <tr align="left" valign="baseline">
                    <td colspan="2" class="field_label">
                         How did you hear about us?&nbsp; 
                        <asp:DropDownList ID="ddlhearedt" runat="server" 
           TabIndex="10" Height="22px" Width="239px" 
           SelectedValue='<%# Bind("refby") %>'   >
        <asp:ListItem></asp:ListItem>
        <asp:ListItem>Internet Search</asp:ListItem>
        <asp:ListItem>Email</asp:ListItem>
        <asp:ListItem>Word of Mouth</asp:ListItem>
        <asp:ListItem>Returning Customer</asp:ListItem>
        					<asp:ListItem>Catolog Mailing</asp:ListItem>
							<asp:ListItem>Other Direct Mail</asp:ListItem>
							<asp:ListItem>Jostens.com</asp:ListItem>
        </asp:DropDownList>                      
						 <asp:Button ID="btneditcopy" runat="server" 
							 Height="31px" Text="Copy Information To Shipping" 
                            Width="221px" onclick="btneditcopy_Click" TabIndex="11"  /></td>
                </tr>
  </table>
          </div>

       <hr />
       
      
            
       <div class="invoice"> <table width="700" border="0" cellspacing="1" cellpadding="2">
              <tr align="right" valign="baseline">
                <td colspan="2" align="left" class="auto-style12">Shipping Information</td>
              </tr>
              <tr><td colspan="2">
              <font size="1" color="red"><strong>Note: We can not accept PO Boxes for shipping.</strong></font>
              </td></tr>
                <tr>
                      <td align="right" class="style48" valign="baseline">
                          <asp:CheckBox ID="chkintshpedt" runat="server" AutoPostBack="True" oncheckedchanged="chkintshpedt_CheckedChanged1" Text="US Address" />
                          &nbsp;&nbsp;&nbsp; Country:</td>
                      <td class="style48">
                          <asp:DropDownList ID="ddlcountryshpedt" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="dscountry" DataTextField="name" DataValueField="abbrev" Height="28px" Width="175px" SelectedValue='<%# Bind("scountry") %>'>
                              <asp:ListItem Value="US">UNITED STATES</asp:ListItem>
                          </asp:DropDownList>
                          <div class="req_field_val">
                              
                     <asp:CustomValidator ID="cvcountryshp" runat="server" ErrorMessage="Country Not International" OnServerValidate="cvcountryshp_ServerValidate"></asp:CustomValidator>
                    
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator11116" runat="server" ControlToValidate="ddlcountryshpedt" Display="Dynamic" ErrorMessage="Country Required" ValidationGroup="g2"></asp:RequiredFieldValidator>
                    
                          </div>
                      </td>
                  </tr>
                   <tr>
                  <td align="right" class="field_label" valign="baseline" width="295">
                      *First Name:
                  </td>
                  <td class="field_label" width="394">
                      <asp:TextBox ID="sfnameshipedt" runat="server" CausesValidation="True" Height="22px" 
                          style="text-transform:uppercase;" TabIndex="12" Text='<%# Bind("sfname") %>' 
                          ValidationGroup="g2" Width="157px"></asp:TextBox>
                      <div class="req_field_val">
                          <asp:RequiredFieldValidator ID="fvfname" runat="server" 
                              ControlToValidate="sfnameshipedt" Display="Dynamic" ErrorMessage="First Name Required" 
                              ValidationGroup="g2"></asp:RequiredFieldValidator>
                      </div>
                  </td>
              <tr>
                  <td align="right" class="field_label" valign="baseline">*Last Name:</td>
                  <td class="field_label">
                      <asp:TextBox ID="slnameshpedt" runat="server" CausesValidation="True" Height="22px" style="text-transform:uppercase;" TabIndex="13" Text='<%# Bind("slname") %>' Width="171px"></asp:TextBox>
                      <div class="req_field_val">
                          <asp:RequiredFieldValidator ID="fvlname" runat="server" ControlToValidate="slnameshpedt" Display="Dynamic" ErrorMessage="Last Name Required" ValidationGroup="g2"></asp:RequiredFieldValidator>
                      </div>
                  </td>
                  <tr>
                      <td align="right" class="req_field_val" valign="baseline">&nbsp;</td>
                      <td class="req_field_val"></td>
                  </tr>
                  <tr>
                      <td align="right" class="field_label" valign="baseline">School or Business Name: </td>
                      <td class="field_label">
                          <asp:TextBox ID="scompanyshpedt" runat="server" Height="22px" style="text-transform:uppercase;" TabIndex="14" Text='<%# Bind("scompanyname") %>' Width="333px"></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                      <td align="right" class="field_label" valign="baseline">*Address: </td>
                      <td class="field_label">
                          <asp:TextBox ID="saddr1shpedt" runat="server" CausesValidation="True" Height="22px" style="text-transform:uppercase;" TabIndex="15" Text='<%# Bind("saddr1") %>' Width="178px"></asp:TextBox>
                          <div class="req_field_val">
                              <asp:RequiredFieldValidator ID="fvaddr" runat="server" ControlToValidate="saddr1shpedt" Display="Dynamic" ErrorMessage="Address Required" ValidationGroup="g2"></asp:RequiredFieldValidator>
                              <asp:CustomValidator ID="vpoboxshpedt" runat="server" ControlToValidate="saddr1shpedt" ErrorMessage="PO Not allowed" onservervalidate="vpoboxshpedt_ServerValidate" ValidationGroup="g2"></asp:CustomValidator>
                          </div>
                      </td>
                  </tr>
                  <tr>
                      <td align="right" class="field_label" valign="baseline">Address2:</td>
                      <td class="field_label">
                          <asp:TextBox ID="saddr2shpedt" runat="server" Height="22px" style="text-transform:uppercase;" TabIndex="16" Text='<%# Bind("saddr2") %>' Width="175px"></asp:TextBox>
                          <div class="req_field_val">
                              <asp:CustomValidator ID="vpobox2shpedt" runat="server" ControlToValidate="saddr2shpedt" ErrorMessage="PO Not allowed" onservervalidate="vpobox2shpedt_ServerValidate" ValidationGroup="g2"></asp:CustomValidator>
                          </div>
                      </td>
                  </tr>
                  <tr>
                      <td align="right" class="field_label" valign="baseline">City: </td>
                      <td class="style42">
                          <asp:TextBox ID="scityshpedt" runat="server" CausesValidation="True" Height="22px" style="text-transform:uppercase;" TabIndex="17" Text='<%# Bind("scity") %>' Width="154px"></asp:TextBox>
                          <div class="req_field_val">
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator11111" runat="server" ControlToValidate="scityshpedt" Display="Dynamic" ErrorMessage="City Required" ValidationGroup="g2"></asp:RequiredFieldValidator>
                          </div>
                      </td>
                  </tr>
                  <tr>
                      <td align="right" class="style44" valign="baseline">&nbsp;&nbsp;&nbsp; *State/Province:</td>
                      <td class="field_label">
                          <asp:TextBox ID="txtsstateshpedt" runat="server" AutoPostBack="True" Height="26px"  style="text-transform: uppercase;" Width="174px"></asp:TextBox>
                          <div class="req_field_val">
                          </div>
                      </td>
                  </tr>
                  <tr>
                      <td align="right" class="field_label" valign="baseline">*Zip Code:</td>
                      <td class="style42">
                          <asp:TextBox ID="szipshpedt" runat="server" CausesValidation="True" Height="30px" MaxLength="15" TabIndex="19" Text='<%# Bind("spostalcode") %>' Width="186px"></asp:TextBox>
                          <div class="req_field_val">
                          </div>
                      </td>
                  </tr>
                  <tr>
                      <td align="right" class="field_label" valign="baseline">Phone Number: </td>
                      <td class="field_label">
                          <asp:TextBox ID="sphoneshpedt" runat="server" Height="22px" MaxLength="15" TabIndex="20" Text='<%# Bind("sphonenumber") %>' Width="143px"></asp:TextBox>
                      </td>
                  </tr>
                  <tr align="right" valign="baseline">
                      <td class="field_label" colspan="2">&nbsp; </td>
                  </tr>
                  <tr align="right" valign="baseline">
                      <td colspan="2">
                          <asp:HiddenField ID="hfcustid" runat="server" Value='<%# eval("custid") %>' />
                          <asp:Button ID="btnupdate" runat="server" onclick="btnupdate_Click" TabIndex="21" Text="Continue" ValidationGroup="g2" />
                      </td>
                  </tr>
              </tr>
              </table>
  
  </div>
        </EditItemTemplate>

   </asp:FormView>
 
   </div>
   <asp:SqlDataSource ID="dscountry" runat="server" 
        ConnectionString="<%$ ConnectionStrings:KK5 %>" 
        ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
        
        SelectCommand="SELECT upper(name) AS name, abbrev FROM country WHERE (upper(name) &lt;&gt; 'CANADA') OR (upper(name) &lt;&gt; 'UNITED STATES') ORDER BY name"></asp:SqlDataSource>
 <asp:SqlDataSource ID="dsstates" runat="server" 
        ConnectionString="<%$ ConnectionStrings:KK5 %>" 
        ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
        
        
        
        SelectCommand="SELECT trim(name) AS name, trim(abrv) AS abrv, id, selectval FROM states ORDER BY selectval, name"></asp:SqlDataSource>
    <asp:SqlDataSource ID="ddsstates1" runat="server" 
		ConnectionString="<%$ ConnectionStrings:KK5 %>" 
		ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
		SelectCommand="SELECT trim(name) AS name, abrv, id FROM states"></asp:SqlDataSource><br />
    <asp:SqlDataSource 
    ID="DSCust" runat="server" 
    ConnectionString="<%$ ConnectionStrings:KK5 %>" 
    DeleteCommand="DELETE FROM [cust] WHERE [custid] = ?" 
    ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
    
        UpdateCommand="UPDATE cust SET fname = upper(@fname), lname = upper(@lname), CompanyName = upper(@companyname), billingaddr1 = upper(@billingaddr1), billingaddr2 = upper(@billingaddr2), city = upper(@city), state = @state, postalcode = @postalcode, phonenumber = @phonenumber, Schname = upper(@schname), sfname = upper(@sfname), slname = upper(@slname), scompanyname = upper(@scompanyname), saddr1 = upper(@saddr1), saddr2 = upper(@saddr2), scity = upper(@scity), sstate = @sstate, spostalcode = @spostalcode, sphonenumber = @sphonenumber, sfax = @sfax, EmailAddress = @EmailAddress, country = @country, scountry = @scountry, international = @international, sinternational = @sinternational WHERE (custid = @custid)" 
        
        SelectCommand="SELECT custid, fname, lname, EmailAddress, CompanyName, billingaddr1, billingaddr2, city, trim(state) AS state, postalcode, phonenumber, taxid, repofschool, Schname, trim(refby) AS refby, emailsubscriber, iscs, taxexempt, country, scountry, international, sinternational FROM cust" 
          
        InsertCommand="INSERT INTO cust(fname, lname, EmailAddress, CompanyName, billingaddr1, billingaddr2, city, state, postalcode, phonenumber, repofschool, Schname, refby, sfname, slname, scompanyname, saddr1, saddr2, scity, sstate, spostalcode, sphonenumber, sfax, country, scountry, international, sinternational) VALUES (upper(@fname), upper(@lname), @emailaddress, upper(@companyname), upper(@billingaddr1), upper(@billingaddr2), upper(@city), @state, @postalcode, @phonenumber, @repofschool, upper(@schname), @refby, upper(@sfname), upper(@slname), upper(@scompanyname), upper(@saddr1), upper(@saddr2), upper(@scity), @sstate, @spostalcode, @sphonenumber, @sfax, @country, @scountry, @international, @sinternational)">
            <DeleteParameters>
                <asp:Parameter Name="custid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="FormView1" Name="fname" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="FormView1" Name="lname" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="FormView1" Name="emailaddress" 
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
                <asp:ControlParameter ControlID="FormView1" Name="repofschool" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="FormView1" Name="schname" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="FormView1" Name="refby" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="FormView1" Name="counrtry" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="FormView1" Name="scountry" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="FormView1" Name="international" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="FormView1" Name="sinternational" 
                    PropertyName="SelectedValue" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:HiddenField ID="hftaxabletotal" runat="server" />
        <asp:SqlDataSource ID="Dsmisc" runat="server" 
        ConnectionString="<%$ ConnectionStrings:KK5 %>" 
        ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>"></asp:SqlDataSource>
     

    <asp:HiddenField ID="x_exp_date" runat="server" />



<!-- InstanceEndEditable -->

<div id="footer">
  		<p><a href="returns.aspx">Shipping Rates and ReturnsnkButton ID="ordstatus" runat="server"  OnClick="ordstatus_Click">Order History</asp:LinkButton> &nbsp; &#124; &nbsp; 
          <a href="ChangePassword.aspx">Change Password/User Name</a> &nbsp;  &#124; &nbsp;
          <a href="http://www.jostenskinderkraft.com/contact.html"> Contact Us</a> &nbsp; &#124; &nbsp; 
          <a href="http://www.jostenskinderkraft.com/kinderkraft_home.html">Home</a></p>
  		<p><font size="-6">©2015 Jostens, Inc • All Rights Reserved</font></p>
</div>
</div>
</form>
</body>
<!-- InstanceEnd --></html>

