using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LapakMikir.Pages.Student
{
    public partial class student : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ActiveStudentEmail"] == null)
            {
                Response.Redirect("student_login.aspx");
            }
        }
    }
}