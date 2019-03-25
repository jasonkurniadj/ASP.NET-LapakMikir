using System;
using Binus.BusinessFacade;
using Binus.Common.Data;

namespace LapakMikir.Pages.Student
{
    public partial class student_securityQuestion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SecurityEmail"] == null)
            {
                Response.Redirect("student_login.aspx");
            }

            lblSecurityQuestion.Text = Session["SecurityQuestion"].ToString() + "?";
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            string Answer = txtAnswer.Text.ToString().ToLower();

            if(Answer == "")
            {
                lblErrorMsg.Text = "Please input the answer!";
            }
            else
            {
                Binus.Common.Data.Student Data = new Binus.Common.Data.Student
                {
                    studentEmail = Session["SecurityEmail"].ToString(),
                    studentSecurityAnswer = Answer
                };

                Binus.Common.Data.Student CheckPassword = new StudentSystem().Student_CheckSecurityAnswer(Data);

                if (Data.studentSecurityAnswer == CheckPassword.studentSecurityAnswer)
                {
                    Response.Redirect("student_resetPassword.aspx");
                }
                else
                {
                    lblErrorMsg.Text = "Wrong answer!";
                }
            }
        }
    }
}