<%@ page language="C#" autoeventwireup="true" inherits="login, App_Web_csijsg3o" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title>ZERODOTONE LOGIN</title>

<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://www.modernizr.com/downloads/modernizr-latest.js"></script>

<script src="Script/jquery1.10.2.js"></script>
<style>


#loader{
	position:fixed;
	margin:0 auto;
	left:0;
	right:0;
	top:80%;
	margin-top:-30px;
	width:60px;
	height:60px;
  list-style:none;
}

#loader li{
  background-color:#ffffff;
  width:10px;
  height:10px;
  float:left;
  margin-right:5px;
  box-shadow: 0px 80px 20px rgba(0,0,0,0.2);
}

@-webkit-keyframes 'laadbalk' {
	0%{
		height: 10px;
		margin-top: 25px;
	}
	50%{
		height:50px;
		margin-top: 0px;
	}
	100%{
		height: 10px;
		margin-top: 25px;
	}
}

#loader li:nth-child(1){
  -webkit-animation: laadbalk 0.6s ease-in-out infinite 0;
}
#loader li:nth-child(2){
  -webkit-animation: laadbalk 0.6s ease-in-out infinite -0.2s;
}
#loader li:nth-child(3){
  -webkit-animation: laadbalk 0.6s ease-in-out infinite -0.4s;
}


</style>
<script type="text/javascript">
    var loading = function (e) {
        e.preventDefault();
        e.stopPropagation();
        e.target.classList.add('loading');
        e.target.setAttribute('disabled', 'disabled');
        setTimeout(function () {
            e.target.classList.remove('loading');
            e.target.removeAttribute('disabled');
        }, 1500);
    };

    var btns = document.querySelectorAll('button');
    for (var i = btns.length - 1; i >= 0; i--) {
        btns[i].addEventListener('click', loading);
    }
</script>
 <script>

     $(document).ready(function () {
         $("#loader").hide();
         $("#submit").click(function () {
             $("#loader").show();
             var orgusername = $("#txtusername").val();
             var password = $("#txtpassword").val();

             if (orgusername != '' && password != '') {
                 $.ajax({
                     type: "POST",
                     contentType: "application/json; charset=utf-8",
                     url: "login.aspx/OrganaisationLogin",
                     data: "{'dorgusername':'" + orgusername + "','dpassword':'" + password + "'}",
                     dataType: "json",
                     success: function (data) {
                         var obj = data.d;
                         if (obj) {

                             window.location.href = "Invoice.aspx";
                         }
                         else {

                             window.location.href = "login.aspx";
                             alert("USERNAME PASSWORD IS WRONG");
                             $("#loader").hide();
                         }
                     }
                 });
             }
             else {
                 alert("ENTER USERNAME PASSWORD IS WRONG");
                 $("#loader").hide();
             }

         });
     });
</script>
</head>
<body>
    <form id="slicklogin" runat="server">
   <input type="text" runat="server" id="txtusername" name="username" placeholder="Username">
<input type="password" runat="server" id="txtpassword" name="password"  placeholder="password" style=" margin:20px 0px 20px 0px">
<input id="submit" type="button"  value="login" style=" background-color:#09C; border-radius:.25rem; font-size:16px; font-weight:bold; margin:20px 0px 0px 0px; color:#FFF; padding:5px 20px 5px 20px; border:none; ">


<ul id="loader">
  <li></li>
  <li></li>
  <li></li>

<ul>

    </form>

   
</body>
</html>
