<%----------------------------------------
 -- Created by: Jason 
 -- Date: January 10th, 2018
 -- Purpose: Student security question
----------------------------------------%>


<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student_securityQuestion_popUp_fill.aspx.cs" Inherits="LapakMikir.Pages.Student.student_securityQuestion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link rel="stylesheet" type="text/css" href="~/Style/style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="TextAlignCenter MarginAuto Width75p">
            <h2>Your Security Question:</h2>

            <asp:Label ID="lblSecurityQuestion" runat="server" Text="[securityQuestion]" CssClass="FontMedium"></asp:Label>
            <br />
            <asp:TextBox ID="txtAnswer" runat="server" CssClass="TextAlignCenter Width75p Font12pt"></asp:TextBox>
            <br />

            <div class="ClearTopBottom50px"></div>

            <asp:Label ID="lblErrorMsg" runat="server"></asp:Label>
            <br />
            <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" CssClass="Btn FlexBtn BorderRadius10px" BackColor="Red" OnClick="btnChangePassword_Click"/>
        </div>
    </form>
</body>
</html>
