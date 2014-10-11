<%@ page language="C#" autoeventwireup="true" inherits="sales, App_Web_csijsg3o" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ZERODOTONE</title>
    <link rel="stylesheet" href="Css/animate.css" type="text/css"/>
    <style>
@media screen {
	body{
		width:99%; font-family:Arial, Helvetica, sans-serif;
	}
    p {
        font-family: verdana,sans-serif;
        font-size: 14px;
    }
	.maintop{
		display:inline-block; box-shadow: 0px 0px 1px 0px #000; margin-left:100px; background-color:#FFF;  width:90%; height:auto;
	}
	.mainbordercontent{
		display:block; height:10px; width:100%; overflow:hidden; background:#000;
	}
	.mainlayereone{
		display:inline-block; height:10px; width:20%; overflow:hidden; background:#008c81; float:left;
	}
	.mainlayertwo{
		display:inline-block; height:10px; width:20%; overflow:hidden; background:#014037; float:left;
	}
	.tbltop{
		width:30%; overflow:hidden; float:left; display:inline; height:400px; background:#014037 ;
	}
	.mainleft
	{
		display:inline-block; float:left; position:fixed; height:auto;
	}
	.form{
		width:100%;  box-shadow: 0px 2px 5px 0px #000; height:200px; overflow:hidden;  margin:10px 0px 0px 0px; background:#00F;
	}
	.totalborder
	{
		width:99.8%; overflow:hidden; border:thin solid #008c81;  margin:0px 0px 0px 0px;
	}
	.topfixed
	{
		background:#000; box-shadow: 0px 0px 15px 0px #000; position:fixed; width:100%; margin:-10px 0px 0px -8px; height:30px;
	}
	.payform
	{
		width:30%; padding:10px 10px 10px 10px;  float:left; display:inline-block;
	}
	.cusform
	{
		width:30%;  margin:0px auto 0px auto; padding:10px 10px 10px 10px; background:#FFF;  display:inline-block;
	}
	.staffform
	{
		width:30% ; padding:10px 10px 10px 10px; background:#FFF; float:left; display:inline-block;
	}
	.priceblock
	{
		width:30%; overflow:hidden; padding:10px 0px 10px 0px;  display:inline-block; float:right; background-color:#014037;
	}
}

@media print {
    p {
        font-size: 20px;
        color: red;
    }
	.maintop{
		display:inline-block; box-shadow: 0px 0px 0px 0px #000; margin-left:0px; background-color:#FFF;  width:100%; height:auto;
	}
	.mainbordercontent{
		display:block; height:10px; width:100%; overflow:hidden;
	}
	.mainlayereone{
		display:inline-block; height:10px; width:20%; overflow:hidden; background:#008c81; float:left;
	}
	.mainlayertwo{
		display:inline-block; height:10px; width:20%; overflow:hidden; background:#014037; float:left;
	}
	.tbltop{
		width:30%; overflow:hidden; float:left; display:inline; height:200px; background:#014037 ;
	}
	.mainleft
	{
		display:none; float:left; position:fixed;    width:200px; height:auto;
	}
	.form{
		width:100%;  box-shadow: 0px 0px 0px 0px #000; height:200px; overflow:hidden;  margin:10px 0px 0px 0px; background:#00F;
	}
	.totalborder
	{
		width:99.8%; overflow:hidden;  margin:0px 0px 0px 0px;
	}
	.topfixed
	{
		display:none;
	}
	.payform
	{
		width:100%; margin:20px 0px 0px 0px; padding:10px 10px 10px 10px; display:block;
	}
	.cusform
	{
		width:100%;  margin:50px auto 0px auto; padding:10px 10px 10px 10px; background:#FFF;  display:block;
	}
	.staffform
	{
		width:100% ;  margin:5px auto 0px auto; padding:10px 10px 10px 10px; background:#FFF; float:left; display:block;
	}
	.priceblock
	{
		width:30%; overflow:hidden; padding:10px 0px 11px 0px;  display:inline-block; float:right; background-color:#014037;
	}
}
</style>


<script src="Script/jquery1.10.2.js"></script>
<script>
    $(document).ready(function () {
        $("#voice").hide();
        $("#ales").hide();
        $("#recepspan").hide();
        $("#upinvoice").hide();
        var tdate = new Date();
        var dd = tdate.getDate();
        var MM = tdate.getMonth();
        var yyyy = tdate.getFullYear();
        var date = dd + "-" + (MM + 1) + "-" + yyyy;
        $("#lbldate").text(date);
        
        $("#invoice").hover(function () {
            $("#voice").show();
            $("#voice").css("-webkit-animation-name", "fadeInLeft");
        });
        $("#recep").hover(function () {
            $("#recepspan").show();
            $("#recepspan").css("-webkit-animation-name", "fadeInLeft");
        });
        $("#invoice").mouseleave(function () {
            $("#voice").css("-webkit-animation-name", "bounceOutLeft");
            //$("#voice").hide();
        });
        $("#recep").mouseleave(function () {
            $("#recepspan").css("-webkit-animation-name", "bounceOutLeft");
            // $("#recepspan").hide();
        });
        $("#sales").hover(function () {
            $("#ales").show();
            $("#ales").css("-webkit-animation-name", "fadeInLeft");
        });
        $("#sales").mouseleave(function () {
            $("#ales").css("-webkit-animation-name", "bounceOutLeft");
            // $("#ales").hide();
        });
        $("#upinvoicediv").hover(function () {
            $("#upinvoice").show();
            $("#upinvoice").css("-webkit-animation-name", "fadeInLeft");
        });
        $("#upinvoicediv").mouseleave(function () {
            $("#upinvoice").css("-webkit-animation-name", "bounceOutLeft");
            // $("#upinvoice").hide();
        });
    });
    </script>
</head>
<body>
 <form id="form1" runat="server">
    <div class="topfixed">
</div>

<div style="margin:0px 0px 0px -10px;  padding:30px 0px 0px 0px;   width:100%; overflow:hidden;" >
<div class="mainleft">
<div id="invoice" style="display:table-row; cursor:pointer; ">
<a href="Invoice.aspx"  style=" width:15px;  text-decoration:none; margin:1px 0px 0px 0px; padding:15px 20px 15px 25px; font-weight:bold; font-size:24px; color:#FFF; background-color:#014037; float:left; ">I</a>
<span id="voice" class="animated" style="font-weight:bold; cursor:pointer; margin:1.4px 0px 0px 0px; padding:16px 20px 17px 5px; font-size:22px; color:#FFF; background-color:#014037; display:inline-block; float:right;">Invoice</span>
</div>
<div style="clear:both; overflow:hidden;"></div>
<div  id="sales"  style="display:table-row; overflow:hidden; cursor:pointer;  " >
<a href="sales.aspx"style=" width:15px; text-decoration:none; color:#FFF; font-weight:bold; font-size:24px; float:left; padding:15px 20px 15px 25px; margin:10px 0px 0px 0px; background-color:#008c81; ">S</a>
<span id="ales" class="animated" style="font-weight:bold; margin:10px 0px 0px 0px; padding:16px 20px 17px 5px; cursor:pointer; font-size:22px; color:#FFF; background-color:#008c81; display:inline-block; float:right;">Sales</span>
</div>
<div style="clear:both; overflow:hidden;"></div>
<div  id="upinvoicediv"  style="display:table-row; overflow:hidden; cursor:pointer; " >
<a href="uploadinvoice.aspx"style=" width:15px; text-decoration:none; color:#FFF; font-weight:bold; font-size:24px; float:left; padding:15px 20px 15px 25px; margin:10px 0px 0px 0px; background-color:#014037; ">U</a>
<span id="upinvoice" class="animated" style="font-weight:bold; margin:10px 0px 0px 0px; padding:16px 20px 17px 5px; cursor:pointer; font-size:22px; color:#FFF; background-color:#014037; display:inline-block; float:right;">Upload Invoice</span>
</div>
<div style="clear:both; overflow:hidden;"></div>
<div  id="recep"  style="display:table-row; overflow:hidden; cursor:pointer; " >
<a href="Receipt.aspx"style=" width:15px; text-decoration:none; color:#FFF; font-weight:bold; font-size:24px; float:left; padding:15px 20px 15px 25px; margin:10px 0px 0px 0px; background-color:#008c81; ">R</a>
<span id="recepspan" class="animated" style="font-weight:bold; margin:10px 0px 0px 0px; padding:16px 20px 17px 5px; cursor:pointer; font-size:22px; color:#FFF; background-color:#008c81; display:inline-block; float:right;">Receipt</span>
</div>
</div>

<div class="maintop">
<div class="mainbordercontent">
<div class="mainlayereone"></div>
<div class="mainlayertwo"></div>
<div class="mainlayereone"></div>
<div class="mainlayertwo"></div>
<div class="mainlayereone"></div>
</div>
<!-- header -->
<div style="width:100%; margin:10px 0px 0px 0px; overflow:hidden; height:auto;">
<img src="Assets/logo.jpg"/>
</div>
<!-- form -->
<div class="form">
<!-- left -->
<div style="width:30%; overflow:hidden; float:left; display:inline; height:200px; background:#014037 ;">
<div style="margin:100px 0px 0px 0px;">
<div style="width:100%; display:block; padding:2px 0px 2px 20px; ">
<label  style="color:#FFF; font-weight:bold; font-size:20px;">UPDATED ON</label>
</div>
<div style="width:100%; display:block; padding:2px 0px 2px 20px; ">
<label id="lbldate" style="color:#FFF; font-weight:bold; font-size:20px;"></label>
</div>
</div>
</div>
<!-- right -->
<div style="width:70%; overflow:hidden; float:right; display:inline; height:200px; background:#008c81;">
<div style="width:100%;  display:block; padding:15px 0px 0px 20px; ">
<label style="color:#FFF;  font-weight:bold; font-size:20px;">ZERODOTONE • REGISTRATION NUMBER: 53262873W </label>
</div>
<div style="width:90%;  display:block; padding:30px 0px 0px 20px; ">
<label  style="color:#FFF;   margin:0px auto 0px auto; font-weight:bolder; font-size:30px;">SALES</label>
</div>


</div>
</div>
<!-- Header end -->
<!-- tabel start -->
<!-- tabelheader start -->
<div style="width:100%; overflow:hidden;  margin:20px 0px 0px 0px;">

<!-- tabelcontent start -->
<div style="width:100%; overflow:hidden;  margin:0px 0px 0px 0px;">
<!-- tabelcontentleft start -->
<table align="center" cellpadding="5" cellspacing ="5"  border="1" style=" width:100%; border:1px solid #CCC" >
<tr align="center" style=" background-color:#333; color:#FFF; box-shadow:0px 0px 30px 0px #000;  ">

            <td style=" background-color:#014037;"><span style="color:#FFF; padding:10px 10px 10px 10px;">INVOICE
NUMBER</span></td>
            <td style="background-color:#014037;"><span style="color:#FFF; padding:10px 10px 10px 10px;">CUSTOMER NAME</span></td>
            
            <td style=" background-color:#014037;"><span style="color:#FFF; padding:10px 10px 10px 10px;">TOTAL COST</span></td>
            <td style=" background-color:#014037;"><span style="color:#FFF; padding:10px 10px 10px 10px;">PAID</span></td>
            <td style=" background-color:#014037;"><span style="color:#FFF; padding:10px 10px 10px 10px;">PENDING AMOUNT</span></td>
             <td style="background-color:#014037;"><span style="color:#FFF; padding:10px 10px 10px 10px;">CONTACT NUMBER</span></td>
              <td style="background-color:#014037;"><span style="color:#FFF; padding:10px 10px 10px 10px;">PRODUCT NAME</span></td>
               <td style="background-color:#014037;"><span style="color:#FFF; padding:10px 10px 10px 10px;">DATE OF 
SALES</span></td>

        </tr>
<asp:Repeater ID="Invoicesale" runat="server">
    <itemtemplate>
        
           <tr align="center" style="color:#000; " >
            <td style="padding:0px 0px 0px 0px; overflow:hidden; padding:10px 10px 10px 10px;"><a href="Invoice.aspx?ID=<%# Eval("Invoiceno")%>" style=" display:block; height:100%; padding:10px 20px 10px 20px; border-radius:2px;"><%#Eval("Invoiceno")%></a></td>
            <td style="padding:0px 0px 0px 0px; overflow:hidden; padding:10px 10px 10px 10px;"><%#Eval("PrepareFor")%></td>
            <td style="padding:0px 0px 0px 0px; overflow:hidden; padding:10px 10px 10px 10px;"><%#Eval("price")%></td>
            <td style="padding:0px 0px 0px 0px; overflow:hidden; padding:10px 10px 10px 10px;"><%#Eval("payamount")%></td>
            <td style="padding:0px 0px 0px 0px; overflow:hidden; padding:10px 10px 10px 10px;"><%#Eval("dueamount")%></td>
            <td style="padding:0px 0px 0px 0px; overflow:hidden; padding:10px 10px 10px 10px;"><%#Eval("ccontactno")%></td>
            <td style="padding:0px 0px 0px 0px; overflow:hidden; padding:10px 10px 10px 10px;"><%#Eval("Projectname")%></td>
            <td style="padding:0px 0px 0px 0px; overflow:hidden; padding:10px 10px 10px 10px;"><%#Eval("cdate")%></td>
            
            
        </tr>
        
    </itemtemplate>
</asp:Repeater>

</table>
<!-- tabelcontentleft end-->

</div>
<!-- tabelcontent end-->

<!-- footer start-->
<div style="display:block; width:100%; margin:20px 0px 0px 0px ; background:#014037; overflow:hidden; padding:5px 0px 5px 0px;">
<p style="color:#FFF; text-align:center; padding:0px 20px 0px 20px;  font-weight:bold; font-size:16px;">
ZERODOTONE • REGISTRATION NUMBER: 53262873W • 10 ANSON ROAD, #26-04, INTERNATIONAL PLAZA, SINGAPORE 079903 •  www.picgrantdeals.com
</p>
</div>
<!-- footer end-->
    </form>
</body>
</html>
