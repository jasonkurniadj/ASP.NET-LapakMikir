<%----------------------------------------
 -- Created by: Jason 
 -- Date: December 28th, 2018
 -- Purpose: Student exercise/quiz page
----------------------------------------%>


<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Student/student.Master" AutoEventWireup="true" CodeBehind="student_exercise.aspx.cs" Inherits="LapakMikir.Pages.Student.student_excercise" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>LapakMikir | Excercise</title>
    <style type="text/css">
        .auto-style1 {
            width: 5%;
            height: 35px;
        }
        .auto-style2 {
            width: 65%;
            height: 35px;
        }
        .auto-style3 {
            width: 30%;
            height: 35px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="TextAlignCenter">
        <asp:Label ID="lblTitle" runat="server" Text="[title]" CssClass="FontXLarge MarginBottom10px"></asp:Label><br />
        <asp:Label ID="lblCode" runat="server" Text="[courseName]"></asp:Label>
    </div>

    <asp:Table ID="tblExercise" runat="server" CssClass="MarginAuto MarginTop50px" Width="90%">
        <asp:TableHeaderRow ID="tblheader" runat="server" BackColor="MidnightBlue">
            <asp:TableHeaderCell Scope="Column" Text="No." ForeColor="White" CssClass="auto-style1"></asp:TableHeaderCell>
            <asp:TableHeaderCell Scope="Column" Text="Question" ForeColor="White" CssClass="auto-style2"></asp:TableHeaderCell>
            <asp:TableHeaderCell Scope="Column" Text="Answer" ForeColor="White" CssClass="auto-style3"></asp:TableHeaderCell>
        </asp:TableHeaderRow>

        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Center">1.</asp:TableCell>
            <asp:TableCell><asp:Label ID="lblQuestion1" runat="server" Text="[question]"></asp:Label></asp:TableCell>
            <asp:TableCell>
                <asp:RadioButton ID="rbAnswer1A" runat="server" GroupName="rbgnAnswer1" Text="[answerA]" /><br />
                <asp:RadioButton ID="rbAnswer1B" runat="server" GroupName="rbgnAnswer1" Text="[answerB]" /><br />
                <asp:RadioButton ID="rbAnswer1C" runat="server" GroupName="rbgnAnswer1" Text="[answerC]" /><br />
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow BackColor="GradientActiveCaption">
            <asp:TableCell HorizontalAlign="Center">2.</asp:TableCell>
            <asp:TableCell><asp:Label ID="lblQuestion2" runat="server" Text="[question]"></asp:Label></asp:TableCell>
            <asp:TableCell>
                <asp:RadioButton ID="rbAnswer2A" runat="server" GroupName="rbgnAnswer2" Text="[answerA]" /><br />
                <asp:RadioButton ID="rbAnswer2B" runat="server" GroupName="rbgnAnswer2" Text="[answerB]" /><br />
                <asp:RadioButton ID="rbAnswer2C" runat="server" GroupName="rbgnAnswer2" Text="[answerC]" /><br />
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Center">3.</asp:TableCell>
            <asp:TableCell><asp:Label ID="lblQuestion3" runat="server" Text="[question]"></asp:Label></asp:TableCell>
            <asp:TableCell>
                <asp:RadioButton ID="rbAnswer3A" runat="server" GroupName="rbgnAnswer3" Text="[answerA]" /><br />
                <asp:RadioButton ID="rbAnswer3B" runat="server" GroupName="rbgnAnswer3" Text="[answerB]" /><br />
                <asp:RadioButton ID="rbAnswer3C" runat="server" GroupName="rbgnAnswer3" Text="[answerC]" /><br />
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow BackColor="GradientActiveCaption">
            <asp:TableCell HorizontalAlign="Center">4.</asp:TableCell>
            <asp:TableCell><asp:Label ID="lblQuestion4" runat="server" Text="[question]"></asp:Label></asp:TableCell>
            <asp:TableCell>
                <asp:RadioButton ID="rbAnswer4A" runat="server" GroupName="rbgnAnswer4" Text="[answerA]" /><br />
                <asp:RadioButton ID="rbAnswer4B" runat="server" GroupName="rbgnAnswer4" Text="[answerB]" /><br />
                <asp:RadioButton ID="rbAnswer4C" runat="server" GroupName="rbgnAnswer4" Text="[answerC]" /><br />
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell HorizontalAlign="Center">5.</asp:TableCell>
            <asp:TableCell><asp:Label ID="lblQuestion5" runat="server" Text="[question]"></asp:Label></asp:TableCell>
            <asp:TableCell>
                <asp:RadioButton ID="rbAnswer5A" runat="server" GroupName="rbgnAnswer5" Text="[answerA]" /><br />
                <asp:RadioButton ID="rbAnswer5B" runat="server" GroupName="rbgnAnswer5" Text="[answerB]" /><br />
                <asp:RadioButton ID="rbAnswer5C" runat="server" GroupName="rbgnAnswer5" Text="[answerC]" /><br />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <div class="TextAlignCenter" style="margin:50px;">
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="Btn FlexBtn BorderRadius10px" OnClick="btnSubmit_Click"/>
    </div>
</asp:Content>
