<%----------------------------------------
 -- Created by: Jason 
 -- Date: December 27th, 2018
 -- Purpose: Student's forget password
----------------------------------------%>


<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student_forgetPassword_popUp.aspx.cs" Inherits="LapakMikir.Pages.Student.student_forgetPassword" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %> 

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LapakMikir | Forget Password</title>

    <link rel="stylesheet" type="text/css" href="~/Style/style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div style="width:50%;" class="MarginAuto">
            <h3 class="TextAlignCenter">Forget Password</h3>

            <div class="ClearTopBottom50px"></div>

            <p class="TextAlignCenter">Please Enter Your Email</p>
            <div class="TextAlignCenter">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="TextAlignCenter Width75p Font12pt" TextMode="Email"></asp:TextBox>
            </div>

            <div class="TextAlignCenter">
                <asp:Label ID="lblErrorMsg" runat="server" Text="" CssClass="FontRed MarginTop50px"></asp:Label><br />
            </div>
            <br />
            <div class="TextAlignCenter">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="Btn FlexBtn BorderRadius10px" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </form>
</body>
</html>
