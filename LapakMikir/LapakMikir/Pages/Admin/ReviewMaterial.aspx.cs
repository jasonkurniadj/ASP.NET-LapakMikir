using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace WebApplication1
{
    public partial class ReviewMaterial : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(@"Data Source=.;Initial Catalog=Material;Integrated Security = true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("admin_login.aspx");
            }
            lblUserDetail.Text = "Courses   " + Session["username"];
            if (!IsPostBack)
            {
                btnDelete.Enabled = false;
                FillGridView();
            }
        }
        public void Clear() {
            hfMaterial.Value = "";
            ddlCourse.Text = txtMaterialDesc.Text = txtMaterialName.Text = "";
            lblSuccessMessage.Text = lblErrorMessage.Text = "";
            btnUpload.Text = "Save";
        }
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("CreateorUpdate",sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@Id",hfMaterial.Value==""?0:Convert.ToInt32(hfMaterial.Value));
            sqlCmd.Parameters.AddWithValue("@Course",ddlCourse.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@MaterialName",txtMaterialName.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@MaterialDesc",txtMaterialDesc.Text.Trim());
            if (FUpload.HasFile) {
                string extension = System.IO.Path.GetExtension(FUpload.FileName);
                    string path = Server.MapPath("~/File//");
                    FUpload.SaveAs(path + FUpload.FileName);
                   sqlCmd.Parameters.AddWithValue("@FileUpload", FUpload.FileName.Trim());
            }
            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            string materialId = hfMaterial.Value;
            Clear();
            if (materialId == "")
                lblSuccessMessage.Text = "Save Success";
            else
                lblSuccessMessage.Text = "Update Success";
            FillGridView();
        }
        void FillGridView() {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("ViewAll", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlCon.Close();
            gvMaterial.DataSource = dtbl;
            gvMaterial.DataBind();
        }

        protected void gvMaterial_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void lnk_OnClick(object sender, EventArgs e) {
            int Id = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("viewbyid", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@Id", Id);
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlCon.Close();
            hfMaterial.Value = Id.ToString();
            ddlCourse.Text = dtbl.Rows[0]["Course"].ToString();
            txtMaterialName.Text = dtbl.Rows[0]["MaterialName"].ToString();
            txtMaterialDesc.Text = dtbl.Rows[0]["MaterialDesc"].ToString();
            btnUpload.Text = "Update";
            btnDelete.Enabled = true;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (sqlCon.State == ConnectionState.Closed);
            sqlCon.Open();
            SqlCommand sqlCmd = new SqlCommand("deletebyid",sqlCon);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.AddWithValue("@Id", Convert.ToInt32(hfMaterial.Value));
            sqlCmd.ExecuteNonQuery();
            sqlCon.Close();
            Clear();
            FillGridView();
            lblSuccessMessage.Text = "Delete Success";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("WelcomeAdmin.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("WebForm1.aspx");
        }
    }
}