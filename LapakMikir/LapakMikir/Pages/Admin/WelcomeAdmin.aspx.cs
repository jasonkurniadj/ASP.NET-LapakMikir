using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WelcomeAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null) {
                Response.Redirect("admin_login.aspx");
            }
            lblUserDetail.Text = "Courses   " + Session["username"];
            lblWelcome.Text = "Welcome " + Session["username"];
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("admin_login.aspx");
        }

        protected void btnManage_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReviewMaterial.aspx");
        }
    }
}