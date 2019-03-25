using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Binus.BusinessFacade;
using Binus.Common.Data;

namespace LapakMikir.Pages.Student
{
    public partial class student_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["SecurityEmail"] = null;
            Session["SecurityName"] = null;
            Session["SecurityQuestion"] = null;
            Session["ExerciseID"] = null;

            if(Session["ActiveStudentEmail"] != null)
            {
                Response.Redirect("student_dashboard.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string Email = txtEmail.Text.ToString();
            string Password = txtPassword.Text.ToString();

            // Hashing password
            string HashPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(Password, "SHA1");
            
            Binus.Common.Data.Student Login = new Binus.Common.Data.Student
            {
                studentEmail = Email,
                studentPassword = Password
            };

            if (Email != "test@student.com")
            {
                Login.studentPassword = HashPassword;
            }

            Binus.Common.Data.Student DoLogin = new LogInSystem().DoLogIn(Login);

            if (DoLogin == null)
            {
                lblErrorMsg.Text = "Invalid username & password!";
            }
            else
            {
                if (Login.studentPassword == DoLogin.studentPassword)
                {
                    Session["ActiveStudentEmail"] = DoLogin.studentEmail;
                    Session["Password"] = Password;
                    Session["CurrentCourse"] = DoLogin.courseName;

                    Response.Redirect("student_dashboard.aspx");
                    //Response.Redirect("student_accountSetting.aspx");
                }
                else
                {
                    lblErrorMsg.Text = "Invalid username & password!";
                }
            }
        }
    }
}
