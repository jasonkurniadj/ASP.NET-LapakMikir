using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Binus.BusinessFacade;
using Binus.Common.Data;

namespace LapakMikir.Pages.Student
{
    public partial class student_accountSetting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Binus.Common.Data.Student Data = new Binus.Common.Data.Student
            {
                studentEmail = Session["ActiveStudentEmail"].ToString()
            };

            Binus.Common.Data.Student GetDetail = new StudentSystem().Student_GetDetail(Data);

            lblStudentID.Text = GetDetail.studentID;
            lblStudentName.Text = GetDetail.studentName;
            lblStudentDOB.Text = GetDetail.studentDOB;
            lblCourseName.Text = GetDetail.courseName;

            string ConStr = @"Data Source=127.0.0.1;Initial Catalog=LapakMikir;Integrated Security=True";
            SqlConnection Conn = new SqlConnection(ConStr);

            SqlCommand sqlCommand = new SqlCommand("dbo.bn_student_readDetail", Conn);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.Add("Email", SqlDbType.VarChar).Value = Session["ActiveStudentEmail"].ToString();

            Conn.Open();
            SqlDataReader Reader = sqlCommand.ExecuteReader();
            if (Reader.HasRows)
            {
                while (Reader.Read())
                {
                    try
                    {
                        byte[] ImgData = (byte[])Reader["studentPicture"];

                        string ImgUrl = Convert.ToBase64String(ImgData, 0, ImgData.Length);
                        imgProfile.ImageUrl = "data:image/png;base64," + ImgUrl;
                    }
                    catch
                    {
                        imgProfile.ImageUrl = "~/Assets/ppDefault.png";
                    }
                }

                Reader.Close();
            }
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            if(ValidateChangePassword())
            {
                string CurrentPassword = txtCurrentPassword.Text;
                string NewPassword = txtNewPassword.Text;
                string ReTypePassword = txtReNewPassword.Text;

                // Hashing password
                string HashPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(NewPassword, "SHA1");
                
                Binus.Common.Data.Student Data = new Binus.Common.Data.Student();
                Data.studentEmail = Session["ActiveStudentEmail"].ToString();
                Data.studentPassword = CurrentPassword;

                try
                {
                    if(Session["ActiveStudentEmail"].ToString() == "test@student.com")
                    {
                        if (new StudentSystem().Student_ChangePassword(Data, NewPassword))
                        {
                            lblErrorMsg.Text = "Success..";
                            Session["Password"] = NewPassword;
                        }
                        else
                        {
                            lblErrorMsg.Text = "ERROR!";
                        }
                    }
                    else
                    {
                        if (new StudentSystem().Student_ChangePassword(Data, HashPassword))
                        {
                            lblErrorMsg.Text = "Success..";
                            Session["Password"] = HashPassword;
                        }
                        else
                        {
                            lblErrorMsg.Text = "ERROR!";
                        }
                    }
                    
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
            else
            {
                lblErrorMsg.Text = "Please check all field input!";
            }
        }

        private bool ValidateChangePassword()
        {
            string CurrPassword = txtCurrentPassword.Text;
            string NewPassword = txtNewPassword.Text;
            string ReTypePassword = txtReNewPassword.Text;

            if (CurrPassword == "") return false;

            if(Session["ActiveStudentEmail"].ToString() == "test@student.com")
            {
                if (CurrPassword != Session["Password"].ToString()) return false;
            }
            else
            {
                string HashPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(CurrPassword, "SHA1");

                if (HashPassword != Session["Password"].ToString()) return false;
            }

            Regex regex = new Regex("^[a-zA-Z0-9]*$");

            if (NewPassword.Length < 6) return false;
            if (!regex.IsMatch(NewPassword)) return false;
            if (NewPassword != ReTypePassword) return false;
            
            return true;
        }

        protected void btnCancelChange_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }
    }
}
