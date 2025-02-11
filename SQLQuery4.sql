create table Students(
ID int primary key identity(1,1),
name varchar(255),
dateofbirth date,
address varchar(255),
age int
);


create table familyInfo(
ID int primary key identity(1,1),
familyID int unique ,
fatherName varchar(255),
residant varchar(255),
FOREIGN KEY (familyID) REFERENCES Students(ID)
);


create table Courses(
ID int primary key identity(1,1),
name varchar(255),
description varchar(255),
Resource varchar(255)


);


create table Classes(
ID int primary key identity(1,1),
classCode int ,
roomNum int,
schedule varchar(255)

);


create table Assignments(
ID int primary key identity(1,1),
name varchar(255),
description varchar(255),
dateofassign date,
state NVARCHAR(10) CHECK (state IN ('pass', 'failed')) 
);


create table attendance(
ID int primary key identity(1,1),
attenddate date,
student_id INT, 
class_id int,
absence_type NVARCHAR(20) CHECK (absence_type IN ('leaving', 'absence', 'late')),  
FOREIGN KEY (student_id) REFERENCES Students(ID) ON DELETE CASCADE
);



create table Enrollments(
studentID int,
courseID int,
PRIMARY KEY (studentID, courseID),
FOREIGN KEY (studentID) REFERENCES Students(ID) ON DELETE CASCADE,
FOREIGN KEY (courseID) REFERENCES Courses(ID) ON DELETE CASCADE
);


CREATE TABLE StudentClasses (
studentID INT,  
courseID INT, 
PRIMARY KEY (studentID, courseID), 
FOREIGN KEY (studentID) REFERENCES Students(ID) ON DELETE CASCADE, 
FOREIGN KEY (courseID) REFERENCES Classes(ID) ON DELETE CASCADE 
);


CREATE TABLE Submissions (
submission_id INT PRIMARY KEY, 
student_id INT,  
assignment_id INT,  
submission_date DATE NOT NULL,  
state NVARCHAR(10) CHECK (state IN ('pass', 'failed')), 
FOREIGN KEY (student_id) REFERENCES Students(ID) ON DELETE CASCADE,  
FOREIGN KEY (assignment_id) REFERENCES Assignments(ID) ON DELETE CASCADE  
);


SELECT * FROM Students WHERE dateofbirth = 'YYYY-MM-DD';

SELECT * FROM Courses WHERE name = 'Math';


--Add a new column 'Email' to the Students table:

ALTER TABLE Students ADD Email VARCHAR(255);


INSERT INTO Students (name, dateofbirth, address) 
VALUES ('John Doe', '2010-05-15', '123 Main St');


SELECT *
FROM Students 
INNER JOIN familyInfo  ON Students.ID = familyInfo.familyID;


SELECT * 
FROM Students 
JOIN attendance  ON Students.ID = attendance.student_id
JOIN Classes  ON attendance.class_id = Classes.ID
JOIN Courses  ON Classes.ID = Courses.ID
WHERE Courses.name = 'Math';


