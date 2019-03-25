using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LapakMikir.Pages.Student
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            HttpPostedFile postedFile = uploadFile.PostedFile;
            string _fileName = Path.GetFileName(postedFile.FileName);
            string FileExt = Path.GetExtension(_fileName);

            if(FileExt.ToLower() == ".jpg" || FileExt.ToLower() == ".png")
            {
                Stream stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                byte[] ImgData = binaryReader.ReadBytes((int) stream.Length);

                string ConStr = @"Data Source=127.0.0.1;Initial Catalog=LapakMikir;Integrated Security=True";
                using(SqlConnection Conn = new SqlConnection(ConStr))
                {
                    SqlCommand sqlCommand = new SqlCommand("dbo.bn_student_changePicture", Conn);
                    sqlCommand.CommandType = CommandType.StoredProcedure;
                    sqlCommand.Parameters.Add("Email", SqlDbType.VarChar).Value = Session["ActiveStudentEmail"].ToString();
                    sqlCommand.Parameters.Add("Image", SqlDbType.VarBinary).Value = ImgData;

                    Conn.Open();
                    sqlCommand.ExecuteNonQuery();
                    Conn.Close();
                }

                lblErrorMsg.Text = "Update Successful..";
                lblErrorMsg.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblErrorMsg.Text = "Please input .jpg or .png extension!";
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                string ImgPath = "~/Assets/ppDefault.png";
                byte[] ImgData = File.ReadAllBytes(HttpContext.Current.Server.MapPath(ImgPath));

                string ConStr = @"Data Source=127.0.0.1;Initial Catalog=LapakMikir;Integrated Security=True";
                using (SqlConnection Conn = new SqlConnection(ConStr))
                {
                    SqlCommand sqlCommand = new SqlCommand("dbo.bn_student_changePicture", Conn);
                    sqlCommand.CommandType = CommandType.StoredProcedure;
                    sqlCommand.Parameters.Add("Email", SqlDbType.VarChar).Value = Session["ActiveStudentEmail"].ToString();
                    sqlCommand.Parameters.Add("Image", SqlDbType.VarBinary).Value = ImgData;

                    Conn.Open();
                    sqlCommand.ExecuteNonQuery();
                    Conn.Close();
                }

                lblErrorMsg.Text = "Update Successful..";
                lblErrorMsg.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}