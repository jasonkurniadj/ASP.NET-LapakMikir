/***
 * Created by: Jason
 * Date: December 22nd, 2018
 * Purpose: Create stored procedure to LapakMikir database
***/

-- Use Database
USE LapakMikir
--USE master

-- Create Procedure
GO
CREATE PROCEDURE bn_student_doLogin
	@Email VARCHAR(50),
	@Password VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
		a.studentID,
		studentEmail,
		studentPassword,
		c.courseID,
		courseName
	FROM msStudent a
	JOIN trStudentDetail b ON a.studentID = b.studentID
	JOIN msCourse c ON b.courseID = c.courseID
	WHERE studentEmail LIKE @Email AND studentPassword LIke @Password AND courseActive = 1
END

GO
CREATE PROCEDURE bn_student_createNewStudent
	@Name VARCHAR(25),
	@DOB DATE,
	@Email VARCHAR(50),
	@SecEmail VARCHAR(50),
	@Password VARCHAR(50),
	@SecurityQuestion VARCHAR(100),
	@SecurityAnswer VARCHAR(50)
AS
DECLARE
	@next_idx CHAR(3),
	@input_id CHAR(14),
	@securityQuestionID CHAR(3)
BEGIN
	SET NOCOUNT ON

	-- Get last index & set current index
	SELECT TOP 1
		@next_idx = CAST( FORMAT( CAST( RIGHT(studentID, 3) AS INT) + 1, '000') AS VARCHAR)
	FROM msStudent
	ORDER BY studentID DESC

	-- Set current id
	SET @input_id = 'SD' + 
					CAST(YEAR(GETDATE()) AS VARCHAR) + 
					'0' + CAST( FORMAT( MONTH(GETDATE()), '00') AS VARCHAR ) + 
					CAST(DAY(GETDATE()) AS VARCHAR) + 
					CAST(@next_idx AS VARCHAR)

	-- Security Question ID
	SELECT
		@securityQuestionID = securityQuestionID
	FROM msSecurityQuestion
	WHERE accSecurityQuestion LIKE @SecurityQuestion

	-- Insert values
	INSERT INTO msStudent (
		studentID,
		studentName,
		studentDOB,
		studentEmail,
		studentSecondaryEmail,
		studentPassword,
		securityQuestionID,
		accSecurityAnswer,
		studentPicture,
		studentOverallProgress,
		studentRegister
	)
	VALUES(@input_id, @Name, @DOB, @Email, @SecEmail, @Password, @securityQuestionID, @SecurityAnswer, null, 0, CURRENT_TIMESTAMP)
	
	INSERT INTO trStudentDetail (
		studentID,
		courseID,
		courseStatus,
		courseActive
	)
	VALUES
	(@input_id, 'CRSL01', 0, 1),
	(@input_id, 'CRJA02', 0, 0),
	(@input_id, 'CRAJ03', 0, 0)
END

GO
CREATE PROCEDURE bn_student_forgetPassword
	@Email VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
		studentID,
		studentName,
		accSecurityQuestion,
		accSecurityAnswer,
		studentEmail,
		studentPassword
	FROM msStudent a
	JOIN msSecurityQuestion b ON a.securityQuestionID = b.securityQuestionID
	WHERE studentEmail LIKE @Email
END

GO
CREATE PROCEDURE bn_student_changePassword
	@Email VARCHAR(50),
	@CurrentPassword VARCHAR(50),
	@NewPassword VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE msStudent SET studentPassword = @NewPassword
	WHERE studentEmail LIKE @Email AND studentPassword LIKE @CurrentPassword
END

GO
CREATE PROCEDURE bn_student_changePicture
	@Email VARCHAR(50),
	@Image VARBINARY(MAX)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE msStudent
	SET studentPicture = @Image
	WHERE studentEmail LIKE @Email
END

GO
CREATE PROCEDURE bn_student_readDetail
	@Email VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON

	SELECT TOP 1
		b.studentID,
		studentName,
		"studentDOB" = CONVERT(VARCHAR, studentDOB, 107),
		c.courseID,
		courseName,
		--courseProcess?
		studentPicture,
		studentOverallProgress
	FROM trStudentDetail a
	JOIN msStudent b ON a.studentID = b.studentID
	JOIN msCourse c ON a.courseID = c.CourseID
	WHERE studentEmail LIKE @Email AND courseActive = 1
	ORDER BY courseActive DESC
END

GO
CREATE PROCEDURE bn_student_changeCourse
	@Email VARCHAR(50),
	@Course VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON

	-- Set all course activity into non-active (0)
	UPDATE a SET courseActive = 0
	FROM trStudentDetail a
	JOIN msStudent b ON a.studentID = b.studentID
	WHERE studentEmail LIKE @Email

	-- Set changed course activity into active (1)
	UPDATE a SET courseActive = 1
	FROM trStudentDetail a
	JOIN msStudent b ON a.studentID = b.studentID
	JOIN msCourse c ON a.courseID = c.courseID
	WHERE studentEmail LIKE @Email AND courseName LIKE @Course
END

GO
CREATE PROCEDURE bn_student_readMaterials
	@CourseName VARCHAR(25)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
		a.materialID,
		materialName,
		materialDesc,
		materialFile,
		'dataUploaded' = CONVERT(VARCHAR, dataUploaded, 107)
	FROM msMaterial a
	JOIN trMaterialDetail b ON a.materialID = b.materialID
	JOIN msCourse c ON b.courseID = c.courseID
	WHERE courseName LIKE @CourseName AND adminID != ''
END

GO
CREATE PROCEDURE bn_student_getMaterial
	@MaterialID CHAR(6)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
		materialID,
		materialName,
		materialDesc,
		dataUploaded,
		materialFile
	FROM msMaterial
	WHERE materialID LIKE @MaterialID
END

GO
CREATE PROCEDURE bn_student_checkAvailabilityExercise
	@Email VARCHAR(50),
	@ExerciseID CHAR(4)
AS
DECLARE
	@prev_idx CHAR(2),
	@max_score INT,
	@result TINYINT
BEGIN
	SET NOCOUNT ON

	-- Get prev index
	SELECT TOP(1)
		@prev_idx = CAST( FORMAT( CAST( RIGHT(@ExerciseID, 2) AS INT) - 1, '00') AS VARCHAR)
	FROM trExercise

	IF(EXISTS(
		SELECT a.studentID
		FROM trHistoryExercise a
		JOIN msStudent b ON a.studentID = b.studentID
	))
	BEGIN
		SELECT
			@max_score = MAX(score)
		FROM trHistoryExercise a
		JOIN msStudent b ON a.studentID = b.studentID
		WHERE studentEmail LIKE @Email AND exerciseID LIKE 'EX'+@prev_idx

		IF(@max_score < 4 OR @max_score LIKE NULL)
		BEGIN
			SET @result = 0
		END
		ELSE
		BEGIN
			SET @result = 1
		END

		SELECT 'Availability' = @result
	END
	ELSE
	BEGIN
		SELECT 'Availability' = 0
	END
END

GO
CREATE PROCEDURE bn_student_readExerciseQuestion
	@ExerciseID CHAR(4)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
		a.packageID,
		question,
		answer1,
		answer2,
		answer3
	FROM msPackage a
	JOIN trPackageDetail b ON a.packageID = b.packageID
	WHERE exerciseID LIKE @ExerciseID
END

GO
CREATE PROCEDURE bn_student_checkExerciseQuestion
	@ExerciseID CHAR(4),
	@Num INT
AS
BEGIN
	SET NOCOUNT ON

	SELECT TOP(1)
		'answer' = ans
	FROM (
		SELECT TOP(@Num)
			b.packageID,
			'ans' = answer1
		FROM trPackageDetail a
		JOIN msPackage b ON a.packageID = b.packageID
		WHERE exerciseID LIKE @ExerciseID
		ORDER BY packageID ASC
	) AS AnswerTable
	ORDER BY AnswerTable.packageID DESC
END

GO
CREATE PROCEDURE bn_student_SubmitExercise
	@Email VARCHAR(50),
	@ExerciseID CHAR(4),
	@Score INT
AS
DECLARE
	@next_idx CHAR(3),
	@input_id CHAR(5),
	@student_id CHAR(14)
BEGIN
	SET NOCOUNT ON

	-- Get last index & set current index
	SELECT TOP(1)
		@next_idx = CAST( FORMAT( CAST( RIGHT(historyID, 3) AS INT) + 1, '000') AS VARCHAR)
	FROM trHistoryExercise
	ORDER BY historyID DESC

	SET @input_id = 'HS' + @next_idx

	-- Get student ID
	SELECT
		@student_id = studentID
	FROM msStudent
	WHERE studentEmail LIKE @Email

	-- Insert values
	INSERT INTO trHistoryExercise(historyID, studentID, exerciseID, score, exerciseDate)
	VALUES(@input_id, @student_id, @ExerciseID, @Score, CURRENT_TIMESTAMP)
END


/***
 * Created by: Verren
 * Date: January 19th, 2019
 * Purpose: Create stored procedure to LapakMikir database
***/

GO
CREATE PROCEDURE bn_student_getStudyReport 
	@Email VARCHAR(50),
	@CourseName VARCHAR(25)
AS
BEGIN
	SET NOCOUNT ON

	SELECT DISTINCT
		b.exerciseID,
		'score' = CAST(score AS varchar) + '/5',
		exerciseDate,
		'status' = CASE WHEN score < 4 THEN 'Failed' ELSE 'Passed' END
	FROM trHistoryExercise a
	JOIN trExercise b ON a.exerciseID = b.exerciseID
	JOIN msCourse c ON b.courseID = c.courseID
	JOIN msStudent d ON a.studentID = d.studentID
	JOIN trStudentDetail e ON c.courseID = e.courseID
	WHERE studentEmail = @Email AND courseName LIKE @CourseName
END
