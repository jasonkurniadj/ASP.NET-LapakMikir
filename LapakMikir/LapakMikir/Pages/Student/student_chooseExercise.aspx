<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Student/student.Master" AutoEventWireup="true" CodeBehind="student_chooseExercise.aspx.cs" Inherits="LapakMikir.Pages.Student.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="TextAlignCenter">
        <asp:Button ID="btnExercise1" runat="server" Text="Exercise 1" CssClass="Btn FlexBtn MarginTop50px" OnClick="btnExercise1_Click" /><br />
        <asp:Button ID="btnExercise2" runat="server" Text="Exercise 2" CssClass="Btn FlexBtn MarginTop25px" OnClick="btnExercise2_Click" /><br />
        <asp:Button ID="Quiz" runat="server" Text="QUIZ" CssClass="Btn FlexBtn MarginTop25px" BackColor="Red" OnClick="Quiz_Click" /><br />

        <asp:Label ID="lblErrorMsg" runat="server" CssClass="TextAlignCenter FontRed MarginTop50px"></asp:Label>
    </div>
</asp:Content>
