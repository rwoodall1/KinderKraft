<%@ Page Language="VB" AutoEventWireup="false" CodeFile="banners.aspx.vb" Inherits="cartpages_banners" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- InstanceBegin template="/Templates/KK_Storefront_LayoutSubfolder.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
    <!-- InstanceBeginEditable name="head" -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <title>Graduate Banners</title>

    <script type="text/javascript" src="../cssverticalmenu.js">
    </script>
    <script type="text/javascript">

        function changevalue(obj) {
            Select_Value_Set("ddlclr", "form1", obj.id);
        }

        /* This script and many more are available free online at
        The JavaScript Source :: http://javascript.internet.com
        Created by: Francis Cocharrua :: http://scripts.franciscocharrua.com/ */

        function Select_Value_Set(SelectName, FormName, Value) {

            eval('SelectObject = document.' + FormName + '.' + SelectName + ';');


            for (index = 0; index < SelectObject.length; index++) {
                if (SelectObject[index].value == Value)
                    SelectObject.selectedIndex = index;
            }
        }

    </script>
    <script type="text/javascript">
        function MM_swapImgRestore() { //v3.0
            var i, x, a = document.MM_sr; for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
        }
        function MM_preloadImages() { //v3.0
            var d = document; if (d.images) {
                if (!d.MM_p) d.MM_p = new Array();
                var i, j = d.MM_p.length, a = MM_preloadImages.arguments; for (i = 0; i < a.length; i++)
                    if (a[i].indexOf("#") != 0) { d.MM_p[j] = new Image; d.MM_p[j++].src = a[i]; }
            }
        }

        function MM_findObj(n, d) { //v4.01
            var p, i, x; if (!d) d = document; if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
                d = parent.frames[n.substring(p + 1)].document; n = n.substring(0, p);
            }
            if (!(x = d[n]) && d.all) x = d.all[n]; for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
            for (i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n, d.layers[i].document);
            if (!x && d.getElementById) x = d.getElementById(n); return x;
        }

        function MM_swapImage() { //v3.0
            var i, j = 0, x, a = MM_swapImage.arguments; document.MM_sr = new Array; for (i = 0; i < (a.length - 2) ; i += 3)
                if ((x = MM_findObj(a[i])) != null) { document.MM_sr[j++] = x; if (!x.oSrc) x.oSrc = x.src; x.src = a[i + 2]; }
        }
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
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div id="pagewrapper">
            <div id="header">
                <div id="headleft">
                    <br />
                    <a href="../shopjostenshome.aspx">
                        <img alt="" height="101" src="../images/jostenslogo.PNG" border="0" width="270" /></a>
                </div>
                <div id="headright" style="width: 689px">
                    <br />
                    <a href="../shopjostenshome.aspx">
                        <img src="../images/Kinderkraft_2.jpg" width="160" height="34" alt="" /></a>
                    <p>
                        <asp:LinkButton ID="lklogin" runat="server" OnClick="lklogin_Click">Log In </asp:LinkButton>
                        | <a href="../scart.aspx">View Cart</a>
                    </p>
                    <br />
                    <br />
                    <div class="welcome">
                        <asp:Label ID="Label1" runat="server" Text="Welcome, GUEST" Visible="False"></asp:Label>
                    </div>
                    <div align="left">
                        <asp:Label ID="lblcurrentcustomer" runat="server" Text="Current Customer is:" Font-Italic="True" Font-Size="Larger" Visible="False"></asp:Label>
                    </div>
                </div>
            </div>

            <div id="menu">
                <div id="browse">
                    Browse Products 
                </div>

                <ul id="verticalmenu" class="glossymenu">
                    <li><a href="../packages.aspx">Packages</a></li>
                    <li><a href="../capsandgowns.aspx">Caps and Gowns</a></li>
                    <li><a href="../tasselsandsashes.aspx">Tassels and Sashes</a></li>
                    <li><a href="../diplomasandcertificates.aspx">Diplomas and Certificates</a></li>
                    <li><a href="../accessories.aspx">Accessories</a></li>
                    <li><a href="banners.aspx"><span style="color: #DF0003; font-weight: 500">NEW! </span>Graduation Banners</a></li>
                    <!--<li><a href="../clearance.aspx" >Clearance</a></li> -->
                    <li>
                        <asp:LinkButton ID="LinkButton1" runat="server" Visible="False"
                            PostBackUrl="~/Admin/Admin.aspx">Administration</asp:LinkButton></li>
                </ul>

                <div id="ssl">
                    <img src="../images/verisign.png" width="75" height="38" alt="SSL Certificate" />
                </div>
                <asp:SqlDataSource ID="dscolor" runat="server"
                    ConnectionString="<%$ ConnectionStrings:KK5 %>"
                    ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>"
                    SelectCommand="SELECT id, optiondesc, selectorder FROM options WHERE (optioncatid = 50) ORDER BY selectorder, optiondesc"></asp:SqlDataSource>
                <asp:SqlDataSource ID="dsOrientation" runat="server"
                    ConnectionString="<%$ ConnectionStrings:KK5 %>"
                    ProviderName="<%$ ConnectionStrings:KK5.ProviderName %>"
                    SelectCommand="SELECT id, optiondesc, selectorder FROM options WHERE (optioncatid = 51) ORDER BY selectorder, optiondesc"></asp:SqlDataSource>
            </div>

            <!-- InstanceBeginEditable name="Content" -->

            <div id="content">
                <table cellpadding="0" cellspacing="0" style="width: 660px; height: auto">
                    <tr>
                        <td class="style13" valign="top">
                            <a href="../shopjostenshome.aspx">Home</a> &gt; <a href="../capsandgowns.aspx">Accesories</a><br />
                            <strong><span class="style15">Banner<br />

                                <br />
                            </span></strong>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td rowspan="2" valign="top">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:Image runat="server" name="defaultBanner" ID="defaultBanner" ImageUrl="~/images/banners/KK_Stud_Banner_Gold.jpg" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td height="79" valign="top">
                            <div id="packprice" style="height: auto">
                                <strong>Our Price:<font> <span class="red">$</span><asp:Label ID="KBANNER" runat="server" ForeColor="#D74141" Text="KBANNER"></asp:Label>
                                    <br />
                                    <br />
                                </font></strong>Congratulations is in order for your little graduate, so shout it out with a custom banner. Complete the information below and submit a high resolution picture of your graduate to create your own custom banner.
                  <p>Available in your choice of 7 color options.*</p>
                                <ul>
                                    <li>Measures 18" by 36"</li>
                                    <li>Durable indoor/outdoor material</li>
                                    <li>Features grommets on all four corners for easy hanging</li>
                                </ul>
                                <p class="pkg_order_instr">*The color you see on your monitor is an approximation of print color. Images submitted less than 300 dpi and 2800 x 2400 pixels in size may reproduce poorly. </p>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td height="202" valign="top" style="height: auto">
                            <div id="select_options">
                                <h3>All fields are required...</h3>
                                <p style="margin-left: 10px" class="field_label">
                                    <label>First Name: </label>
                                    <asp:TextBox ID="txtfname" runat="server" Style="margin-bottom: 0px" Width="248px"></asp:TextBox>
                                    <br />
                                    <em>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First Name Required" ControlToValidate="txtfname" ForeColor="Red" Display="Dynamic" ValidationGroup="v1"></asp:RequiredFieldValidator></em>
                                </p>
                                <p style="margin-left: 10px" class="field_label">
                                    <label>Last Name: </label>
                                    <asp:TextBox ID="txtlname" runat="server" Width="248px"></asp:TextBox>
                                    <br />
                                    <em>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Last Name Required" ControlToValidate="txtlname" ForeColor="Red" Display="Dynamic" ValidationGroup="v1"></asp:RequiredFieldValidator>

                                    </em>
                                </p>
                                <p style="margin-left: 10px" class="field_label">
                                    Please Select Orientation:&nbsp;
                        <asp:DropDownList ID="ddlOrientation" runat="server" Height="22px" Width="147px" onchange="change(this);" DataSourceID="dsOrientation" DataTextField="optiondesc" DataValueField="id" AutoPostBack="True">
                        </asp:DropDownList><br />
                                </p>
                                <p style="margin-left: 10px" class="field_label">
                                    Please Select Color:&nbsp;
                        <asp:DropDownList ID="ddlclr" runat="server" Height="22px" Width="147px" DataSourceID="dscolor" DataTextField="optiondesc" DataValueField="id" AutoPostBack="True">
                        </asp:DropDownList><br />
                                    <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="CustomValidator" ForeColor="Red" ValidationGroup="v1" Display="Dynamic"></asp:CustomValidator>
                                </p>

                                <script type="text/javascript">
                                    function change(x) {
                                        var i = document.getElementById("defaultBanner");
                                        i.src = img3[x.selectedIndex];
                                    }

                                </script>
                                <script type="text/javascript">
                                    var img3 =
                                        ["../images/banners/KK_Stud_Banner_Gold.jpg", "../images/banners/KK_Stud_Banner_Blue.jpg", "../images/banners/KK_Stud_Banner_Green.jpg", "../images/banners/KK_Stud_Banner_Orange.jpg", "../images/banners/KK_Stud_Banner_Pink.jpg", "../images/banners/KK_Stud_Banner_Purple.jpg", "../images/banners/KK_Stud_Banner_Red.jpg", "../images/banners/KK_Stud_Banner_Gold.jpg"];
                                </script>

                                <div style="margin-left: 10px">


                                    <asp:ImageButton ID="btnblue" runat="server" ImageUrl="~/images/banners/blue.jpg" Height="40px" Width="40px" />
                                    <asp:ImageButton ID="btngreen" runat="server" ImageUrl="~/images/banners/green.jpg" Height="40px" Width="40px" />
                                    <asp:ImageButton ID="btnorange" runat="server" ImageUrl="~/images/banners/orange.jpg" Height="40px" Width="40px" />
                                    <asp:ImageButton ID="btnpink" runat="server" ImageUrl="~/images/banners/pink.jpg" Height="40px" Width="40px" />
                                    <asp:ImageButton ID="btnpurple" runat="server" ImageUrl="~/images/banners/purple.jpg" Height="40px" Width="40px" />
                                    <asp:ImageButton ID="btnred" runat="server" ImageUrl="~/images/banners/red.jpg" Height="40px" Width="40px" />
                                    <asp:ImageButton ID="btngold" runat="server" ImageUrl="~/images/banners/yellow.jpg" Height="40px" Width="40px" />




                                </div>
                                <p style="margin-left: 10px" class="field_label">
                                    <label>
                                        Upload Your Image: 
                           <asp:FileUpload ID="fuImgfile" runat="server" accept=".png,.jpg,.jpeg,.tiff" Width="367px" Height="26px" />
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Image Required" ControlToValidate="fuImgfile" ForeColor="Red" Display="Dynamic" ValidationGroup="v1"></asp:RequiredFieldValidator><asp:CustomValidator ID="valupload" runat="server" ErrorMessage="Only .png, .jpeg, .jpg or .tiff files are allowed." ControlToValidate="fuImgfile" Display="Dynamic" ValidationGroup="v1"></asp:CustomValidator>
                                    </label>
                                    &nbsp;<table width="400">
                                        <tr>
                                            <td colspan="2">Qty:
                                                <asp:TextBox ID="txtqty" runat="server" Width="36px">1</asp:TextBox>
                                                &nbsp;&nbsp;&nbsp; 
                                    <asp:Button ID="btnadd" runat="server" Text="Add to Cart" ValidationGroup="v1" />
                                                <em>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter quantity" ControlToValidate="txtqty" ForeColor="Red" ValidationGroup="v1"></asp:RequiredFieldValidator></em>
                                            </td>
                                        </tr>
                                    </table>

                                    <div class="req_field_val">

                                        <asp:RegularExpressionValidator ID="numval" runat="server" ControlToValidate="txtqty" ErrorMessage="Enter a numeric value" ForeColor="Red" ValidationExpression="^\d+$" ValidationGroup="v1"></asp:RegularExpressionValidator>
                                    </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <!-- InstanceEndEditable -->

            <div id="footer">
                <p>
                    <a href="../returns.aspx">Shipping Rates and Returns</a> &nbsp; &#124; &nbsp; 
                    <asp:LinkButton ID="ordstatus" runat="server" OnClick="ordstatus_Click">Order History</asp:LinkButton>
                    &nbsp; &#124; &nbsp; 
          <a href="../ChangePassword.aspx">Change Password/User Name</a> &nbsp;  &#124; &nbsp;
          <a href="http://www.jostenskinderkraft.com/contact.html">Contact Us</a> &nbsp; &#124; &nbsp; 
          <a href="http://www.jostenskinderkraft.com/kinderkraft_home.html">Home</a>
                </p>
                <p><font size="-6">©2015 Jostens, Inc • All Rights Reserved</font></p>
            </div>
        </div>
    </form>
</body>
<!-- InstanceEnd -->
</html>
