/***
 * Created by: Jason
 * Date: December 24th, 2018
 * Purpose: Student data
***/


using System;

namespace Binus.Common.Data
{
    public class Student
    {
        private string _ID;
        private string _name;
        private string _DOB;
        private string _email;
        private string _secondaryEmail;
        private string _password;
        private string _securityQuestion;
        private string _securityAnswer;
        private byte[] _profilePicture;
        private int _overallProgress;

        private string _courseName;
        private int _courseProgress;

        public string studentID
        {
            get { return _ID; }
            set { _ID = value; }
        }
        public string studentName
        {
            get { return _name; }
            set { _name = value; }
        }
        public string studentDOB
        {
            get { return _DOB; }
            set { _DOB = value; }
        }
        public string studentEmail
        {
            get { return _email; }
            set { _email = value; }
        }
        public string studentSecondaryEmail
        {
            get { return _secondaryEmail; }
            set { _secondaryEmail = value; }
        }
        public string studentPassword
        {
            get { return _password; }
            set { _password = value; }
        }
        public string studentSecurityQuestion
        {
            get { return _securityQuestion; }
            set { _securityQuestion = value; }
        }
        public string studentSecurityAnswer
        {
            get { return _securityAnswer; }
            set { _securityAnswer = value; }
        }
        public byte[] studentProfilePicture
        {
            get { return _profilePicture; }
            set { _profilePicture = value; }
        }
        public int studentOverallProgress
        {
            get { return _overallProgress; }
            set { _overallProgress = value; }
        }

        public string courseName
        {
            get { return _courseName; }
            set { _courseName = value; }
        }
        public int courseProgress
        {
            get { return _courseProgress; }
            set { _courseProgress = value; }
        }
    }
}
