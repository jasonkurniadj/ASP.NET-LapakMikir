<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_login.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LapakMikir | Admin Login</title>
    <style>
        body{
	    background-image: url(../../Assets/login.jpg);
        background-size:cover;
        }
        .formclass {
        position: absolute;
        margin-top: -120px;
        margin-left: -200px;
        left: 50%;top: 50%;
        width: 450px;
        height: 300px;
        background-color: black;
        color:white;
   	    opacity: 0.6;
	    border:4px solid white;
        border-radius: 3px 3px 3px;
        }
        .input {
        text-align: center;
	    padding: 9px;
        width: 280px;
	    margin-top:10px;
        margin-left:75px;
        border-radius:6px 6px 6px;
        }
        .login{
        padding: 10px;   
        margin-left:150px;
        margin-top:15px;
        width:150px;
        border-radius:10px 10px 10px;
        background-color:white;
        color:black;
        cursor:pointer;
        }
        .login:hover{  
        border-color:white;    
        background-color:black;
        color:white;
        transition:0.5s;
        }
        h2 {
        text-align:center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="formclass">
        <h2>Login Admin</h2>
        <asp:TextBox ID="txtUser" class="input" placeholder="Username" runat="server"></asp:TextBox>
        <br /><br />
        <asp:TextBox ID="txtPass" class="input" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox>
        <br /><br />
        <asp:Button ID="btnLogin"  class="login" runat="server" Text="Login" OnClick="btnLogin_Click" />
    </div>
    </form>
</body>
</html>
