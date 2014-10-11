<%@ page language="C#" autoeventwireup="true" inherits="ADMIN_ADMIN, App_Web_tp1vgith" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ADMIN</title>
    <script src="../Script/jquery1.10.2.js"></script>
    <script>

        $(document).ready(function () {
            $("#tempsub").show();
            $("#tempedit").hide();

            //            $("#tempedit").click(function () {
            //                $("#tempsub").show();
            //                $("#tempedit").hide();
            //                $.ajax({
            //                    type: 'POST',
            //                    url: 'ADMIN.aspx/Update',
            //                    data: '{ "Tempname" : "' + Delete + '" }',
            //                    contentType: 'application/json; charset=utf-8',
            //                    dataType: 'json',
            //                    success: function (data) {
            //                        alert(data.d);
            //                        document.location.href = "ADMIN.aspx";
            //                    },
            //                    error: function (result) {
            //                        alert(result.d);
            //                    }
            //                });
            //            });

            $("a[name=EDIT]").click(function () {
                $("#form1").scrollTop(0);
                var tempname = $(this).data("tempname");
                var proname = $(this).data("proname");
                var prodec = $(this).data("prodec");
                var proprice = $(this).data("proprice");
                $("#tempname").val(tempname);
                $("#proname").val(proname);
                $("#prodec").val(prodec);
                $("#proprice").val(proprice);
                $("#tempsub").hide()
                $("#tempedit").show();
            });

            $("a[name=DELETE]").click(function () {
                var Delete = $(this).data("delete");
                $.ajax({
                    type: 'POST',
                    url: 'ADMIN.aspx/delete',
                    data: '{ "Tempname" : "' + Delete + '" }',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        alert(data.d);
                        document.location.href = "ADMIN.aspx";
                    },
                    error: function (result) {
                        alert(result.d);
                    }
                });
            });

            $("#tempsub").click(function () {
                $.ajax({
                    type: 'POST',
                    url: 'ADMIN.aspx/Templatea',
                    data: '{ "Tempname" : "' + $("#tempname").val() + '" , "proname" : "' + $("#proname").val() + '" , "prodes" : "' + $("#prodec").val() + '", "proprice" : "' + $("#proprice").val() + '" }',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        alert(data.d);
                        document.location.href = "ADMIN.aspx";
                    },
                    error: function (result) {
                        alert(result.d);
                    }
                });
            });

            $("#staffsub").click(function () {
                $.ajax({
                    type: 'POST',
                    url: 'ADMIN.aspx/Staff',
                    data: '{ "staffid" : "' + $("#staffid").val() + '" , "staffname" : "' + $("#staffname").val() + '" , "staffnric" : "' + $("#staffnric").val() + '", "staffcontact" : "' + $("#staffcontact").val() + '", "staffpass" : "' + $("#staffpassword").val() + '" }',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        alert(data.d);
                        document.location.href = "ADMIN.aspx";
                    },
                    error: function (result) {
                        alert(result.d);
                    }
                });
            });
        });
    </script>
</head>
<body style="margin: 0px; padding: 10px;">
    <form id="form1" runat="server">
    <div style="display: block; width: 100%; background-color: #FFF;">
        <h2>
            TEMPLATE</h2>
        <br />
        <label>
            Template Name</label>
        <input type="text" id="tempname" name="temp" placeholder="Template Name" /><br />
        <label>
            Project Name</label>
        <input type="text" id="proname" name="temp" placeholder="Project Name" /><br />
        <label>
            Project Description</label>
        <br />
        <textarea id="prodec" name="temp" runat="server" style="width: 99%; border: 1px solid #CCC;
            overflow: auto; resize: none; height: 250px; font-size: 16px; font-weight: bold;">Product Description :</textarea><br />
        <label>
            Project Price</label><input type="text" id="proprice" name="temp" placeholder="Project Price" /><br />
        <input type="button" id="tempsub" style="display: none;" name="tempsub" value="SubmitTemplate" /><br />
        <input type="button" id="tempedit" style="display: none;" name="tempsub" value="EditTemplate" /><br />
        <br />
        <br />
        <h2>
            STAFF DETAILS</h2>
        <br />
        <label>
            STAFF ID</label>
        <input type="text" id="staffid" placeholder="STAFF ID" /><br />
        <label>
            STAFF Name</label>
        <input type="text" id="staffname" placeholder="STAFF Name" /><br />
        <label>
            STAFF NRIC</label>
        <input type="text" id="staffnric" placeholder="STAFF NRIC" /><br />
        <label>
            STAFF Contactnumber</label>
        <input type="text" id="staffcontact" placeholder="STAFF Contactnumber" /><br />
        <label>
            STAFF Password</label>
        <input type="password" id="staffpassword" placeholder="STAFF Password" /><br />
        <input type="button" id="staffsub" name="staffsub" value="SubmitStaff" />
    </div>
    <div id="tempdata" style="display: block; width: 100%; background-color: #FFF; margin: 10px 0px;
        padding: 10px;">
        <table align="center" cellpadding="5" cellspacing="5" border="1" style="width: 90%;
            border: 1px solid #CCC">
            <tr align="center" style="background-color: #333; color: #FFF; box-shadow: 0px 0px 30px 0px #000;">
                <td style="background-color: #014037;">
                    <span style="color: #FFF; padding: 10px 10px 10px 10px;">Template ID</span>
                </td>
                <td style="background-color: #014037;">
                    <span style="color: #FFF; padding: 10px 10px 10px 10px;">Template Name</span>
                </td>
                <td style="background-color: #014037;">
                    <span style="color: #FFF; padding: 10px 10px 10px 10px;">Project Name</span>
                </td>
                <td style="background-color: #014037;">
                    <span style="color: #FFF; padding: 10px 10px 10px 10px;">Project Description</span>
                </td>
                <td style="background-color: #014037;">
                    <span style="color: #FFF; padding: 10px 10px 10px 10px;">Project Price</span>
                </td>
                <%--  <td style="background-color: #014037;">
                    <span style="color: #FFF; padding: 10px 10px 10px 10px;">Edit</span>
                </td>--%>
                <td style="background-color: #014037;">
                    <span style="color: #FFF; padding: 10px 10px 10px 10px;">Delete</span>
                </td>
            </tr>
            <asp:Repeater ID="Invoicesale" runat="server">
                <ItemTemplate>
                    <tr align="center" style="color: #000;">
                        <td style="padding: 0px 0px 0px 0px; overflow: hidden; padding: 10px 10px 10px 10px;">
                            <%#Eval("TempID")%>
                        </td>
                        <td style="padding: 0px 0px 0px 0px; overflow: hidden; padding: 10px 10px 10px 10px;">
                            <%#Eval("Tempname")%>
                        </td>
                        <td style="padding: 0px 0px 0px 0px; overflow: hidden; padding: 10px 10px 10px 10px;">
                            <%#Eval("ProjectName")%>
                        </td>
                        <td style="padding: 0px 0px 0px 0px; overflow: hidden; padding: 10px 10px 10px 10px;">
                            <%#Eval("ProjectDec")%>
                        </td>
                        <td style="padding: 0px 0px 0px 0px; overflow: hidden; padding: 10px 10px 10px 10px;">
                            <%#Eval("ProjectPrice")%>
                        </td>
                        <%--<td style="padding: 0px 0px 0px 0px; overflow: hidden; padding: 10px 10px 10px 10px;">
                            <a href="#" name="EDIT" data-tempname="<%#Eval("Tempname")%>" data-proname="<%#Eval("ProjectName")%>"
                                data-prodec="<%#Eval("ProjectDec")%>" data-proprice="<%#Eval("ProjectPrice")%>"
                                value="Edit">Edit</a>
                        </td>--%>
                        <td style="padding: 0px 0px 0px 0px; overflow: hidden; padding: 10px 10px 10px 10px;">
                            <a href="#" value="Delete" name="DELETE" data-delete="<%#Eval("Tempname")%>">Delete</a>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </div>
    <%-- <div id="Staffdata" style="display: block; width: 100%; background-color: #FFF; margin: 10px 0px;
        padding: 10px;" >
        <table align="center" cellpadding="5" cellspacing="5" border="1" style="width: 90%;
            border: 1px solid #CCC">
            <tr align="center" style="background-color: #333; color: #FFF; box-shadow: 0px 0px 30px 0px #000;">
                <td style="background-color: #014037;">
                    <span style="color: #FFF; padding: 10px 10px 10px 10px;">Template Name</span>
                </td>
                <td style="background-color: #014037;">
                    <span style="color: #FFF; padding: 10px 10px 10px 10px;">Project Name</span>
                </td>
                <td style="background-color: #014037;">
                    <span style="color: #FFF; padding: 10px 10px 10px 10px;">Project</span>
                </td>
                <td style="background-color: #014037;">
                    <span style="color: #FFF; padding: 10px 10px 10px 10px;">Project Price</span>
                </td>
              <%--  <td style="background-color: #014037;">
                    <span style="color: #FFF; padding: 10px 10px 10px 10px;">Edit</span>
                </td>
                <td style="background-color: #014037;">
                    <span style="color: #FFF; padding: 10px 10px 10px 10px;">Delete</span>
                </td>
            </tr>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <tr align="center" style="color: #000;">
                        <td style="padding: 0px 0px 0px 0px; overflow: hidden; padding: 10px 10px 10px 10px;">
                            <%#Eval("Tempname")%>
                        </td>
                        <td style="padding: 0px 0px 0px 0px; overflow: hidden; padding: 10px 10px 10px 10px;">
                            <%#Eval("ProjectName")%>
                        </td>
                        <td style="padding: 0px 0px 0px 0px; overflow: hidden; padding: 10px 10px 10px 10px;">
                            <%#Eval("ProjectDec")%>
                        </td>
                        <td style="padding: 0px 0px 0px 0px; overflow: hidden; padding: 10px 10px 10px 10px;">
                            <%#Eval("ProjectPrice")%>
                        </td>
                        <%--<td style="padding: 0px 0px 0px 0px; overflow: hidden; padding: 10px 10px 10px 10px;">
                            <a href="#" name="EDIT" data-tempname="<%#Eval("Tempname")%>" data-proname="<%#Eval("ProjectName")%>"
                                data-prodec="<%#Eval("ProjectDec")%>" data-proprice="<%#Eval("ProjectPrice")%>"
                                value="Edit">Edit</a>
                        </td>
                        <td style="padding: 0px 0px 0px 0px; overflow: hidden; padding: 10px 10px 10px 10px;">
                            <a href="#" value="Delete" name="DELETE" data-delete="<%#Eval("Tempname")%>">Delete</a>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
        </div>--%>
    </form>
</body>
</html>
