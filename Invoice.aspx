<%@ page language="C#" autoeventwireup="true" inherits="Invoice, App_Web_csijsg3o" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


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
		width:30%; overflow:hidden; float:left; display:inline; height:200px; background:#014037 ;
	}
	.mainleft
	{
		display:inline-block; float:left; position:fixed;   height:auto;
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
	.fontboldupper
	{
	     text-transform:uppercase; text-align:justify; font-weight:bold;
	}
	.fontboldlower
	{
	     text-transform:uppercase; text-align:justify; font-weight:bold;
	}
	.fontupperjust
	{
	    text-transform:uppercase; text-align:justify;
	}
	.fontlowerjust
	{
	    text-transform:lowercase; text-align:justify;
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
            
//             var sa = canvas.toDataURL();
//             document.getElementById("canvasimg").src = sa;
//             document.getElementById("canvasimg").alt = sa;
//             document.getElementById("canvasimg").style.display = "inline";
         }
         else {
             var dataURL = document.getElementById('can').toDataURL("image/png");

             dataURL = dataURL.replace('data:image/png;base64,', '');
            // document.location.href = dataURL;
//             var sa = canvas.toDataURL();
//             document.getElementById("canvasimg1").src = sa;
//             document.getElementById("canvasimg1").alt = sa;
//             document.getElementById("canvasimg1").style.display = "inline";
         }
     }

     function findxy(res, e) {
         if (res == 'down') {
             prevX = currX;
             prevY = currY;
             currX = e.clientX - canvas.offsetLeft;
             currY = e.clientY - canvas.offsetTop;

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
                 currY = e.clientY - canvas.offsetTop;
                 draw();
             }
         }
     }
</script>

<script>
    $(document).ready(function () {
        $(".content").css("display", "none");

        $("#voice").css("display", "none");
        $("#ales").css("display", "none");
        $("#recepspan").css("display", "none");
        $("#upinvoice").css("display", "none");
        var tdate = new Date();
        var dd = tdate.getDate();
        var MM = tdate.getMonth();
        var yyyy = tdate.getFullYear();
        var date = dd + "-" + (MM + 1) + "-" + yyyy;
        $("#txtinvdate").val(date);
        $("#txtsdate").val(date);
        $("#txtcdate").val(date);
        $("#print").click(function () {
            $("#print").hide();
            $("#submit").hide();
            $("#UpdateData").hide();
            window.print();
        });

        $("#Close").click(function () {
            $("#sigplace").css("visibility", "collapse");
        });

        $("#btnstaffsig").click(function () {
            var obj = $("#canvasimg").prop('src');
            $("#staffsig").attr('src', obj);
            $("#btnstaffsig").hide();
        });



        $('#Selecttemp').on('change', function () {
            if (this.value != "Select-Template") {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "Invoice.aspx/GetTemplateData",
                    data: '{ "templatename" : "' + this.value + '" }',
                    dataType: "json",
                    success: function (data) {
                        $(".content").css("display", "block");
                        $("#Selecttemp").css("display", "none");
                        $("#txtproduct").val(data.d.ProjectName);
                        $("#lblPriceTop").text("SGD " + data.d.ProjectPrice);
                        $("#lblPriceBottom").text("SGD " + data.d.ProjectPrice);
                        var split = data.d.ProjectDec.split('.');
                        for(var i=0; i < split.length; i++)
                            $("#txtdec").val($("#txtdec").val() + "\r\n" + split[i]);

                        
                    },
                    error: function (result) {
                        alert(result);
                    }

                });
            }

        });

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "Invoice.aspx/GetTemplate",
            dataType: "json",
            success: function (data) {
                $("#Selecttemp").empty();
                for (var i = 0; i <= data.d.length; i++) {
                    $("#Selecttemp").append("<option value=" + data.d[i].tempid + ">" + data.d[i].Tempname + "</option>");
                }
            },
            error: function (result) {
                alert(result);
            }
        });

        $("#btnCussig").click(function () {
            var obj = $("#canvasimg1").prop('src');
            $("#cussig").attr('src', obj);
            $("#btnCussig").hide();
        });

        $("#btn").click(function () {
            var image = document.getElementById("can").toDataURL();
            image = image.replace('data:image/png;base64,', '');
            var vall = document.getElementById('btn').value;
            var invno1 = $("#lblinv").text();
            $.ajax({
                type: 'POST',
                url: 'Invoice.aspx/UploadImage',
                data: '{ "imageData" : "' + image + '" , "chos" : "' + vall + '" , "invoi" : "' + invno1 + '" }',
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    var obj = data.d;
                    if (vall == 'save') {
                        $("#canvasimg").attr('src', obj);
                    }
                    else {
                        $("#canvasimg1").attr('src', obj);
                    }
                }
            });
            $("#sigplace").css("visibility", "collapse");
        });

        $("#Sig").click(function () {
            $("#sigplace").css("visibility", "visible");
            $("#btn").val("save");
        });

        $("#Sig1").click(function () {
            $("#sigplace").css("visibility", "visible");
            $("#btn").val("save1");
        });


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
            $("#voice").css("display", "none");
        });
        $("#recep").mouseleave(function () {
            $("#recepspan").css("-webkit-animation-name", "bounceOutLeft");
            $("#recepspan").css("display", "none");
        });
        $("#sales").hover(function () {
            $("#ales").show();
            $("#ales").css("-webkit-animation-name", "fadeInLeft");
        });
        $("#sales").mouseleave(function () {
            $("#ales").css("-webkit-animation-name", "bounceOutLeft");
            $("#ales").css("display", "none");
        });
        $("#upinvoicediv").hover(function () {
            $("#upinvoice").show();
            $("#upinvoice").css("-webkit-animation-name", "fadeInLeft");
        });
        $("#upinvoicediv").mouseleave(function () {
            $("#upinvoice").css("-webkit-animation-name", "bounceOutLeft");
            $("#upinvoice").css("display", "none");
        });

        $("#txtdec").focus(function () {
            var tee = $("#txtdec").val();
            if (tee == 'Product Description :') {
                $("#txtdec").val('');
            }
        });
        $("#txtdec").blur(function () {
            var tee = $("#txtdec").val();
            if (tee == "") {
                $("#txtdec").val('Product Description :');

            }
        });

        $("#Search").click(function () {
            var searchinv = $("#sinv").val();
            if (searchinv != '') {

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "Invoice.aspx/Searchinv",
                    data: "{'SearchInv':'" + searchinv + "'}",
                    dataType: "json",
                    success: function (data) {
                        if (data.d.length == 1) {

                            $("#lblpre").text("Prepared for " + data.d[0].PrepareFor + " ");
                            $("#txtpre").val();
                            $("#txtpre").hide();
                            $("#lblinvdate").text(data.d[0].invoicedate);
                            $("#txtinvdate").hide();
                            $("#lblpro").text(" Project Type " + data.d[0].Projectname);
                            $("#txtpro").val();
                            $("#txtpro").hide();
                            $("#lblproduct").text(data.d[0].Product);
                            $("#txtproduct").hide();
                            $("#lbldec").text(data.d[0].productDes);
                            $("#txtdec").hide();
                            $("#lblpay").text(data.d[0].payamount);
                            $("#txtpay").hide();

                            $("#lblpay").show();
                            $("#txtdue").text(data.d[0].dueamount);
                            $("#lblcname").text(data.d[0].cname);
                            $("#txtcname").hide();
                            $("#lblsname").text(data.d[0].sname);
                            $("#txtsname").hide();
                            $("#lblsnri").text(data.d[0].cnri);
                            $("#txtsnri").hide();
                            $("#lblcnri").text(data.d[0].snri);
                            $("#txtcnri").hide();
                            $("#lblcno").text(data.d[0].ccontactno);
                            $("#txtcno").hide();
                            $("#lblsno").text(data.d[0].scontactno);
                            $("#txtsno").hide();
                            $("#lblsdate").text(data.d[0].sdate);
                            $("#txtsdate").hide();
                            $("#lblcdate").text(data.d[0].cdate);
                            $("#txtcdate").hide();
                            $("#canvasimg").attr('src', data.d[0].csignature);
                            $("#canvasimg1").attr('src', data.d[0].ssignature);
                            $("#lbldate").text("Date : " + data.d[0].cdate);
                            $("#lblinv").text(data.d[0].Invoiceno);

                            $("#Sig").hide();
                            $("#Sig1").hide();

                        }
                    },
                    error: function (result) {
                        alert(result);
                    }
                });

            }
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

                            $("#lblpre").text("Prepared for " + data.d[0].PrepareFor + " ");
                            $("#txtpre").val();
                            $("#lblinvdate").text(data.d[0].invoicedate);
                            $("#txtinvdate").hide();
                            $("#txtpre").hide();
                            $("#lblpro").text(" Project Type " + data.d[0].Projectname);
                            $("#txtpro").val();
                            $("#txtpro").hide();
                            $("#lblproduct").text(data.d[0].Product);
                            $("#txtproduct").hide();
                            $("#lbldec").text(data.d[0].productDes);
                            $("#txtdec").hide();
                            $("#txtpay").show();
                            $("#lblpay").hide();
                            $("#txtpay").val(data.d[0].payamount);
                            $("#txtdue").text(data.d[0].dueamount);
                            $("#lblcname").text(data.d[0].cname);
                            $("#txtcname").hide();
                            $("#lblsname").text(data.d[0].sname);
                            $("#txtsname").hide();
                            $("#lblsnri").text(data.d[0].cnri);
                            $("#txtsnri").hide();
                            $("#lblcnri").text(data.d[0].snri);
                            $("#txtcnri").hide();
                            $("#lblcno").text(data.d[0].ccontactno);
                            $("#txtcno").hide();
                            $("#lblsno").text(data.d[0].scontactno);
                            $("#txtsno").hide();
                            $("#lblsdate").text(data.d[0].sdate);
                            $("#txtsdate").hide();
                            $("#lblcdate").text(data.d[0].cdate);
                            $("#txtcdate").hide();
                            $("#canvasimg").attr('src', data.d[0].csignature);
                            $("#canvasimg1").attr('src', data.d[0].ssignature);
                            $("#lbldate").text("Date : " + data.d[0].cdate);
                            $("#lblinv").text(data.d[0].Invoiceno);

                            $("#Sig").hide();
                            $("#Sig1").hide();

                        }
                    },
                    error: function (result) {
                        alert(result);
                    }
                });

            }
        });

        $("#rdbus").click(function () {

            $("#Bussness").show();
            $("#CRM").hide();
        });

        $("#rdcrm").click(function () {
            $("#Bussness").hide();
            $("#CRM").show();
        });

        $("#submit").click(function () {
            var prefor1 = $("#txtpre").val();
            var proname1 = $("#txtpro").val();
            var dec = $("#txtdec").val();
            var pay = $("#txtpay").val();
            var cname = $("#txtcname").val();
            var cnri = $("#txtcnri").val();
            var cadd = $("#txtcadd").val();
            var cdate = $("#txtcdate").val();
            var sname = $("#txtsname").val();
            var snri = $("#txtsnri").val();
            var sadd = $("#txtsadd").val();
            var sdate = $("#txtsdate").val();
            if (document.getElementById('rdcrm').checked || document.getElementById('rdbus').checked) {
                if (prefor1 != '' && dec != '' && pay != '' && cname != '' && cnri != '' && cadd != '' && cdate != '' && sname != '' && snri != '' && sadd != '' && sdate != '') {
                    $("#lblpre").text("Prepared for " + $("#txtpre").val());
                    $("#lblinvdate").text($("#txtinvdate").val());
                    $("#txtinvdate").hide();
                    $("#txtpre").val();
                    $("#txtpre").hide();
                    $("#lblpro").text(" Project Type " + $("#txtpro").val());
                    $("#txtpro").val();
                    $("#txtpro").hide();
                    $("#lblproduct").text($("#txtproduct").val());
                    $("#txtproduct").hide();
                    $("#lbldec").text("" + $("#txtdec").val() + "");
                    $("#txtdec").hide();
                    $("#lblpay").text($("#txtpay").val());
                    $("#txtpay").hide();
                    $("#txtdue").text();
                    $("#lblcname").text($("#txtcname").val());
                    $("#txtcname").hide();
                    $("#lblsname").text($("#txtsname").val());
                    $("#txtsname").hide();
                    $("#lblsnri").text($("#txtsnri").val());
                    $("#txtsnri").hide();
                    $("#lblcnri").text($("#txtcnri").val());
                    $("#txtcnri").hide();
                    $("#lblcno").text($("#txtcno").val());
                    $("#txtcno").hide();
                    $("#lblsno").text($("#txtsno").val());
                    $("#txtsno").hide();
                    $("#lblsdate").text($("#txtsdate").val());
                    $("#txtsdate").hide();
                    $("#lblcdate").text($("#txtcdate").val());
                    $("#txtcdate").hide();
                    var csign1 = $("#canvasimg").prop('src');
                    var ssign1 = $("#canvasimg1").prop('src');
                    $("#Sig").hide();
                    $("#Sig1").hide();
                    var invno1 = $("#lblinv").text();

                    var product1 = $("#lblproduct").text();
                    var prodes1 = $("#lbldec").text();
                    var price1 = $("#lblprice").text();
                    var payamount1 = $("#lblpay").text();
                    var dueamount1 = $("#txtdue").text();
                    var sname1 = $("#lblsname").text();
                    var snri1 = $("#lblsnri").text();
                    var scontno1 = $("#lblsno").text();
                    var sdate1 = $("#lblsdate").text();
                    var invdate = $("#lblinvdate").text();
                    var cname1 = $("#lblcname").text();
                    var cnri1 = $("#lblcnri").text();
                    var ccontno1 = $("#lblcno").text();
                    var cdate1 = $("#lblcdate").text();


                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Invoice.aspx/InsertInvoice",
                        data: "{'invno':'" + invno1 + "','invdate':'" + invdate + "','prefor':'" + prefor1 + "','proname':'" + proname1 + "','prod':'" + product1 + "','prodes':'" + prodes1 + "','price':' 15000 ','payamount':'" + payamount1 + "','dueamount':'" + dueamount1 + "','sname':'" + sname1 + "','snri':'" + snri1 + "','scontno':'" + scontno1 + "' ,'sdate':'" + sdate1 + "','ssign':'" + ssign1 + "','cname':'" + cname1 + "','cnri':'" + cnri1 + "','ccontno':'" + ccontno1 + "','cdate':'" + cdate1 + "','csign':'" + csign1 + "'}",
                        dataType: "json",
                        success: function (data) {
                            $("#lblinv").text(data.d);
                                alert("inserted");
                        },
                        error: function (result) {
                            alert(result);
                        }
                    });
                }
                else {
                    alert("Enter all value");
                    return false;
                }
            }
            else {
                alert("Radio not checked");
                return false;
            }


        });

        $("#UpdateData").click(function () {
            var pre = $("#txtpre").val();
            var dec = $("#txtdec").val();
            var pay = $("#txtpay").val();
            var cname = $("#txtcname").val();
            var cnri = $("#txtcnri").val();
            var cadd = $("#txtcadd").val();
            var cdate = $("#txtcdate").val();
            var sname = $("#txtsname").val();
            var snri = $("#txtsnri").val();
            var sadd = $("#txtsadd").val();
            var sdate = $("#txtsdate").val();

            $("#lblpre").text("Prepared for " + $("#txtpre").val());
            $("#txtpre").val();
            $("#txtpre").hide();
            $("#lblpro").text(" Project Type " + $("#txtpro").val());
            $("#txtpro").val();
            $("#txtpro").hide();
            $("#lblproduct").text($("#txtproduct").val());
            $("#txtproduct").hide();
            $("#lbldec").text("" + $("#txtdec").val() + "");
            $("#txtdec").hide();
            $("#lblpay").text($("#txtpay").val());
            $("#txtpay").hide();
            $("#txtdue").text();
            $("#lblcname").text($("#txtcname").val());
            $("#txtcname").hide();
            $("#lblsname").text($("#txtsname").val());
            $("#txtsname").hide();
            $("#lblsnri").text($("#txtsnri").val());
            $("#txtsnri").hide();
            $("#lblcnri").text($("#txtcnri").val());
            $("#txtcnri").hide();
            $("#lblcno").text($("#txtcno").val());
            $("#txtcno").hide();
            $("#lblsno").text($("#txtsno").val());
            $("#txtsno").hide();
            $("#lblsdate").text($("#txtsdate").val());
            $("#txtsdate").hide();
            $("#lblcdate").text($("#txtcdate").val());
            $("#txtcdate").hide();
            var csign1 = $("#canvasimg").prop('src');
            var ssign1 = $("#canvasimg1").prop('src');
            $("#Sig").hide();
            $("#Sig1").hide();
            var invno1 = $("#lblinv").text();
            var prefor1 = $("#lblpre").text();
            var proname1 = $("#lblpro").text();
            var product1 = $("#lblproduct").text();
            var prodes1 = $("#lbldec").text();
            var price1 = $("#lblprice").text();
            var payamount1 = $("#lblpay").text();
            var dueamount1 = $("#txtdue").text();
            var sname1 = $("#lblsname").text();
            var snri1 = $("#lblsnri").text();
            var scontno1 = $("#lblsno").text();
            var sdate1 = $("#lblsdate").text();
            var invdate = $("#txtinvdate").text();
            var cname1 = $("#lblcname").text();
            var cnri1 = $("#lblcnri").text();
            var ccontno1 = $("#lblcno").text();
            var cdate1 = $("#lblcdate").text();


            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Invoice.aspx/UpdateInvoice",
                data: "{'invno':'" + invno1 + "','payamount':'" + payamount1 + "','dueamount':'" + dueamount1 + "'}",
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
        $("#txtpay").blur(function () {
            var pay = $("#txtpay").val();
            var due = $("#txtdue").text();
            var pattern1 = /^0|[1-9]\d*$/;

            if (pattern1.test(pay)) {
                var a = parseInt(pay);
                var b = 15000;
                var countcal = b - a;
                if (parseInt(countcal) >= 0) {
                    $("#txtdue").text(countcal);
                }
                else {

                    $("#txtpay").val(0);
                }
            }
            else {

                $("#txtpay").val(0);
            }
        });

        ////        $("#txtcno").blur(function () {
        ////            var txtcontact = $("#txtcno").val();
        ////            var pattern1 = /^\d{10}$/;
        ////            if (!pattern1.test(txtcontact)) {
        ////                $('#lblcnoerr').html("* Enter the mobile number");
        ////                $('#lblcnoerr').css("color", "#F00");
        ////                $("#txtcno").val('');

        ////            }
        ////            else {

        ////                $('#lblcnoerr').html("");
        ////                $('#lblcnoerr').css("color", "#060");


        ////            }
        ////        });
        ////        $("#txtsno").blur(function () {
        ////            var txtcontact = $("#txtsno").val();
        ////            var pattern1 = /^\d{10}$/;
        ////            if (!pattern1.test(txtcontact)) {
        ////                $('#lblsnoerr').html("* Enter the mobile number");
        ////                $('#lblsnoerr').css("color", "#F00");
        ////                $("#txtsno").val('');

        ////            }
        ////            else {

        ////                $('#lblsnoerr').html("");
        ////                $('#lblsnoerr').css("color", "#060");


        ////            }
        ////        });
    });
</script>
</head>
<body  onLoad="init()">
   
    <div id="sigplace" style="width:100%; height:100%; position:fixed; visibility:collapse; margin:-10px 0px 0px -8px;  background-color:#CFF;"> 
 <canvas id="can" width="600" height="400" style=" cursor:crosshair; position:absolute;top:80px;left:200px;border:2px solid;"></canvas>
  <input type="button" value="save" id="btn" size="50"   style=" float:right; margin:80px 20px 0px 20px;  padding:10px 10px 10px 10px; color:#FFF; font-size:20px; background-color:#C09; "/>
    <input type="button" value="clear" id="clr" size="50" onClick="erase()" style= " float:right; margin:80px 20px 0px 20px;  padding:10px 10px 10px 10px; color:#FFF; font-size:20px; background-color:#C09; "/>
    <input type="button" value="Close" id="close" size="50" style= " padding:10px 10px 10px 10px; float:right; margin:80px 20px 0px 20px;  color:#FFF; font-size:20px; background-color:#C09; "/>
</div>
 <form id="form1" runat="server">
<div class="topfixed">
    <asp:Button ID="Button1" runat="server" Text="Logout" onclick="Button1_Click"/>
<input type="button" id="Search" name="Search" value="Search" style=" float:right; margin:6px 10px 0px 0px; border:none; background:#000; color:#FFF;  " />
<input type="text" id="sinv" placeholder="Search by invoice number" style=" float:right; margin:5px 10px 0px 0px;" /> 

<%--<input type="button" id="Update" name="Update" value="Update" style=" float:right; margin:6px 10px 0px 0px; border:none; background:#000; color:#FFF; " />--%>
<%--<input type="text" id="uinv" placeholder="Update by invoice number" style=" float:right; margin:5px 10px 0px 0px;" /> --%>

</div>

<div style="margin:0px 0px 0px -10px;  padding:30px 0px 0px 0px;   width:100%; overflow:hidden;" >
<div class="mainleft">
<div id="invoice" style="display:table-row; cursor:pointer; ">
<a href="Invoice.aspx"  style=" width:15px;  text-decoration:none; margin:1px 0px 0px 0px; padding:15px 20px 15px 25px; font-weight:bold; font-size:24px; color:#FFF; background-color:#014037; float:left; ">I</a>
<span id="voice" class="animated" style="font-weight:bold; cursor:pointer; margin:1.4px 0px 0px 0px; padding:16px 20px 16px 5px; font-size:22px; color:#FFF; background-color:#014037; display:inline-block; float:right;">Invoice</span>
</div>
<div style="clear:both; overflow:hidden;"></div>
<div  id="sales"  style="display:table-row; overflow:hidden; cursor:pointer;  " >
<a href="sales.aspx"style=" width:15px; text-decoration:none; color:#FFF; font-weight:bold; font-size:24px; float:left; padding:15px 20px 15px 25px; margin:10px 0px 0px 0px; background-color:#008c81; ">S</a>
<span id="ales" class="animated" style="font-weight:bold; margin:10px 0px 0px 0px; padding:16px 20px 16px 5px; cursor:pointer; font-size:22px; color:#FFF; background-color:#008c81; display:inline-block; float:right;">Sales</span>
</div>
<div style="clear:both; overflow:hidden;"></div>
<div  id="upinvoicediv"  style="display:table-row; overflow:hidden; cursor:pointer; " >
<a href="uploadinvoice.aspx"style=" width:15px; text-decoration:none; color:#FFF; font-weight:bold; font-size:24px; float:left; padding:15px 20px 15px 25px; margin:10px 0px 0px 0px; background-color:#014037; ">U</a>
<span id="upinvoice" class="animated" style="font-weight:bold; margin:10px 0px 0px 0px; padding:16px 20px 16px 5px; cursor:pointer; font-size:22px; color:#FFF; background-color:#014037; display:inline-block; float:right;">Upload Invoice</span>
</div>
<div style="clear:both; overflow:hidden;"></div>
<div  id="recep"  style="display:table-row; overflow:hidden; cursor:pointer; " >
<a href="Receipt.aspx"style=" width:15px; text-decoration:none; color:#FFF; font-weight:bold; font-size:24px; float:left; padding:15px 20px 15px 25px; margin:10px 0px 0px 0px; background-color:#008c81; ">R</a>
<span id="recepspan" class="animated" style="font-weight:bold; margin:10px 0px 0px 0px; padding:16px 20px 16px 5px; cursor:pointer; font-size:22px; color:#FFF; background-color:#008c81; display:inline-block; float:right;">Receipt</span>
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
<div style="width:40%; overflow:hidden; float:left; display:inline; height:200px; background:#014037 ;">
<div style="margin:100px 0px 0px 0px;">
<div style="width:100%; display:block; padding:2px 20px 2px 20px; ">
<label id="lbldate" style="color:#FFF; font-weight:bold; font-size:20px;">Date :</label>
<input type="text" id="txtinvdate" placeholder="Enter Date" style="border:1px #000 solid; padding:3px 0px 3px 10px; font-size:16px; " />
<label id="lblinvdate" runat="server" style="color:#FFF; font-weight:bold; font-size:20px;"></label>
</div>
<div style="width:100%; display:block; padding:2px 20px 2px 20px; ">
<label style="color:#FFF; font-weight:bold; font-size:20px;">Invoice no. : </label>
<label id="lblinv" runat="server" style="color:#FFF; font-weight:bold; font-size:20px;"></label>

</div>
</div>
</div>
<!-- right -->
<div style="width:60%; overflow:hidden; float:right; display:inline; height:200px; background:#008c81;">
<div style="width:100%;  display:block; padding:15px 0px 0px 20px; ">
<label id="summa" style="color:#FFF;  font-weight:bold; font-size:20px;">ZERODOTONE • REGISTRATION NUMBER: 53262873W </label>
</div>
<div style="width:90%;  display:block; padding:30px 0px 0px 20px; ">
<label  style="color:#FFF; float:right;  margin:0px 0px 0px 0px font-weight:bolder; font-size:30px;">INVOICE </label>
</div>

<div style="width:90%;  display:block; padding:30px 0px 0px 20px; margin:20px 0px 0px 0px; ">
<label id="lblpro" runat="server" style="color:#FFF; float:right; margin:0px 0px 0px 0px font-weight:bolder; font-size:16px;">Project : <input id="txtpro" runat="server"  type="text" placeholder=" Project type" style="border:none; padding:3px 0px 3px 10px; font-size:16px; " /> </label>
<label id="lblpre" runat="server" style="color:#FFF; float:right; margin:0px 0px 0px 0px font-weight:bolder; font-size:16px;"> Prepared for <input id="txtpre" runat="server"  type="text" placeholder=" Prepared For" style="border:none; padding:3px 0px 3px 10px; font-size:16px; " /> </label>

</div>
</div>
</div>
<!-- Header end -->
<!-- tabel start -->
<!-- tabelheader start -->
<div style="width:100%; overflow:hidden;  margin:20px 0px 0px 0px;">
<!-- tabelheaderleft start -->
<div style="width:70%; overflow:hidden; padding:10px 0px 10px 0px;  display:inline-block; float:left; background-color:#008c81;">
<label style="color:#FFF; padding:0px 0px 0px 20px;  font-weight:bold; font-size:20px;">PRODUCT</label></div>
<!-- tabelheaderleft end -->
<!-- tabelheaderright start -->
<div class="priceblock">
<label style="color:#FFF; padding:0px 20px 0px 0px; float:right;  font-weight:bold; font-size:20px;">PRICE</label></div>
<!-- tabelheaderright end -->
</div>
<!-- tabelheader end -->

<!-- tabelcontent start -->
<div  style="width:100%; overflow:hidden;  margin:0px 0px 0px 0px;">

<select id="Selecttemp" style=" width:50%; margin:20px auto 20px auto;  padding:10px 0px; text-align:center; font-size:medium; color:#FFF; background-color:#008c81; ">

</select>
<div class="content">



<!-- tabelcontentleft start -->
<div style="width:65%; overflow:hidden; padding:10px 0px 10px 0px; margin:0px 10px 0px 20px;   display:inline-block; float:left;">
<div style=" width:90%; overflow:hidden; display:block;">
<label id="lblproduct"  runat="server" style="font-size:16px; text-transform:uppercase; margin:20px 20px 0px 30px;  white-space:pre-line; width:100%;    font-weight:bold; color:#000;"></label>
</div>
<div style=" width:90%; overflow:hidden; display:block; margin:20px 0px 0px 0px;">
<label id="lbldec" runat="server" style="font-size:12px; margin:20px 20px 0px 30px;  white-space:pre-line;  width:80%;  font-weight:bold; color:#666;"></label>
</div>
<input id="txtproduct" type="text" runat="server"  placeholder="Enter the Product" style="width:90%; overflow:auto; padding:10px 10px 10px 30px; font-size:16px;  font-weight:bold;" />
<textarea id="txtdec" runat="server" style="width:90%; overflow:auto; padding:10px 10px 10px 30px; resize:none; border:none;  height:250px; font-size:16px;  font-weight:bold;">Product Description :</textarea>
</div>
<!-- tabelcontentleft end -->
<!-- tabelcontentright start -->
<div style="width:30%; overflow:hidden; padding:10px 0px 10px 0px;  display:inline-block; float:right; background-color:#e1eded;">
<label id="lblPriceTop" style="color:#000; padding:0px 20px 0px 0px; float:right;  font-weight:bold; font-size:16px;">SGD 15,000.00</label></div>
</div>
<!-- tabelcontentrright end -->
</div>
<!-- tabelcontent end -->

<!-- tabeltotal start -->
<div class="totalborder">
<div class="content">
<!-- tabeltotalleft start -->
<div style="width:68%; overflow:hidden; padding:10px 0px 10px 0px;  display:inline-block; float:left; background-color:#FFF;">
<label style="color:#008c81; padding:0px 0px 0px 20px;  font-weight:bold; font-size:16px;">----------------------TOTAL COST ------------------------</label></div>
<!-- tabeltotalleft end -->
<!-- tabeltotalright start -->
<div style="width:30%; overflow:hidden; padding:10px 0px 10px 0px;  display:inline-block; float:right; background-color:#e1eded;  ">
<label id="lblPriceBottom" style="color:#000; padding:0px 20px 0px 0px; float:right;  font-weight:bold; font-size:16px;">SGD  15,000.00 /-</label></div
><!-- tabeltotalrright end -->
</div>
</div>
<!-- tabeltotal end -->
<!-- tabel end-->

<!-- field start-->
<div style="width:100%; height:auto; margin:0px auto 0px auto; overflow:hidden;"">

<!-- paymentdetail start-->
<div class="payform">
<div style="width:100%; display:block; overflow:hidden;
padding:10px 0px 10px 0px;  box-shadow: 0px 0.5px 0px 0px #000; background:#000; ">
<label style="color:#FFF; margin:0px 0px 0px 10px; font-weight:bold; font-size:16px; text-decoration:underline;">PAYMENT DETAILS  </label>
</div>
<div style="width:100%; margin:20px 0px 0px 0px; display:block; ">
<label style="color:#000;  font-weight:bold; font-size:16px;">EXPENSE INCURRED  :</label>
<label id="lblprice" runat="server" style="color:#000;  font-weight:bold; font-size:16px;">15000</label>
  </div>
<div style="width:100%; margin:20px 0px 0px 0px; display:block; ">
<label style="color:#000;  font-weight:bold; font-size:16px;">AMOUNT COLLECTED :</label>
<label id="lblpay" runat="server" style="color:#000; font-weight:bold; font-size:16px;"></label>
<input type="text" runat="server" id="txtpay" placeholder="Enter the Amount" style="border:1px #000 solid; padding:3px 0px 3px 10px; font-size:16px; " />
</div>
<div style="width:100%; display:block; margin:20px 0px 0px 0px; ">
<label style="color:#000; font-weight:bold; font-size:16px;">DUE AMOUNT : </label>
<label id="txtdue" runat="server" runat="server" style="color:#F00; font-weight:bold; font-size:16px;">00</label>
</div>
<div style="width:100%; display:block; margin:20px 0px 0px 0px; ">
<input type="radio" id="rdbus" name="Agree" value="Business" /> Business Agreement
<input type="radio" id="rdcrm" name="Agree" value="CRM" /> CRM Agreement
</div>
</div>
<!-- paymentdetail end-->
<!-- staffdetail start-->
<div class="cusform">

<div style="width:100%; display:block; overflow:hidden;
padding:10px 0px 10px 0px;  box-shadow: 0px 0.5px 0px 0px #000; background:#000; ">
<label style="color:#FFF; margin:0px 0px 0px 10px; font-weight:bold; font-size:16px; text-decoration:underline;">RECEIVER DETAILS </label>
</div>
<div style="width:100%; margin:20px 0px 0px 0px; display:block; ">
<label style="color:#000;  font-weight:bold; font-size:16px;">NAME : </label>
<label id="lblcname" runat="server" style="padding:3px 0px 3px 10px; font-size:14px; font-weight:bold;" ></label>
<input id="txtcname" runat="server" type="text" placeholder="Enter theName" style="border:1px #000 solid; padding:3px 0px 3px 10px; font-size:14px; " />
  </div>
<div style="width:100%; margin:20px 0px 0px 0px; display:block; ">
<label style="color:#000;  font-weight:bold; font-size:16px;">NRIC :</label>
<label id="lblcnri" runat="server" style="padding:3px 0px 3px 10px; font-size:14px; font-weight:bold;" ></label>
<input id="txtcnri" runat="server" type="text" placeholder="Enter the NRIC" style="border:1px #000 solid; padding:3px 0px 3px 10px; font-size:14px; " />
</div>

<div style="width:100%; display:block; margin:20px 0px 0px 0px; ">
<label style="color:#000; font-weight:bold; font-size:16px;">CONTACT NUMBER :</label>
<label id="lblcno" runat="server" style="padding:3px 0px 3px 10px; font-size:14px; font-weight:bold;" ></label>
<input id="txtcno" runat="server" type="text" placeholder="Enter the Contact Number" style="border:1px #000 solid; padding:3px 10px 3px 10px; font-size:14px; " />
<label id="lblcnoerr" style="padding:3px 0px 3px 10px; font-size:14px; font-weight:bold; color:#F00;" ></label>
</div>

<div style="width:100%; display:block; margin:20px 0px 0px 0px; ">
<label style="color:#000; font-weight:bold; font-size:16px;">DATE :</label>
<label id="lblcdate" runat="server" style="padding:3px 0px 3px 10px; font-size:14px; font-weight:bold;" ></label>
<input id="txtcdate" runat="server" type="text" placeholder="Enter the Date" style="border:1px #000 solid; padding:3px 0px 3px 10px; font-size:14px; " />
</div>

<div style="width:100%; display:block; margin:20px 0px 0px 0px; ">
<label style="color:#000; font-weight:bold; font-size:16px;">SIGNATURE : </label>
 <img id="canvasimg" runat="server" style="border:none; width:250px; height:150px;"/>
<input type="button" id="Sig" name="Sig" value="Add SIGNATURE"/>
</div>
</div>
<!-- staffdetail end-->
<!-- customdetail start-->
<div class="staffform">
<div style="width:100%; display:block; overflow:hidden;
padding:10px 0px 10px 0px;  box-shadow: 0px 0.5px 0px 0px #000; background:#000; ">
<label style="color:#FFF; margin:0px 0px 0px 10px; font-weight:bold; font-size:16px; text-decoration:underline;">STAFF DETAILS </label>
</div>
<div style="width:100%; margin:20px 0px 0px 0px; display:block; ">
<label style="color:#000;  font-weight:bold; font-size:16px;">NAME : </label>
<label id="lblsname" runat="server" style="padding:3px 0px 3px 10px; font-size:14px; font-weight:bold;" ></label>
<input id="txtsname" runat="server" type="text" placeholder="Enter theName" style="border:1px #000 solid; padding:3px 0px 3px 10px; font-size:14px; " />
  </div>
<div style="width:100%; margin:20px 0px 0px 0px; display:block; ">
<label  style="color:#000;  font-weight:bold; font-size:16px;">NRIC :</label>
<label id="lblsnri" runat="server" style="padding:3px 0px 3px 10px; font-size:14px; font-weight:bold;" ></label>
<input type="text" id="txtsnri" runat="server" placeholder="Enter the NRIC" style="border:1px #000 solid; padding:3px 0px 3px 10px; font-size:14px; " />
</div>


<div style="width:100%; display:block; margin:20px 0px 0px 0px; ">
<label style="color:#000; font-weight:bold; font-size:16px;">CONTACT NUMBER :</label>
<label id="lblsno" runat="server" style="padding:3px 0px 3px 10px; font-size:14px; font-weight:bold;" ></label>
<input type="text" runat="server" id="txtsno" placeholder="Enter the Contact Number" style="border:1px #000 solid; padding:3px 10px 3px 10px; font-size:14px; " />
<label id="lblsnoerr" style="padding:3px 0px 3px 10px; font-size:14px; font-weight:bold; color:#F00;" ></label>
</div>

<div style="width:100%; display:block; margin:20px 0px 0px 0px; ">
<label style="color:#000; font-weight:bold; font-size:16px;">DATE :</label>
<label id="lblsdate" runat="server" style="padding:3px 0px 3px 10px; font-size:14px; font-weight:bold;" ></label>
<input id="txtsdate" runat="server" type="text" placeholder="Enter the Date" style="border:1px #000 solid; padding:3px 0px 3px 10px; font-size:14px; " />
</div>

<div style="width:100%; display:block; margin:20px 0px 0px 0px; ">
<label style="color:#000; font-weight:bold; font-size:16px;">SIGNATURE : </label>
 <img id="canvasimg1"  runat="server" style="border:none; width:250px; height:150px;"/>
<input type="button" id="Sig1" name="Sig1" value="Add SIGNATURE"/>
</div>
</div>
<!-- customdetail end-->

</div>
<!-- field end-->

<!-- footer start-->
<div style="display:block; width:100%; margin:20px 0px 0px 0px ; background:#014037; overflow:hidden; padding:5px 0px 5px 0px;">
<span style="color:#FFF; text-align:center; padding:0px 20px 0px 20px;  font-weight:bold; font-size:16px;">
ZERODOTONE • REGISTRATION NUMBER: 53262873W • 10 ANSON ROAD, #26-04, INTERNATIONAL PLAZA, SINGAPORE 079903 •  www.picgrantdeals.com
</span>
</div>
<!-- footer end-->

<!-- Bussness Agreement Start-->
<div id="Bussness" style="display:block; display:none; width:90%; padding:10px 10px 10px 10px;">

<h2 contenteditable="true" id="Agmade" class="fontupperjust">THIS AGREEMENT <span class="fontlowerjust">made on 28/June/2014 between:-</span></h2>
<br />
<br />
<p contenteditable="true" id="Agline1" class="fontlowerjust">(1) <span  class="fontboldupper">ZERODOTONE</span>  (RC No. 53262873W) of 10 Anson Road #26-04 International Plaza Singapore 169208 (hereinafter referred to as <span class="fontboldupper">“1ST PARTY”</span>); and</p>
<br />
<p contenteditable="true" id="Agline2" class="fontlowerjust">(2) <span  class="fontboldupper">XXYY (NRIC No. XXYY) </span>  of <span  class="fontboldupper"> XXYY</span>(hereinafter referred to as <span  class="fontboldupper"> “2ND PARTY”</span>).</p>
<br />
<br />
<h2 contenteditable="true" id="Agtop1" class="fontupperjust"><span style="text-decoration:underline;">WHEREAS</span> </h2>
<br />
<br />
<p contenteditable="true" id="top1line1" class="fontlowerjust">(a) The 1st Party provides Business, Software and Hardware Consultancy Services;</p>
<p contenteditable="true" id="top1line2" class="fontlowerjust">(b) The 2nd Party intends to purchase the Services of the 1st Party;</p>
<p contenteditable="true" id="top1line3" class="fontlowerjust">(c) The 1st Party will build and upload into the life server a Business Website and Business App as per the 2nd Party’s needs and with the features requested by the 2nd Party; and</p>
<p contenteditable="true" id="top1line4" class="fontlowerjust">(d) The 2nd Party will pay the 1st Party a total sum of S$XX,000.00 (deposit of S$XX,000.00to be paid on XX/XX/XXXX and the remainder of S$XX,000.00 to be paid on XX/XX/XXXX) for the above mentioned Services.</p>
<br />
<br />
<h2 contenteditable="true" id="Agtop2" class="fontupperjust"><span style="text-decoration:underline;">AND IT IS HEREBY AGREED AS FOLLOWS:-</span> </h2>
<br />
<h2 contenteditable="true" id="top2subtop1" class="fontupperjust">1.  <span style="text-decoration:underline;">BUSINESS WEBSITE & BUSINESS APP</span> </h2>
<br />
<p contenteditable="true" id="top2subtop1line1" class="fontlowerjust">(1.1) Upon the signing of this agreement and the collection of the deposit, the 1st Party will build and upload into the life server a Business Website and Business App as per the 2nd Party’s needs and with the features requested by the 2nd Party.</p>
<p contenteditable="true" id="top2subtop1line2" class="fontlowerjust">(1.2) Within 2 weeks of the collection of the deposit, the 1st Party will issue the user-id and password for the Business Website and Business App to the 2nd Party.</p>
<p contenteditable="true" id="top2subtop1line3" class="fontlowerjust">(1.3) Within 2 weeks of the collection of the deposit, the 1st Party will upload the Business Website and Business App into the life server.</p>
<p contenteditable="true" id="top2subtop1line4" class="fontlowerjust">(1.4) Upon the uploading of the Business Website and Business App into the life server, the 1st Party will maintain the Business Website and Business App for a period of one year free of charge. Any maintenance provided after this 1 year period will be chargeable (charges to be agreed between parties).</p>
<br />
<h2 contenteditable="true" id="top2subtop2" class="fontupperjust">2.  <span style="text-decoration:underline;">TERMS OF PAYMENT</span> </h2>
<br />
<p contenteditable="true" id="top2subtop2line1" class="fontlowerjust">(2.1) The 2nd Party will pay the 1st Party a total sum of S$XX,000.00 for the building and uploading of the Business Website and Business App into the life server.</p>
<p contenteditable="true" id="top2subtop2line2" class="fontlowerjust">(2.2) Upon the signing of this Agreement, the 2nd Party will pay the 1st Party a deposit of S$XX,000.00 on XX/XX/XX and the remainder of S$XX000.00 is to be paid on XX/XX/XXXX.</p>
<p contenteditable="true" id="top2subtop2line3" class="fontlowerjust">(2.3) If the remaining payment of S$XX,000.00 is not paid on XX/XX/XX by the 2nd Party, the 1st Party will take down the Business Website and the Business App and the deposit of S$1,000.00 will be forfeited.</p>
<p contenteditable="true" id="top2subtop2line4" class="fontlowerjust">(2.4) Upon full payment of the S$XX,000.00 by the 2nd Party, the 1st Party will hand over the full Administrative Control of the Business Website and Business App to the 2nd Party.</p>
<br />
<h2 contenteditable="true" id="top2subtop3" class="fontupperjust">3.  <span style="text-decoration:underline;">TERMS OF PAYMENT</span> </h2>
<br />
<p contenteditable="true" id="top2subtop3line1" class="fontlowerjust">(3.1) Upon full payment of the S$XX,000.00 by the 2nd Party, the 1st Party will provide the 2nd Party with hardware devices (laptop / smartphone / tablet)* as free gifts. These free hardware devices must be collected by the 2nd Party from the following vendor at the following address:-
 
NEWSTEAD TECHNOLOGIES PTE LTD
City Square Mall
180 Kitchener Road, #09-01/05
Singapore 208539
</p>
<p contenteditable="true" id="top2subtop3line2" class="fontlowerjust">(3.2) The 1st Party DOES NOT provide any warranties with regards to these complimentary hardware devices to the 2nd Party. The 2nd Party will have to look to the manufacture of the hardware devices for all hardware issues.</p>
<p contenteditable="true" id="top2subtop3line3" class="fontlowerjust">(3.3) The 1st Party is NOT LIABLE for any faults or issues with the complimentary hardware devices to the 2nd Party. The 2nd Party has to look to the manufacture of the hardware devices for all hardware issues.</p>
<p contenteditable="true" id="top2subtop3line4" class="fontlowerjust">*delete where applicable</p>
<br />
<h2 contenteditable="true" id="top2subtop4" class="fontupperjust">4.  <span style="text-decoration:underline;">TERMINATION OF THIS AGREEMENT</span> </h2>
<br />
<p contenteditable="true" id="top2subtop4line1" class="fontlowerjust">(4.1) Where the remaining payment of S$XX,000.00 is not paid on XX/XX/XXXX by the 2nd Party, the 1st Party will take down the Business Website and the Business App and the deposit of S$XX,000.00 will be forfeited.</p>
<p contenteditable="true" id="top2subtop4line2" class="fontlowerjust">(4.2) Where the remaining payment of S$XX,000.00 is not paid on XX/XX/XXXX by the 2nd Party, the 2nd Party is NOT ENTITLED to the Free Gifts and Complimentary Services found above. </p>
<br />
<br />
<p contenteditable="true" id="footertext" class="fontlowerjust"> <span  class="fontboldupper">IN WITNESS WHEREOF</span> this Agreement has been entered into on the date stated on the day and year above written.</p>
<br />
<br />
<div style=" display:inline-block; float:left; width:40%; ">
<p contenteditable="true" id="party1" class="fontlowerjust">The 1st Party</p>
<p contenteditable="true" id="p1" class="fontlowerjust">SIGNED BY:-</p>
<img id="staffsig"  runat="server" style="border:none; width:250px; height:150px;"/>
<input type="button" id="btnstaffsig"  value="Add SIGNATURE"/>
<p contenteditable="true" id="p3" class="fontboldupper">VIKNESWARAN DEVADAS </p>
<p contenteditable="true" id="p6" class="fontlowerjust">for and on behalf of</p>
<p contenteditable="true" id="p7" class="fontboldupper">ZERODOTONE </p>
</div>

<div style=" display:inline-block; float:left; width:40%; ">
<p contenteditable="true" id="party2" class="fontlowerjust">The 2st Party</p>
<p contenteditable="true" id="p2" class="fontlowerjust">SIGNED BY:-</p>
<img id="cussig"  runat="server" style="border:none; width:250px; height:150px;"/>
<input type="button" id="btnCussig"  value="Add SIGNATURE"/>
<p contenteditable="true" id="p4" class="fontboldupper">NAME: CONNIE LOH DAN LIN</p>
<p contenteditable="true" id="p5" class="fontboldupper">NRIC No.:  XXXX</p>
<p contenteditable="true" id="p8" class="fontlowerjust">for and on behalf of</p>
<p contenteditable="true" id="p9" class="fontboldupper">ZERODOTONE </p>

</div>
</div>
<!-- Bussness Agreement end-->
<!-- CRM Agreement Start-->
<div id="CRM" style="display:block; display:none; width:90%; padding:10px 10px 10px 10px;">
<h2 contenteditable="true" id="H1" class="fontupperjust">THIS AGREEMENT <span class="fontlowerjust">made on  XX/XX/XXXX between:-</span></h2>
<br />
<br />
<p contenteditable="true" id="P10" class="fontlowerjust">(1) <span  class="fontboldupper">ZERODOTONE</span>  (RC No. 53262873W) of 10 Anson Road #26-04 International Plaza Singapore 169208 (hereinafter referred to as <span class="fontboldupper">“1ST PARTY”</span>); and</p>
<br />
<p contenteditable="true" id="P11" class="fontlowerjust">(2) <span  class="fontboldupper">XXYY (NRIC No. XXYY) </span>  of <span  class="fontboldupper"> XXYY</span>(hereinafter referred to as <span  class="fontboldupper"> “2ND PARTY”</span>).</p>
<br />
<br />
<h2 contenteditable="true" id="H2" class="fontupperjust"><span style="text-decoration:underline;">WHEREAS</span> </h2>
<br />
<br />
<p contenteditable="true" id="P12" class="fontlowerjust">(a) The 1st Party provides Business, Software and Hardware Consultancy Services;</p>
<p contenteditable="true" id="P13" class="fontlowerjust">(b) The 2nd Party intends to purchase the Services of the 1st Party;</p>
<p contenteditable="true" id="P14" class="fontlowerjust">(c) The 1st Party will build and install a customized CRM software as per the 2nd Party’s needs and with the features requested by the 2nd Party in the existing  hardware (laptop / smart phone / tablet)* of the 2nd Party; and</p>
<p contenteditable="true" id="P15" class="fontlowerjust">(d) The 2nd Party will pay the 1st Party a total sum of S$XX,000.00 (deposit of S$300 to be paid on XX/XX/XXXX) and the (remainder of S$XX,XX to be paid on XX/XX/XXXX) for the above mentioned Software and Hardware Services.</p>
<br />
<br />
<h2 contenteditable="true" id="H3" class="fontupperjust"><span style="text-decoration:underline;">AND IT IS HEREBY AGREED AS FOLLOWS:-</span> </h2>
<br />
<h2 contenteditable="true" id="H4" class="fontupperjust">1.  <span style="text-decoration:underline;">CRM SOFTWARE</span> </h2>
<br />
<p contenteditable="true" id="P16" class="fontlowerjust">(1.1) Upon the signing of this agreement and the collection of the deposit, the 1st Party will build a customized CRM software as per the 2nd Party’s needs and with the features requested by the 2nd Party.</p>
<p contenteditable="true" id="P17" class="fontlowerjust">(1.2) Within 3 working days of the collection of the deposit, the 1st Party will issue the user-id and password for the customized CRM software to the 2nd Party.</p>
<p contenteditable="true" id="P18" class="fontlowerjust">(1.3) Within 2 weeks of the collection of the deposit, the 1st Party will install the customized CRM software in the existing hardware of the 2nd Party.</p>
<p contenteditable="true" id="P19" class="fontlowerjust">(1.4) Upon the installation of the customized CRM software in the existing hardware of the 2nd Party, the 1st Party will provide the 2nd Party with a User-Manual for the CRM software.</p>
<p contenteditable="true" id="P42" class="fontlowerjust">(1.5) Upon the installation of the customized CRM software in the existing hardware of the 2nd Party, should the 2nd Party require further assistance, he / she should book an appointment (at least 2 days in advance) through the “Contact Us” page on the website www.picgrantdeals.com or send an e-mail to it@picgrantdeals.com or call 94524354. Additional training will be provided by the 1st Party depending on the availability of the Training Executive.</p>
<p contenteditable="true" id="P43" class="fontlowerjust">(1.5) Upon the installation of the customized CRM software in the existing hardware of the 2nd Party, the 1st Party will test the software for any bugs and should any bugs arise, the 1st Party will provide assistance in fixing those bugs for a period of one year free of charge. Any assistance / services provided after this 1 year period will be chargeable (charges to be agreed between parties).</p>
<br />
<h2 contenteditable="true" id="H5" class="fontupperjust">2.  <span style="text-decoration:underline;">TERMS OF PAYMENT</span> </h2>
<br />
<p contenteditable="true" id="P20" class="fontlowerjust">(2.1) The 2nd Party will pay the 1st Party a total sum of S$15,000.00 for the customized CRM Software.</p>
<p contenteditable="true" id="P21" class="fontlowerjust">(2.2) Upon the signing of this Agreement, the 2nd Party will pay the 1st Party a deposit of S$XX on XX/XX/XXXX and the remainder of S$XXXX is to be paid on XX/ XX/XXXX.</p>
<p contenteditable="true" id="P22" class="fontlowerjust">(2.3) If the remaining payment of S$XX is not paid on XX/XX/XXXX by the 2nd Party, the 1st Party will block the usage of the customized CRM Software by the 2nd Party and a sum of $XX will be deducted for Administrative Charges and the remainder of the deposit of S$XX will be refunded.</p>
<p contenteditable="true" id="P23" class="fontlowerjust">(2.4) Upon full payment of the S$XX,000.00 by the 2nd Party, the 1st Party will hand over the full control of the customized CRM Software to the 2nd Party.</p>
<br />
<h2 contenteditable="true" id="H6" class="fontupperjust">3.  <span style="text-decoration:underline;">FREE GIFTS & COMPLIMENTARY SERVICES</span> </h2>
<br />
<p contenteditable="true" id="P24" class="fontlowerjust">(3.1) Upon full payment of the S$XXXX.00 by the 2nd Party, the 1st Party will provide the 2nd Party with hardware devices (laptop / smart phone / tablet)* as free gifts. These free hardware devices must be collected by the 2nd Party from the following vendor at the following address:-
 
 
NEWSTEAD TECHNOLOGIES PTE LTD
City Square Mall
180 Kitchener Road, #09-01/05
Singapore 208539

</p>
<p contenteditable="true" id="P25" class="fontlowerjust">(3.2) The 1st Party DOES NOT provide any warranties with regards to these complimentary hardware devices to the 2nd Party. The 2nd Party will have to look to the manufacture of the hardware devices for all hardware issues.</p>
<p contenteditable="true" id="P26" class="fontlowerjust">(3.3) The 1st Party is NOT LIABLE for any faults or issues with the complimentary hardware devices to the 2nd Party. The 2nd Party has to look to the manufacture of the hardware devices for all hardware issues.</p>
<p contenteditable="true" id="P44" class="fontlowerjust">(3.4) Where the 2nd Party is a Property agent at the time of signing this Agreement, the 1st Party will provide the 2nd Party with a COMPLIMENTARY Membership for a period of 1 year from the date of full payment or for a period of 1 year from the date of the expiry of the 2nd Party’s current membership with:-
 
(a) ST Property (Corporate Platinum); *
(b) SRX Enterprise (Investor); *
(c) Power Search Pro (PC & Homeloan PC); *
(d) Homebiz; * and
(e) Property Guru (Ultimate). *
</p>
<p contenteditable="true" id="P27" class="fontlowerjust">*delete where applicable</p>
<br />
<h2 contenteditable="true" id="H7" class="fontupperjust">4.  <span style="text-decoration:underline;">TERMINATION OF THIS AGREEMENT</span> </h2>
<br />
<p contenteditable="true" id="P28" class="fontlowerjust">(4.1) Where the remaining payment of S$XXXX is not paid on XX/XX/XXXX by the 2nd Party, the 1st Party will block the usage of the customized CRM Software by the 2nd Party and a sum of $100.00 will be deducted for Administrative Charges and the remainder of the deposit of S$200 will be refunded.</p>
<p contenteditable="true" id="P29" class="fontlowerjust">(4.2) Where the remaining payment of S$XXXX is not paid on XX/XX/XXXX by the 2nd Party, the 2nd Party is NOT ENTITLED to the Free Gifts and Complimentary Services found above.</p>
<br />
<h2 contenteditable="true" id="H8" class="fontupperjust">5.  <span style="text-decoration:underline;">CLIENT DATA PROTECTION</span> </h2>
<br />
<p contenteditable="true" id="P45" class="fontlowerjust">(5.1) The 1st Party will take reasonable steps to keep the information of the 2nd Party and the information provided by the 2nd Party secured. This shall not be construed as a guarantee by the 1st Party to the 2nd Party that the CRM System is impenetrable.</p>
<br />
<br />
<p contenteditable="true" id="P30" class="fontlowerjust"> <span  class="fontboldupper">IN WITNESS WHEREOF</span> this Agreement has been entered into on the date stated on the day and year above written.</p>
<br />
<br />
<div style=" display:inline-block; float:left; width:40%; ">
<p contenteditable="true" id="p31" class="fontlowerjust">The 1st Party</p>
<p contenteditable="true" id="p32" class="fontlowerjust">SIGNED BY:-</p>
<img id="Img3"  runat="server" style="border:none; width:250px; height:150px;"/>
<input type="button" id="Button3"  value="Add SIGNATURE"/>
<p contenteditable="true" id="p33" class="fontboldupper">VIKNESWARAN DEVADAS </p>
<p contenteditable="true" id="p34" class="fontlowerjust">for and on behalf of</p>
<p contenteditable="true" id="p35" class="fontboldupper">ZERODOTONE </p>
</div>

<div style=" display:inline-block; float:left; width:40%; ">
<p contenteditable="true" id="p36" class="fontlowerjust">The 2st Party</p>
<p contenteditable="true" id="p37" class="fontlowerjust">SIGNED BY:-</p>
<img id="crmcussig"  runat="server" style="border:none; width:250px; height:150px;"/>
<input type="button" id="crmbtnCussig"  value="Add SIGNATURE"/>
<p contenteditable="true" id="p38" class="fontboldupper">NAME: CONNIE LOH DAN LIN</p>
<p contenteditable="true" id="p39" class="fontboldupper">NRIC No.:  XXXX</p>
<p contenteditable="true" id="p40" class="fontlowerjust">for and on behalf of</p>
<p contenteditable="true" id="p41" class="fontboldupper">ZERODOTONE </p>
</div>
</div>
<!-- CRM Agreement end-->

<div style="display:block; width:100%; margin:40px auto 0px auto ; overflow:hidden; padding:5px 0px 5px 0px;">
    
<input type="button" id="print" name="PRINT" value="PRINT" style="border:none; background:#930; font-size:20px; padding:10px 10px 10px 10px; color:#FFF;"/>
<input type="button" id="submit" name="SUBMIT" value="SUBMIT" style="border:none; background:#930; font-size:20px; padding:10px 10px 10px 10px; color:#FFF;"/>
<%--<input type="button" id="UpdateData" name="Update" value="Update" style="border:none; background:#930; font-size:20px; padding:10px 10px 10px 10px; color:#FFF;"/>--%>
</div>

</div>
</div>
    </form>
</body>
</html>
