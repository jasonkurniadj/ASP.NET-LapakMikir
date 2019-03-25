using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using Binus.BusinessFacade;
using Binus.Common.Data;

namespace LapakMikir.Pages.Student
{
    public partial class student_excercise : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ExerciseID"] == null)
            {
                Response.Redirect("student_chooseExercise.aspx");
            }

            try
            {
                if (Session["ExerciseID"].ToString() == "EX00" ||
                Session["ExerciseID"].ToString() == "EX03" ||
                Session["ExerciseID"].ToString() == "EX06")
                    lblTitle.Text = "Exercise 1";
                else if (Session["ExerciseID"].ToString() == "EX01" ||
                    Session["ExerciseID"].ToString() == "EX04" ||
                    Session["ExerciseID"].ToString() == "EX07")
                    lblTitle.Text = "Exercise 2";
                else if (Session["ExerciseID"].ToString() == "EX02" ||
                    Session["ExerciseID"].ToString() == "EX05" ||
                    Session["ExerciseID"].ToString() == "EX08")
                    lblTitle.Text = "QUIZ";

                lblCode.Text = Session["CurrentCourse"].ToString();

                LoadData();
            }
            catch
            {
                Response.Redirect("student_chooseExercise.aspx");
            }
        }

        private void LoadData()
        {
            List<Exercise> RetVal = new StudentSystem().Student_ReadExercise(Session["ExerciseID"].ToString());

            lblQuestion1.Text = RetVal[0].Question;
            lblQuestion2.Text = RetVal[1].Question;
            lblQuestion3.Text = RetVal[2].Question;
            lblQuestion4.Text = RetVal[3].Question;
            lblQuestion5.Text = RetVal[4].Question;

            string A1, B1, C1;
            string A2, B2, C2;
            string A3, B3, C3;
            string A4, B4, C4;
            string A5, B5, C5;

            A1 = RetVal[0].Answer1;
            B1 = RetVal[0].Answer2;
            C1 = RetVal[0].Answer3;
            A2 = RetVal[1].Answer1;
            B2 = RetVal[1].Answer2;
            C2 = RetVal[1].Answer3;
            A3 = RetVal[2].Answer1;
            B3 = RetVal[2].Answer2;
            C3 = RetVal[2].Answer3;
            A4 = RetVal[3].Answer1;
            B4 = RetVal[3].Answer2;
            C4 = RetVal[3].Answer3;
            A5 = RetVal[4].Answer1;
            B5 = RetVal[4].Answer2;
            C5 = RetVal[4].Answer3;

            int Rand = RandomGenerator(1,3);

            //rbAnswer1A.Text = A1;
            //rbAnswer1B.Text = B1;
            //rbAnswer1C.Text = C1;
            //rbAnswer2A.Text = A2;
            //rbAnswer2B.Text = B2;
            //rbAnswer2C.Text = C2;
            //rbAnswer3A.Text = A3;
            //rbAnswer3B.Text = B3;
            //rbAnswer3C.Text = C3;
            //rbAnswer4A.Text = A4;
            //rbAnswer4B.Text = B4;
            //rbAnswer4C.Text = C4;
            //rbAnswer5A.Text = A5;
            //rbAnswer5B.Text = B5;
            //rbAnswer5C.Text = C5;

            if (Rand == 1)
            {
                rbAnswer1A.Text = A1;
                rbAnswer1B.Text = B1;
                rbAnswer1C.Text = C1;
                rbAnswer2A.Text = C2;
                rbAnswer2B.Text = B2;
                rbAnswer2C.Text = A2;
                rbAnswer3A.Text = B3;
                rbAnswer3B.Text = A3;
                rbAnswer3C.Text = C3;
                rbAnswer4A.Text = A4;
                rbAnswer4B.Text = C4;
                rbAnswer4C.Text = B4;
                rbAnswer5A.Text = B5;
                rbAnswer5B.Text = C5;
                rbAnswer5C.Text = A5;
            }
            else if (Rand == 2)
            {
                rbAnswer1A.Text = C1;
                rbAnswer1B.Text = B1;
                rbAnswer1C.Text = A1;
                rbAnswer2A.Text = B2;
                rbAnswer2B.Text = A2;
                rbAnswer2C.Text = C2;
                rbAnswer3A.Text = A3;
                rbAnswer3B.Text = B3;
                rbAnswer3C.Text = C3;
                rbAnswer4A.Text = A4;
                rbAnswer4B.Text = C4;
                rbAnswer4C.Text = B4;
                rbAnswer5A.Text = C5;
                rbAnswer5B.Text = B5;
                rbAnswer5C.Text = A5;
            }
            else if (Rand == 3)
            {
                rbAnswer1A.Text = B1;
                rbAnswer1B.Text = A1;
                rbAnswer1C.Text = C1;
                rbAnswer2A.Text = A2;
                rbAnswer2B.Text = B2;
                rbAnswer2C.Text = C2;
                rbAnswer3A.Text = A3;
                rbAnswer3B.Text = B3;
                rbAnswer3C.Text = C3;
                rbAnswer4A.Text = C4;
                rbAnswer4B.Text = B4;
                rbAnswer4C.Text = A4;
                rbAnswer5A.Text = C5;
                rbAnswer5B.Text = B5;
                rbAnswer5C.Text = A5;
            }
        }

        private int RandomGenerator(int Start, int End)
        {
            Random Rand = new Random();
            int Num = Rand.Next(Start, End);

            return Num;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            List<string> _answer = new List<string>();

            if (rbAnswer1A.Checked) _answer.Add(rbAnswer1A.Text);
            else if (rbAnswer1B.Checked) _answer.Add(rbAnswer1B.Text);
            else if (rbAnswer1C.Checked) _answer.Add(rbAnswer1C.Text);

            if (rbAnswer2A.Checked) _answer.Add(rbAnswer2A.Text);
            else if (rbAnswer2B.Checked) _answer.Add(rbAnswer2B.Text);
            else if (rbAnswer2C.Checked) _answer.Add(rbAnswer2C.Text);

            if (rbAnswer3A.Checked) _answer.Add(rbAnswer3A.Text);
            else if (rbAnswer3B.Checked) _answer.Add(rbAnswer3B.Text);
            else if (rbAnswer3C.Checked) _answer.Add(rbAnswer3C.Text);

            if (rbAnswer4A.Checked) _answer.Add(rbAnswer4A.Text);
            else if (rbAnswer4B.Checked) _answer.Add(rbAnswer4B.Text);
            else if (rbAnswer4C.Checked) _answer.Add(rbAnswer4C.Text);

            if (rbAnswer5A.Checked) _answer.Add(rbAnswer5A.Text);
            else if (rbAnswer5B.Checked) _answer.Add(rbAnswer5B.Text);
            else if (rbAnswer5C.Checked) _answer.Add(rbAnswer5C.Text);

            int Score = 0;
            for (int i=0; i<_answer.Count; i++)
            {
                Binus.Common.Data.Exercise Check = new Binus.Common.Data.Exercise
                {
                    SubmitedAnswer = _answer[i]
                };
                
                Binus.Common.Data.Exercise DoCheck = new StudentSystem().Student_CheckExercise(Check, i+1); //?

                if (Check.SubmitedAnswer == DoCheck.SubmitedAnswer)
                {
                    Score++;
                }
            }

            if (new StudentSystem().Student_SubmitExercise(Session["ActiveStudentEmail"].ToString(), Session["ExerciseID"].ToString(), Score))
            {
                Response.Redirect("student_chooseExercise.aspx");
            }
        }
    }
}