<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PhoneLog.aspx.vb" Inherits="PhoneLog" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<!-- TemplateBeginEditable name="head" -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
 <title></title>
  

<link href="../css/cssverticalmenu.css" rel="stylesheet" type="text/css" />
<link href="../css/package.css" rel="stylesheet" type="text/css" />
<link href="../css/package_cartpgs.css" rel="stylesheet" type="text/css" />
<link href="../css/master.css" rel="stylesheet" type="text/css" />
<link href="../css/productboxes.css" rel="stylesheet" type="text/css" />
<!-- TemplateEndEditable -->

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
	<p><a href="../login.aspx">Log In </a> | <a href="../scart.aspx">View Cart</a></p><br /><br />
<div class="welcome"><asp:Label ID="Label1" runat="server" Text="Welcome, GUEST" Visible="False" ></asp:Label></div>
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
		PostBackUrl="~/Admin/Admin.aspx">Adminstration</asp:LinkButton>  </li>
	  
  </ul>
  <div id="visa"> <img alt="" height="40" src="../images/visa.PNG" width="75" /> 
	  <img alt="" height="40" src="../images/mastercard.PNG" width="75" /> </div></div>

<!-- TemplateBeginEditable name="Content" -->
<div id="content">
<div align="center">
    <asp:Label ID="Label13" runat="server" Text="Telephone Log" Font-Size="X-Large" 
        Font-Bold="True" Font-Underline="True"></asp:Label>
    <br />
</div>
<asp:DetailsView ID="DetailsView1" runat="server" 
        AutoGenerateRows="False" CellPadding="4" 
        DataSourceID="dscust" ForeColor="#333333" GridLines="None" Height="50px" 
        Width="689px" DataKeyNames="custid">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" Width="150px" />
        <Fields>
            <asp:BoundField DataField="CompanyName" HeaderText="Company Name" 
                SortExpression="CompanyName" />
            <asp:BoundField DataField="custid" HeaderText="Customer No." ReadOnly="True" 
                SortExpression="custid" />
            <asp:BoundField DataField="fname" HeaderText="First Name" 
                SortExpression="fname" />
            <asp:BoundField DataField="lname" HeaderText="Last Name" 
                SortExpression="lname" />
            <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
            <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
            <asp:BoundField DataField="postalcode" HeaderText="Zip" 
                SortExpression="postalcode" />
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerSettings Mode="NumericFirstLast" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
    <br />
    <asp:Button ID="Button1" runat="server" Text="New Record" />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" 
        DataSourceID="dsPhoneLog" ForeColor="#333333" PageSize="4" 
        Width="696px" Font-Size="Smaller" DataKeyNames="id" ShowHeader="False">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:TemplateField HeaderText="Call" SortExpression="callcont">
                <EditItemTemplate>
                  <asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Underline="True" 
                        Text="Call"></asp:Label><br />  <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("callcont") %>' 
                        Height="14px" />
                    <br />
                    <br />
                    <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Underline="True" 
                        Text="Pri"></asp:Label>
                    <br />
                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="TextBox16" FilterType ="Numbers">
                    </ajaxToolkit:FilteredTextBoxExtender>
                    <asp:TextBox ID="TextBox16" runat="server" Height="14px" 
                        Text='<%# Bind("priority") %>' Width="30px"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                  <asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Underline="True" 
                        Text="Call"></asp:Label><br /> <asp:CheckBox ID="CheckBox1" runat="server"  />
                    <br />
                    <br />
                    <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Underline="True" 
                        Text="Pri"></asp:Label>
                    <br />
                     <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="TextBox16" FilterType ="Numbers">
                    </ajaxToolkit:FilteredTextBoxExtender>
                    <asp:TextBox ID="TextBox16" runat="server" Height="14px" 
                         Width="30px" Font-Size="Smaller"></asp:TextBox>
                </FooterTemplate>
                <HeaderTemplate>
				<asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Underline="True" 
                        Text="Call"></asp:Label><br /> <asp:CheckBox ID="CheckBox1" runat="server"  />
                    <br />
                    <br />
                    <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Underline="True" 
                        Text="Pri"></asp:Label>
                    <br />
                     <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="TextBox16" FilterType ="Numbers">
                    </ajaxToolkit:FilteredTextBoxExtender>
                    <asp:TextBox ID="TextBox16" runat="server" Height="14px" 
                         Width="30px" Font-Size="Smaller"></asp:TextBox>
					
				</HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Underline="True" 
                        Text="Call"></asp:Label>
                    <br />
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("callcont") %>' 
                        Enabled="false" Font-Size="Smaller" />
                    <br />
                    <br />
                    <asp:Label ID="Label8" runat="server" Font-Underline="True" Text="Pri" 
                        Font-Bold="True"></asp:Label>
                    <br />
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("priority") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="10px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Contacted" SortExpression="caltime">
                <EditItemTemplate>
                   <asp:Label ID="Label18" runat="server" Font-Bold="True" Font-Underline="True" 
                        Text="Contacted"></asp:Label><br /> <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("percontact") %>' 
                        Font-Size="Smaller" Height="14px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Underline="True" 
                        Text="Call Time"></asp:Label>
                    <br />
                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="TextBox18" FilterType="Custom, Numbers" ValidChars="." >
                    </ajaxToolkit:FilteredTextBoxExtender>
                    <asp:TextBox ID="TextBox18" runat="server" Font-Size="Smaller" Height="14px" 
                        Text='<%# Bind("caltime") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Label ID="Label18" runat="server" Font-Bold="True" Font-Underline="True" 
                        Text="Contacted"></asp:Label><br /> <asp:TextBox ID="TextBox5" runat="server" Text='' 
                        Font-Size="Smaller" Height="14px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Underline="True" 
                        Text="Call Time"></asp:Label>
                    <br />
                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="TextBox18" FilterType="Custom, Numbers" ValidChars="." >
                    </ajaxToolkit:FilteredTextBoxExtender>
                    <asp:TextBox ID="TextBox18" runat="server" Font-Size="Smaller" Height="14px" 
                        Text='<%# Bind("caltime") %>'></asp:TextBox>
                </FooterTemplate>
                <HeaderTemplate>
					 <asp:Label ID="Label18" runat="server" Font-Bold="True" Font-Underline="True" 
                        Text="Contacted"></asp:Label><br /> <asp:TextBox ID="TextBox5" runat="server" Text='' 
                        Font-Size="Smaller" Height="14px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Underline="True" 
                        Text="Call Time"></asp:Label>
                    <br />
                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="TextBox18" FilterType="Custom, Numbers" ValidChars="." >
                    </ajaxToolkit:FilteredTextBoxExtender>
                    <asp:TextBox ID="TextBox18" runat="server" Font-Size="Smaller" Height="14px" 
                        Text='<%# Bind("caltime") %>'></asp:TextBox>
				</HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label18" runat="server" Font-Bold="True" Font-Underline="True" 
                        Text="Contacted"></asp:Label>
                    <br />
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("percontact") %>'></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label10" runat="server" Text="Call Time" Font-Bold="True" 
                        Font-Underline="True"></asp:Label>
                    <br /><asp:Label ID="Label5" runat="server" Text='<%# Bind("caltime") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date/Time" SortExpression="datecont">
                <EditItemTemplate>
                        <asp:Label ID="Label19" runat="server" Font-Bold="True" Font-Underline="True" 
                        Text="Date/Time"></asp:Label> <br />
                         <asp:Label ID="Label14" runat="server" Text='<%# Eval("datecont") %>'></asp:Label>
                         <br />
                         <br />
                         <asp:Label ID="Label9" runat="server" Font-Underline="True" Text="CS Person" 
                        Font-Bold="True"></asp:Label>
                    <br />
                    <asp:TextBox ID="TextBox17" runat="server" Height="14px" 
                        Text='<%# Bind("csperson") %>' Width="140px"></asp:TextBox>
                   
                         <br />
                   
                </EditItemTemplate>
                <FooterTemplate>
                         <asp:Label ID="Label16" runat="server" Font-Italic="True" Font-Size="Smaller" 
                             Text="time is automatic"></asp:Label>
                         <br />
                         <br />
                         <asp:Label ID="Label9" runat="server" Font-Underline="True" Text="CS Person" 
                        Font-Bold="True"></asp:Label>
                    <br />
                    <asp:TextBox ID="TextBox17" runat="server" Height="14px" 
                        Text='<%# Bind("csperson") %>' Width="140px" Font-Size="Smaller" onprerender="TextBox17_PreRender" 
                            ></asp:TextBox>
                </FooterTemplate>
                <HeaderTemplate>
					 <asp:Label ID="Label16" runat="server" Font-Italic="True" Font-Size="Smaller" 
                             Text="time is automatic"></asp:Label>
                         <br />
                         <br />
                         <asp:Label ID="Label9" runat="server" Font-Underline="True" Text="CS Person" 
                        Font-Bold="True"></asp:Label>
                    <br />
                    <asp:TextBox ID="TextBox17" runat="server" Height="14px" 
                        Text='<%# Bind("csperson") %>' Width="140px" Font-Size="Smaller" onprerender="TextBox17_PreRender" 
                            ></asp:TextBox>
				</HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label19" runat="server" Font-Bold="True" Font-Underline="True" 
                        Text="Date/Time"></asp:Label>
                    <br />
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("datecont") %>'></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label9" runat="server" Font-Underline="True" Text="CS Person" 
                        Font-Bold="True"></asp:Label>
                    <br />
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("csperson") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="150px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Reason" SortExpression="reason">
                <EditItemTemplate>
                    <asp:Label ID="Label20" runat="server" Text="Reason" Font-Bold="True" 
                        Font-Underline="True"></asp:Label>
                    <br />
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("reason") %>' 
                        Height="39px" TextMode="MultiLine" Width="155px"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                   <asp:Label ID="Label20" runat="server" Text="Reason" Font-Bold="True" 
                        Font-Underline="True"></asp:Label> <br />
                    <asp:TextBox ID="TextBox10" runat="server" Height="39px" TextMode="MultiLine" 
                        Width="155px"></asp:TextBox>
                </FooterTemplate>
                <HeaderTemplate>
					 <asp:Label ID="Label20" runat="server" Text="Reason" Font-Bold="True" 
                        Font-Underline="True"></asp:Label> <br />
                    <asp:TextBox ID="TextBox10" runat="server" Height="39px" TextMode="MultiLine" 
                        Width="155px"></asp:TextBox>
				</HeaderTemplate>
                <ItemTemplate>
                  <asp:Label ID="Label20" runat="server" Text="Reason" Font-Bold="True" 
						Font-Underline="True"></asp:Label>  <br />
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("reason") %>' 
                        Font-Bold="False" Font-Underline="False"></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="150px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Type" SortExpression="typecont">
                <EditItemTemplate>
                    <asp:Label ID="Label21" runat="server" Text="Type" Font-Bold="True" 
                        Font-Underline="True"></asp:Label>
                    <br />
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("typecont") %>' 
                        Font-Size="Smaller" Height="14px" Width="71px"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Label ID="Label21" runat="server" Text="Type" Font-Bold="True" 
                        Font-Underline="True"></asp:Label><br />
                    <asp:TextBox ID="TextBox15" runat="server" Font-Size="Smaller" Height="14px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Button ID="Button2" runat="server" CommandName="insert" 
                        onclick="Button2_Click" Text="Save New Record" Width="100px" 
                        Font-Size="Smaller" />
                    <br />
                    <asp:Button ID="Button3" runat="server" Font-Size="Smaller" 
                        onclick="Button3_Click" Text="Cancel" />
                </FooterTemplate>
                <HeaderTemplate>
					 <asp:Label ID="Label21" runat="server" Text="Type" Font-Bold="True" 
                        Font-Underline="True"></asp:Label><br />
                    <asp:TextBox ID="TextBox15" runat="server" Font-Size="Smaller" Height="14px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Button ID="Button2" runat="server" CommandName="insert" 
                        onclick="Button2_Click" Text="Save New Record" Width="100px" 
                        Font-Size="Smaller" />
                    <br />
                    <asp:Button ID="Button3" runat="server" Font-Size="Smaller" 
                        onclick="Button3_Click" Text="Cancel" />
				</HeaderTemplate>
                <ItemTemplate>
                   <asp:Label ID="Label21" runat="server" Text="Type" Font-Bold="True" 
                        Font-Underline="True"></asp:Label><br /> <asp:Label ID="Label7" runat="server" Text='<%# Bind("typecont") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="custid" HeaderText="custid" Visible="False" />
            <asp:BoundField DataField="id" HeaderText="ID" Visible="False" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>

</div>
<asp:SqlDataSource ID="dscust" runat="server" 
		ConnectionString="<%$ ConnectionStrings:KK5 %>" 
		ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
		
		
        
        
        
        
        SelectCommand="SELECT custid, fname, lname, EmailAddress, password, CompanyName, billingaddr1, billingaddr2, city, state, postalcode, phonenumber, taxid, repofschool, Schname, refby, emailsubscriber, sfname, slname, scompanyname, saddr1, saddr2, scity, sstate, spostalcode, sphonenumber, sfax, residential, business, taxexempt, username, iscs FROM cust WHERE (custid =@custid )">
    <SelectParameters>
        <asp:QueryStringParameter Name="custid" QueryStringField="custid" />
    </SelectParameters>
	</asp:SqlDataSource>
    <asp:SqlDataSource ID="dsPhoneLog" runat="server" 
        ConnectionString="<%$ ConnectionStrings:KK5 %>" 
        ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
        
        
        SelectCommand="SELECT custid, datecont, reason, csperson, typecont, nxtdays, ` nxdate`, callcont, caltime, priority, percontact, id FROM datecont WHERE (custid = @custid) ORDER BY datecont DESC" 
        
        
        UpdateCommand="UPDATE datecont SET reason = @reason, csperson = @csperson, typecont = @typecont, nxtdays = @nxtdays, ` nxdate` = @nxdate, callcont = @callcont, caltime = @caltime, priority = @priority, percontact = @percontact WHERE (id = @id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="custid" QueryStringField="custid" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="GridView1" DefaultValue="" Name="reason" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="GridView1" Name="csperson" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="GridView1" Name="typecont" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="GridView1" Name="nxtdays" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="GridView1" Name="nxdate" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="GridView1" Name="callcont" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="GridView1" Name="caltime" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="GridView1" Name="priority" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="GridView1" Name="percontact" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="GridView1" DefaultValue="custid" Name="custid" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="GridView1" Name="id" 
                PropertyName="SelectedValue" />
        </UpdateParameters>
    </asp:SqlDataSource>
<!-- TemplateEndEditable -->
</div>

<div id="footer">
  <p><a href="../returns.aspx">Shipping Rates and Returns> &nbsp; &#124; &nbsp; <a href="http://www.jostenskinderkraft.com/contact.html"> Contact Us</a> &nbsp; &#124; &nbsp; <a href="http://www.jostenskinderkraft.com/kinderkraft_home.html">Return To Jostens Kinderkraft</a></p>
  <p><font size="-6">©2012 Jostens, Inc • All Rights Reserved</font></p>
</div>
</div>



</form>
</body>
</html>
