/***
 * Created by: Jason
 * Date: December 31st, 2018
 * Purpose: Data access to student features
***/


using System;
using System.Data;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using Binus.Common.Data;
using System.Collections.Generic;

namespace Binus.DataAccess
{
    public class DAStudent
    {
        private Database DB;

        public DAStudent()
        {
            try
            {
                DB = DatabaseFactory.CreateDatabase("ConStr");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool Student_CreateNewStudent (Student Param)
        {
            try
            {
                DbCommand dbCommand = DB.GetStoredProcCommand("dbo.bn_student_createNewStudent");
                DB.AddInParameter(dbCommand, "Name", DbType.String, Param.studentName);
                DB.AddInParameter(dbCommand, "DOB", DbType.Date, Param.studentDOB);
                DB.AddInParameter(dbCommand, "Email", DbType.String, Param.studentEmail);
                DB.AddInParameter(dbCommand, "SecEmail", DbType.String, Param.studentSecondaryEmail);
                DB.AddInParameter(dbCommand, "Password", DbType.String, Param.studentPassword);
                DB.AddInParameter(dbCommand, "SecurityQuestion", DbType.String, Param.studentSecurityQuestion);
                DB.AddInParameter(dbCommand, "SecurityAnswer", DbType.String, Param.studentSecurityAnswer);

                DB.ExecuteNonQuery(dbCommand);
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Student Student_GetDetail (Student Param)
        {
            Student RetVal = new Student();

            try
            {
                DbCommand dbCommand = DB.GetStoredProcCommand("dbo.bn_student_readDetail");
                DB.AddInParameter(dbCommand, "Email", DbType.String, Param.studentEmail);
                
                using (IDataReader Reader = DB.ExecuteReader(dbCommand))
                {
                    if (Reader.Read())
                    {
                        RetVal.studentID = Reader["studentID"].ToString();
                        RetVal.studentName = Reader["studentName"].ToString();
                        RetVal.studentDOB = Reader["studentDOB"].ToString();
                        //RetVal.studentProfilePicture = (byte[]) Reader["studentPicture"]; //At the first time login, attribute studentPicture is null so the system can't run this step.
                        RetVal.courseName = Reader["courseName"].ToString();
                    }

                    Reader.Close();
                }

                return RetVal;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Student Student_ReadSecurityQuestion (Student Param)
        {
            Student RetVal = new Student();

            try
            {
                DbCommand dbCommand = DB.GetStoredProcCommand("dbo.bn_student_forgetPassword");
                DB.AddInParameter(dbCommand, "Email", DbType.String, Param.studentEmail);

                using (IDataReader Reader = DB.ExecuteReader(dbCommand))
                {
                    while (Reader.Read())
                    {
                        RetVal.studentEmail = Reader["studentEmail"].ToString();
                        RetVal.studentName = Reader["studentName"].ToString();
                        RetVal.studentPassword = Reader["studentPassword"].ToString();
                        RetVal.studentSecurityQuestion = Reader["accSecurityQuestion"].ToString();
                    }

                    Reader.Close();
                }

                return RetVal;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Student Student_CheckSecurityAnswer (Student Param)
        {
            Student RetVal = new Student();

            try
            {
                DbCommand dbCommand = DB.GetStoredProcCommand("dbo.bn_student_forgetPassword");
                DB.AddInParameter(dbCommand, "Email", DbType.String, Param.studentEmail);

                using (IDataReader Reader = DB.ExecuteReader(dbCommand))
                {
                    while (Reader.Read())
                    {
                        RetVal.studentEmail = Reader["studentEmail"].ToString();
                        RetVal.studentPassword = Reader["studentPassword"].ToString();
                        RetVal.studentSecurityAnswer = Reader["accSecurityAnswer"].ToString();
                    }

                    Reader.Close();
                }

                return RetVal;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool Student_ChangePassword (Student Param, string NewPassword)
        {
            try
            {
                DbCommand dbCommand = DB.GetStoredProcCommand("dbo.bn_student_changePassword");
                DB.AddInParameter(dbCommand, "Email", DbType.String, Param.studentEmail);
                DB.AddInParameter(dbCommand, "CurrentPassword", DbType.String, Param.studentPassword);
                DB.AddInParameter(dbCommand, "NewPassword", DbType.String, NewPassword);

                DB.ExecuteNonQuery(dbCommand);
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool Student_ChangeCourse (Student Param)
        {
            try
            {
                DbCommand dbCommand = DB.GetStoredProcCommand("dbo.bn_student_changeCourse");
                DB.AddInParameter(dbCommand, "Email", DbType.String, Param.studentEmail);
                DB.AddInParameter(dbCommand, "Course", DbType.String, Param.courseName);

                DB.ExecuteNonQuery(dbCommand);
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        
        public List<Material> Student_GetMaterial (Student Param)
        {
            List<Material> RetVal = new List<Material>();

            try
            {
                DbCommand dbCommand = DB.GetStoredProcCommand("dbo.bn_student_readMaterials");
                DB.AddInParameter(dbCommand, "CourseName", DbType.String, Param.courseName);

                using (IDataReader Reader = DB.ExecuteReader(dbCommand))
                {
                    while (Reader.Read())
                    {
                        Material Data = new Material();
                        Data.materialID = Reader["materialID"].ToString();
                        Data.materialName = Reader["materialName"].ToString();
                        Data.materialDescription = Reader["materialDesc"].ToString();
                        Data.dataUploaded = Reader["dataUploaded"].ToString();
                        //Data.materialFile = (byte[]) Reader["materialFile"];

                        RetVal.Add(Data);
                    }

                    Reader.Close();
                }

                return RetVal;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        
        public Exercise Student_CheckAvailabilityExercise (string Email, string ExerciseID)
        {
            Exercise RetVal = new Exercise();

            try
            {
                DbCommand dbCommand = DB.GetStoredProcCommand("dbo.bn_student_checkAvailabilityExercise");
                DB.AddInParameter(dbCommand, "Email", DbType.String, Email);
                DB.AddInParameter(dbCommand, "ExerciseID", DbType.String, ExerciseID);
                
                using (IDataReader Reader = DB.ExecuteReader(dbCommand))
                {
                    if (Reader.Read())
                    {
                        RetVal.ExerciseAvailability = Convert.ToInt16(Reader["Availability"]);
                    }

                    Reader.Close();
                }

                return RetVal;
            }
            catch (Exception ex)
            {
                RetVal.ExerciseAvailability = 0;
                return RetVal;
            }
        }

        public List<Exercise> Student_ReadExercise(string ExerciseID)
        {
            List<Exercise> RetVal = new List<Exercise>();

            try
            {
                DbCommand dbCommand = DB.GetStoredProcCommand("dbo.bn_student_readExerciseQuestion");
                DB.AddInParameter(dbCommand, "ExerciseID", DbType.String, ExerciseID);

                using (IDataReader Reader = DB.ExecuteReader(dbCommand))
                {
                    while (Reader.Read())
                    {
                        Exercise Data = new Exercise();
                        Data.PackageID = Reader["packageID"].ToString();
                        Data.Question = Reader["question"].ToString();
                        Data.Answer1 = Reader["answer1"].ToString();
                        Data.Answer2 = Reader["answer2"].ToString();
                        Data.Answer3 = Reader["answer3"].ToString();

                        RetVal.Add(Data);
                    }

                    Reader.Close();
                }

                return RetVal;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Exercise Student_CheckExercise(Exercise Param, int Num)
        {
            Exercise RetVal = new Exercise();

            try
            {
                DbCommand dbCommand = DB.GetStoredProcCommand("dbo.bn_student_checkExerciseQuestion");
                DB.AddInParameter(dbCommand, "ExerciseID", DbType.String, Param.ExerciseID);
                DB.AddInParameter(dbCommand, "Num", DbType.Int32, Num);

                using (IDataReader Reader = DB.ExecuteReader(dbCommand))
                {
                    while (Reader.Read())
                    {
                        RetVal.SubmitedAnswer = Reader["answer"].ToString();
                    }

                    Reader.Close();
                }

                return RetVal;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool Student_SubmitExercise(string Email, string ExerciseID, int Score)
        {
            try
            {
                DbCommand dbCommand = DB.GetStoredProcCommand("dbo.bn_student_SubmitExercise");
                DB.AddInParameter(dbCommand, "Email", DbType.String, Email);
                DB.AddInParameter(dbCommand, "ExerciseID", DbType.String, ExerciseID);
                DB.AddInParameter(dbCommand, "Score", DbType.Int32, Score);

                DB.ExecuteNonQuery(dbCommand);
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<StudyReport> Student_GetStudyReport (Student Param)
        {
            List<StudyReport> RetVal = new List<StudyReport>();

            try
            {
                //...

                return RetVal;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
