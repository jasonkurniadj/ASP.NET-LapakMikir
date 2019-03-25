using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Binus.BusinessFacade;

namespace LapakMikir.Pages.Student
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["ExerciseID"] = null;
        }

        protected void btnExercise1_Click(object sender, EventArgs e)
        {
            string CurrCourse = Session["CurrentCourse"].ToString();

            if (CurrCourse == "SQL") Session["ExerciseID"] = "EX00";
            else if (CurrCourse == "Java") Session["ExerciseID"] = "EX03";
            else if (CurrCourse == "Advanced Java") Session["ExerciseID"] = "EX06";

            Response.Redirect("student_exercise.aspx" + "?" + Session["ExerciseID"].ToString());
        }

        protected void btnExercise2_Click(object sender, EventArgs e)
        {
            string CurrCourse = Session["CurrentCourse"].ToString();

            if (CurrCourse == "SQL") Session["ExerciseID"] = "EX01";
            else if (CurrCourse == "Java") Session["ExerciseID"] = "EX04";
            else if (CurrCourse == "Advanced Java") Session["ExerciseID"] = "EX07";

            Binus.Common.Data.Exercise Check = new StudentSystem().Student_CheckAvailabilityExercise(Session["ActiveStudentEmail"].ToString(), Session["ExerciseID"].ToString());

            if(Check.ExerciseAvailability == 1)
                Response.Redirect("student_exercise.aspx" + "?" + Session["ExerciseID"].ToString());
            else
            {
                lblErrorMsg.Text = "Please do the previous exercise!";
            }
        }

        protected void Quiz_Click(object sender, EventArgs e)
        {
            string CurrCourse = Session["CurrentCourse"].ToString();

            if (CurrCourse == "SQL") Session["ExerciseID"] = "EX02";
            else if (CurrCourse == "Java") Session["ExerciseID"] = "EX05";
            else if (CurrCourse == "Advanced Java") Session["ExerciseID"] = "EX08";

            Binus.Common.Data.Exercise Check = new StudentSystem().Student_CheckAvailabilityExercise(Session["ActiveStudentEmail"].ToString(), Session["ExerciseID"].ToString());

            if (Check.ExerciseAvailability == 1)
                Response.Redirect("student_exercise.aspx" + "?" + Session["ExerciseID"].ToString());
            else
            {
                lblErrorMsg.Text = "Please do the previous exercise!";
            }
        }
    }
}