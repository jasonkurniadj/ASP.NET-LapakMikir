<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Student/student.Master" AutoEventWireup="true" CodeBehind="student_dashboard.aspx.cs" Inherits="LapakMikir.Pages.Student.student_dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>LapakMikir | Dashboard</title>
    <style type="text/css">
        .auto-style1 {
            width: 150px;
        }
        .auto-style2 {
            width: 375px;
            height: 30px;
            padding-left: 10px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:90%; margin-left: 10px;">
        <asp:Label ID="lblStudentName" runat="server" Text="Welcome,[fullName]!"></asp:Label>

        <tr>
            <td rowspan="4" class="auto-style10">
                <asp:Image ID="imgProfile" runat="server" Height="150px" Width="150px" />
            </td>
            <td class="auto-style1">Current Course</td>
            <td>:</td>
            <td class="auto-style2">
                <asp:Label ID="lblCourseName" runat="server" Text="[selectedCourse]"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Course Progress</td>
            <td>:</td>
            <td class="auto-style2">
                <asp:Label ID="lblCourseProgress" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
