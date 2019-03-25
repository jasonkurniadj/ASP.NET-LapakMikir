using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Common;
using Binus.BusinessFacade;
using Binus.Common.Data;

namespace LapakMikir.Pages.Student
{
    public partial class student_materials : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblCourseName.Text = Session["CurrentCourse"].ToString();
            LoadData();
        }

        private void LoadData()
        {
            Binus.Common.Data.Student Data = new Binus.Common.Data.Student()
            {
                courseName = Session["CurrentCourse"].ToString()
            };

            List<Material> RetVal = new StudentSystem().Student_GetMaterial(Data);

            gvMaterial.DataSource = RetVal;
            gvMaterial.DataBind();
        }

        protected void lbtnDownload_Click(object sender, EventArgs e)
        {
            LinkButton linkButton = (LinkButton)sender;
            GridViewRow gvRow = (GridViewRow)linkButton.NamingContainer;

            string ID = gvMaterial.Rows[gvRow.RowIndex].Cells[1].Text;
            Download(ID);
        }

        private void Download(string ID)
        {
            string ConStr = @"Data Source=127.0.0.1;Initial Catalog=LapakMikir;Integrated Security=True";
            DataTable dataTable = new DataTable();

            using (SqlConnection Conn = new SqlConnection(ConStr))
            {
                SqlCommand sqlCommand = new SqlCommand("dbo.bn_student_getMaterial", Conn);
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.Parameters.Add("MaterialID", SqlDbType.VarChar).Value = ID;

                Conn.Open();
                SqlDataReader Reader = sqlCommand.ExecuteReader();
                dataTable.Load(Reader);
            }

            string Name = dataTable.Rows[0]["materialName"].ToString();
            byte[] File = (byte[])dataTable.Rows[0]["materialFile"];

            Response.ClearContent();
            Response.ContentType = "application/octetstream";
            Response.AddHeader("Content-Disposition", string.Format("attachment; filename={0}", Name));
            Response.AddHeader("Content-Length", File.Length.ToString());

            Response.BinaryWrite(File);
            Response.Flush();
            Response.Close();
        }

        protected void gvMaterial_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMaterial.PageIndex = e.NewPageIndex;
            gvMaterial.DataBind();
        }
    }
}