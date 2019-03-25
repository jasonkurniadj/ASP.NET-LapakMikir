<%----------------------------------------
 -- Created by: Dar 
 -- Date: December 27th, 2018
 -- Purpose: First Page
----------------------------------------%>

<%@ Page Title="" Language="C#" MasterPageFile="Pages/Home/NavbarFooter.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebApplication2.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="bg">
    <h2 class="title">Start Learning Java & SQL Now</h2>
     
    <div class="courses">
        <a href="Pages/Home/JavaDesc.aspx" class="btn1">Java</a>
        <a href="Pages/Home/SqlDesc.aspx" class="btn2">SQL</a>
        <a href="Pages/Home/AdvJavaDesc.aspx" class="btn3">Advanced Java</a>
    </div>

    </div>
</asp:Content>
