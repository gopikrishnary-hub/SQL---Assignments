create database school;
use school
create table CSC(stu_id int primary key,Name varchar(50));
create table ECE(stu_id int primary key,Name varchar(50));
INSERT INTO CSC (stu_id, Name) 
VALUES (101, 'GOPI'), 
       (102, 'ARUN'), 
       (103, 'JHON');
INSERT INTO ECE (stu_id, Name) VALUES(101,'GOPI'),(104, 'KRISHNA'),(105, 'PRIYA');  
SELECT stu_id,Name FROM CSC UNION SELECT stu_id,Name FROM ECE; 
SELECT stu_id,Name FROM CSC EXCEPT SELECT stu_id,Name FROM ECE;
SELECT stu_id,Name FROM CSC INTERSECT SELECT stu_id,Name FROM ECE; 
SELECT stu_id,Name FROM CSC MINUS SELECT stu_id,Name FROM ECE;
CREATE TABLE Employees (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);  
INSERT INTO Employees (ID, Name, Department, Salary) VALUES 
(1, 'David', 'Engineering', 85000),
(2, 'Elena', 'Finance', 72000),
(3, 'Fahad', 'IT Support', 48000),
(4, 'Grace', 'Data Science', 95000),
(5, 'Isaac', 'Research', 64000);
SELECT  Name, Salary,AVG(Salary) OVER() AS AV_SALARY FROM Employees;
SELECT  Name, Salary,AVG(Salary) OVER(PARTITION BY Department) AS DEPT_AV_SALARY FROM Employees;
SELECT  Name,Salary,ROW_NUMBER() OVER(ORDER BY Salary DESC) AS ROWNUMBER FROM Employees;
SELECT  Name,Salary,ROW_NUMBER() OVER(PARTITION BY Department ORDER BY Salary DESC) AS ROWNUMBER FROM Employees;
INSERT INTO Employees (ID, Name, Department, Salary) VALUES (6,'GOPI','R&D',95000);
SELECT Name, Salary,RANK() OVER(ORDER BY Salary) AS SALARY_RANK FROM Employees;
SELECT Name, Salary,DENSE_RANK() OVER(ORDER BY Salary) AS SALARY_RANK FROM Employees;
SELECT Name, Salary,NTILE(4) OVER(ORDER BY Salary ) AS PERFORMANCE FROM Employees;
SELECT * FROM Employees;
ALTER TABLE Employees ADD HIRE_DATE DATE AFTER Salary;
UPDATE Employees SET hire_date = '2026-11-03' WHERE ID = 1;
UPDATE Employees SET hire_date = '2026-12-03' WHERE ID= 2;
UPDATE Employees SET hire_date = '2026-10-03' WHERE ID= 3;
UPDATE Employees SET hire_date = '2026-09-03' WHERE ID = 4;
UPDATE Employees SET hire_date = '2026-08-03' WHERE ID= 5;
UPDATE Employees SET hire_date = '2026-05-03' WHERE ID= 6;
SELECT * FROM Employees;
SELECT 
    Name,
    Salary,
    LAG(Salary) OVER (ORDER BY Salary ASC) AS Previous_Lower_Salary,
    LEAD(Salary) OVER (ORDER BY Salary ASC) AS Next_Higher_Salary
FROM Employees;
SELECT 
    Name,
    Salary,
    hire_date,
    FIRST_VALUE(Name) OVER (
        ORDER BY Salary ASC
    ) AS Lowest_Paid_Employee,
    LAST_VALUE(Name) OVER (
        ORDER BY Salary ASC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS Highest_Paid_Employee
FROM Employees;
