using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Binus.BusinessFacade;

namespace LapakMikir.Pages.Student
{
    public partial class student_changeCourse_popUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Binus.Common.Data.Student Data = new Binus.Common.Data.Student
            {
                studentEmail = Session["ActiveStudentEmail"].ToString()
            };

            Binus.Common.Data.Student GetDetail = new StudentSystem().Student_GetDetail(Data);
            
            lblCurrentCourse.Text = GetDetail.courseName;
            Session["CurrentCourse"] = GetDetail.courseName;
        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            Binus.Common.Data.Student Data = new Binus.Common.Data.Student();
            Data.studentEmail = Session["ActiveStudentEmail"].ToString();
            Data.courseName = ddlCourse.SelectedValue.ToString();

            try
            {
                if (new StudentSystem().Student_ChangeCourse(Data))
                {
                    Response.Redirect(Request.RawUrl);
                    lblSuccessMessage.Text = "Success..";
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}