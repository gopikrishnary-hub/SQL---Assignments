create database company;
use company;
create table Employees(Employee_ID int,Employee_Name varchar(50),Department varchar(30),Salary decimal(10,2),City varchar(30));
insert into Employees(Employee_ID,Employee_Name,Department,Salary,City) values(1,'Arun','Finance',30000,'chennai'),(2,'sarath','book keeping',60000,'delhi'),(3,'suresh','cso services',80000,'kolkata'),(4,'varun','IT',70000,'hyderabad'),(5,'Tharun','HR',50000,'mumbai'),(6,'maran','sales tax',55000,'lucknow');
select *from Employees
update Employees set Salary = Salary + 20000  where Employee_ID =1;
update Employees set Salary = 45000 where Employee_ID =1;
update Employees set Department = 'Finance' where Employee_Name = 'Tharun';
alter table Employees add status_of_the_employee varchar(20);
insert into Employees(status_of_the_employee) values('working'),('resigned'),('working'),('working'),('working');
alter table Employees drop column status_of_the_employee;
alter table Employees add status_of_the_employee varchar(20);
update Employees set status_of_the_employee = 'working' where Employee_ID = 1 and 2;
update Employees set status_of_the_employee = 'resigned' where Employee_Name = 'maran';
delete from Employees where Employee_ID = 6;
select *from Employees where Salary >40000;
select *from Employees where Department = 'IT';




