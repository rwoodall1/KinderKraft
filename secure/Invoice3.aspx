<%@ Page Title="" Language="VB"  AutoEventWireup="false" CodeFile="Invoice3.aspx.vb" Inherits="Invoice3" %>
<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_LayoutSubfolder.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->
<%-- Randy's style for grid--%>
<style type="text/css">
        .FixedHeader {
            position: absolute;
            font-weight: bold;
        }     
    </style>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>Review Payment</title>
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
 <script type="text/javascript">
     function MM_showHideLayers() { //v9.0
         var i, p, v, obj, args = MM_showHideLayers.arguments;
         for (i = 0; i < (args.length - 2); i += 3)
             with (document) if (getElementById && ((obj = getElementById(args[i])) != null)) {
                 v = args[i + 2];
                 if (obj.style) { obj = obj.style; v = (v == 'show') ? 'visible' : (v == 'hide') ? 'hidden' : v; }
                 obj.visibility = v;
             }
     }
</script>
  <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
   <div class="step_one">
              <img src="../images/KK_review.jpg" alt="" width="600" height="50" /><br />
        </div>
          
   
    <hr /> 

         
<div align="center" style="font-size: small; height: auto;">

<table cellpadding="0" cellspacing="0" style="width: 672px">
		<tr>
			<td align="left" style="font-size: large" valign="top">Billing Information<br />
				<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
					CellPadding="4" DataSourceID="dscust" ForeColor="#333333" GridLines="None" 
					Height="110px" Width="350px" DataKeyNames="custid,emailaddress,isorg" Font-Size="7pt">
					<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
					<CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
					<EditRowStyle BackColor="#999999" />
					<FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
					<Fields>
						<asp:BoundField DataField="CompanyName" HeaderText="Company Name" 
							SortExpression="CompanyName" />
						<asp:BoundField DataField="custid" HeaderText="Customer No." ReadOnly="True" 
							SortExpression="custid" />
						<asp:BoundField DataField="fname" HeaderText="First Name" 
							SortExpression="fname" />
						<asp:BoundField DataField="lname" HeaderText="Last Name" 
							SortExpression="lname" />
						<asp:BoundField DataField="billingaddr1" HeaderText="Address" 
							SortExpression="billingaddr1" />
						<asp:BoundField DataField="billingaddr2" HeaderText="Address 2" 
							SortExpression="billingaddr2" />
						<asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
						<asp:CheckBoxField DataField="international" HeaderText="international" 
                            SortExpression="international" />
						<asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
						<asp:BoundField DataField="country" HeaderText="Country" 
                            SortExpression="country" />
						<asp:BoundField DataField="postalcode" HeaderText="Zip Code" 
							SortExpression="postalcode" />
						<asp:BoundField DataField="emailaddress" HeaderText="Email" />
						<asp:CheckBoxField DataField="taxexempt" HeaderText="Tax Exempt" 
							SortExpression="taxexempt" />
					    <asp:TemplateField HeaderText="School Org">
                            <EditItemTemplate>
                                <asp:CheckBox ID="chkisorg" runat="server" Checked='<%# Bind("isorg") %>' />
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("isorg") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkisorg" runat="server" Checked='<%# Bind("isorg") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
					</Fields>
					<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
					<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
					<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
					<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
				</asp:DetailsView>
			</td>
			<td align="left" valign="top" style="font-size: large">
				Shipping Information<br />
				<asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" 
					CellPadding="4" DataKeyNames="custid" DataSourceID="DSCust" 
					ForeColor="#333333" GridLines="None" Height="110px" Width="350px" 
					Font-Size="7pt">
					<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
					<CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
					<EditRowStyle BackColor="#999999" />
					<FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
					<Fields>
						<asp:BoundField DataField="scompanyname" HeaderText="Company Name" 
							SortExpression="scompanyname" />
						<asp:BoundField DataField="sfname" HeaderText="First Name" 
							SortExpression="sfname" />
						<asp:BoundField DataField="slname" HeaderText="Last Name" 
							SortExpression="slname" />
						<asp:BoundField DataField="saddr1" HeaderText="Address" 
							SortExpression="saddr" />
						<asp:BoundField DataField="saddr2" HeaderText="Address 2" 
							SortExpression="sadd2" />
						<asp:BoundField DataField="scity" HeaderText="City" SortExpression="scity" />
						<asp:CheckBoxField DataField="sinternational" HeaderText="international" 
                            SortExpression="sinternational" />
						<asp:BoundField DataField="sstate" HeaderText="State" 
							SortExpression="sstate" />
						<asp:BoundField DataField="scountry" HeaderText="Country" 
                            SortExpression="scountry" />
						<asp:BoundField DataField="spostalcode" HeaderText="Zip Code" 
							SortExpression="szip" />
						<asp:BoundField DataField="sphonenumber" HeaderText="Phone#" />
					    <asp:BoundField ReadOnly="True" SortExpression="custid" />
					    <asp:BoundField ReadOnly="True" SortExpression="custid" />
					    <asp:BoundField />
					</Fields>
					<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
					<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
					<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
					<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
				</asp:DetailsView>
			</td>
		</tr>
	</table>
    <div align="center" class="invoice_heading">
        Order Information
        <br />
         <asp:CheckBox ID="chkonhold" runat="server" Text="Put On Hold" 
            Visible="False" />
  </div>   
    
   <div style="height:231px; overflow-y: auto; overflow-x:hidden" align="center">
<asp:GridView ID="gv1" runat="server" Width="698px"  HeaderStyle-CssClass="FixedHeader"
		 AutoGenerateColumns="False" CellPadding="10" ForeColor="#333333" 
			GridLines="None" HorizontalAlign="Center" BorderStyle="None" PageSize="4" DataKeyNames="detailid,pkgid,OrderId" 
        Font-Size="9pt" Height="44px" >
  <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
		<Columns>
			<asp:BoundField DataField="productname" HeaderText="Item" >
            <HeaderStyle Width="200px" />
            <ItemStyle Width="200px" />
            </asp:BoundField>
			<asp:BoundField DataField="Quantity" HeaderText="Qty">
			<HeaderStyle HorizontalAlign="Center" Width="60px" />
            <ItemStyle HorizontalAlign="Center" Width="60px" />
			</asp:BoundField>
			<asp:BoundField DataField="prodprice" HeaderText="Price">
			<HeaderStyle HorizontalAlign="Center" Width="60px" />
			<ItemStyle HorizontalAlign="Center" Width="60px" />
			</asp:BoundField>
			<asp:BoundField DataField="totalprice" HeaderText="Total">
			<HeaderStyle HorizontalAlign="Center" Width="100px" />
			<ItemStyle HorizontalAlign="Center" Width="100px" />
			</asp:BoundField>
			<asp:BoundField DataField="detailid" HeaderText="DetailId" 
				Visible="False">
			</asp:BoundField>    
			
			
			
				   
<asp:TemplateField HeaderText="Options">
				<ItemTemplate>
				 <asp:GridView ID="opd" runat="server" AutoGenerateColumns="False" CellPadding="4"  
						ForeColor="#333333" GridLines="None" ShowHeader="False" Height="13px" Font-Size="7pt" >
			<Columns>
			   
				<asp:BoundField DataField="opdesc" >
			   
				<ItemStyle VerticalAlign="Top" />
                </asp:BoundField>
			   
				<asp:BoundField DataField="detailid" HeaderText="detailid" Visible="False" />
			   
				</Columns>
               <RowStyle VerticalAlign="Top" />
				 </asp:GridView>
				</ItemTemplate>
				
				<HeaderStyle HorizontalAlign="Center" Width="160px" />
				
				<ItemStyle Font-Size="7pt" HorizontalAlign="Center" />
				
			</asp:TemplateField>



			<asp:BoundField DataField="pkgid" HeaderText="pkgid" Visible="False" />
			<asp:BoundField DataField="orderid" HeaderText="orderid" Visible="False" />



		</Columns>
		<EditRowStyle BackColor="#999999" />
		<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
		<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
			Height="30px" HorizontalAlign="Center" />
		<PagerSettings Mode="NextPreviousFirstLast" NextPageText="Next Page" 
            PreviousPageText="Previous Page" />
		<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
		<RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="14px" 
            VerticalAlign="Top" />
		<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
		<SortedAscendingCellStyle BackColor="#E9E7E2" />
		<SortedAscendingHeaderStyle BackColor="#506C8C" />
		<SortedDescendingCellStyle BackColor="#FFFDF8" />
		<SortedDescendingHeaderStyle BackColor="#6F8DAE" />
	</asp:GridView>
  </div>
    <hr />	
  </div>
    
    <div class="invoice"><table style="width:700px; height: 73px;">
		<tr>
		  <td align="right" class="style42">&nbsp;</td>
			<td align="right" class="style39">
				Subtotal:</td>
			<td width="80" align="right" class="field_label">
				<asp:Label ID="lblsubtot" runat="server" >0</asp:Label>
			</td>
		</tr>
		
		<tr>
		  <td class="auto-style8" align="right" >
              <asp:CheckBox ID="cknoshp" runat="server" AutoPostBack="True" ForeColor="Red" 
                  Text="No Shipping" Visible="False" />
&nbsp;&nbsp; Shipping 
                Method:<asp:Label ID="lblmethod" runat="server" Font-Italic="True"></asp:Label>
              
            </td>
			<td align="right" class="auto-style11">
				Shipping:</td>
			<td align="right" class="auto-style12">
            
				<asp:Label  ID="lblshipping" runat="server" >0</asp:Label>
                
              </td>
		</tr>
		
		<tr>
		  <td class="style44" align="right">Promotion Code:
                <asp:Label ID="lblpromocode" runat="server" Font-Italic="True"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp; </td>
			<td align="right" class="style39">
				Promotion: </td>
			<td align="right" class="field_label">
             
				<asp:Label ID="lbldiscount" runat="server" Text="0"></asp:Label>
                
			</td>
		</tr>
		
		<tr>
		  <td class="style44" align="right"><asp:HiddenField ID="HFshpcode" runat="server" /></td>
			<td align="right" class="style39">
				Tax:</td>
			<td align="right" class="field_label">
             
				<asp:Label ID="lbltax" runat="server"  >0</asp:Label></td>
		</tr>
		
		<tr>
		  <td class="style44" align="right">&nbsp;</td>
			<td align="right" class="style39">
				Total:</td>
			<td align="right">
             <asp:UpdatePanel ID="UpdatePanel4" runat="server">
               <ContentTemplate>
				<asp:Label id="x_amount11" runat="server"  >0</asp:Label>
                </ContentTemplate></asp:UpdatePanel>
			  </td>
		</tr>
		<tr>
		  <td align="left" class="style44" >Order Comments:<asp:TextBox ID="ordnotes" runat="server" Height="64px" TextMode="MultiLine" 
                  Width="429px" TabIndex="37"></asp:TextBox></td>
		  <td class="style39" >    </td>
		  <td align="right">&nbsp;</td>
		  </tr>
	</table>

</div>
<hr/>
       <div class="invoice" style="padding:5px"> 
      <div class="invoice_heading">
      Payment Type &nbsp;&nbsp;&nbsp;<%Response.Write(Session("paymenterror"))%>
          </div>
      <div class="field_label">
      Payment Method :<asp:DropDownList ID="ddlpaytype" runat="server" Height="22px" Width="149px" AutoPostBack="True" >
            <asp:ListItem Selected="True">Credit Card</asp:ListItem>
            <asp:ListItem Value="PO">PO#</asp:ListItem>
            </asp:DropDownList>
          <asp:HiddenField ID="x_amount" runat="server" />
          <asp:HiddenField ID="x_invoice_num" runat="server" />
      </div>   </div>   
      
      <hr/>
      
                          
 <asp:Panel ID="pnlCC" runat="server" Width="705px" Height="306px">
   <div class="invoice">  
   
  <table style="height: 215px; width: 700px;">
        <tr>
            <td valign="baseline" class="style56"></td>
            <td align="left" class="style57">
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
            <td width="326" align="left" class="style58"></td>
        </tr>
        <tr>
            <td align="right" valign="bottom" class="style64" >
                Card Type:</td>
            <td align="left" class="style55" valign="bottom">
                <asp:DropDownList ID="ddlcardtype" runat="server" Height="22px" Width="152px">
					<asp:ListItem></asp:ListItem>
					<asp:ListItem>VISA</asp:ListItem>
					<asp:ListItem>MASTER CARD</asp:ListItem>
					<asp:ListItem>AMERICAN EXPRESS</asp:ListItem>
					<asp:ListItem>DISCOVER</asp:ListItem>
				</asp:DropDownList>
			</td>
            <td align="left"  class="style47">
				<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
					ControlToValidate="ddlpaytype" Display="Dynamic" 
					ErrorMessage="Card Name Required" ValidationGroup="g1"></asp:RequiredFieldValidator></td>
            
        </tr>
        <tr>
			<td align="right" class="style61" valign="bottom">
				Card Number:</td>
			<td align="left" class="style54" valign="bottom">
				<asp:TextBox ID="x_card_num" runat="server" CausesValidation="True" 
					Height="22px" MaxLength="16" TabIndex="31" ValidationGroup="g1" Width="130px"></asp:TextBox>
			</td>
			<td align="left" class="req_field_val">
				<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
					ControlToValidate="x_card_num" Display="Dynamic" 
					ErrorMessage="Card Number Required" ValidationGroup="g1"></asp:RequiredFieldValidator>
			</td>
		</tr>
        <tr>
            <td align="right" valign="bottom" class="style64">
                Security Code:</td>
            <td align="left" class="style55" valign="bottom">
                <asp:TextBox ID="x_card_code" runat="server" MaxLength="16" Width="51px" ValidationGroup="g1" TabIndex="32" CausesValidation="True"></asp:TextBox>
             </td>
            <td align="left" class="style47"><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
ControlToValidate="x_card_code" ErrorMessage="Security Code Required" Display="Dynamic" ValidationGroup="g1"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" class="style62" valign="bottom">
                <asp:Label ID="Label4" runat="server" Height="22px" Text="Name On Card:"></asp:Label></td>
            <td align="left" valign="bottom" class="style60">

                <asp:Label ID="Label2" runat="server" Height="22px" Text="First:"></asp:Label>&nbsp;<asp:TextBox 
					ID="x_first_name"  style="text-transform:uppercase;" runat="server" CausesValidation="True" 
                    Height="22px" Width="173px" TabIndex="33"></asp:TextBox>
                


            </td>
            <td align="left" valign="bottom" class="style59"><asp:Label ID="Label3" runat="server" Height="22px" Text="Last:"></asp:Label> 
				<asp:TextBox ID="x_last_name" runat="server"  style="text-transform:uppercase;" CausesValidation="True" 
					Height="22px" Width="173px" TabIndex="34"></asp:TextBox></td>
        </tr>
        <tr>
          <td align="right" valign="baseline" class="style61">&nbsp;</td>
          <td class="style50"><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
ControlToValidate="x_first_name" ErrorMessage="First Name Required" Display="Dynamic" ValidationGroup="g1"></asp:RequiredFieldValidator></td>
          <td valign="top" class="req_field_val"><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
ControlToValidate="x_last_name" ErrorMessage="Last Name Required" Display="Dynamic" ValidationGroup="g1"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" valign="top" class="style61">
                Expiration Date:</td>
            <td colspan="2" align="left" valign="top" class="field_label">
              
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
                                                                
                     <asp:DropDownList ID="ddlyear" runat="server" 
                    causesvalidation="True" CssClass="Text" validationgroup="g2" 
                    AutoPostBack="True" TabIndex="36">
                       <asp:ListItem></asp:ListItem>
                       <asp:ListItem>2015</asp:ListItem>
                       <asp:ListItem>2016</asp:ListItem>
                       <asp:ListItem>2017</asp:ListItem>
                       <asp:ListItem>2018</asp:ListItem>
                       <asp:ListItem>2019</asp:ListItem>
                       <asp:ListItem>2020</asp:ListItem>
                       <asp:ListItem>2021</asp:ListItem>
                         <asp:ListItem>2022</asp:ListItem>
                         <asp:ListItem>2023</asp:ListItem>
                </asp:DropDownList>&nbsp; Year</ContentTemplate></asp:UpdatePanel>
                <asp:HiddenField ID="x_exp_date" runat="server" /></td>
            </tr>
        <tr>
          <td align="right" valign="baseline" class="style40"></td>
          <td colspan="2" align="left" valign="top" class="req_field_val">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    candrag="error_text" ControlToValidate="ddlmonth" 
                    ErrorMessage="Expiration Month Required" Display="Dynamic" 
                  ValidationGroup="g1"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    candrag="error_text" ControlToValidate="ddlyear" 
                    ErrorMessage="Expiration Year Required" Display="Dynamic" 
                  ValidationGroup="g1"></asp:RequiredFieldValidator></td>
          </tr>
        <tr>
            <td valign="baseline" class="style63"></td>
            <td class="style53"></td>
            <td align="right" class="style35"><asp:Button ID="btncc" runat="server" Text="Submit Order" 
                    ValidationGroup="g1" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
        </tr>
    
    </table>
    </div>
     </asp:Panel>
    
         
           

  
  <asp:Panel ID="pnlEC" runat="server" 
                            Width="687px" Height="353px" Visible="False" style="margin-top: 37px">
  
  
  <div class="invoice">
  <table width="700" border="0" cellspacing="1" cellpadding="2">
  <tr>
    <td width="363" align="right" class="field_label">Customer's Name (as it appears on bank account):</td>
    <td width="326" class="field_label"><asp:TextBox ID="x_bank_acct_name" 
			runat="server" Width="260px" TabIndex="37"></asp:TextBox></td>
    </tr>
  <tr>
    <td align="right">&nbsp;</td>
    <td class="req_field_val"><asp:RequiredFieldValidator ID="rfCustName" runat="server" 
              ControlToValidate="x_bank_acct_name" 
              ErrorMessage="Full Name Required"></asp:RequiredFieldValidator></td>
  </tr>
  <tr>
    <td class="field_label" align="right">Bank Name:</td>
    <td class="field_label"><asp:TextBox ID="x_bank_name" runat="server" Width="260px" 
			ToolTip="Name of bank" TabIndex="38"></asp:TextBox></td>
  </tr>
  <tr>
    <td align="right"> </td>
    <td class="req_field_val"><asp:RequiredFieldValidator ID="rfbankname" runat="server" 
              ControlToValidate="x_bank_name" ErrorMessage="Bank Name Required"></asp:RequiredFieldValidator></td>
  </tr>
  <tr>
    <td class="field_label" align="right">Bank Account Type:</td>
    <td><asp:DropDownList ID="x_bank_acct_type" runat="server" 
            Height="24px" Width="260px" TabIndex="39">
            <asp:ListItem Selected="True"></asp:ListItem>
            <asp:ListItem>CHECKING</asp:ListItem>
            <asp:ListItem Value="BUSINESSCHECKING">BUSINESS CHECKING</asp:ListItem> <asp:ListItem>SAVINGS</asp:ListItem> </asp:DropDownList></td>
  </tr>
  <tr>
    <td align="right">&nbsp;</td>
    <td class="req_field_val"><asp:RequiredFieldValidator ID="rfacctype" runat="server" ControlToValidate="x_bank_acct_type" ErrorMessage="Account Type Required"></asp:RequiredFieldValidator></td>
  </tr>
  <tr>
    <td class="field_label" align="right">Bank's ABA Routing Number: <span class="Textlink" onmouseover="MM_showHideLayers('feature4','','show')" onmouseout="MM_showHideLayers('feature4','','hide')">What's This</span></td>
    <td><asp:TextBox ID="x_bank_aba_code" runat="server" Width="260px" 
			causesvalidation="True" MaxLength="9" ToolTip="First nine digits on check" 
			TabIndex="40"></asp:TextBox></td>
  </tr>
  <tr>
    <td align="right">&nbsp;</td>
    <td class="req_field_val"><asp:RequiredFieldValidator ID="rfRoutingnume" runat="server" ControlToValidate="x_bank_aba_code" ErrorMessage="Routing Number Is Required"></asp:RequiredFieldValidator></td>
  </tr>
  <tr>
    <td class="field_label" align="right">Bank Account Number: <span class="Textlink" onmouseover="MM_showHideLayers('feature4','','show')" onmouseout="MM_showHideLayers('feature4','','hide')">What's This</span></td>
    <td class="field_label"><asp:TextBox ID="x_bank_acct_num" runat="server" 
			Width="260px" MaxLength="16" ToolTip="Last section of digits on check" 
			TabIndex="41"></asp:TextBox></td>
  </tr>
  <tr>
    <td align="right">&nbsp;</td>
    <td class="req_field_val"><asp:RequiredFieldValidator ID="rfBankAcc" runat="server" ControlToValidate="x_bank_acct_num" ErrorMessage="Account Number Required"></asp:RequiredFieldValidator></td>
  </tr>
  <tr>
    <td align="right"><asp:HiddenField ID="x_echeck_type" 
                  runat="server" Value="WEB" /><asp:HiddenField ID="x_recurring_billing" runat="server" Value="FALSE" />
            <asp:HiddenField ID="x_relay_response" runat="server" Value="FALSE" />
            <asp:HiddenField ID="x_delim_data" runat="server" Value="TRUE" /></td>
    <td align="right"><asp:HiddenField ID="x_method" runat="server" Value="ECHECK" />
                <asp:Button ID="btnEC" runat="server" Text="Submit Order"  />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  
</table>
</div>
 </asp:Panel>


<asp:Panel ID="pnlPO" runat="server" 
                            Width="690px" Height="59px" Visible="False">
  <div class="invoice">
  <table width="700" border="0" cellspacing="1" cellpadding="2">
  <tr>
    <td width="354" align="right" class="field_label" >
        
        PO#:</td>
    <td width="335" class="field_label"><asp:TextBox ID="txtpo" runat="server" 
			Width="170px" CausesValidation="True" TabIndex="42"></asp:TextBox></td>
  </tr>
  <tr>
    <td></td>
    <td class="req_field_val"><asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtpo" ErrorMessage="PO# Required"></asp:RequiredFieldValidator></td>
  </tr>
  <tr>
    <td></td>
    <td align="right"><asp:Button ID="btnPO" runat="server" Text="Submit Order" />&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
</table>
</div>

</asp:Panel>
     <p style="color:#F00; font-weight:bold"><eo:MsgBox ID="MsgBox1" runat="server" BackColor="#EBEBEB" CloseButtonUrl="00070301" ControlSkinID="None" HeaderHtml="Dialog Title" Height="216px" Width="320px">
         <HeaderStyleActive CssText="padding-right: 3px; padding-left: 8px; font-weight: bold; font-size: 10pt; background-image: url(00020213); padding-bottom: 3px; color: white; padding-top: 0px; font-family: 'trebuchet ms';height:20px;" />
         <ContentStyleActive CssText="padding-right: 4px; padding-left: 4px; font-size: 8pt; padding-bottom: 4px; padding-top: 4px; font-family: tahoma" />
         <FooterStyleActive CssText="padding-right: 4px; padding-left: 4px; font-size: 8pt; padding-bottom: 4px; padding-top: 4px; font-family: tahoma" />
         <BorderImages BottomBorder="00020212" BottomLeftCorner="00020207" BottomRightCorner="00020208" LeftBorder="00020210" RightBorder="00020211" TopBorder="00020209" TopLeftCorner="00020201" TopLeftCornerBottom="00020203" TopLeftCornerRight="00020202" TopRightCorner="00020204" TopRightCornerBottom="00020206" TopRightCornerLeft="00020205" />
         </eo:MsgBox>
     </p>

  </div>                        
     

    <asp:SqlDataSource 
    ID="DSCust" runat="server" 
    ConnectionString="<%$ ConnectionStrings:KK5 %>" 
    DeleteCommand="DELETE FROM [cust] WHERE [custid] = ?" 
    ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
        
        
        
        SelectCommand="SELECT custid, fname, lname, EmailAddress, password, CompanyName, billingaddr1, billingaddr2, city, state, postalcode, phonenumber, taxid, repofschool, Schname, refby, emailsubscriber, sfname, slname, scompanyname, saddr1, saddr2, scity, sstate, spostalcode, sphonenumber, sfax, residential, business, taxexempt, username, iscs, custid AS Expr1, isorg, sinternational, international, scountry, country FROM cust WHERE (custid = @custid)">
            <DeleteParameters>
                <asp:Parameter Name="custid" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="custid" QueryStringField="custid" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:HiddenField ID="hftaxabletotal" runat="server" />
        <asp:SqlDataSource ID="Dsmisc" runat="server" 
        ConnectionString="<%$ ConnectionStrings:KK5 %>" 
        ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>"></asp:SqlDataSource>
     

    <asp:HiddenField ID="hfcustid" runat="server" />

   
    <asp:HiddenField ID="x_type" runat="server" Value="AUTH_CAPTURE" />
    <asp:HiddenField ID="x_duplicate_window" runat="server" Value="420" />
   
<!-- InstanceEndEditable -->

<div id="footer">
  		<p><a href="../returns.aspx">Shipping Rates and Returns</a> &nbsp; &#124; &nbsp;  <asp:LinkButton ID="ordstatus" runat="server"  OnClick="ordstatus_Click">Order History</asp:LinkButton> &nbsp; &#124; &nbsp; 
          <a href="../ChangePassword.aspx">Change Password/User Name</a> &nbsp;  &#124; &nbsp;
          <a href="http://www.jostenskinderkraft.com/contact.html"> Contact Us</a> &nbsp; &#124; &nbsp; 
          <a href="http://www.jostenskinderkraft.com/kinderkraft_home.html">Home</a></p>
  		<p><font size="-6">©2015 Jostens, Inc • All Rights Reserved</font></p>
</div>
</div>
</form>
</body>
<!-- InstanceEnd --></html>
