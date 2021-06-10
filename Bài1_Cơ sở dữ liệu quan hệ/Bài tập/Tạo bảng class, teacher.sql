create database student_management;
create table student_management.student(
id int primary key not null,
namestudent varchar(45) ,
age int,
country varchar(45));
create table student_management.class(
id int primary key not null,
nameclass varchar(45));
create table student_management.teacher(
id int primary key not null,
nameteacher varchar(45),
age int,
country varchar(45));