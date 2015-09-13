<%@ Page Title="" Language="VB"  AutoEventWireup="false" CodeFile="diplomacart.aspx.vb" Inherits="diplomacart" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_LayoutSubfolder.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>Diploma/Certificate</title>

<script type="text/javascript" src="../cssverticalmenu.js">
</script>
<script language="javascript">
function changevalue(obj) 
	{
        Select_Value_Set("ddlclr", "form1", obj.id);
    }
    

    /* This script and many more are available free online at
    The JavaScript Source :: http://javascript.internet.com
    Created by: Francis Cocharrua :: http://scripts.franciscocharrua.com/ */

function Select_Value_Set(SelectName, FormName, Value) 
	{
        eval('SelectObject = document.' + FormName + '.' + SelectName + ';');
        for (index = 0; index < SelectObject.length; index++) 
		{
            if (SelectObject[index].value == Value)
                SelectObject.selectedIndex = index;
        }
    }
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
function MM_showHideLayers() { //v9.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) 
  with (document) if (getElementById && ((obj=getElementById(args[i]))!=null)) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
</script>

<link href="../css/diplomapopouts.css" rel="stylesheet" type="text/css" />
<!-- InstanceEndEditable -->

<link href="../css/cssverticalmenu.css" rel="stylesheet" type="text/css" />
<link href="../css/package.css" rel="stylesheet" type="text/css" />
<link href="../css/package_cartpgs.css" rel="stylesheet" type="text/css" />
<link href="../css/master.css" rel="stylesheet" type="text/css" />
<link href="../css/productboxes.css" rel="stylesheet" type="text/css" />
</head> 

<body onload="MM_preloadImages('../images/diplomasandcertificates/diplomas/BrightBeginnings_Kinder_Swap.jpg','../images/diplomasandcertificates/diplomas/BrightBeginnings_PreK_Swap.jpg','../images/diplomasandcertificates/diplomas/Chalkboard_Elem_Swap.jpg','../images/diplomasandcertificates/diplomas/Chalkboard_Kinder_Swap.jpg','../images/diplomasandcertificates/diplomas/Chalkboard_PreK_Swap.jpg','../images/diplomasandcertificates/diplomas/dog.jpg','../images/diplomasandcertificates/diplomas/cog.jpg','../images/diplomasandcertificates/diplomas/LearningBlocks_Elem_Swap.jpg','../images/diplomasandcertificates/diplomas/LearningBlocks_Kinder_Swap.jpg','../images/diplomasandcertificates/diplomas/LearningBlocks_PreK_Swap.jpg','../images/diplomasandcertificates/diplomas/SmartStarts_Elem_Swap.jpg','../images/diplomasandcertificates/diplomas/SmartStarts_Kinder_Swap.jpg','../images/diplomasandcertificates/diplomas/SmartStarts_PreK_Swap.jpg','../images/diplomasandcertificates/diplomas/SmartStarts_General_Swap.jpg')">

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
    <li><a href="banners.aspx" ><span style="color:#DF0003; font-weight:500">NEW! </span> Graduation Banners</a></li>
    <!--<li><a href="../clearance.aspx" >Clearance</a></li> -->
   	<li><asp:LinkButton ID="LinkButton1" runat="server" Visible="False" 
		PostBackUrl="~/Admin/Admin.aspx">Administration</asp:LinkButton></li>
 </ul>
  
  	<div id="ssl"> <img src="../images/verisign.png" width="75" height="38" alt="SSL Certificate" />
    </div>
</div>

<!-- InstanceBeginEditable name="Content" -->

<div id="content">

<table style="width: 660px; height: 405px" cellpadding="0" cellspacing="0">
	<tr>
		<td class="style13" valign="top">
		<a href="../shopjostenshome.aspx">Home</a> &gt;<a href="../diplomasandcertificates.aspx"> Diplomas and Certificates</a><br />
			<strong><span class="style15">Diploma/Certificate<br /><br /></span></strong>
        </td>
		<td></td>
	</tr>
	
    <tr>
		<td rowspan="2" valign="top" class="style25">
			<img src="../images/diplomasandcertificates/dipmain.jpg" name="theImg5" 
                id="theImg5" onmouseover="MM_swapImgRestore()" /></td>
		<td height="77">
			<div id="packprice" style="height:auto"> 
			<strong>Our Price: <span class="red">$</span> <asp:Label ID="KDIP" runat="server" ForeColor="#D74141" Text="KDIP"></asp:Label><br /><br /></strong>Printed on high-quality paper. 11&quot; x 8 ½&quot;</div></td>
	
    <tr>
	   	<td height="202" valign="top" style="height:auto"> 
        	<div id="select_options">
				<h3>Choose your options...</h3>
		
        		<table width="400">
					<tr>
					  <td colspan="2">
					  		<script>

					  		    var img3 = [
                                    , "../images/diplomasandcertificates/diplomas/BrightBeginnings_Kinder_Swap.jpg",
                                      "../images/diplomasandcertificates/diplomas/BrightBeginnings_PreK_Swap.jpg",
                                      "../images/diplomasandcertificates/diplomas/Chalkboard_Elem_Swap.jpg",
                                      "../images/diplomasandcertificates/diplomas/Chalkboard_Kinder_Swap.jpg",
                                      "../images/diplomasandcertificates/diplomas/Chalkboard_PreK_Swap.jpg",
                                       "../images/diplomasandcertificates/diplomas/dog.jpg",
                                       "../images/diplomasandcertificates/diplomas/cog.jpg",
                                       "../images/diplomasandcertificates/diplomas/LearningBlocks_Elem_Swap.jpg",
                                       "../images/diplomasandcertificates/diplomas/LearningBlocks_Kinder_Swap.jpg",
                                       "../images/diplomasandcertificates/diplomas/LearningBlocks_PreK_Swap.jpg",
                                       "../images/diplomasandcertificates/diplomas/SmartStarts_Elem_Swap.jpg",
                                      "../images/diplomasandcertificates/diplomas/SmartStarts_General_Swap.jpg",
                                      "../images/diplomasandcertificates/diplomas/SmartStarts_Kinder_Swap.jpg",
                                     "../images/diplomasandcertificates/diplomas/SmartStarts_PreK_Swap.jpg"];
							</script>
                                 
       <a href="#" onclick="MM_swapImage('theImg5','','../images/diplomasandcertificates/diplomas/BrightBeginnings_Kinder_Swap.jpg',1)" >
      <img src="../images/diplomasandcertificates/diplomas/diplomas_NEW/noahs_arc_kindergarten.jpg" width="37" height="27" alt="noahs_arc_kindergarten.jpg" id="202" onclick="changevalue(this);" /></a>
      
      <a href="#" onclick="MM_swapImage('theImg5','','../images/diplomasandcertificates/diplomas/BrightBeginnings_PreK_Swap.jpg',1)">
      <img src="../images/diplomasandcertificates/diplomas/diplomas_NEW/noahs_arc_preschool.jpg" width="37" height="27" alt="noahs_arc_preschool.jpg" id="201" onclick="changevalue(this);"/></a>                         
                                  
      <a href="#" onclick="MM_swapImage('theImg5','','../images/diplomasandcertificates/diplomas/Chalkboard_Elem_Swap.jpg',1)" >
        <img src="../images/diplomasandcertificates/diplomas/diplomas_NEW/chalkboard_elementary.jpg" alt="chalkboard_elem.jpg" width="37" height="27" id="200" onclick="changevalue(this);" /></a>
      
      <a href="#" onclick="MM_swapImage('theImg5','','../images/diplomasandcertificates/diplomas/Chalkboard_Kinder_Swap.jpg',1)">
        <img src="../images/diplomasandcertificates/diplomas/diplomas_NEW/chalkboard_kindergarten.jpg" alt="chalkboard_kindergarten" width="37" height="27" id="199" onclick="changevalue(this);" /></a>
      
      <a href="#" onclick="MM_swapImage('theImg5','','../images/diplomasandcertificates/diplomas/Chalkboard_PreK_Swap.jpg',1)">
        <img src="../images/diplomasandcertificates/diplomas/diplomas_NEW/chalkboard_preschool.jpg" width="37" height="27" alt="chalkboard_preschool"  id="198" onclick="changevalue(this);"/></a>
       
        <a href="#" onclick="MM_swapImage('theImg5','','../images/diplomasandcertificates/diplomas/dog.jpg',1)">
      <img src="../images/diplomasandcertificates/diplomas/diplomas_NEW/learn_grow_elementary.jpg" width="37" height="27" alt="learn_grow_elementary.jpg" id="205" onclick="changevalue(this);" /></a>
      
      <a href="#" onclick="MM_swapImage('theImg5','','../images/diplomasandcertificates/diplomas/cog.jpg',1)">
      <img src="../images/diplomasandcertificates/diplomas/diplomas_NEW/learn_grow_general.jpg" width="37" height="27" alt="learn_grow_general.jpg"id="206" onclick="changevalue(this);" /></a>
       <br />
      <a href="#" onclick="MM_swapImage('theImg5','','../images/diplomasandcertificates/diplomas/LearningBlocks_Elem_Swap.jpg',1)">
        <img src="../images/diplomasandcertificates/diplomas/diplomas_NEW/learning_blocks_elem.jpg" width="37" height="27" alt="learning_blocks_elem.jpg" id="204" onclick="changevalue(this);" /></a>
      
      <a href="#" onclick="MM_swapImage('theImg5','','../images/diplomasandcertificates/diplomas/LearningBlocks_Kinder_Swap.jpg',1)">
        <img src="../images/diplomasandcertificates/diplomas/diplomas_NEW/learning_blocks_kindergarten.jpg" width="37" height="27" alt="learning_blocks_kindergarten.jpg" id="203" onclick="changevalue(this);" /></a>
        
        <a href="#" onclick="MM_swapImage('theImg5','','../images/diplomasandcertificates/diplomas/LearningBlocks_PreK_Swap.jpg',1)">
        <img src="../images/diplomasandcertificates/diplomas/diplomas_NEW/learning_blocks_prek.jpg" 
                                width="37" height="27" alt="learning_blocks_prek.jpg" id="256" 
                                onclick="changevalue(this);" /></a>
            
      <a href="#" onclick="MM_swapImage('theImg5','','../images/diplomasandcertificates/diplomas/SmartStarts_Elem_Swap.jpg',1)">
      <img src="../images/diplomasandcertificates/diplomas/diplomas_NEW/SmartStarts_Elem.jpg" width="37" height="29" alt="SmartStarts_Elem" id="101" onclick="changevalue(this);"/></a>
      
      <a href="#" onclick="MM_swapImage('theImg5','','../images/diplomasandcertificates/diplomas/SmartStarts_Kinder_Swap.jpg',1)">
      <img src="../images/diplomasandcertificates/diplomas/diplomas_NEW/SmartStarts_Kinder.jpg" width="37" height="29" alt="SmartStarts_Kinder" id="102" onclick="changevalue(this);"/></a>
      
      <a href="#" onclick="MM_swapImage('theImg5','','../images/diplomasandcertificates/diplomas/SmartStarts_PreK_Swap.jpg',1)">
      <img src="../images/diplomasandcertificates/diplomas/diplomas_NEW/SmartStarts_PreK.jpg" width="37" height="29" alt="SmartStarts_PreK" id="103" onclick="changevalue(this);"/></a>
      
       <a href="#" onclick="MM_swapImage('theImg5','','../images/diplomasandcertificates/diplomas/SmartStarts_General_Swap.jpg',1)">
       <img src="../images/diplomasandcertificates/diplomas/diplomas_NEW/SmartStarts_General.jpg" width="37" height="29" alt="SmartStarts_General" id="104" onclick="changevalue(this);"/></a></td>
				         		
					</tr>
					
                    <tr>
						<td width="122">Diploma/Certificate*:
                        </td>
						<td width="256"><asp:DropDownList  runat="server" Height="27px" Width="187px" onchange="change55(this);" ID="ddlclr" DataSourceID="dscolor" DataTextField="optiondesc" DataValueField="id"></asp:DropDownList>
						<script>
						    function change55(x) {
						        var i = document.getElementById("theImg5");
						        i.src = img3[x.selectedIndex];
						    }
 							 		</script>
                        </td>
					</tr>
					
                    <tr>
						<td width="122" class="style35" colspan="2">
                            <asp:CheckBox ID="chkPersonalized" runat="server" 
                                Text="Personalize for an extra .50&cent; each (min. of 25)" Width="330px" 
                                AutoPostBack="True" />
                            <br />
                            <asp:RangeValidator ID="rvpersonalized" runat="server" 
                                ControlToValidate="txtqty" Display="Dynamic" ErrorMessage="RangeValidator" 
                                MaximumValue="30000" MinimumValue="25" Type="Integer" Enabled="False">Minimum of 25</asp:RangeValidator>
                           
                        </td>
					</tr>
					
                    <tr>
						<td colspan="2" valign="middle">Qty: <asp:TextBox ID="txtqty" runat="server" Width="36px">1</asp:TextBox>&nbsp;&nbsp;&nbsp; <asp:Button ID="Button1" runat="server" Text="Add to Cart "/>
                        <em><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter quantity" ControlToValidate="txtqty" ForeColor="Red"></asp:RequiredFieldValidator></em> 
						</td>
					</tr>
				</table>
				
	<div class="req_field_val"><asp:CustomValidator ID="CustomValidator2" runat="server" 
                    ErrorMessage="CustomValidator" ForeColor="Red"></asp:CustomValidator>
                <asp:RegularExpressionValidator ID="numval" runat="server" 
                    ControlToValidate="txtqty" ErrorMessage="Enter a numeric value" ForeColor="Red" 
                    ValidationExpression="^\d+$"></asp:RegularExpressionValidator></div>
</div>


<asp:SqlDataSource ID="dscolor" runat="server" 
				ConnectionString="<%$ ConnectionStrings:KK5 %>" 
				ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
                
                SelectCommand="SELECT id, optiondesc FROM options WHERE (optioncatid = 39) ORDER BY optiondesc">
</asp:SqlDataSource>
          
</table>
   	
    	<table width="700" border="0" cellspacing="1" cellpadding="2">
  			<tr>
    			<td height="100">
    	<div id="feature1"></div>
    	<div id="feature2"></div>
        <div id="feature3"></div>
        <div id="feature4"></div>
        <div id="feature5"></div>
        <div id="feature6"></div>
        <div id="feature7"></div>
        <div id="feature8"></div>
        <div id="feature9"></div>
        <div id="feature10"></div>
        <div id="feature11"></div>
        <div id="feature12"></div>
        <div id="feature13"></div>
        <div id="feature14"></div>
        		</td>
  		</tr>
  		
        <tr>
    			<td>
     <div class="diploma_lg"><p>Mouse over diploma to see larger image.</p> 
     <img src="../images/diplomasandcertificates/diplomas/LearningBlocks_Elem_Swap.jpg" name="bright1" width="92" height="72" id="bright1" onmouseover="MM_showHideLayers('feature1','','show')" onmouseout="MM_showHideLayers('feature1','','hide')" />      
    <img src="../images/diplomasandcertificates/diplomas/LearningBlocks_Kinder_Swap.jpg" name="bright2" width="92" height="72" id="bright2" onmouseover="MM_showHideLayers('feature2','','show')" onmouseout="MM_showHideLayers('feature2','','hide')" />      
    <img src="../images/diplomasandcertificates/diplomas/LearningBlocks_PreK_Swap.jpg" name="bright3" width="92" height="71" id="bright3" onmouseover="MM_showHideLayers('feature3','','show')" onmouseout="MM_showHideLayers('feature3','','hide')" />      
    <img src="../images/diplomasandcertificates/diplomas/BrightBeginnings_Kinder_Swap.jpg" name="flower1" width="92" height="74" id="flower1" onmouseover="MM_showHideLayers('feature4','','show')" onmouseout="MM_showHideLayers('feature4','','hide')" />      
    <img src="../images/diplomasandcertificates/diplomas/BrightBeginnings_PreK_Swap.jpg" name="flower2" width="92" height="74" id="flower2" onmouseover="MM_showHideLayers('feature5','','show')" onmouseout="MM_showHideLayers('feature5','','hide')" />      
    <img src="../images/diplomasandcertificates/diplomas/cog.jpg" name="learn1" width="92" height="70" id="learn1" onmouseover="MM_showHideLayers('feature6','','show')" onmouseout="MM_showHideLayers('feature6','','hide')" />      
    <img src="../images/diplomasandcertificates/diplomas/dog.jpg" name="learn2" width="92" height="70" id="learn2" onmouseover="MM_showHideLayers('feature7','','show')" onmouseout="MM_showHideLayers('feature7','','hide')" />      
    <img src="../images/diplomasandcertificates/diplomas/SmartStarts_Elem_Swap.jpg" name="noah1" width="92" height="72" id="noah1" onmouseover="MM_showHideLayers('feature8','','show')" onmouseout="MM_showHideLayers('feature8','','hide')" />      
    <img src="../images/diplomasandcertificates/diplomas/SmartStarts_Kinder_Swap.jpg" name="noah2" width="92" height="72" id="noah2" onmouseover="MM_showHideLayers('feature9','','show')" onmouseout="MM_showHideLayers('feature9','','hide')" />
    <img src="../images/diplomasandcertificates/diplomas/SmartStarts_PreK_Swap.jpg" name="noah2" width="92" height="72" id="noah2" onmouseover="MM_showHideLayers('feature10','','show')" onmouseout="MM_showHideLayers('feature10','','hide')" />
    <img src="../images/diplomasandcertificates/diplomas/SmartStarts_General_Swap.jpg" name="noah2" width="92" height="72" id="noah2" onmouseover="MM_showHideLayers('feature11','','show')" onmouseout="MM_showHideLayers('feature11','','hide')" />
     <img src="../images/diplomasandcertificates/diplomas/Chalkboard_Elem_Swap.jpg" name="noah2" width="92" height="72" id="noah2" onmouseover="MM_showHideLayers('feature12','','show')" onmouseout="MM_showHideLayers('feature12','','hide')" />
    <img src="../images/diplomasandcertificates/diplomas/Chalkboard_Kinder_Swap.jpg" name="noah2" width="92" height="72" id="noah2" onmouseover="MM_showHideLayers('feature13','','show')" onmouseout="MM_showHideLayers('feature13','','hide')" />
    <img src="../images/diplomasandcertificates/diplomas/Chalkboard_PreK_Swap.jpg" name="noah2" width="92" height="72" id="noah2" onmouseover="MM_showHideLayers('feature14','','show')" onmouseout="MM_showHideLayers('feature14','','hide')" /></div>
			</td>
  		</tr>
</table>

</div>

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
