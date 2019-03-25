<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student_register.aspx.cs" Inherits="LapakMikir.Pages.Student.student_register" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lapak Mikir | Register</title>

    <link rel="stylesheet" type="text/css" href="~/Style/style.css" />
    <link rel="stylesheet" type="text/css" href="~/Style/student_loginRegister.css" />

    <style type="text/css">
        .auto-style1 {
            width: 125px;
        }
        .auto-style2 {
            width: 190px;
        }
    </style>
</head>
<body>
    <%--<header class="Header FontXLarge">
        LapakMikir
    </header>--%>

    <div class="Background"></div>

    <form id="form1" runat="server">
        <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></cc1:ToolkitScriptManager>

        <div id="RegisterForm" class="Form">
            <table class="MarginAuto">
                <h3 class="TextAlignCenter MarginBottom10px">Register</h3>

                <tr>
                    <td class="auto-style2">Full Name</td>
                    <td class="auto-style1">
                        <asp:textbox id="txtName" runat="server" width="20em"></asp:textbox>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">Email</td>
                    <td class="auto-style1">
                        <asp:textbox id="txtEmail" runat="server" width="20em" TextMode="Email"></asp:textbox>
                    </td>
                </tr>    

                <tr>
                    <td class="auto-style2">Secondary Email</td>
                    <td class="auto-style1">
                        <asp:textbox id="txtSecEmail" runat="server" width="20em" TextMode="Email"></asp:textbox>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style1">Date of Birth</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtDOB" runat="server" Width="18em" ReadOnly="true" ></asp:TextBox>
                        <%--<asp:ImageButton ID="imgbtnCalendar" runat="server" ImageUrl="~/Assets/Calendar.png" Width="22px" />
                        <cc1:CalendarExtender ID="calDOB" runat="server" TargetControlID="txtDOB" PopupButtonID="imgbtnCalendar" Format="yyyy/MM/dd"></cc1:CalendarExtender>--%>

                        <asp:Calendar ID="calDOB" runat="server" OnSelectionChanged="calDOB_SelectionChanged"></asp:Calendar>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">Password</td>
                    <td class="auto-style1">
                        <asp:textbox id="txtPassword" textmode="Password" runat="server" width="20em"></asp:textbox>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">Confirm password</td>
                    <td class="auto-style1">
                        <asp:textbox id="txtConfirmPassword" textmode="Password" runat="server" width="20em"></asp:textbox>
                    </td>
                </tr>

                <tr>
                <td class="auto-style2">Security Question</td>
                    <td class="auto-style1">
                        <asp:dropdownlist id="ddlSecurityQuestion" runat="server" width="20em" height="30px" DataSourceID="SqlDataSource1" DataTextField="accSecurityQuestion" DataValueField="accSecurityQuestion">
                            <asp:listitem Value="None">Select a question</asp:listitem>
                        </asp:dropdownlist>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConStr %>" SelectCommand="SELECT [accSecurityQuestion] FROM [msSecurityQuestion]"></asp:SqlDataSource>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">Answer</td>
                    <td class="auto-style1">
                        <asp:textbox id="txtSecurityAnswer" runat="server" Width="20em"></asp:textbox>
                    </td>
                </tr>

                <tr>
                    <td colspan="2" class="TextAlignCenter">
                        <div class="MarginTop25px"></div>
                        <asp:Label ID="lblErrorMsg" runat="server" CssClass="FontRed"></asp:Label><br />
                        <div class="MarginBottom10px"></div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="TextAlignCenter">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="BtnSubmit_Click" CssClass="Btn FixBtn BorderRadius10px MarginRight5p" />
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="Btn FixBtn BorderRadius10px" />
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
