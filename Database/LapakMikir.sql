/***
 * Created by: Jason
 * Date: December 22nd, 2018
 * Purpose: Database LapakMikir
***/

-- //Create and Use Database
CREATE DATABASE LapakMikir
GO
USE LapakMikir

-- //Create Table
CREATE TABLE msSecurityQuestion (
	securityQuestionID CHAR(3) PRIMARY KEY,
	accSecurityQuestion VARCHAR(50),

	CONSTRAINT check_securityQuestionID CHECK(securityQuestionID LIKE 'SQ[0-9]')
)

CREATE TABLE msStudent (
	studentID CHAR(14) PRIMARY KEY,
	studentName VARCHAR(25) NOT NULL,
	studentDOB DATE NOT NULL,
	studentEmail VARCHAR(50) NOT NULL,
	studentSecondaryEmail VARCHAR(50) NOT NULL,
	studentPassword VARCHAR(50) NOT NULL,
	securityQuestionID CHAR(3) FOREIGN KEY REFERENCES msSecurityQuestion(securityQuestionID) NOT NULL,
	accSecurityAnswer VARCHAR(50) NOT NULL,
	studentPicture VARBINARY(MAX),
	studentOverallProgress INT NOT NULL,
	studentRegister DATETIME NOT NULL,

	CONSTRAINT check_studentID CHECK(studentID LIKE 'SD[1-2][0-9][0-9][0-9]0[0-1][1-9][0-3][0-9][0-9][0-9][0-9]'), -- SD[YYYYMMMDD = date of register][0-9 = list of number]
	CONSTRAINT check_studentEmail CHECK(studentEmail LIKE '%_@__%.__%'),
	CONSTRAINT check_studentEmail_unique UNIQUE(studentEmail), -- studentEmail must be unique
	CONSTRAINT check_studentSecondaryEmail CHECK(studentSecondaryEmail LIKE '%_@__%.__%' AND studentSecondaryEmail NOT LIKE studentEmail),
	CONSTRAINT check_studentOverallProgress CHECK(studentOverallProgress >= 0 AND studentOverallProgress <= 100) -- max student overall progress = 100
)

CREATE TABLE msAdmin (
	adminID CHAR(4) PRIMARY KEY,
	adminName VARCHAR(25) NOT NULL,
	adminEmail VARCHAR(50) NOT NULL,
	adminPassword VARCHAR(50) NOT NULL,
	adminRegister DATETIME NOT NULL,

	CONSTRAINT check_adminID CHECK(adminID LIKE 'AD[0][0-9]'),
	CONSTRAINT check_adminEmail CHECK(adminEmail LIKE '%_@__%.__%'),
	CONSTRAINT check_adminEmail_unique UNIQUE(adminEmail), -- adminEmail must be unique
	CONSTRAINT check_adminPassword CHECK(LEN(adminPassword) >= 8)
)

CREATE TABLE msCourse (
	courseID CHAR(6) PRIMARY KEY,
	courseName VARCHAR(25) NOT NULL,
	courseDesc VARCHAR(255) NOT NULL,

	CONSTRAINT check_courseID CHECK(courseID LIKE 'CR[A-Z][A-Z][0][1-3]'), -- CR[A-Z = initial of course][0][1-3 = code of course]
)

CREATE TABLE msMaterial (
	materialID CHAR(6) PRIMARY KEY,
	adminID CHAR(4) FOREIGN KEY REFERENCES msAdmin(adminID),
	materialName VARCHAR(50) NOT NULL,
	materialDesc VARCHAR(255) NOT NULL,
	materialFile VARBINARY(MAX),
	dataUploaded DATETIME NOT NULL,

	CONSTRAINT check_materialID CHECK(materialID LIKE 'MR[1-3][0-9][0-9][0-9]'), --MR[1-3 = code of course][0-9 = list of number]
	CONSTRAINT check_materialFile CHECK(DATALENGTH(materialFile) <= 2097152) -- max file size = 2MB
)

CREATE TABLE trMaterialDetail (
	courseID CHAR(6) FOREIGN KEY REFERENCES msCourse(courseID) NOT NULL,
	materialID CHAR(6) FOREIGN KEY REFERENCES msMaterial(materialID) NOT NULL
)

CREATE TABLE trExercise (
	exerciseID CHAR(4) PRIMARY KEY,
	courseID CHAR(6) FOREIGN KEY REFERENCES msCourse(courseID) NOT NULL,

	CONSTRAINT check_exerciseID CHECK(exerciseID LIKE 'EX[0-9][0-9]')
)

CREATE TABLE msPackage (
	packageID CHAR(5) PRIMARY KEY,
	question VARCHAR(255) NOT NULL,
	answer1 VARCHAR(255) NOT NULL,
	answer2 VARCHAR(255) NOT NULL,
	answer3 VARCHAR(255) NOT NULL,

	CONSTRAINT check_packageID CHECK(packageID LIKE 'PC[0-9][0-9][0-9]')
)

CREATE TABLE trPackageDetail (
	exerciseID CHAR(4) FOREIGN KEY REFERENCES trExercise(exerciseID) NOT NULL,
	packageID CHAR(5) FOREIGN KEY REFERENCES msPackage(packageID) NOT NULL
)

CREATE TABLE trHistoryExercise (
	historyID CHAR(5) PRIMARY KEY,
	studentID CHAR(14) FOREIGN KEY REFERENCES msStudent(studentID) NOT NULL,
	exerciseID CHAR(4) FOREIGN KEY REFERENCES trExercise(exerciseID) NOT NULL,
	score INT NOT NULL,
	exerciseDate DATETIME NOT NULL,

	CONSTRAINT check_historyID CHECK(historyID LIKE 'HS[0-9][0-9][0-9]'),
	CONSTRAINT check_score CHECK(score >= 0 AND score <=5) -- max score = 5
)

CREATE TABLE trStudentDetail (
	studentID CHAR(14) FOREIGN KEY REFERENCES msStudent(studentID) NOT NULL,
	courseID CHAR(6) FOREIGN KEY REFERENCES msCourse(courseID) NOT NULL,
	courseStatus TINYINT NOT NULL,
	courseActive TINYINT NOT NULL,

	CONSTRAINT check_courseStatus CHECK(courseStatus = 0 OR courseStatus = 1), -- 0 for not completed, 1 for completed
	CONSTRAINT check_courseActive CHECK(courseActive = 0 OR courseActive = 1) -- 0 for not active, 1 for active
)

-- //Insert Values
INSERT INTO msSecurityQuestion (securityQuestionID, accSecurityQuestion) VALUES
('SQ0', 'Select a question'),
('SQ1', 'What is your favorite movie genre'),
('SQ2', 'What is your first pet name'),
('SQ3', 'What was the name of your elementary school'),
('SQ4', 'What are the last five digits of your ID cart'),
('SQ5', 'What is the last name of your favorite teacher')

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
VALUES (
	'SD201801222000',
	'Testing Student',
	'2018/12/22',
	'test@student.com',
	'test@student.co.id',
	'test123',
	'SQ1',
	'Action',
	null,
	0,
	CURRENT_TIMESTAMP
)

INSERT INTO msAdmin(adminID, adminName, adminEmail, adminPassword, adminRegister) VALUES
('AD00', 'Testing Admin', 'test@admin.com', 'Admintest123', CURRENT_TIMESTAMP)

INSERT INTO msCourse(courseID,courseName, courseDesc) VALUES
('CRSL01', 'SQL', 'In this course, we will learn about database and query.'),
('CRJA02', 'Java', 'In this course, we will learn about basic of Java and object-oriented programming.'),
('CRAJ03', 'Advanced Java', 'In this course, we will learn about Java GUI and Java 2D.')

INSERT INTO msMaterial(materialID, adminID, materialName, materialDesc, materialFile, dataUploaded) VALUES
('MR1000', 'AD00', 'Testing SQL Material', 'This is first SQL testing material.', (SELECT * FROM OPENROWSET(BULK 'F:\Users\admin\Documents\Binus\JP2019\ITBootcamp\FinalProject\Database\File\Material\SQL1.pptx', SINGLE_BLOB) AS MaterialFile), CURRENT_TIMESTAMP),
('MR1001', 'AD00', 'Testing SQL Material 2', 'This is second SQL testing material.', (SELECT * FROM OPENROWSET(BULK 'F:\Users\admin\Documents\Binus\JP2019\ITBootcamp\FinalProject\Database\File\Material\SQL2.pptx', SINGLE_BLOB) AS MaterialFile), CURRENT_TIMESTAMP),
('MR1002', 'AD00', 'Testing SQL Material 3', 'This is third SQL testing material.', (SELECT * FROM OPENROWSET(BULK 'F:\Users\admin\Documents\Binus\JP2019\ITBootcamp\FinalProject\Database\File\Material\SQL3.pptx', SINGLE_BLOB) AS MaterialFile), CURRENT_TIMESTAMP),
('MR1003', 'AD00', 'Testing SQL Material 4', 'This is fourth SQL testing material.', (SELECT * FROM OPENROWSET(BULK 'F:\Users\admin\Documents\Binus\JP2019\ITBootcamp\FinalProject\Database\File\Material\SQL4.pptx', SINGLE_BLOB) AS MaterialFile), CURRENT_TIMESTAMP),
('MR2004', 'AD00', 'Testing Java Material 1', 'This is first Java testing material.', (SELECT * FROM OPENROWSET(BULK 'F:\Users\admin\Documents\Binus\JP2019\ITBootcamp\FinalProject\Database\File\Material\Java1.pptx', SINGLE_BLOB) AS MaterialFile), CURRENT_TIMESTAMP),
('MR2005', 'AD00', 'Testing Java Material 2', 'This is second Java testing material.', (SELECT * FROM OPENROWSET(BULK 'F:\Users\admin\Documents\Binus\JP2019\ITBootcamp\FinalProject\Database\File\Material\Java2.pptx', SINGLE_BLOB) AS MaterialFile), CURRENT_TIMESTAMP),
('MR2006', 'AD00', 'Testing Java Material 3', 'This is third Java testing material.', (SELECT * FROM OPENROWSET(BULK 'F:\Users\admin\Documents\Binus\JP2019\ITBootcamp\FinalProject\Database\File\Material\Java3.pptx', SINGLE_BLOB) AS MaterialFile), CURRENT_TIMESTAMP),
('MR3007', 'AD00', 'Testing Advanced Java Material 1', 'This is first Advanced Java testing material.', (SELECT * FROM OPENROWSET(BULK 'F:\Users\admin\Documents\Binus\JP2019\ITBootcamp\FinalProject\Database\File\Material\AdvancedJava1.pptx', SINGLE_BLOB) AS MaterialFile), CURRENT_TIMESTAMP),
('MR3008', 'AD00', 'Testing Advanced Java Material 2', 'This is second Advanced Java testing material.', (SELECT * FROM OPENROWSET(BULK 'F:\Users\admin\Documents\Binus\JP2019\ITBootcamp\FinalProject\Database\File\Material\AdvancedJava2.pptx', SINGLE_BLOB) AS MaterialFile), CURRENT_TIMESTAMP)

INSERT INTO trMaterialDetail(courseID, materialID) VALUES
('CRSL01', 'MR1000'),
('CRSL01', 'MR1001'),
('CRSL01', 'MR1002'),
('CRSL01', 'MR1003'),
('CRJA02', 'MR2004'),
('CRJA02', 'MR2005'),
('CRJA02', 'MR2006'),
('CRAJ03', 'MR3007'),
('CRAJ03', 'MR3008')

INSERT INTO trExercise(exerciseID, courseID) VALUES
('EX00', 'CRSL01'),
('EX01', 'CRSL01'),
('EX02', 'CRSL01')

INSERT INTO msPackage(packageID, question, answer1, answer2, answer3) VALUES
('PC001', 'SQL singkatan dari', 'Stucture Query Language', 'Start Query Linked', 'Structured Queen Language'),
('PC002', 'Database adalah', 'Basis data', 'Penyimpanan barang', 'Tempat penitiapan anak'),
('PC003', 'Yang bukan termasuk software database adalah', 'Mobile Legend', 'MySQL', 'Oracle'),
('PC004', 'DBMS berupakan singkatan dari', 'Database Management System', 'Database Management Studio', 'Database Multi System'),
('PC005', 'Pernyataan berikut yang TIDAK TEPAT adalah', 'Database merupakan alat pencari makan', 'Database merupakan kumpulan data yang terorganisir', 'DBMS merupakan perangkat lunak untuk mengelola database'),

('PC006', 'SELECT * FROM _______', 'Table name', 'Database name', 'Attribute name'),
('PC007', 'SELECT _______ FROM msUser', 'Attribute name', 'Database name', 'Table name'),
('PC008', 'Query yang berguna untuk membuat table adalah', 'CREATE', 'INSERT', 'SELECT'),
('PC009', 'INSERT INTO msStudent _______ (studentID, studentName, studentGender, studentAddress, studentGPA)', 'VALUES', 'TO', 'FROM'),
('PC010', 'Query berukut yang TIDAK TEPAT adalah', 'USE tableName', 'CREATE TABLE tableName (...)', 'DROP DATABASE databaseName')

INSERT INTO trPackageDetail(exerciseID, packageID) VALUES
('EX00', 'PC001'),('EX00', 'PC002'),('EX00', 'PC003'),('EX00', 'PC004'),('EX00', 'PC005'),
('EX01', 'PC006'),('EX01', 'PC007'),('EX01', 'PC008'),('EX01', 'PC009'),('EX01', 'PC010'),
('EX02', 'PC001'),('EX02', 'PC004'),('EX02', 'PC006'),('EX02', 'PC009'),('EX02', 'PC010')

INSERT INTO trHistoryExercise(historyID, studentID, exerciseID, score, exerciseDate) VALUES
('HS000', 'SD201801222000', 'EX00', 2, CURRENT_TIMESTAMP),
('HS001', 'SD201801222000', 'EX00', 4, CURRENT_TIMESTAMP),
('HS002', 'SD201801222000', 'EX00', 5, CURRENT_TIMESTAMP),
('HS003', 'SD201801222000', 'EX01', 4, CURRENT_TIMESTAMP),
('HS004', 'SD201801222000', 'EX01', 2, CURRENT_TIMESTAMP),
('HS005', 'SD201801222000', 'EX01', 5, CURRENT_TIMESTAMP)

INSERT INTO trStudentDetail(studentID, courseID, courseStatus, courseActive) VALUES
('SD201801222000', 'CRSL01', 0, 1),
('SD201801222000', 'CRJA02', 0, 0),
('SD201801222000', 'CRAJ03', 0, 0)


--USE master
--DROP DATABASE LapakMikir
