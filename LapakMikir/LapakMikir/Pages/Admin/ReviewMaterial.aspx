<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReviewMaterial.aspx.cs" Inherits="WebApplication1.ReviewMaterial" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            margin: 0;
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
            background-image: url(../../Assets/content2.jpg);
            background-size:cover;
            height:450px;
        }
         .formcontent {
            position: absolute;
            margin-top: -210px;
            margin-left: -360px;
            left: 50%;top: 50%;
            width: 650px;
            height: 390px;
            background-color: black;
            color:white;
   	        opacity: 0.6;
	        border:4px solid white;
            border-radius: 3px 3px 3px;
        }
        .gridcontent {
            position: absolute;
            margin-top: 280px;
            top: 50%;
            text-align:center;
            left: 0px;
            width: 746px;
            left: 20%;
        }
        .text{
            float:left;
            margin-left: 80px;
            margin-top: 35px;
            font-weight:bold;
        }
        .ddl{
            float:right;
            margin-top:34px;
            height:25px;
            width:250px;
            margin-left:80px;
            border-radius:3px 3px 3px;
        }
        .mName{
            float:right;
            margin-top:34px;
            height:20px;
            width:250px;
            border-radius:3px 3px 3px;
        }
        .mDesc{
            float:right;
            margin-top:34px;
            height:70px;
            width:250px;
             border-radius:3px 3px 3px;
        }
        .upload{
            float:right;
            margin-top:34px;
            border-radius:3px 3px 3px;
        }
        .buttonsave{
            margin-top:20px;
            padding:4px;
            width:100px;
            background-color:white;
            color:black;
            cursor:pointer;
            border-radius:5px 5px 5px;
            margin-left:80px;
        }
        .buttondelete{    
            padding:4px;
            width:100px;
            background-color:white;
            color:black;
            cursor:pointer;
            border-radius:5px 5px 5px;
        }
        .buttoncancel{
            padding:4px;
            width:100px;
            background-color:white;
            color:black;
            cursor:pointer;
            border-radius:5px 5px 5px;
        }
       .buttonsave:hover{
             transition:0.4s;
             border-color:#00FF00;
             color:#32CD32;
            }
       .buttoncancel:hover{
             transition:0.4s;
             border-color:#0000CD;
             color:#00008B;
            }
       .buttondelete:hover{
           transition:0.4s;
           border-color:#FF0000;
           color:#8B0000;
       }
       .message{
           margin-left:80px;
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
    <div class="formcontent">
        <asp:hiddenfield ID="hfMaterial" runat="server"></asp:hiddenfield>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Course Name" class="text"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlCourse" runat="server" class="ddl">
                        <asp:ListItem>SQL</asp:ListItem>
                        <asp:ListItem>Advanced Java</asp:ListItem>
                        <asp:ListItem>Java</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
              <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Material Name" class="text"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtMaterialName" runat="server" Class="mName"></asp:TextBox>
                </td>
            </tr>
              <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Material Description" class="text"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtMaterialDesc" runat="server" TextMode="MultiLine" class="mDesc"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                     <asp:Label ID="Label4" runat="server" Text="Material File" class="text"></asp:Label>
                </td>
                <td>
                    <asp:FileUpload ID="FUpload" runat="server" class="upload"/>
                </td>
            </tr>
               <tr>
                <td>
                </td>
                <td>
                    <asp:Button ID="btnUpload" runat="server" Text="Save" OnClick="btnUpload_Click" class="buttonsave"/>
                     <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" class="buttondelete"/>
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" class="buttoncancel"/>
                </td>
            </tr>
             <tr>
                <td>
                  
                </td>
                <td>
                    <asp:Label ID="lblSuccessMessage" runat="server" Text="" ForeColor="Green" Font-Bold="true" Class="message"></asp:Label>
                </td>
                  <tr>
                <td>
                  
                </td>
                <td>
                    <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            </tr>
        </table>
        </div>
       </div>
        <br />
        <div class="gridcontent">
        <asp:GridView ID="gvMaterial" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvMaterial_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None" style="margin-left: 0px" Width="104%" Height="90px">
                 <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                 <Columns>
                    <asp:BoundField DataField ="Course" HeaderText="Course"/>
                    <asp:BoundField DataField ="MaterialName" HeaderText="MaterialName" />
                    <asp:BoundField DataField ="MaterialDesc" HeaderText="MaterialDesc" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="linkUpdate" runat="server" CommandArgument='<%# Eval("Id") %>' OnClick="lnk_OnClick">Update</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                 <EditRowStyle BackColor="#999999" />
                 <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                 <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                 <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                 <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                 <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                 <SortedAscendingCellStyle BackColor="#E9E7E2" />
                 <SortedAscendingHeaderStyle BackColor="#506C8C" />
                 <SortedDescendingCellStyle BackColor="#FFFDF8" />
                 <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
       </div>
    </form>
</body>
</html>
