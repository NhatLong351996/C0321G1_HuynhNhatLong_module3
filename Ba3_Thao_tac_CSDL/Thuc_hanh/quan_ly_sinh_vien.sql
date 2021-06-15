create database quanlysinhvien;
use quanlysinhvien;

create table Class(
ClassID int auto_increment primary key,
ClassName varchar(60) not null,
StartDate date not null,
Status BIT
);

create table student(
StudentID int auto_increment primary key,
StudentName varchar(30) not null,
Adress varchar(50),
Phone varchar(20),
Status bit,
ClassID int not null,
foreign key(ClassID) references class(ClassID)
);

create table subject(
SubID int auto_increment primary key,
SubName varchar(30) not null,
Credit tinyint default 1 check(Credit >=1),
Status bit default 1
);

use quanlysinhvien;
create table mark(
MarkID int auto_increment primary key,
SubID int not null,
StudentID int not null,
Mark float default 0 check (Mark between 0 and 100),
ExamTimes tinyint default 1,
foreign key(SubID) references subject(SubID),
foreign key(StudentID) references student(StudentID)
);

use quanlysinhvien;
insert into class(ClassName,StartDate,Status)
value ('A1', '2008-12-20', 1);
insert into class(ClassName,StartDate,Status)
value ('A2', '2008-12-22', 1);
insert into class(ClassName,StartDate,Status)
value ('B3', current_date, 0);

INSERT INTO Student (StudentName, Adress, Phone, Status, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (StudentName, Adress, Status, ClassId)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (StudentName, Adress, Phone, Status, ClassId)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);

