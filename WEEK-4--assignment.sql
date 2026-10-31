CREATE DATABASE EMPLOYEE_DB;
USE EMPLOYEE_DB;
CREATE TABLE departments (dept_id INT PRIMARY KEY,dept_name VARCHAR(50) NOT NULL);
CREATE TABLE employees (emp_id INT PRIMARY KEY,employee_name varchar(50),
dept_id INT,
    manager_id INT,
    salary DECIMAL(10, 2) NOT NULL,
    joining_date DATE NOT NULL
    );
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    budget DECIMAL(10, 2) NOT NULL
);  
CREATE TABLE employee_projects (
    emp_id INT,
    project_id INT,
    hours_worked INT NOT NULL);
SELECT * FROM departments,employees,projects;
INSERT INTO departments (dept_id, dept_name) VALUES(1, 'IT'),(2, 'HR'),(3, 'Finance'),(4, 'Marketing'),(5, 'Operations');
INSERT INTO employees (emp_id,employee_name, dept_id, manager_id, salary, joining_date) VALUES(101, 'Gopi', 1, NULL, 95000, '2019-03-15'),(102, 'Priya', 1, 101, 72000, '2021-06-01'),(103, 'Arun', 3, 101, 55000, '2020-01-10'),(104, 'Sneha', 2, NULL, 38000, '2022-09-15'),(105, 'Vikram', 1, 102, 42000, '2023-02-20'),(106, 'santosh', 4, 103, 32000, '2024-01-05');
INSERT INTO projects (project_id, project_name, budget) VALUES(501, 'Cloud', 1500000),(502, 'Middleware', 2200000),(503, 'database', 450000),(504, 'Aichatbot', 850000),(505, 'Networking', 300000);
INSERT INTO employee_projects (emp_id, project_id, hours_worked) VALUES(101, 501, 120),(101, 502, 90),(102, 501, 160),(102, 504, 110),(103, 502, 140);
#1. Generate an employee report displaying employee names, department names, salary details, joining dates, and years of experience.#
SELECT employee_name,salary,joining_date,TIMESTAMPDIFF(YEAR,joining_date,CURDATE()) AS EXPERIENCE_YEAR,dept_name  FROM employees,departments;
#2. Identify employees based on their salary range and classify them into salary categories such as Low, Medium, and High#
SELECT employee_name,salary,
CASE
    WHEN salary >50000 THEN  'HIGH'
    WHEN salary BETWEEN 40000 AND 50000 THEN 'MEDIUM'
    ELSE 'LOW'
    END AS SALARY_LEVEL
    FROM employees;
 #3. Generate a department-wise report showing the total salary, average salary, highest salary, and number of employees. Display only departments whose average salary is greater than ₹40,000. #
 SELECT E.salary,E.employee_name, E.dept_id,D.dept_name,SUM(E. salary) AS TOTAL_SALARY_SUM,MAX(E. salary) AS HIGHEST_SALARY,COUNT(E.emp_id) AS NUMBER_OF_EMPLOYEE FROM employees E LEFT JOIN  departments D ON E.dept_id = D.dept_id GROUP BY E.salary,E.employee_name, E.dept_id,D.dept_name HAVING AVG(E. salary) >40000;
 #4.4. Display employee names along with their respective manager names and identify employees who do not have a manager.#
 SELECT E.employee_name,M.employee_name AS ASSIGNED_MANAGER FROM employees E LEFT JOIN employees M ON E.manager_id = M.emp_id;
 SELECT E.employee_name,M.employee_name AS ASSIGNED_MANAGER FROM employees E LEFT JOIN employees M ON E.manager_id = M.emp_id WHERE M.employee_name IS NULL;
#5. Generate a report showing employee and project combinations, including employees who are not assigned to any project and projects that do not have any employees.#
	SELECT 
    E.employee_name,
    P.project_name
FROM employees E
LEFT JOIN employee_projects EP ON E.emp_id = EP.emp_id
LEFT JOIN projects P ON EP.project_id = P.project_id

UNION

SELECT 
    E.employee_name,
    P.project_name
FROM projects P
LEFT JOIN employee_projects EP ON P.project_id = EP.project_id
LEFT JOIN employees E ON EP.emp_id = E.emp_id;

SELECT *FROM departments,employees,projects,employee_projects

#6. Identify employees whose salary is greater than the company's average salary and employees who earn more than the average salary of their respective departments.#
SELECT employee_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
#7. Find employees who work in the same department as a given employee and employees whose salary is greater than the average salary of the IT department.#
SELECT E.employee_name,D.dept_name,E.salary FROM employees E INNER JOIN departments D ON E.dept_id = D.dept_id WHERE salary >( SELECT AVG(salary) FROM employees E);
#8. Identify the second-highest-paid employee in the company and the highest-paid employee in each department.#
SELECT E.employee_name,E.salary FROM employees E WHERE E.salary = (SELECT MAX(E.salary) FROM employees E WHERE E.salary < (SELECT MAX(E.salary) FROM employees E));
#9. Find employees who are assigned to projects with a budget greater than the average project budget.#
SELECT E.employee_name,P.project_name,P.budget FROM employees E LEFT JOIN employee_projects EP ON E.emp_id = EP.emp_id LEFT JOIN projects P ON EP.project_id = P.project_id WHERE budget >(SELECT AVG(budget) FROM projects);
#10. Identify employees who have worked on projects with more hours than the average project working hours.#
SELECT E.employee_name,P.project_name,EP.hours_worked FROM employees E LEFT JOIN employee_projects EP ON E.emp_id = EP.emp_id LEFT JOIN projects P ON EP.project_id = P.project_id WHERE hours_worked >(SELECT AVG(hours_worked) FROM employee_projects);
#11. Generate a report showing each employee's total number of assigned projects and identify employees who are assigned to more projects than the average number of projects per employee#
SELECT E.employee_name,COUNT(EP.project_id) AS total_projects  
FROM employees E 
INNER JOIN employee_projects EP ON E.emp_id = EP.emp_id 
GROUP BY E.emp_id, E.employee_name 
HAVING COUNT(EP.project_id) > 1;
#12. Display all possible employee and project combinations for project planning and resource allocation.#
SELECT e.employee_name,p.project_name FROM employees e CROSS JOIN projects p;

     


    







