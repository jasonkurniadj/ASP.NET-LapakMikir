/***
 * Created by: Jason
 * Date: December 31st, 2018
 * Purpose: Student features
***/


using System;
using System.Collections.Generic;
using Binus.Common.Data;
using Binus.DataAccess;

namespace Binus.BusinessFacade
{
    public class StudentSystem
    {
        public bool Student_CreateNewStudent(Student Param)
        {
            return new DAStudent().Student_CreateNewStudent(Param);
        }

        public Student Student_GetDetail(Student Param)
        {
            return new DAStudent().Student_GetDetail(Param);
        }

        public Student Student_ReadSecurityQuestion(Student Param)
        {
            return new DAStudent().Student_ReadSecurityQuestion(Param);
        }

        public Student Student_CheckSecurityAnswer (Student Param)
        {
            return new DAStudent().Student_CheckSecurityAnswer(Param);
        }

        public bool Student_ChangePassword(Student Param, string NewPassword)
        {
            return new DAStudent().Student_ChangePassword(Param, NewPassword);
        }

        public bool Student_ChangeCourse(Student Param)
        {
            return new DAStudent().Student_ChangeCourse(Param);
        }

        public List<Material> Student_GetMaterial(Student Param)
        {
            return new DAStudent().Student_GetMaterial(Param);
        }

        public Exercise Student_CheckAvailabilityExercise(string Email, string ExcerciseID)
        {
            return new DAStudent().Student_CheckAvailabilityExercise(Email, ExcerciseID);
        }

        public List<Exercise> Student_ReadExercise(string ExerciseID)
        {
            return new DAStudent().Student_ReadExercise(ExerciseID);
        }

        public Exercise Student_CheckExercise(Exercise Param, int Num)
        {
            return new DAStudent().Student_CheckExercise(Param, Num);
        }

        public bool Student_SubmitExercise(string Email, string ExerciseID, int Score)
        {
            return new DAStudent().Student_SubmitExercise(Email, ExerciseID, Score);
        }

        public List<StudyReport> Student_GetStudyReport(Student Param)
        {
            return new DAStudent().Student_GetStudyReport(Param);
        }
    }
}
