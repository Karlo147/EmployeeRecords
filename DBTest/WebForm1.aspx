<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="DBTest.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script src="jquery.min.js"></script>
    <script type="text/javascript">
          //Create a function for Insert the data
         //In url write your page name like"Person.aspx".
        //Write jQuery Ajax to call WebMethod(InsertData).
 
        function SubmitData() {
            $.ajax({
                url: 'WebForm1.aspx/InsertData',//InsertData is a method name create in ".aspx.cs" page.
                type: 'post',
                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                data: "{Name:'" +$('#txtname').val()+ "',Address:'" + $('#txtaddress').val() + "',age:'" + $('#txtage').val() + "'}",
                success: function () {
                    alert("Data inserted successfully");
 
                },
                error:function(){
                    alert("insert errorr");
                }
 
            });
 
        }
 
    </script>
 
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
        <tr>
            <td>Name:</td>
            <td><input type="text" id="txtname" /></td>
        </tr>
        <tr>
            <td>Address:</td>
            <td><input type="text" id="txtaddress" /></td>
        </tr>
        <tr>
            <td>Age:</td>
            <td><input type="text" id="txtage" /></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="button" id="btnsave" value="Submit" onclick="SubmitData()" /></td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>

</asp:Content>
