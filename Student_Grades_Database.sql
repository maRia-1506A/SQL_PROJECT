CREATE DATABASE student_grade;
CREATE DATABASE IF NOT EXISTS student_grade;
USE student_grade;

-- student table
CREATE TABLE student (
	studentID INT PRIMARY KEY, name VARCHAR(25), address VARCHAR(10)
);

-- course table
CREATE TABLE course (
	courseID INT PRIMARY KEY, courseName VARCHAR(25)
);

-- grades table
CREATE TABLE grades (
	gardeID INT PRIMARY KEY, grade DECIMAL(5,2), studentID INT, courseID INT,
    FOREIGN KEY(studentID) REFERENCES student (studentID),
	FOREIGN KEY(courseID) REFERENCES course (courseID)
);
-- Fixing the typo:
ALTER TABLE grades CHANGE COLUMN gardeID gradeID INT;

-- Add students and courses 
INSERT INTO student (studentID, name, address)
VALUES
(101, "Maria", "Jashore"),
(102, "Efath", "Bhola"),
(103, "Afridi", "Mymensingh");

INSERT INTO course (courseID, courseName)
VALUES
(001, "AOL"),
(002, "Algorithm");
INSERT INTO course (courseID, courseName)
VALUES
(003, "DBMS");

-- Record student grades 
INSERT INTO grades (gradeID, grade, studentID, courseID)
VALUES
(1, 98.5, 101, 001),
(2, 80, 102, 002),
(3, 87.75, 103, 001),
(4, 70, 101, 002),
(5, 65, 103, 003);

-- Calculate average grades for a student 
SELECT s.name, ROUND(AVG(g.grade), 2) AS avg_grade
FROM grades as g
JOIN student as s
ON g.studentID= s.studentID
WHERE g.studentID = 101;

-- List students with the highest grades in a course 
SELECT s.studentID, s.name, c.courseName, g.grade 
FROM grades as g
JOIN student as s ON g.studentID=s.studentID
JOIN course as c ON g.courseID= c.courseID
WHERE g.courseID= 002
AND g.grade= (
	SELECT MAX(grade) FROM grades
    WHERE courseID= 002
);

