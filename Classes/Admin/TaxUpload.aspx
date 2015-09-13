<%@ Register TagPrefix="eo" Namespace="EO.Web" Assembly="EO.Web" %>
<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TaxUpload.aspx.vb" Inherits="TaxUpload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/KK_Storefront_LayoutSubfolder.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<!-- InstanceBeginEditable name="head" -->


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
<title>Administration</title>
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
    <li><a href="../clearance.aspx" >Clearance</a></li>
   	<li><asp:LinkButton ID="LinkButton1" runat="server" Visible="False" 
		PostBackUrl="~/Admin/Admin.aspx">Administration</asp:LinkButton></li>
 </ul>
  
  	<div id="ssl"> <img src="../images/verisign.png" width="75" height="38" alt="SSL Certificate" />
    </div>
</div>

<!-- InstanceBeginEditable name="Content" -->
<div id="content">
    
<script type="text/javascript">

    function Start() {
        //Trigger AJAX callback with "start" parameter
        eo_Callback("<%=CallbackPanel1.ClientID%>", "start");
    }

    function AfterCallbackUpate(callback, extraData) {
        if (extraData == "start") {
            //Now start the progress bar
            var progressBar = eo_GetObject("<%=ProgressBar1.ClientID%>");
            progressBar.startTask();
        }
    }

    function OnProgress(progressBar) {
        var extraData = progressBar.getExtraData();
        
        
        
        
        if (extraData) {
            //The following code demonstrates how to update
            //client side DHTML element based on the value
            //RunTask passed to us with e.UpdateProgress
            if (extraData != "The upload is done!") {
                var div = document.getElementById("divStatus");
                div.innerHTML = extraData;
            }
            if (extraData == "The upload is done!") {
                //Trigger an AJAX callback using the CallbackPanel
                //control. This will trigger the server side
                //CallbackPanel1_Execute event handler. See the 
                //documentation for more details on how to use the 
                //CallbackPanel control. Note we must use setTimeout 
                //here to make sure our code is run after the progress
                //bar has finished updating its internal states
                
                window.setTimeout(
				"eo_Callback('<%=CallbackPanel1.ClientID%>', 'done')",
				10);
            }

            if (extraData == "There was an update error. Please try again!") {
                window.setTimeout(
				"eo_Callback('<%=CallbackPanel1.ClientID%>', 'error')",
				10);
            }


        }
    }

    </script>
    <asp:FileUpload ID="FileUpload1" runat="server" Height="22px" Width="392px" size="50" />
       
        <br />
        <br />
       <a href="javascript:Start()">Upload Tax Rates</a> &nbsp;
    <asp:LinkButton ID="btnStop" runat="server">Stop Upload</asp:LinkButton>
        <br />
     <br />
     <div align="center">
    <eo:ProgressBar runat="server" ID="ProgressBar1" ShowPercentage="True" IndicatorImage="00060104"
        BackgroundImageRight="00060103" ControlSkinID="None" BackgroundImage="00060101"
        IndicatorIncrement="7" BackgroundImageLeft="00060102" Width="650px" StartTaskButton=""
        StopTaskButton="btnStop" ClientSideOnValueChanged="OnProgress" 
        OnRunTask="ProgressBar1_RunTask" Height="16px" Maximum="41812">
    </eo:ProgressBar>
    </div>
    <br>
    
    <div id="divStatus">
    </div>
    <eo:CallbackPanel runat="server" ID="CallbackPanel1" ClientSideAfterUpdate="AfterCallbackUpate"
        OnExecute="CallbackPanel1_Execute" BackColor="White" Width="316px">
        <asp:Label ID="lblmsg" runat="server" ForeColor="Black" Font-Bold="True" 
            Font-Italic="True"></asp:Label>
    </eo:CallbackPanel>
    
<asp:SqlDataSource ID="dstaxrate" runat="server" 
			ConnectionString="<%$ ConnectionStrings:KK5 %>" 
			ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>" 
			UpdateCommand="UPDATE taxrate SET totsalestx = @totsalestx WHERE (zipcode = @zipcode)">
		</asp:SqlDataSource>
    </div>


<!-- InstanceEndEditable -->

<div id="footer">
  		<p><a href="../returns.aspx">Shipping Rates and Returns</a> &nbsp; &#124; &nbsp;  <asp:LinkButton ID="ordstatus" runat="server"  OnClick="ordstatus_Click">Order History</asp:LinkButton> &nbsp; &#124; &nbsp; 
          <a href="../ChangePassword.aspx">Change Password/User Name</a> &nbsp;  &#124; &nbsp;
          <a href="http://www.jostenskinderkraft.com/contact.html"> Contact Us</a> &nbsp; &#124; &nbsp; 
          <a href="http://www.jostenskinderkraft.com/kinderkraft_home.html">Home</a></p>
  		<p><font size="-6">©2013 Jostens, Inc • All Rights Reserved</font></p>
</div>
</div>
</form>
</body>
<!-- InstanceEnd --></html>