using System;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Web.Security;
using Binus.BusinessFacade;

namespace LapakMikir.Pages.Student
{
    public partial class student_resetPassword : System.Web.UI.Page
    {
        private string NewPassword;

        protected void Page_Load(object sender, EventArgs e)
        {
            NewPassword = GeneratePassword(12);
            LoadData(NewPassword);
        }

        private void LoadData(string NewPassword)
        {
            string Receiver = Session["SecurityEmail"].ToString();
            string Name = Session["SecurityName"].ToString();

            // Hashing password
            string HashPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(NewPassword, "SHA1");
            
            Binus.Common.Data.Student Data = new Binus.Common.Data.Student();
            Data.studentEmail = Receiver;
            Data.studentPassword = Session["SecurityPassword"].ToString();

            try
            {
                // Hash password update to DB and non-hashing password send to email.
                if (new StudentSystem().Student_ChangePassword(Data, HashPassword))
                {
                    SendEmail(Receiver, Name, NewPassword);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private string GeneratePassword(int PasswordLength)
        {
            string Password;

            // Get new password
            using (var RandomGenerator = new RNGCryptoServiceProvider())
            {
                var RandomNumber = new byte[64];
                RandomGenerator.GetBytes(RandomNumber);

                Password = Convert.ToBase64String(RandomNumber);
            }

            Password = Password.Substring(0, PasswordLength);
            return Password;
        }

        public void SendEmail(string Receiver, string Name, string NewPassword)
        {
            // Send non-hashing password to receiver email 
            MailMessage mailMessage = new MailMessage("lapakmikir@gmail.com", Receiver);
            mailMessage.Subject = "Reset Password";
            mailMessage.Body = "Dear, " + Name + "!\n\nYour new password: " + NewPassword + "\nChange your password immediately and do not share your password!\n\nThank you..";

            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.Credentials = new System.Net.NetworkCredential()
            {
                // Sender's email & password
                UserName = "lapakmikir@gmail.com",
                Password = "L@p4kM1k1r"
            };

            smtpClient.EnableSsl = true;
            System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate (object s,
                        System.Security.Cryptography.X509Certificates.X509Certificate certificate,
                        System.Security.Cryptography.X509Certificates.X509Chain chain,
                        System.Net.Security.SslPolicyErrors sslPolicyErrors)
            {
                return true;
            };

            smtpClient.Send(mailMessage);
        }

        protected void btnResend_Click(object sender, EventArgs e)
        {
            // Resend email in case email is not delivered
            LoadData(NewPassword);
        }
    }
}