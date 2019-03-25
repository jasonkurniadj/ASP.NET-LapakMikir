<%----------------------------------------
 -- Created by: Jason 
 -- Date: December 29th, 2018
 -- Purpose: Student account setting page
----------------------------------------%>


<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Student/student.Master" AutoEventWireup="true" CodeBehind="student_accountSetting.aspx.cs" Inherits="LapakMikir.Pages.Student.student_accountSetting" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>LapakMikir | Account Setting</title>
    <style type="text/css">
        .auto-style1 {
            width: 150px;
        }
        .auto-style2 {
            width: 433px;
            height: 30px;
            padding-left: 10px;
        }
        .auto-style3 {
            width: 350px;
        }
        .auto-style4 {
            width: 450px;
        }
        .auto-style5 {
            width: 350px;
            height: 32px;
        }
        .auto-style6 {
            height: 32px;
        }
        .auto-style7 {
            margin-left: 10px;
            margin-top: 25px;
        }
        .auto-style10 {
            width: 1px;
        }
        .auto-style11 {
            width: 63px;
        }
        .auto-style12 {
            width: 12px;
        }
        .auto-style13 {
            width: 72%;
        }
        .auto-style14 {
            width: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <table style="margin-left: 10px;" class="auto-style13">
        <tr>
            <td rowspan="5" class="auto-style14"></td>

            <td rowspan="4" class="auto-style10">
                <asp:Image ID="imgProfile" runat="server" Height="150px" Width="150px" />
            </td>
            <td class="auto-style11">Student ID</td>
            <td class="auto-style12">:</td>
            <td class="auto-style2">
                <asp:Label ID="lblStudentID" runat="server" Text="[studentID]"></asp:Label>
            </td>
        </tr>

        <tr>
            <td class="auto-style11">Full Name</td>
            <td class="auto-style12">:</td>
            <td class="auto-style2">
                <asp:Label ID="lblStudentName" runat="server" Text="[fullName]"></asp:Label>
            </td>
        </tr>

        <tr>
            <td class="auto-style11">Birth Date</td>
            <td class="auto-style12">:</td>
            <td class="auto-style2">
                <asp:Label ID="lblStudentDOB" runat="server" Text="[DOB]"></asp:Label>
            </td>
        </tr>

        <tr>
            <td class="auto-style11">Course</td>
            <td class="auto-style12">:</td>
            <td class="auto-style2">
                <asp:Label ID="lblCourseName" runat="server" Text="[selectedCourse]"></asp:Label>
            </td>
        </tr>

        <tr>
            <td class="auto-style10">
                <asp:Button ID="btnChangePic" runat="server" Text="+ Change Profile Picture" BackColor="White" ForeColor="Black" Width="150px" />
            </td>
            <td colspan="2" class="TextAlignCenter">
                <asp:Button ID="btnChangeCourse" runat="server" Text="Change Course" CssClass="Btn FlexBtn BorderRadius10px" />
            </td>
        </tr>
    </table>

    <cc1:ModalPopupExtender ID="popupChangePicture" runat="server" PopupControlID="pnlChangePicture" TargetControlID="btnChangePic" CancelControlID="btnCancelPic" BackgroundCssClass="BgGrey"></cc1:ModalPopupExtender>

    <asp:Panel ID="pnlChangePicture" runat="server" BackColor="White" align="center" BorderColor="MidnightBlue" BorderStyle="Solid" BorderWidth="2px">
        <iframe ID="Iframe1" runat="server" src="student_changePicture_popUp.aspx"></iframe>
        <br />
        <asp:Button ID="btnCancelPic" runat="server" Text="Cancel" CssClass="Btn FlexBtn BorderRadius10px" OnClick="btnCancelChange_Click" />
    </asp:Panel>

    <cc1:ModalPopupExtender ID="popupChangeCourse" runat="server" PopupControlID="pnlChangeCourse" TargetControlID="btnChangeCourse" CancelControlID="btnCancelCourse" BackgroundCssClass="BgGrey"></cc1:ModalPopupExtender>

    <asp:Panel ID="pnlChangeCourse" runat="server" BackColor="White" align="center" BorderColor="MidnightBlue" BorderStyle="Solid" BorderWidth="2px">
        <iframe ID="IFrame2" runat="server" src="student_changeCourse_popUp.aspx"></iframe>
        <br />
        <asp:Button ID="btnCancelCourse" runat="server" Text="Cancel" CssClass="Btn FlexBtn BorderRadius10px" OnClick="btnCancelChange_Click" />
    </asp:Panel>

    <asp:Panel ID="pnpChangePassword" runat="server" BorderColor="MidnightBlue" BorderStyle="Solid" BorderWidth="2px" Width="65%" CssClass="auto-style7">
        <table class="MarginLeft10px">
            <tr>
                <td colspan="3">
                    <h3 class="TextAlignCenter FontRed">Change Password</h3>
                </td>
            </tr>

            <tr>
                <td class="auto-style3">Current Password</td>
                <td>:</td>
                <td>
                    <asp:TextBox ID="txtCurrentPassword" runat="server" TextMode="Password" CssClass="auto-style4"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td class="auto-style3">New Password</td>
                <td>:</td>
                <td>
                    <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="auto-style4"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td class="auto-style5">Retype New Password</td>
                <td class="auto-style6">:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtReNewPassword" runat="server" TextMode="Password" CssClass="auto-style4"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td colspan="3" class="FontRed auto-style1">
                    <div class="TextAlignCenter">
                        <asp:Label ID="lblErrorMsg" runat="server" ></asp:Label>
                    </div>
                </td>
            </tr>

            <tr>
                <td colspan="3" class="TextAlignCenter">
                    <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" CssClass="Btn FlexBtn BorderRadius10px" BackColor="Red" ForeColor="White" OnClick="btnChangePassword_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
