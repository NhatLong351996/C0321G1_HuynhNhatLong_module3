create database quanlysinhvien;
use quanlysinhvien;

create table Class(
ClassID int auto_increment primary key,
ClassName varchar(60) not null,
StartDate datetime not null,
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