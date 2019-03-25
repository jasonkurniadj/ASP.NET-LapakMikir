<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Student/student.Master" AutoEventWireup="true" CodeBehind="student_studyReport.aspx.cs" Inherits="LapakMikir.Pages.Student.student_studyReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>LapakMikir | Study Report</title>
    <style type="text/css">
        .auto-style1 {
            width: 150px;
        }
        .auto-style9 {
            width: 4px;
        }
        .auto-style10 {
            width: 774px;
            height: 30px;
            padding-left: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:90%; margin-left: 10px;">
        <tr>
            <td class="auto-style1">Student ID</td>
            <td class="auto-style9">:</td>
            <td class="auto-style10">
                <asp:Label ID="lblStudentID" runat="server" Text="[studentID]"></asp:Label>
            </td>

        <tr>
            <td class="auto-style1">Full Name</td>
            <td class="auto-style9">:</td>
            <td class="auto-style10">
                <asp:Label ID="lblStudentName" runat="server" Text="[fullName]"></asp:Label>
            </td>
        </tr>

        <tr>
            <td class="auto-style1">Course</td>
            <td class="auto-style9">:</td>
            <td class="auto-style10">
                <asp:Label ID="lblCourseName" runat="server" Text="[selectedCourse]"></asp:Label>
            </td>
        </tr>
   </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="exerciseID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="exerciseID" HeaderText="exerciseID" ReadOnly="True" SortExpression="exerciseID" />
            <asp:BoundField DataField="score" HeaderText="score" ReadOnly="True" SortExpression="score" />
            <asp:BoundField DataField="exerciseDate" HeaderText="exerciseDate" SortExpression="exerciseDate" />
            <asp:BoundField DataField="status" HeaderText="status" ReadOnly="True" SortExpression="status" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConStr %>" SelectCommand="bn_student_getStudyReport" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="Email" SessionField="ActiveStudentEmail" Type="String" />
            <asp:SessionParameter Name="CourseName" SessionField="CurrentCourse" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
