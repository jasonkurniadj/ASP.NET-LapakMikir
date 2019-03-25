using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Binus.BusinessFacade;
using Binus.Common.Data;

namespace LapakMikir.Pages.Student
{
    public partial class student_forgetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private bool ValidateEmail(string Email)
        {
            Regex EmailRegex = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
            Match match = EmailRegex.Match(Email);

            if (match.Success) return true;
            return false;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string Email = txtEmail.Text.ToString();

            if (ValidateEmail(Email))
            {
                Binus.Common.Data.Student Data = new Binus.Common.Data.Student
                {
                    studentEmail = Email
                };

                Binus.Common.Data.Student ForgetPassword = new StudentSystem().Student_ReadSecurityQuestion(Data);

                if (Data.studentEmail == ForgetPassword.studentEmail)
                {
                    Session["SecurityEmail"] = ForgetPassword.studentEmail;
                    Session["SecurityName"] = ForgetPassword.studentName;
                    Session["SecurityPassword"] = ForgetPassword.studentPassword;
                    Session["SecurityQuestion"] = ForgetPassword.studentSecurityQuestion;

                    Response.Redirect("student_securityQuestion_popUp_fill.aspx" + "?" + ForgetPassword.studentEmail);
                }
                else
                {
                    lblErrorMsg.Text = "Invalid email!";
                }
            }
            else
            {
                lblErrorMsg.Text = "Please input correct email!";
            }
        }
    }
}