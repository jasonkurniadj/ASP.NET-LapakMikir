<%----------------------------------------------
 -- Created by: Jason 
 -- Date: December 29th, 2018
 -- Purpose: Student change course pop-up page
-----------------------------------------------%>


<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student_changeCourse_popUp.aspx.cs" Inherits="LapakMikir.Pages.Student.student_changeCourse_popUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link rel="stylesheet" type="text/css" href="~/Style/style.css" />
    <style type="text/css">
        .auto-style1 {
            width: 250px;
            height: 30px;
        }
        .auto-style2 {
            width: 175px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table style="width:auto; height:50px;">
            <tr>
                <td class="auto-style1">Current Course</td>
                <td>:</td>
                <td class="auto-style2">
                    <asp:Label ID="lblCurrentCourse" runat="server" Text="[currentCourse]"></asp:Label>
                </td>
            </tr>

            <tr>
                <td class="auto-style1">Change to</td>
                <td>:</td>
                <td class="auto-style2">
                    <asp:DropDownList ID="ddlCourse" runat="server" Height="25px" Width="175px" DataSourceID="SqlDataSource1" DataTextField="courseName" DataValueField="courseName">
                        <asp:ListItem Selected="True" Value="Error">ERROR!!!</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConStr %>" SelectCommand="SELECT [courseName] FROM [msCourse] WHERE ([courseName] NOT LIKE @courseName)">
                        <SelectParameters>
                            <asp:SessionParameter Name="courseName" SessionField="CurrentCourse" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>

            <tr>
                <td colspan="3" class="TextAlignCenter FontPrimary" style="margin-top:20px;">
                    <asp:Label ID="lblSuccessMessage" runat="server"></asp:Label>
                </td>
            </tr>

            <tr>
                <td colspan="3" class="TextAlignCenter FontRed" style="margin-top:20px;">
                    <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>
                </td>
            </tr>

            <tr>
                <td colspan="3" class="TextAlignCenter" style="margin-top:20px;">
                    <asp:Button ID="btnChange" runat="server" Text="Change" CssClass="Btn FlexBtn BorderRadius10px MarginPadding0 MarginTop25px" OnClick="btnChange_Click"/>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
