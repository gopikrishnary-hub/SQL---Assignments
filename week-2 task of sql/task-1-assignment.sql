create database HRDB
use HRDB
create table Employees(Employee_ID int primary key,Employee_Name varchar(100) not null,Department varchar(50),email varchar(100),Salary decimal(10,2),Joining_Date date,city varchar(50));
insert into Employees(Employee_ID,Employee_Name,Department,email,Salary,Joining_Date,city) values(1,'Gopikrishna','production','gopi@gmail.com',70000,'2026-04-03','goa'),(2,' GokulaKrishna ','production','pi@gmail.com',80000,'2025-07-03','chennai'),(3,'krishna','EEE','krish@gmail.com',70000,'2026-04-03','goa'),(4,'rajaPandiyan ','production','gopi@gmail.com',70000,'2023-04-03','trichy'),(5,'suresh','production','gopi@gmail.com',90000,'2025-04-03','bombay');
select upper(Employee_Name) from Employees  as result;
select trim(Employee_Name) from Employees  as result;
select left(Employee_Name,3) from Employees
select email from employees;
select * from Employees where salary between 30000 and 70000;
select Department,avg(salary) as avg_salary from Employees group by Department;
select Department,avg(salary) as avg_salary from Employees group by Department having avg_salary >45000;
select Employee_Name from Employees  where Joining_Date >= '2025-07-03' 