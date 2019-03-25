using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(@"Data source=.;Initial Catalog=login_admin;Integrated Security=True"))
            {
                sqlCon.Open();
                string query = "select count(1) from tbl_login where username = @username AND password = @password";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@username", txtUser.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@password", txtPass.Text.Trim());
                int count = Convert.ToInt32(sqlCmd.ExecuteScalar());
                if (count == 1)
                {
                    Session["username"] = txtUser.Text.Trim();
                    Response.Redirect("WelcomeAdmin.aspx");
                }
            }

        }
    }
}