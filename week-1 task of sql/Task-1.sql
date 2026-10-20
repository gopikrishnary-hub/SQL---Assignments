create database collegeDB;
use collegeDB
create table students(students_ID int,student_Name varchar(30),Age int,Department varchar(30),Marks int);
insert into students(students_ID,student_Name,Age,Department,Marks) values(1,'xxx',25,'mechanical',95),(2,'ggg',26,'EEE',83),(3,'ppp',24,'IT',79),(4,'zzz',23,'EEE',75),(5,'yyy',28,'civil',85);
select *from students;
select student_Name,Department from students;
select *from students where Marks >80;