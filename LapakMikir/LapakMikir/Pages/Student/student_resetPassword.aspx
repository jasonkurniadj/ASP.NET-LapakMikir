<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student_resetPassword.aspx.cs" Inherits="LapakMikir.Pages.Student.student_resetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Reset Password</h2>

            <p>You're password already reset..</p>
            <p>Please check your email for new password. Do not share your password!</p>
            <p>If you're don't get an email, please click this button</p>
            <asp:Button ID="btnResend" runat="server" Text="Resend Email" OnClick="btnResend_Click" />

            <br /><br />
            <p>Thank you..</p>
        </div>
    </form>
</body>
</html>
