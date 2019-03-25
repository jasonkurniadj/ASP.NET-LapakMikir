using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Binus.BusinessFacade;
using Binus.Common.Data;

namespace LapakMikir.Pages.Student
{
    public partial class student_register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            // Hashing the password
            string HashPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPassword.Text, "SHA1");
            string ErrorMsg = CheckData();

            Binus.Common.Data.Student Data = new Binus.Common.Data.Student
            {
                studentName = txtName.Text,
                studentEmail = txtEmail.Text,
                studentSecondaryEmail = txtSecEmail.Text,
                studentPassword = HashPassword,
                studentDOB = txtDOB.Text,
                studentSecurityQuestion = ddlSecurityQuestion.SelectedValue,
                studentSecurityAnswer = txtSecurityAnswer.Text.ToLower()
            };

            if (ValidateInput(ErrorMsg))
            {
                try
                {
                    if (new StudentSystem().Student_CreateNewStudent(Data))
                    {
                        Response.Redirect("student_login.aspx");
                    }
                    else
                    {
                        lblErrorMsg.Text = "Error!";
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
            else
            {
                lblErrorMsg.Text = ErrorMsg;
            }
        }

        private bool ValidateInput(string ErrorMsg)
        {
            if (ErrorMsg != "") return false;
            return true;
        }

        private string CheckData()
        {
            string ErrorMsg = "";

            if (txtName.Text.Trim() == "")
            {
                ErrorMsg += "Please input name! <br />";
            }
            if (txtEmail.Text.Trim() == "")
            {
                ErrorMsg += "Please input email! <br />";
            }
            if (txtEmail.Text == txtSecEmail.Text)
            {
                ErrorMsg += "Secondary email must be different! <br />";
            }
            if(txtDOB.Text == "")
            {
                ErrorMsg += "Please select birth date! <br />";
            }
            if (txtPassword.Text.Trim().Length < 6)
            {
                ErrorMsg += "Password must be longger than 6 characters! <br />";
            }

            Regex regex1 = new Regex(@"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$*");
            Match match1 = regex1.Match(txtPassword.Text);
            if (!match1.Success)
            {
                ErrorMsg += "Password must include alphanumeric! <br />";
            }
            if (txtPassword.Text != txtConfirmPassword.Text)
            {
                ErrorMsg += "Confirm password is not same! <br />";
            }
            if (ddlSecurityQuestion.SelectedValue == "None")
            {
                ErrorMsg += "Please select security question! <br />";
            }
            if (txtSecurityAnswer.Text.Trim() == "")
            {
                ErrorMsg += "Please input security answer! <br />";
            }

            return ErrorMsg;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/index.aspx");
        }

        protected void calDOB_SelectionChanged(object sender, EventArgs e)
        {
            txtDOB.Text = calDOB.SelectedDate.Year.ToString() + "/" + calDOB.SelectedDate.Month.ToString() + "/" + calDOB.SelectedDate.Day.ToString();
        }
    }
}