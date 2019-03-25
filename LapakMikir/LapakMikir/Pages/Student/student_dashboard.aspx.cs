using Binus.BusinessFacade;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LapakMikir.Pages.Student
{
    public partial class student_dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Binus.Common.Data.Student Data = new Binus.Common.Data.Student
            {
                studentEmail = Session["ActiveStudentEmail"].ToString()
            };

            Binus.Common.Data.Student GetDetail = new StudentSystem().Student_GetDetail(Data);
            lblStudentName.Text = "Welcome, "+ GetDetail.studentName + '!';
            lblCourseName.Text = GetDetail.courseName;
            lblCourseProgress.Text = GetDetail.courseProgress.ToString()+'%';

            string ConStr = @"Data Source=.;Initial Catalog=LapakMikir;Integrated Security=True";
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
    }
}