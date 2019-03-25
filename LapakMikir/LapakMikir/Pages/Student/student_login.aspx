<%----------------------------------------
 -- Created by: Jason 
 -- Date: December 24th, 2018
 -- Purpose: Student login page
----------------------------------------%>


<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student_login.aspx.cs" Inherits="LapakMikir.Pages.Student.student_login" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %> 

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LapakMikir | Login</title>

    <link rel="stylesheet" type="text/css" href="~/Style/style.css" />
    <link rel="stylesheet" type="text/css" href="~/Style/student_loginRegister.css" />

    <style type="text/css">
        .auto-style1 {
            width: 125px;
        }
    </style>
</head>
<body>
    <%--<header class="Header FontXLarge">
        LapakMikir
    </header>--%>

    <div class="Background"></div>

    <form id="form1" runat="server">
        <div id="LoginForm" class="Form">
            <h3 class="TextAlignCenter">Login</h3>

            <table style="margin:auto;">
                <tr>
                    <td class="auto-style1">Email</td>

                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" Width="215px" TextMode="Email" BackColor="transparent"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style1">Password</td>

                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" Width="215px" TextMode="Password" BackColor="transparent"></asp:TextBox>
                    </td>
                </tr>
            </table>
        
            <div class="TextAlignCenter ClearTopBottom50px">
                <asp:Label ID="lblErrorMsg" runat="server" Text="" CssClass="FontRed"></asp:Label><br />
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="Btn FlexBtn BorderRadius10px" OnClick="btnLogin_Click" />
            </div>

            <p class="TextAlignCenter">Don't have an account yet? <a href="student_register.aspx">Click here</a> to register!</p>
            <p ID="lblForgetPassword" class="TextAlignCenter" runat="server"><a href="student_forgetPassword.aspx">Forget password</a>?</p>

            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <cc1:ModalPopupExtender ID="popupForgetPassword" runat="server" PopupControlID="Panel1" TargetControlID="lblForgetPassword" CancelControlID="btnCancel" BackgroundCssClass="BgGrey"></cc1:ModalPopupExtender>
        </div>

        <asp:Panel ID="Panel1" runat="server" BackColor="White" align="center" BorderColor="MidnightBlue" BorderStyle="Solid" Width="50%" Height="45%">
            <iframe ID="if1" runat="server" src="student_forgetPassword_popUp.aspx" width="99%" height="80%"></iframe>
            <br />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="Btn FlexBtn BorderRadius10px" />
        </asp:Panel>
    </form>
</body>
</html>
