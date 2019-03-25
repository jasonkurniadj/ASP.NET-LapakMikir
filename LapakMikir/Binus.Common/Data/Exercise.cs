using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Binus.Common.Data
{
    public class Exercise
    {
        private string _exerciseID;
        private string _courseID;
        private string _courseName;
        private string _packageID;
        private string _question;
        private string _answer1;
        private string _answer2;
        private string _answer3;

        private int _availability;

        private string _answer;
        private int _score;

        public string ExerciseID
        {
            get { return _exerciseID; }
            set { _exerciseID = value; }
        }
        public string CourseID
        {
            get { return _courseID; }
            set { _courseID = value; }
        }
        public string CourseName
        {
            get { return _courseName; }
            set { _courseName = value; }
        }
        public string PackageID
        {
            get { return _packageID; }
            set { _packageID = value; }
        }
        public string Question
        {
            get { return _question; }
            set { _question = value; }
        }
        public string Answer1
        {
            get { return _answer1; }
            set { _answer1 = value; }
        }
        public string Answer2
        {
            get { return _answer2; }
            set { _answer2 = value; }
        }
        public string Answer3
        {
            get { return _answer3; }
            set { _answer3 = value; }
        }

        public int ExerciseAvailability
        {
            get { return _availability; }
            set { _availability = value; }
        }

        public string SubmitedAnswer
        {
            get { return _answer; }
            set { _answer = value; }
        }
        public int FinalScore
        {
            get { return _score; }
            set { _score = value; }
        }
    }
}
