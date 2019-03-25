<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WelcomeAdmin.aspx.cs" Inherits="WebApplication1.WelcomeAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body{
            margin:0;
        }
        .navbar {
            background-color:#333;
            width:100%;
            height:90px;
            overflow:hidden;
        }
       .navbar h2 {
            color:white;
            float:left;
            margin-left:20px;
            border:2px solid #fff;
            padding:10px;
        }
        .navbar #btnLogout{
            float:right;
        }
         .navbar #lblUserDetail{
            float:right;
            color:white;
        }
        .content{
            margin-top:70px;
        }
         .content h2{
             text-align:center;
         }
         .content #btnViewStudent{
             float:right;
             margin-right:60px;
             margin-top:10px;
             width:140px;
             height:40px;
             cursor:pointer;
             border-radius:5px 5px 5px;
         }
        .content #btnViewStudent:hover {
            border-color:white;
            background-color:#333;
            color:white;
            transition:0.4s;
            }
         .content #btnManage {
            float:right;   
            margin-right:60px;
            margin-top:20px;
            width:140px;
            height:40px;
            cursor:pointer;
            border-radius:5px 5px 5px;
         }
         .content #btnManage:hover{
            border-color:white;
            background-color:#333;
            color:white;
            transition:0.4s;
         }
         .content #lblUserStatic{
             float:left;
             margin-left:60px;
             font-size:18px;
             font-weight:bold;
             margin-top:18px;
         }
          .content #lblLearning{
             float:left;
             margin-left:60px;
             font-size:18px;
             font-weight:bold;
              margin-top:40px;
         }
        .navbar .button{
            margin-right:50px;
            margin-top:30px;
            padding:8px;
            width:100px;
            background-color:white;
            color:black;
            cursor:pointer;
            border-radius:5px 5px 5px;
        }
         .navbar .button:hover {
            border-color:white;
            background-color:#333;
            color:white;
            transition:0.4s;
            }
        .navbar .label{
            margin-right:20px;
            margin-top:30px;
            padding:8px;
            font-size:18px;
        }
        .background {
        padding:1px;
        background-image: url(../../Assets/content.jpg);
        background-size:cover;
        height:550px;
        }
        .formcontent {
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="navbar">
        <h2>Lapak Mikir</h2>
        <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" class="button"/>
        <asp:Label ID="lblUserDetail" runat="server" Text="" class="label"></asp:Label>
    </div>
       <div class="background">
        <div class ="formcontent">
        <div class ="content">
            <h2>
                <asp:Label ID="lblWelcome" runat="server"></asp:Label>
            </h2>
                <asp:label ID="lblUserStatic" runat="server" text="">User Statistics :</asp:label>
                <asp:Button ID="btnViewStudent" runat="server" Text="View Student"/>
                <br /><br />
            <asp:label ID="lblLearning" runat="server" text="">Learning Resources :</asp:label>
            <asp:Button ID="btnManage" runat="server" Text="Manage Resources" OnClick="btnManage_Click"/>
        </div>
       </div>
      </div>
    </form>
</body>
</html>
