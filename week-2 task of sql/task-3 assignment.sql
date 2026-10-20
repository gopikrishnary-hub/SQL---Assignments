create database  TrainingDB;
use TrainingDB;
create table Students(Student_ID int primary key,Student_Name varchar(30) not null,Email varchar(40) unique,Course_Name varchar(50),Marks int,Registration_Date date,City varchar(50));
insert into Students (Student_ID, Student_Name, Email, Course_Name, Marks, Registration_Date, City) values
(101, 'Liam Smith', 'liam.smith@email.com', 'Data Science', 88, '2026-01-15', 'New York'),
(102, 'Noah Johnson', 'noah.j@email.com', 'Web Development', 76, '2026-01-18', 'Los Angeles'),
(103, 'Oliver Brown', 'oliver.b@email.com', 'Cybersecurity', 92, '2026-02-01', 'Chicago'),
(104, 'Emma Davis', 'emma.davis@email.com', 'Data Science', 85, '2026-02-10', 'Houston'),
(105, 'Ava Miller', 'ava.m@email.com', 'Artificial Intelligence', 95, '2026-02-12', 'Phoenix'),
(106, 'Sophia Wilson', 'sophia.w@email.com', 'Web Development', 64, '2026-02-15', 'Philadelphia'),
(107, 'Isabella Moore', 'isabella.m@email.com', 'Cybersecurity', 78, '2026-03-01', 'San Antonio'),
(108, 'Mia Taylor', 'mia.taylor@email.com', 'Cloud Computing', 90, '2026-03-05', 'San Diego');
select lower(Student_Name) from Students;
select length(Student_Name) from students;
select substring(Student_Name,1,5) as result from  students;
select *from students where Marks >75 and Registration_Date > '2026-01-15';
select  Course_Name,count(Student_Name) from students group by  Course_Name;
select  Course_Name,count(Student_Name) from students group by  Course_Name having Course_Name >2;
select avg(Marks),min(Marks),max(Marks) from students;
select datediff('2026-01-15' ,current_date);