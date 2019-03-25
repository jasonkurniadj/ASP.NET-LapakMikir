<%----------------------------------------
 -- Created by: Jason 
 -- Date: January 11st, 2018
 -- Purpose: Student change picture
----------------------------------------%>


<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student_changePicture_popUp.aspx.cs" Inherits="LapakMikir.Pages.Student.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link rel="stylesheet" type="text/css" href="~/Style/style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnDelete" runat="server" Text="Delete Profile Picture" CssClass="Btn FlexBtn" BackColor="Red" OnClick="btnDelete_Click" />

            <br /><br />
            <asp:FileUpload ID="uploadFile" runat="server" />

            <br /><br />
            <asp:Label ID="lblErrorMsg" runat="server" CssClass="FontRed" ></asp:Label><br />
            <asp:Button ID="btnChange" runat="server" Text="Change Picture" CssClass="Btn FlexBtn" OnClick="btnChange_Click" />
        </div>
    </form>
</body>
</html>
