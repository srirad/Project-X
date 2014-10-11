<%@ page language="C#" autoeventwireup="true" inherits="Receipt, App_Web_csijsg3o" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>ZERODOTONE</title>
   <link rel="stylesheet" href="Css/animate.css" type="text/css"/>
    <script src="Script/jquery1.10.2.js"></script>
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
		width:100%;  box-shadow: 0px 2px 5px 0px #000;  overflow:hidden;  margin:10px 0px 20px 0px; background:#FFF;
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
		width:100%;  box-shadow: 0px 0px 0px 0px #000; overflow:hidden;  margin:10px 0px 0px 0px; background:#00F;
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
     <script type="text/javascript">
         var canvas, ctx, flag = false,
    prevX = 0,
    currX = 0,
    prevY = 0,
    currY = 0,
    dot_flag = false;

         var x = "black",
    y = 2;

         function init() {
             canvas = document.getElementById('can');
             ctx = canvas.getContext("2d");
             w = canvas.width;
             h = canvas.height;

             canvas.addEventListener("mousemove", function (e) {
                 findxy('move', e)
             }, false);
             canvas.addEventListener("mousedown", function (e) {
                 findxy('down', e)
             }, false);
             canvas.addEventListener("mouseup", function (e) {
                 findxy('up', e)
             }, false);
             canvas.addEventListener("mouseout", function (e) {
                 findxy('out', e)
             }, false);
         }

         function color(obj) {
             switch ("black") {
                 case "black":
                     x = "black";
                     break;
                 case "white":
                     x = "white";
                     break;
             }
             if (x == "white") y = 14;
             else y = 2;

         }

         function draw() {
             ctx.beginPath();
             ctx.moveTo(prevX, prevY);
             ctx.lineTo(currX, currY);
             ctx.strokeStyle = x;
             ctx.lineWidth = y;
             ctx.stroke();
             ctx.closePath();
         }

         function erase() {
             var m = confirm("Want to clear");
             if (m) {
                 ctx.clearRect(0, 0, w, h);
                 document.getElementById("canvasimg").style.display = "none";
             }
         }

         function save() {

             var idd = document.getElementById('btn').value;
             if (idd == "save") {
                 var dataURL = document.getElementById('can').toDataURL("image/png");

                 dataURL = dataURL.replace('data:image/png;base64,', '');
                 // document.location.href = dataURL;

                 var sa = canvas.toDataURL();
                 document.getElementById("canvasimg").src = sa;
                 document.getElementById("canvasimg").alt = sa;
                 document.getElementById("canvasimg").style.display = "inline";
             }
             else {
                 var dataURL = document.getElementById('can').toDataURL("image/png");

                 dataURL = dataURL.replace('data:image/png;base64,', '');
                 // document.location.href = dataURL;
                 var sa = canvas.toDataURL();
                 document.getElementById("canvasimg1").src = sa;
                 document.getElementById("canvasimg1").alt = sa;
                 document.getElementById("canvasimg1").style.display = "inline";
             }
         
         }

         function findxy(res, e) {
             if (res == 'down') {
                 prevX = currX;
                 prevY = currY;
                 currX = e.clientX - canvas.offsetLeft;
                 currY = e.clientY - canvas.offsetTop - 55;

                 flag = true;
                 dot_flag = true;
                 if (dot_flag) {
                     ctx.beginPath();
                     ctx.fillStyle = x;
                     ctx.fillRect(currX, currY, 2, 2);
                     ctx.closePath();
                     dot_flag = false;
                 }
             }
             if (res == 'up' || res == "out") {
                 flag = false;
             }
             if (res == 'move') {
                 if (flag) {
                     prevX = currX;
                     prevY = currY;
                     currX = e.clientX - canvas.offsetLeft;
                     currY = e.clientY - canvas.offsetTop - 55;
                     draw();
                 }
             }
         }
</script>
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
            $("#lbldate").val(date);
            
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
            $("#Sig").click(function () {
                $("#sigplace").css("visibility", "visible");
                $("#btn").val("save");
            });

            $("#Sig1").click(function () {
                $("#sigplace").css("visibility", "visible");
                $("#btn").val("save1");
            });

            $("#btn").click(function () {
                $("#sigplace").css("visibility", "collapse");
            });

            $("#Update").click(function () {
                var searchinv = $("#uinv").val();
                if (searchinv != '') {

                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Invoice.aspx/Searchinv",
                        data: "{'SearchInv':'" + searchinv + "'}",
                        dataType: "json",
                        success: function (data) {
                            if (data.d.length == 1) {

                                $("#txtProjectname").val(data.d[0].Projectname);
                                $("#txtproduct").val(data.d[0].Product);
                                $("#txtpayamount").val(data.d[0].payamount);
                                $("#lbldue").text(data.d[0].dueamount);
                                $("#txtinvno").text(data.d[0].Invoiceno);

                            }
                        },
                        error: function (result) {
                            alert(result);
                        }
                    });

                }
            });


            $("#UpdateData").click(function () {
                var invno1 = $("#txtinvno").text();
                var payamount1 = $("#txtpayamount").val();
                var dueamount1 = $("#lbldue").text();
                var date = $("#lbldate").val();
                var projname = $("#txtProjectname").val();
                var proname = $("#txtproduct").val();
                var csign1 = $("#canvasimg").prop('alt');
                var csign = $("#canvasimg1").prop('alt');
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "Invoice.aspx/UpdateInvoice",
                    data: "{'invno':'" + invno1 + "','payamount':'" + payamount1 + "','dueamount':'" + dueamount1 + "','paydate':'" + date + "','projname':'" + projname + "','proname':'" + proname + "','recsign':'" + csign1 + "','recCussign':'" + csign + "'}",
                    dataType: "json",
                    success: function (data) {
                        var obj = data.d;
                        if (obj == 'true') {
                            document.location.href = "Invoice.aspx";
                        }
                    },
                    error: function (result) {
                        alert(result);
                    }
                });
            });
            $("#txtpayamount").blur(function () {
                var pay = $("#txtpayamount").val();
                var due = $("#lbldue").text();
                var pattern1 = /^0|[1-9]\d*$/;

                if (pattern1.test(pay)) {
                    var a = parseInt(pay);
                    var b = 15000;
                    var countcal = b - a;
                    if (parseInt(countcal) >= 0) {
                        $("#lbldue").text(countcal);
                    }
                    else {

                        $("#txtpayamount").val(0);
                    }
                }
                else {

                    $("#txtpayamount").val(0);
                }
            });
        });
           
    </script>
</head>
<body onLoad="init()">
 <div id="sigplace" style="width:100%; height:600px; position:fixed; visibility:collapse; margin:-10px 0px 0px -8px; top:80px; background-color:#CFF;"> 
 <canvas id="can" width="600" height="400" style=" position:absolute;top:10%;left:10%;border:2px solid;"></canvas>
  <input type="button" value="save" id="btn" size="50"  onClick="save()" style=" padding:10px 10px 10px 10px; color:#FFF; font-size:20px; background-color:#C09; position:absolute;top:90%;left:10%;"/>
    <input type="button" value="clear" id="clr" size="50" onClick="erase()" style= " padding:10px 10px 10px 10px; color:#FFF; font-size:20px;position:absolute; background-color:#C09; top:90%;left:15%;"/>
</div>
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
<div style=" width:100%; margin:50px auto 20px 20px; overflow:hidden; ">
    <div style= " margin:50px auto 20px 80px;">
    <table>
    <tr>
    <td>
    <input type="button" id="Update" name="Update" value="Update" style=" float:right; margin:6px 10px 0px 0px; border:none; background:#000; color:#FFF; " />


    </td>
     <td>
    <input type="text" id="uinv" placeholder="Update by invoice number" style=" float:right; margin:5px 10px 0px 0px;" /> 
    </td>
    </tr></table>
    <table>
    <tr>
    <td>date</td>
<td><input id="lbldate" type="text" style="border:1px #000 solid; padding:3px 0px 3px 10px; font-size:16px; "  /></td>
    </tr>
    <tr>
    <tr>
    <td>Inovice No</td>
<td><label id="txtinvno" style="font-size:16px; color:#000; "</td>
    </tr>
    <tr>
    <td>Project Name</td>
    <td><input id="txtProjectname" type="text"  style="border:1px #000 solid; padding:3px 0px 3px 10px; font-size:16px; "  /></td>
    </tr>
    <tr>
    <td>Product</td>
    <td><input id="txtproduct" type="text"  style="border:1px #000 solid; padding:3px 0px 3px 10px; font-size:16px; "  /></td>
    </tr>
    <tr>
    <td>Product Price</td>
    <td><label >SGD 15,000.00</label></td>
    </tr>
    <tr>
    <td>Due Amount</td>
    <td><label id="lbldue" style="font-size:16px; color:#000; "></label></td>
    </tr>
     <tr>
    <td>Pay Amount</td>
    <td><input id="txtpayamount" type="text"  style="border:1px #000 solid; padding:3px 0px 3px 10px; font-size:16px; "  /></td>
    </tr>
    <tr>
    <td>
     <img id="canvasimg"  runat="server" style="border:none; width:250px; height:150px;"/></td>
     <td>
<input type="button" id="Sig" name="Sig" value="Add SIGNATURE"/>
</td>
</tr>
<tr>
<td>
 <img id="canvasimg1"  runat="server" style="border:none; width:250px; height:150px;"/>

</td>
<td><input type="button" id="Sig1" name="Sig1" value="Add SIGNATURE Customer"/></td></tr>
<tr>
<td>
<input type="button" id="UpdateData" name="Update" value="Update" style="border:none; background:#930; font-size:20px; padding:10px 10px 10px 10px; color:#FFF;"/>
</td></tr>
    </table>
    <table align="center" cellpadding="5" cellspacing ="5"  border="1" style=" width:90%; border:1px solid #CCC" >
<tr align="center" style=" background-color:#333; color:#FFF; box-shadow:0px 0px 30px 0px #000;  ">

            <td style=" background-color:#014037;"><span style="color:#FFF; padding:10px 10px 10px 10px;">INVOICE
NUMBER</span></td>
            <td style="background-color:#014037;"><span style="color:#FFF; padding:10px 10px 10px 10px;">PAY DATE</span></td>
            <td style=" background-color:#014037;"><span style="color:#FFF; padding:10px 10px 10px 10px;">PRODUCT NAME</span></td>
            <td style=" background-color:#014037;"><span style="color:#FFF; padding:10px 10px 10px 10px;">PROJECT NAME</span></td>
            <td style=" background-color:#014037;"><span style="color:#FFF; padding:10px 10px 10px 10px;">PAY AMOUNT</span></td>
             <td style="background-color:#014037;"><span style="color:#FFF; padding:10px 10px 10px 10px;">DUE AMOUNT</span></td>
        </tr>
<asp:Repeater ID="Invoicesale" runat="server">
    <itemtemplate>
        
           <tr align="center" style="color:#000; " >
            <td style="padding:0px 0px 0px 0px; overflow:hidden; padding:10px 10px 10px 10px;"><%#Eval("invoiceno")%></td>
            <td style="padding:0px 0px 0px 0px; overflow:hidden; padding:10px 10px 10px 10px;"><%#Eval("paydate")%></td>
            <td style="padding:0px 0px 0px 0px; overflow:hidden; padding:10px 10px 10px 10px;"><%#Eval("productname")%></td>
            <td style="padding:0px 0px 0px 0px; overflow:hidden; padding:10px 10px 10px 10px;"><%#Eval("projectname")%></td>
            <td style="padding:0px 0px 0px 0px; overflow:hidden; padding:10px 10px 10px 10px;"><%#Eval("payaomount")%></td>
            <td style="padding:0px 0px 0px 0px; overflow:hidden; padding:10px 10px 10px 10px;"><%#Eval("dueamount")%></td>
        </tr>
        
    </itemtemplate>
</asp:Repeater>

</table>
    </div>

    </div>


<div style="display:block; width:100%; margin:20px 0px 0px 0px ; background:#014037; overflow:hidden; padding:5px 0px 5px 0px;">
<p style="color:#FFF; text-align:center; padding:0px 20px 0px 20px;  font-weight:bold; font-size:16px;">
ZERODOTONE • REGISTRATION NUMBER: 53262873W • 10 ANSON ROAD, #26-04, INTERNATIONAL PLAZA, SINGAPORE 079903 •  www.picgrantdeals.com
</p>
</div>
<!-- footer end-->
    </form>
</body>
</html>
