create table Teachers(
ID int primary key,
username varchar(255),
email varchar(255)
);

create table TeachersDetails(
ID int primary key,
firstName varchar(255),
lastName varchar(255),
age int ,
major varchar(255),
serviceLong int,
FOREIGN KEY (ID) REFERENCES Teachers(ID)
);

create table Students(
ID int primary key,
firstname varchar(255),
lastname varchar(255),
grade varchar(255),
years int

);

create table Courses(
ID int primary key,
courseName varchar(255),
courseType varchar(255),
courseLevel int ,
teacherID int,
FOREIGN KEY (teacherID) REFERENCES Teachers(ID)
);


create table Students_Courses(
studentID int,
courseID int,
FOREIGN KEY (studentID) REFERENCES Students(ID),
FOREIGN KEY (courseID) REFERENCES Courses(ID)

);


INSERT INTO Teachers (ID, username, email) VALUES
(1001, 'MalekSalem' , 'MalekSalem@gmail.com'),
(1002, 'FahadSalem' , 'FahadSalem@gmail.com'),
(1003, 'OmarSalem' , 'MalekSalem@gmail.com'),
(1004, 'AymanSalem' , 'AymanSalem@gmail.com'),
(1005, 'AnasSalem' , 'AnasSalem@gmail.com');


INSERT INTO TeachersDetails (ID, firstName, lastName, age , major , serviceLong) VALUES
(1005, 'Anas' , 'Salem',25,'English', 2),
(1004, 'Ayman' , 'Salem',34,'Arabic', 10),
(1003, 'Omar' , 'Salem',32,'Math', 8),
(1002, 'Fahad' , 'Salem',29,'Lucture', 5),
(1001, 'Malek' , 'Salem',45,'Sience',18);


select * from Teachers;