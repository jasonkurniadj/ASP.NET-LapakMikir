using Binus.BusinessFacade;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LapakMikir.Pages.Student
{
    public partial class student_studyReport : System.Web.UI.Page
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
            lblCourseName.Text = GetDetail.courseName;
        }
    }
}