<%@ Page Title="" Language="VB" AutoEventWireup="false" CodeFile="Customers.aspx.vb" Inherits="Admin_Customers" %>
<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_LayoutSubfolder.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>Customers</title>
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
       <li><a href="../cartpages/banners.aspx" ><span style="color:#DF0003; font-weight:500">NEW! </span> Graduation Banners</a></li>
    <!--<li><a href="../clearance.aspx" >Clearance</a></li> -->
   	<li><asp:LinkButton ID="LinkButton1" runat="server" Visible="False" 
		PostBackUrl="~/Admin/Admin.aspx">Administration</asp:LinkButton></li>
 </ul>
  
  	<div id="ssl"> <img src="../images/verisign.png" width="75" height="38" alt="SSL Certificate" />
    </div>
</div>

<!-- InstanceBeginEditable name="Content" -->
<div id="content">

	<asp:textbox ID="txtsearch" runat="server" Width="144px"></asp:textbox>
&nbsp;&nbsp;
	<asp:Button ID="Button1" runat="server" 
	onclick="Button1_Click" Text="Search by Customer ID" />
&nbsp;<asp:Label ID="Label222" runat="server" Font-Size="Smaller" 
		Text="(Leave blank to return all records.)"></asp:Label>
	&nbsp;&nbsp;
	<asp:Button ID="Button7" runat="server" Text="Telephone Log" Width="126px" />
	<br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
	<br />

	<asp:FormView ID="FormView1" runat="server" AllowPaging="True" 
		DataSourceID="dscust"  Width="709px" DataKeyNames="custid">
		<EditItemTemplate>
			<table style="width:100%; height: 91px; font-size: small;">
				<tr>
					<td align="right" class="style76">
						Customer ID:</td>
					<td colspan="3">
						<asp:Label ID="Label1" runat="server" Text='<%# Bind("custid") %>'></asp:Label>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<td align="left" colspan="4">
						User Name:<asp:TextBox ID="TextBox20" runat="server" Height="22px" 
							Text='<%# Bind("username") %>' Width="153px" CausesValidation="True" ValidationGroup="g1"></asp:TextBox>
						&nbsp;&nbsp; Password:<asp:TextBox ID="TextBox21" runat="server" Height="25px" 
							Text='<%# bind("password") %>' Width="136px"></asp:TextBox>
						&nbsp;&nbsp;&nbsp;
						<asp:CheckBox ID="CheckBox6" runat="server" Checked='<%# bind("iscs") %>' 
							Text="Company Personel" />
						<br />
						<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
							ControlToValidate="TextBox20" Display="Dynamic" 
							ErrorMessage="User name is required." ValidationGroup="g1"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="valName2" runat="server" 
                                ControlToValidate="TextBox20" Display="Dynamic" 
                                ErrorMessage="This name is being used, please choose another name." 
                                onservervalidate="valName2_ServerValidate" ValidationGroup="g1" 
                            Enabled="False"></asp:CustomValidator>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="4" 
						style="font-weight: bold; font-size: medium; text-decoration: underline;">
						Customer Billling<br /></td>
				</tr>
				<tr>
					<td align="center" colspan="4">
						&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
				</tr>
				<tr>
					<td align="right" class="style77">
						Company Name:</td>
					<td class="style35" colspan="3">
						<asp:TextBox ID="TextBox3" runat="server" Height="21px" 
							Text='<%# bind("companyname") %>' style="text-transform:uppercase;" Width="487px"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td align="right" class="style76">
						First Name:</td>
					<td class="style75">
						<asp:TextBox ID="TextBox22" runat="server" Height="24px" 
							Text='<%# Bind("fname") %>' style="text-transform:uppercase;" Width="178px"></asp:TextBox>
					</td>
					<td align="right" class="style42">
						Last Name:</td>
					<td class="style34">
						<asp:TextBox ID="TextBox2" runat="server" Height="22px" 
							Text='<%# bind("lname") %>' style="text-transform:uppercase;" Width="191px"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td align="right" class="style76">
						Address 1:</td>
					<td colspan="3">
						<asp:TextBox ID="TextBox4" runat="server" Height="21px" 
							Text='<%# bind("billingaddr1") %>' style="text-transform:uppercase;" Width="487px"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td align="right" class="style76">
						Address 2:</td>
					<td colspan="3">
						<asp:TextBox ID="TextBox5" runat="server" Height="22px" 
							Text='<%# bind("billingaddr2") %>' style="text-transform:uppercase;" Width="487px"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td align="left" class="style59" colspan="4">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                       

						<asp:CheckBox ID="chkinternational" runat="server" AutoPostBack="True" 
							Checked='<%# Bind("international") %>' 
							
							Text="International Address" />
						&nbsp; State/Province:<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsstates" 
							DataTextField="name" DataValueField="abrv" Height="24px" Width="181px" 
							SelectedValue='<%# bind("state") %>' AppendDataBoundItems="True" AutoPostBack="True" 
							onselectedindexchanged="DropDownList1_SelectedIndexChanged" ondatabound="DropDownList1_DataBound" 
                                
						   >
							<asp:ListItem></asp:ListItem>
							<asp:ListItem Value="add">--ADD PROVINCE--</asp:ListItem>
						</asp:DropDownList> 
						<asp:TextBox ID="TextBox1890" runat="server" Height="24px" Width="148px" 
							Visible="False" AutoPostBack="True"  style="text-transform:uppercase;" ontextchanged="TextBox1890_TextChanged"></asp:TextBox>
					 </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
				</tr>
				<tr>
					<td align="right" class="style76">
						City:</td>
					<td class="style75">
						<asp:TextBox ID="TextBox6" runat="server" Height="19px" 
							Text='<%# bind("city") %>' style="text-transform:uppercase;" Width="167px"></asp:TextBox>
						
					</td>
					<td align="right">
						Country:</td>
					<td>
						<asp:TextBox ID="TextBox1891223" runat="server" Height="20px" 
							Text='<%# bind("country") %>' style="text-transform:uppercase;" Width="182px"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td align="right" class="style76">
						Zip Code:</td>
					<td class="style75">
						<asp:TextBox ID="TextBox7" runat="server" Text='<%# bind("postalcode") %>' MaxLength="15"></asp:TextBox>
					</td>
					<td align="right">
						Phone#</td>
					<td>
						<asp:TextBox ID="TextBox8" runat="server" Height="21px" 
							Text='<%# bind("phonenumber") %>' Width="190px"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td align="right" class="style76">
						Email Address:</td>
					<td colspan="3">
						<asp:TextBox ID="TextBox9" runat="server" Height="25px" 
							Text='<%# bind("emailaddress") %>' Width="482px"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td align="left" class="style76">
						<asp:CheckBox ID="CheckBox4" runat="server" 
							Checked='<%# bind("taxexemptconfirmed") %>' Text="Tax Exempt Confirmed" /></td>
					<td class="style75">
						<asp:CheckBox ID="CheckBox1" runat="server" 
							Checked='<%# bind("taxexempt") %>' Text="Tax Exempt" />
					</td>
					<td align="right">
						Tax ID:</td>
					<td>
						<asp:TextBox ID="TextBox10" runat="server" Height="22px" 
							Text='<%# bind("taxid") %>' Width="188px"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td align="left" class="style76">
						<asp:CheckBox ID="CheckBox2" runat="server" 
							Checked='<%# bind("repofschool") %>' Text="School Rep" />
					</td>
					<td class="style75">
						<asp:CheckBox ID="CheckBox3" runat="server" 
							Checked='<%# bind("emailsubscriber") %>' Text="Receive Emails" />
					</td>
					<td align="right">
						Heard of from:</td>
					<td>
						<asp:DropDownList ID="DropDownList2" runat="server" Height="21px" Width="185px" 
							SelectedValue='<%# bind("refby") %>'>
							 <asp:ListItem></asp:ListItem>
		<asp:ListItem>Internet Search</asp:ListItem>
		<asp:ListItem>Email</asp:ListItem>
		<asp:ListItem>Word of Mouth</asp:ListItem>
		<asp:ListItem>Returning Customer</asp:ListItem>
							<asp:ListItem>Catolog Mailing</asp:ListItem>
							<asp:ListItem>Other Direct Mail</asp:ListItem>
							<asp:ListItem>Jostens.com</asp:ListItem>
						</asp:DropDownList>
					</td>
				</tr>
				<tr>
					<td align="left" class="style48" colspan="2">
						Oracle#:<asp:TextBox ID="TextBox124" runat="server" Height="18px" 
							Text='<%# bind("oraclecustid") %>' Width="76px"></asp:TextBox>
						&nbsp;<asp:CheckBox ID="CheckBox8" runat="server" Checked='<%# bind("allowpo") %>' 
							Text="PO Allowed" />
					</td>
					<td align="right" class="style43">
						<asp:CheckBox ID="CheckBox12" runat="server" Checked='<%# bind("isorg") %>' 
                            Text="School Org" />
                    </td>
					<td>
						&nbsp;</td>
				</tr>
				<tr>
					<td align="center" class="style33" colspan="4" 
						style="font-weight: bolder; font-size: medium; text-decoration: underline;">
						Customer Shipping
					</td>
				</tr>
				<tr>
					<td align="right" class="style76">
						Company Name</td>
					<td align="left" class="style33" colspan="3">
						<asp:TextBox ID="TextBox11" runat="server" Height="27px" 
							Text='<%# bind("scompanyname") %>' style="text-transform:uppercase;" Width="487px"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td align="right" class="style76">
						First Name:</td>
					<td align="left" class="style75">
						<asp:TextBox ID="TextBox12" runat="server" Text='<%# bind("sfname") %>' style="text-transform:uppercase;" 
							Width="166px" Height="24px"></asp:TextBox>
					</td>
					<td align="right">
						Last Name:</td>
					<td align="left" class="style33">
						<asp:TextBox ID="TextBox13" runat="server" Height="27px" 
							Text='<%# bind("slname") %>' style="text-transform:uppercase;" Width="190px"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td align="right" class="style77">
						Address1:</td>
					<td align="left" class="style36" colspan="3">
						<asp:TextBox ID="TextBox144" runat="server" Height="22px" 
							Text='<%# bind("saddr1") %>' style="text-transform:uppercase;" Width="487px"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td align="right" class="style77">
						Address 2:</td>
					<td align="left" class="style39" colspan="3">
						<asp:TextBox ID="TextBox15" runat="server" Height="21px" 
							Text='<%# bind("saddr2") %>' style="text-transform:uppercase;" Width="488px"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td align="left" class="style72" colspan="4">
                      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
					   <asp:CheckBox ID="chkinter2" runat="server" AutoPostBack="True" 
							Checked='<%# Bind("sinternational") %>' 
							
							Text="International Address" />&nbsp;&nbsp;&nbsp; State/Province:<asp:DropDownList 
							ID="DropDownList3" runat="server" DataSourceID="dsstates" 
							DataTextField="name" DataValueField="abrv" Height="24px" Width="189px" 
                            AppendDataBoundItems="True" AutoPostBack="True" 
                            onselectedindexchanged="DropDownList3_SelectedIndexChanged" 
                                ondatabound="DropDownList3_DataBound" 
                                SelectedValue='<%# bind("sstate") %>'>
						    <asp:ListItem></asp:ListItem>
                            <asp:ListItem Value="add">--ADD PROVINCE--</asp:ListItem>
						</asp:DropDownList>
						<asp:TextBox ID="TextBox1891" runat="server" Height="24px" Visible="False" 
                            Width="149px" AutoPostBack="True" style="text-transform:uppercase;" ontextchanged="TextBox1891_TextChanged"></asp:TextBox>
					</ContentTemplate></asp:UpdatePanel></td>
				</tr>
				<tr>
					<td align="right" class="style76">
						City:</td>
					<td align="left" class="style75">
						<asp:TextBox ID="TextBox16" runat="server" Text='<%# bind("scity") %>' style="text-transform:uppercase;" 
							Width="167px"></asp:TextBox>
					</td>
					<td align="right">
						Country:</td>
					<td align="left" class="style33">
						
						<asp:TextBox ID="TextBox1891224" runat="server" Height="20px" 
							Text='<%# bind("scountry") %>' style="text-transform:uppercase;" Width="184px"></asp:TextBox>
						
					</td>
				</tr>
				<tr>
					<td align="right" class="style76">
						Zip Code:</td>
					<td align="left" class="style75">
						<asp:TextBox ID="TextBox18" runat="server" Text='<%# bind("spostalcode") %>' MaxLength="15"></asp:TextBox>
					</td>
					<td align="right">
						Phone#</td>
					<td align="left" class="style33">
						<asp:TextBox ID="TextBox17" runat="server" Height="21px" 
							Text='<%# bind("sphonenumber") %>' Width="188px"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td align="right" class="style76">
						Fax#</td>
					<td align="left" class="style33" colspan="3">
						<asp:TextBox ID="TextBox19" runat="server" Text='<%# bind("sfax") %>'></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td align="center"  colspan="4">
						<asp:Button ID="Button22" runat="server" 
							Text="Update Record" CommandName="update" ValidationGroup="g1"  />
						&nbsp;
						<asp:Button ID="btneditcancel" runat="server" 
							Text="Cancel" onclick="btneditcancel_Click" />
						&nbsp;</td>
				</tr>
			</table>
		</EditItemTemplate>
		<InsertItemTemplate>
			<table style="width:98%; height: 91px; font-size: small;">
				<tr>
					<td align="right" class="style87">&nbsp;
						</td>
					<td colspan="3">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td align="left" colspan="4" class="style99">
						User Name:<asp:TextBox ID="TextBox20" runat="server" Height="26px" 
							Text='<%# bind("username") %>' Width="153px" CausesValidation="True" AutoPostBack="True" 
                            ValidationGroup="g1"></asp:TextBox>
						&nbsp;&nbsp; Password:<asp:TextBox ID="TextBox21" runat="server" Height="27px" 
							Text='<%# bind("password") %>' Width="150px"></asp:TextBox>
					
						<asp:CheckBox ID="CheckBox6" runat="server" Checked='<%# bind("iscs") %>' 
							Text="Company Personel" />
						<br />
						<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
							ControlToValidate="TextBox20" Display="Dynamic" 
							ErrorMessage="User name is required." ValidationGroup="g1"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="valName1" runat="server" 
                                ControlToValidate="TextBox20" Display="Dynamic" 
                                ErrorMessage="This name is being used, please choose another name." 
                                onservervalidate="valName1_ServerValidate" TabIndex="60" 
                            ValidationGroup="g1"></asp:CustomValidator>
					</td>
				</tr>
				<tr>
					<td align="center" class="style33" colspan="4" 
						style="font-weight: bold; font-size: medium; text-decoration: underline;">
						Customer Billling</td>
				</tr>
				<tr>
					<td align="right" class="style88">
						Company Name:</td>
					<td class="style35" colspan="3">
						<asp:TextBox ID="TextBox3" runat="server" Height="21px" 
							Text='<%# bind("companyname") %>' style="text-transform:uppercase;"  Width="487px" ></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td align="right" class="style97">
						First Name:</td>
					<td class="style98">
						<asp:TextBox ID="fname" runat="server" Height="24px" 
							Text='<%# Bind("fname") %>' style="text-transform:uppercase;" Width="178px"></asp:TextBox>
					</td>
					<td align="right" >
						Last Name:</td>
					<td align="left" class="style98" colspan="1" rowspan="1">
						<asp:TextBox ID="TextBox2" runat="server" Height="21px" 
							Text='<%# bind("lname") %>' style="text-transform:uppercase;" Width="129px"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td align="right" class="style87">
						Address 1:</td>
					<td colspan="3">
						<asp:TextBox ID="TextBox44" runat="server" Height="21px" 
							Text='<%# bind("billingaddr1") %>' style="text-transform:uppercase;" Width="487px"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td align="right" class="style87">
						Address 2:</td>
					<td colspan="3">
						<asp:TextBox ID="TextBox55" runat="server" Height="22px" 
							Text='<%# bind("billingaddr2") %>' style="text-transform:uppercase;" Width="487px"></asp:TextBox>
					</td>
				</tr>
				<tr>
					  <td align="left" class="style59" colspan="4">
                          <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                          <ContentTemplate>
                         
						<asp:CheckBox ID="chkinternational11" runat="server" AutoPostBack="True" 
							Checked='<%# Bind("international") %>' 
							
							Text="International Address" />
						&nbsp; State/Province:<asp:DropDownList ID="DropDownList11" runat="server" DataSourceID="dsstates" 
							DataTextField="name" DataValueField="abrv" Height="24px" Width="181px" 
							SelectedValue='<%# bind("state") %>' AppendDataBoundItems="True" AutoPostBack="True" 
							  onselectedindexchanged="DropDownList11_SelectedIndexChanged" 
                                  ondatabound="DropDownList11_DataBound" >
                            
							  <asp:ListItem></asp:ListItem>
							  <asp:ListItem Value="add">--Add Province--</asp:ListItem>
						</asp:DropDownList> 
						<asp:TextBox ID="TextBox18901" runat="server" Height="21px" Width="148px" 
							  Visible="False" AutoPostBack="True"   style="text-transform:uppercase;" 
                                  ontextchanged="TextBox18901_TextChanged"></asp:TextBox>
                               </ContentTemplate>
                          </asp:UpdatePanel>
					</td>
				</tr>
				<tr>
					<td align="right" class="style89">
						City:</td>
					<td class="style79">
						<asp:TextBox ID="TextBox6" runat="server" Height="19px" 
							Text='<%# bind("city") %>' style="text-transform:uppercase;" Width="167px"></asp:TextBox>
						
					</td>
					<td align="right" class="style96">
						Country:</td>
					<td>
						<asp:TextBox ID="TextBox1891226" runat="server" Height="22px" 
							Text='<%# bind("country") %>' style="text-transform:uppercase;" Width="176px"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td align="right" class="style87">
						Zip Code:</td>
					<td class="style80">
						<asp:TextBox ID="TextBox77" runat="server" Text='<%# bind("postalcode") %>'></asp:TextBox>
					</td>
					<td align="right" class="style95">
						Phone#</td>
					<td>
						<asp:TextBox ID="TextBox8" runat="server" Height="17px" 
							Text='<%# bind("phonenumber") %>' Width="140px"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td align="right" class="style87">
						Email Address:</td>
					<td colspan="3">
						<asp:TextBox ID="TextBox9" runat="server" Height="25px" 
							Text='<%# bind("emailaddress") %>' Width="482px"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td align="left" class="style87">
						<asp:CheckBox ID="CheckBox4" runat="server" 
							Checked='<%# bind("taxexemptconfirmed") %>' Text="Tax Exempt Confirmed" /></td>
					<td class="style80">
						<asp:CheckBox ID="CheckBox1" runat="server" 
							Checked='<%# bind("taxexempt") %>' Text="Tax Exempt" />
					</td>
					<td align="right" class="style95">
						Tax ID:</td>
					<td>
						<asp:TextBox ID="TextBox10" runat="server" Height="19px" 
							Text='<%# bind("taxid") %>' Width="124px"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td align="left" class="style87">
						<asp:CheckBox ID="CheckBox2" runat="server" 
							Checked='<%# bind("repofschool") %>' Text="School Rep" />
					</td>
					<td class="style80">
						<asp:CheckBox ID="CheckBox33" runat="server" 
							Checked='<%# bind("emailsubscriber") %>' Text="Receive Emails" />
					</td>
					<td align="right" class="style95">
						Heard of from:</td>
					<td>
						<asp:DropDownList ID="DropDownList2" runat="server" Height="23px" Width="133px" 
							SelectedValue='<%# bind("refby") %>'>
						  
							 <asp:ListItem></asp:ListItem>
		<asp:ListItem>Internet Search</asp:ListItem>
		<asp:ListItem>Email</asp:ListItem>
		<asp:ListItem>Word of Mouth</asp:ListItem>
		<asp:ListItem>Returning Customer</asp:ListItem>
							<asp:ListItem>Catolog Mailing</asp:ListItem>
							<asp:ListItem>Other Direct Mail</asp:ListItem>
							<asp:ListItem>Jostens.com</asp:ListItem>
						</asp:DropDownList>
					</td>
				</tr>
				<tr>
					<td align="left" colspan="2">Oracle#:<asp:TextBox ID="TextBox658" 
							runat="server" Height="16px" Text='<%# bind("oraclecustid") %>' Width="84px"></asp:TextBox>
						&nbsp;&nbsp;
						<asp:CheckBox ID="CheckBox9" runat="server" Checked='<%# bind("allowpo") %>' 
							Text="PO Allowed" />
						</td>
					<td align="right" class="style95">
                        <asp:CheckBox ID="CheckBox13" runat="server" Checked='<%# bind("isorg") %>' 
                            Text="School Org" />
                        &nbsp;
						</td>
					<td align="center">
						<asp:Button ID="Button6" runat="server" Height="24px" onclick="Button6_Click1" 
							Text="Copy Info to Shipping" Width="143px" />
					</td>
				</tr>
				<tr>
					<td align="center" class="style33" colspan="4" 
						style="font-weight: bolder; font-size: medium; text-decoration: underline;">
						Customer Shipping
					</td>
				</tr>
				<tr>
					<td align="right" class="style87">
						Company Name</td>
					<td align="left" class="style33" colspan="3">
						<asp:TextBox ID="TextBox11" runat="server" Height="23px" 
							Text='<%# bind("scompanyname") %>' style="text-transform:uppercase;" Width="487px"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td align="right" class="style87">
						First Name:</td>
					<td align="left" class="style78">
						<asp:TextBox ID="TextBox122" runat="server" Text='<%# bind("sfname") %>' style="text-transform:uppercase;"
							Width="166px"></asp:TextBox>
					</td>
					<td align="right" class="style95">
						Last Name:</td>
					<td align="left" class="style33">
						<asp:TextBox ID="TextBox13" runat="server" Height="24px" 
							Text='<%# bind("slname") %>' style="text-transform:uppercase;" Width="125px"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td align="right" class="style88">
						Address1:</td>
					<td align="left" class="style36" colspan="3">
						<asp:TextBox ID="TextBox14" runat="server" Height="18px" 
							Text='<%# bind("saddr1") %>' style="text-transform:uppercase;" Width="487px"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td align="right" class="style90">
						Address 2:</td>
					<td align="left" class="style39" colspan="3">
						<asp:TextBox ID="TextBox15" runat="server" Height="22px" 
							Text='<%# bind("saddr2") %>' style="text-transform:uppercase;" Width="488px"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td align="left" class="style36" colspan="4">

                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                       
					   <asp:CheckBox ID="chkinter21" runat="server" AutoPostBack="True" 
							Checked='<%# Bind("sinternational") %>' 
							oncheckedchanged="chkinter21_CheckedChanged" 
							Text="International Address" />&nbsp;&nbsp;&nbsp; State/Province:<asp:DropDownList 
							ID="DropDownList31" runat="server" DataSourceID="dsstates" 
							DataTextField="name" DataValueField="abrv" Height="24px" Width="189px" 
							SelectedValue='<%# bind("sstate") %>' AppendDataBoundItems="True" AutoPostBack="True" 
                            onselectedindexchanged="DropDownList31_SelectedIndexChanged" 
                            ondatabound="DropDownList31_DataBound">
						    <asp:ListItem></asp:ListItem>
                            <asp:ListItem Value="add">--Add Province</asp:ListItem>
						</asp:DropDownList>
						<asp:TextBox ID="TextBox18911" runat="server" Height="24px" Visible="False"  
                                style="text-transform:uppercase;" Width="149px" 
                            ontextchanged="TextBox18911_TextChanged" AutoPostBack="True"></asp:TextBox>
                             </ContentTemplate>
                        </asp:UpdatePanel>
					</td>


				</tr>
				<tr>
					<td align="right" class="style89">
						City:</td>
					<td align="left" class="style79">
						<asp:TextBox ID="TextBox16" runat="server" Text='<%# bind("scity") %>' style="text-transform:uppercase;" 
							Width="167px"></asp:TextBox>
					</td>
					<td align="right" class="style96">
						Country:</td>
					<td align="left" class="style33">
						
						<asp:TextBox ID="TextBox1891225" runat="server" Height="22px" 
							Text='<%# bind("scountry") %>' style="text-transform:uppercase;" Width="183px"></asp:TextBox>
						
					</td>
				</tr>
				<tr>
					<td align="right" class="style87">
						Zip Code:</td>
					<td align="left" class="style78">
						<asp:TextBox ID="TextBox1888" runat="server" Text='<%# bind("spostalcode") %>'></asp:TextBox>
					</td>
					<td align="right" class="style95">
						Phone#</td>
					<td align="left" class="style33">
						<asp:TextBox ID="TextBox17" runat="server" Height="16px" 
							Text='<%# bind("sphonenumber") %>' Width="184px"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td align="right" class="style87">
						Fax#</td>
					<td align="left" class="style33" colspan="3">
						<asp:TextBox ID="TextBox19" runat="server" Text='<%# bind("sfax") %>'></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="4">
						<asp:Button ID="btnsvinsert" runat="server" CommandName="Insert" 
							 Text="Save Record" ValidationGroup="g1" onclick="btnsvinsert_Click"   />
						&nbsp;
						<asp:Button ID="btninsertcancel" runat="server" 
							Text="Cancel" onclick="btninsertcancel_Click" />
					</td>
				</tr>
			</table>
		</InsertItemTemplate>
		<ItemTemplate>
			<table style="width:100%; height: 91px; font-size: small;">
				<tr>
					<td align="right" class="style72" style="font-size: small">
						Customer ID:</td>
					<td colspan="3">
						<asp:Label ID="Label1" runat="server" Text='<%# eval("custid") %>' 
                            Font-Size="Small"></asp:Label>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<td align="left" colspan="4" class="style72">
						User Name:<asp:label ID="label20" runat="server" Height="22px" 
							Text='<%# eval("username") %>' Width="153px" Font-Size="Small"></asp:label>
						&nbsp;&nbsp; Password:<asp:label ID="label21" runat="server" Height="25px" 
							Text='**********' Width="136px" TextMode="Password" Font-Size="Small"></asp:label>
						&nbsp;&nbsp;&nbsp;
						<asp:CheckBox ID="CheckBox6" runat="server" Checked='<%# eval("iscs") %>' 
							Text="Company Personel" Enabled="False" Font-Size="Small" />
						<br />
					</td>
				</tr>
				<tr>
					<td align="center" colspan="4" 
						style="font-weight: bold; font-size: medium; text-decoration: underline;">
						Customer Billling<br /> </td>
				</tr>
				<tr>
					<td align="center" colspan="4">
						&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
				</tr>
				<tr>
					<td align="right" class="style72">
						Company Name:</td>
					<td class="style35" colspan="3">
						<asp:label ID="label3" runat="server" Height="21px" 
							Text='<%# eval("companyname") %>' Width="487px" Font-Size="Small"></asp:label>
					</td>
				</tr>
				<tr>
					<td align="right" class="style72">
						First Name:</td>
					<td class="style56">
						<asp:label ID="label22" runat="server" Height="24px" 
							Text='<%# eval("fname") %>' Width="178px" Font-Size="Small"></asp:label>
					</td>
					<td align="right" class="style70">
						Last Name:</td>
					<td class="style34">
						<asp:label ID="label2" runat="server" Height="22px" 
							Text='<%# eval("lname") %>' Width="191px" Font-Size="Small"></asp:label>
					</td>
				</tr>
				<tr>
					<td align="right" class="style72">
						Address 1:</td>
					<td colspan="3">
						<asp:label ID="label4" runat="server" Height="21px" 
							Text='<%# eval("billingaddr1") %>' Width="487px" Font-Size="Small"></asp:label>
					</td>
				</tr>
				<tr>
					<td align="right" class="style72">
						Address 2:</td>
					<td colspan="3">
						<asp:label ID="label5" runat="server" Height="22px" 
							Text='<%# eval("billingaddr2") %>' Width="487px" Font-Size="Small"></asp:label>
					</td>
				</tr>
                       
                      
				<tr>
					<td align="left" class="style59" colspan="4">  
						<asp:CheckBox ID="chkinternational222" runat="server" AutoPostBack="True" 
							Checked='<%# Bind("international") %>' 
							
							Text="International Address" Enabled="False" Font-Size="Small" />
						&nbsp; State/Province:
                     
                        <asp:Label ID="Label223" runat="server" Text='<%# bind("state") %>' 
                            Font-Size="Small"></asp:Label>
					</td>
				</tr>
				<tr>
					<td align="right" class="style72">
						City:</td>
					<td class="style56" colspan="1">
						<asp:label ID="label6" runat="server" Height="16px" 
							Text='<%# eval("city") %>' Width="233px" Font-Size="Small"></asp:label>
					</td>
					<td align="right" class="style71">
						Country:</td>
					<td>
						<asp:Label ID="Label23" runat="server" Text='<%# eval("country") %>' 
                            Font-Size="Small"></asp:Label>
					</td>
				</tr>
				<tr>
					<td align="right" class="style72">
						Zip Code:</td>
					<td class="style56">
						<asp:label ID="label7" runat="server" Text='<%# eval("postalcode") %>' 
                            Font-Size="Small"></asp:label>
					</td>
					<td align="right" class="style71">
						Phone#</td>
					<td>
						<asp:label ID="label8" runat="server" Height="21px" 
							Text='<%# eval("phonenumber") %>' Width="190px" Font-Size="Small"></asp:label>
					</td>
				</tr>
				<tr>
					<td align="right" class="style72">
						Email Address:</td>
					<td colspan="3">
						<asp:label ID="label9" runat="server" Height="25px" 
							Text='<%# eval("emailaddress") %>' Width="482px" Font-Size="Small"></asp:label>
					</td>
				</tr>
				<tr>
					<td align="left" class="style72">
					<asp:CheckBox ID="CheckBox4" runat="server" 
							Checked='<%# bind("taxexemptconfirmed") %>' Text="Tax Exempt Confirmed" Font-Size="Small" /></td>
					<td class="style56" valign="top">
						<asp:CheckBox ID="CheckBox1" runat="server" 
							Checked='<%# eval("taxexempt") %>' Enabled="False" Text="Tax Exempt" Font-Size="Small" />
					</td>
					<td align="right" class="style71">
						Tax ID:</td>
					<td>
						<asp:label ID="label10" runat="server" Height="22px" 
							Text='<%# eval("taxid") %>' Width="188px" Font-Size="Small"></asp:label>
					</td>
				</tr>
				<tr>
					<td align="left" class="style74">
						<asp:CheckBox ID="CheckBox2" runat="server" 
							Checked='<%# eval("repofschool") %>' Text="School Rep" Enabled="False" Font-Size="Small" />
					</td>
					<td class="style56">
						<asp:CheckBox ID="CheckBox3" runat="server" 
							Checked='<%# eval("emailsubscriber") %>' Text="Receive Emails" 
							Enabled="False" Font-Size="Small" />
					</td>
					<td align="right" class="style70">
						Heard of from:</td>
					<td>
						<asp:Label ID="Label24" runat="server" Text='<%# eval("refby") %>' 
                            Font-Size="Small"></asp:Label>
					</td>
				</tr>
				<tr>
					<td align="left" colspan="2">
						Jostens Cust Id:<asp:TextBox ID="TextBox1889" runat="server" Height="24px" 
							Text='<%# eval("oraclecustid") %>' Width="86px" Font-Size="Small"></asp:TextBox>
						&nbsp;
						<asp:CheckBox ID="CheckBox7" runat="server" Checked='<%# bind("allowpo") %>' 
							Text=" PO Allowed" Enabled="False" Font-Size="Small" />
					</td>
					<td align="right" class="style70">
						<asp:CheckBox ID="CheckBox11" runat="server" Checked='<%# eval("isorg") %>' 
                            Enabled="False" Text="School Org" Font-Size="Small" />
						</td>
					<td>
						&nbsp;</td>
				</tr>
				<tr>
					<td align="center" class="style33" colspan="4" 
						style="font-weight: bolder; font-size: medium; text-decoration: underline;">
						Customer Shipping
					</td>
				</tr>
				<tr>
					<td align="right" class="style74">
						Company Name</td>
					<td align="left" class="style46" colspan="3">
						<asp:label ID="label11" runat="server" Height="19px" 
							Text='<%# eval("scompanyname") %>' Width="487px" Font-Size="Small"></asp:label>
					</td>
				</tr>
				<tr>
					<td align="right" class="style72">
						First Name:</td>
					<td align="left" class="style56">
						<asp:label ID="label12" runat="server" Text='<%# eval("sfname") %>' 
							Width="166px" Font-Size="Small"></asp:label>
					</td>
					<td align="right" class="style71">
						Last Name:</td>
					<td align="left" class="style33">
						<asp:label ID="label13" runat="server" Height="17px" 
							Text='<%# eval("slname") %>' Width="190px" Font-Size="Small"></asp:label>
					</td>
				</tr>
				<tr>
					<td align="right" class="style73">
						Address1:</td>
					<td align="left" class="style36" colspan="3">
						<asp:label ID="label14" runat="server" Height="18px" 
							Text='<%# eval("saddr1") %>' Width="487px" Font-Size="Small"></asp:label>
					</td>
				</tr>
				<tr>
					<td align="right" class="style49">
						Address 2:</td>
					<td align="left" class="style39" colspan="3">
						<asp:label ID="label15" runat="server" Height="18px" 
							Text='<%# eval("saddr2") %>' Width="488px" Font-Size="Small"></asp:label>
					</td>
				</tr>
				<tr>
					<td align="left" class="style36" colspan="4">
					   <asp:CheckBox ID="chkinter2222" runat="server" AutoPostBack="True" 
							Checked='<%# Bind("sinternational") %>' 
							
							Text="International Address" Enabled="False" Font-Size="Small" />&nbsp;&nbsp;&nbsp; State/Province:<asp:Label 
                            ID="Label224" runat="server" Text='<%# bind("sstate") %>' 
                            Font-Size="Small"></asp:Label>
					</td>
				</tr>
				<tr>
					<td align="right" class="style72">
						City:</td>
					<td align="left" class="style56">
						<asp:label ID="label16" runat="server" Text='<%# eval("scity") %>' 
							Width="167px" Font-Size="Small"></asp:label>
					</td>
					<td align="right" class="style71">
						Country:</td>
					<td align="left" class="style33">
						<asp:Label ID="Label25" runat="server" Text='<%# eval("scountry") %>' 
                            Font-Size="Small"></asp:Label>
					</td>
				</tr>
				<tr>
					<td align="right" class="style72">
						Zip Code:</td>
					<td align="left" class="style56">
						<asp:label ID="label18" runat="server" Text='<%# eval("spostalcode") %>' 
                            Font-Size="Small"></asp:label>
					</td>
					<td align="right" class="style71">
						Phone#</td>
					<td align="left" class="style33">
						<asp:label ID="label17" runat="server" Height="21px" 
							Text='<%# eval("sphonenumber") %>' Width="188px" Font-Size="Small"></asp:label>
					</td>
				</tr>
				<tr>
					<td align="right" class="style72">
						Fax#</td>
					<td align="left" class="style33" colspan="3">
						<asp:label ID="label19" runat="server" Text='<%# eval("sfax") %>' 
                            Font-Size="Small"></asp:label>
					</td>
				</tr>
				<tr>
					<td align="center"  colspan="4">
					<asp:Button ID="btnnewrec" runat="server" 
							Text="New Record" onclick="btnnewrec_Click"  />
						&nbsp;
						<asp:Button ID="Button2" runat="server" 
							Text="Edit Record" onclick="Button2_Click"  />
						&nbsp;&nbsp;<asp:Button ID="Button8" runat="server" onclick="Button8_Click" 
							Text="Delete Customer" />
						&nbsp; <asp:Button ID="Button5" runat="server" onclick="Button5_Click" 
							Text="Customer Orders" />
					</td>
				</tr>
			</table>
		</ItemTemplate>
		<PagerSettings Mode="NumericFirstLast" />
		<PagerStyle BorderColor="#0066FF" BorderStyle="Double" ForeColor="#0066FF" 
			HorizontalAlign="Center" />
	</asp:FormView>

	<eo:MsgBox ID="MsgBox1" runat="server" BackColor="#EBEBEB" 
        CloseButtonUrl="00070301" ControlSkinID="None" HeaderHtml="Dialog Title" 
        Height="123px" Width="305px">
        <HeaderStyleActive CssText="padding-right: 3px; padding-left: 8px; font-weight: bold; font-size: 10pt; background-image: url(00020213); padding-bottom: 3px; color: white; padding-top: 0px; font-family: 'trebuchet ms';height:20px;" />
        <ContentStyleActive CssText="padding-right: 4px; padding-left: 4px; font-size: 8pt; padding-bottom: 4px; padding-top: 4px; font-family: tahoma" />
        <FooterStyleActive CssText="padding-right: 4px; padding-left: 4px; font-size: 8pt; padding-bottom: 4px; padding-top: 4px; font-family: tahoma" />
        <BorderImages BottomBorder="00020212" BottomLeftCorner="00020207" 
            BottomRightCorner="00020208" LeftBorder="00020210" RightBorder="00020211" 
            TopBorder="00020209" TopLeftCorner="00020201" TopLeftCornerBottom="00020203" 
            TopLeftCornerRight="00020202" TopRightCorner="00020204" 
            TopRightCornerBottom="00020206" TopRightCornerLeft="00020205" />
    </eo:MsgBox>

	</div>
	<asp:SqlDataSource ID="ddsstates1" runat="server" 
		ConnectionString="<%$ ConnectionStrings:KK5 %>" 
		ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
		SelectCommand="SELECT trim(name) AS name, trim(abrv) as abrv, id FROM states"></asp:SqlDataSource>
	 <asp:SqlDataSource ID="dsstates" runat="server" 
		ConnectionString="<%$ ConnectionStrings:KK5 %>" 
		ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
		SelectCommand="SELECT trim(name) AS name, trim(abrv) as abrv, id FROM states"></asp:SqlDataSource>

	<asp:SqlDataSource ID="dscust" runat="server" 
		ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
		
		UpdateCommand="UPDATE cust SET fname = upper(@fname), lname = upper(@lname), EmailAddress = @emailaddress, password = @password, CompanyName = upper(@companyname), billingaddr1 = upper(@billingaddr1), billingaddr2 = upper(@billingaddr2), city = upper(@city), state = @state, postalcode = @postalcode, phonenumber = @phonenumber, taxid = @taxid, repofschool = @repofschool, Schname = upper(@schname), refby = @refby, emailsubscriber = @emailsubscriber, sfname = upper(@sfname), slname = upper(@slname), scompanyname = upper(@scompanyname), saddr1 = upper(@saddr1), saddr2 = upper(@saddr2), scity = upper(@scity), sstate = @sstate, spostalcode = @spostalcode, sphonenumber = @sphonenumber, sfax = @sfax, taxexempt = @taxexempt, iscs = @iscs, username = @username, taxexemptconfirmed = @taxexemptconfirmed, oraclecustid = @oraclecustid, allowpo = @allowpo, country = @country, scountry = @scountry, international = @international, sinternational = @sinternational, isorg = @isorg WHERE (custid = @custid)" 
		
		
		
		InsertCommand="INSERT INTO cust(fname, lname, EmailAddress, CompanyName, billingaddr1, billingaddr2, city, state, postalcode, phonenumber, taxid, repofschool, Schname, refby, emailsubscriber, sfname, slname, scompanyname, saddr1, saddr2, scity, sstate, spostalcode, sphonenumber, sfax, taxexempt, username, iscs, password, taxexemptconfirmed, oraclecustid, allowpo, country, scountry, international, sinternational, isorg) VALUES (upper(@fname), Upper(@lname), @emailaddress, upper(@companyname), Upper(@billingaddr1), upper(@billingaddr2), upper(@city), @state, @postalcode, @phonenumber, @taxid, @repofschool, upper(@schname), @refby, @emailsubscriber, upper(@sfname), upper(@slname), upper(@scompanyname), upper(@saddr1), upper(@saddr2), upper(@scity), @sstate, @spostalcode, @sphonenumber, @sfax, @taxexempt, @username, @iscs, @password, @taxexemptconfirmed, @oraclecustid, @allowpo, @country, @scountry, @international, @sinternational, @isorg)" 
		ConnectionString="<%$ ConnectionStrings:KK5 %>" 
        SelectCommand="SELECT cust.* FROM cust">
	</asp:SqlDataSource>
    <asp:SqlDataSource ID="DSSQLCUST" runat="server"  
        ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
        ConnectionString="<%$ ConnectionStrings:KK5 %>">
      </asp:SqlDataSource>

<!-- InstanceEndEditable -->

<div id="footer">
  		<p><a href="../returns.aspx">Shipping Rates and Returnss</a> &nbsp; &#124; &nbsp;  <asp:LinkButton ID="ordstatus" runat="server"  OnClick="ordstatus_Click">Order History</asp:LinkButton> &nbsp; &#124; &nbsp; 
          <a href="../ChangePassword.aspx">Change Password/User Name</a> &nbsp;  &#124; &nbsp;
          <a href="http://www.jostenskinderkraft.com/contact.html"> Contact Us</a> &nbsp; &#124; &nbsp; 
          <a href="http://www.jostenskinderkraft.com/kinderkraft_home.html">Home</a></p>
  		<p><font size="-6">©2013 Jostens, Inc • All Rights Reserved</font></p>
</div>
</div>
</form>
</body>
<!-- InstanceEnd --></html>