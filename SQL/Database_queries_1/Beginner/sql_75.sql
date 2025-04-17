CREATE DATABASE IF NOT EXISTS Sql75;
USE Sql75;

-- Create departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- Create employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    salary DECIMAL(10, 2),
    hire_date DATE,
    department_id INT,
    job_title VARCHAR(100),
    manager_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);




-- Insert into departments table
INSERT INTO departments (department_id, department_name)
VALUES 
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing'),
(5, 'Sales'),
(6, 'Operations'),
(7, 'Legal'),
(8, 'Customer Service'),
(9, 'R&D'),
(10, 'Supply Chain'),
(11, 'HR'), -- Duplicate
(12, 'Finance'), -- Duplicate
(13, 'IT'), -- Duplicate
(14, 'Marketing'), -- Duplicate
(15, 'Sales'), -- Duplicate
(16, 'Operations'), -- Duplicate
(17, 'Legal'), -- Duplicate
(18, 'Customer Service'), -- Duplicate
(19, 'R&D'), -- Duplicate
(20, 'Supply Chain'); -- Duplicate

-- Insert into employees table
INSERT INTO employees (employee_id, first_name, last_name, email, salary, hire_date, department_id, job_title, manager_id)
VALUES 
(1, 'John', 'Doe', 'john.doe@example.com', 50000.00, '2023-01-15', 1, 'HR Manager', NULL),
(2, 'Jane', 'Smith', 'jane.smith@example.com', 60000.00, '2023-02-20', 2, 'Financial Analyst', NULL),
(3, 'Michael', 'Brown', 'michael.brown@example.com', 55000.00, '2023-03-25', 3, 'Software Engineer', 2),
(4, 'Emily', 'Davis', 'emily.davis@example.com', 45000.00, '2023-04-10', 4, 'Marketing Specialist', 1),
(5, 'David', 'Wilson', 'david.wilson@example.com', 70000.00, '2023-05-15', 5, 'Sales Manager', NULL),
(6, 'Sarah', 'Taylor', 'sarah.taylor@example.com', 52000.00, '2023-06-20', 6, 'Operations Coordinator', 4),
(7, 'Chris', 'Evans', 'chris.evans@example.com', 49000.00, '2023-07-25', 7, 'Legal Advisor', 5),
(8, 'Anna', 'White', 'anna.white@example.com', 65000.00, '2023-08-10', 8, 'Customer Service Lead', NULL),
(9, 'Paul', 'Green', 'paul.green@example.com', 47000.00, '2023-09-15', 9, 'R&D Analyst', 7),
(10, 'Laura', 'Hall', 'laura.hall@example.com', 53000.00, '2023-10-20', 10, 'Supply Chain Coordinator', 6),
-- Duplicate rows
(11, 'John', 'Doe', 'john.doe@example.com', 50000.00, '2023-01-15', 1, 'HR Manager', NULL),
(12, 'Jane', 'Smith', 'jane.smith@example.com', 60000.00, '2023-02-20', 2, 'Financial Analyst', NULL),
(13, 'Michael', 'Brown', 'michael.brown@example.com', 55000.00, '2023-03-25', 3, 'Software Engineer', 2),
(14, 'Emily', 'Davis', 'emily.davis@example.com', 45000.00, '2023-04-10', 4, 'Marketing Specialist', 1),
(15, 'David', 'Wilson', 'david.wilson@example.com', 70000.00, '2023-05-15', 5, 'Sales Manager', NULL),
(16, 'Sarah', 'Taylor', 'sarah.taylor@example.com', 52000.00, '2023-06-20', 6, 'Operations Coordinator', 4),
(17, 'Chris', 'Evans', 'chris.evans@example.com', 49000.00, '2023-07-25', 7, 'Legal Advisor', 5),
(18, 'Anna', 'White', 'anna.white@example.com', 65000.00, '2023-08-10', 8, 'Customer Service Lead', NULL),
(19, 'Paul', 'Green', 'paul.green@example.com', 47000.00, '2023-09-15', 9, 'R&D Analyst', 7),
(20, 'Laura', 'Hall', 'laura.hall@example.com', 53000.00, '2023-10-20', 10, 'Supply Chain Coordinator', 6);


SELECT * FROM departments;
SELECT * FROM employees;


-- 1.Retrieve all columns from the employees table. 
SELECT * FROM employees;

-- 2. Retrieve only the first_name and last_name of employees.
SELECT 
	first_name,
	last_name
FROM employees; 

-- 3.Retrieve employees who earn more than 50,000.
SELECT 
first_name,
last_name,
salary
FROM employees
WHERE salary > 50000;

-- 4.Retrieve employees who work in the 'IT' department.
SELECT * FROM employees;
SELECT * FROM departments;

SELECT 
	e.employee_id,
	e.first_name,
	e.last_name,
	d.department_name
FROM employees AS e
INNER JOIN departments AS d
ON d.department_id = e.department_id
WHERE d.department_name = 'IT';

-- 5.Retrieve employees hired between 2020-01-01 and 2023-12-31.

SELECT 
	employee_id,
	first_name,
	last_name,
	hire_date
FROM employees
WHERE hire_date BETWEEN '2020-01-01' AND '2023-12-31';


-- 6.Retrieve the top 5 highest-paid employees.
SELECT
	employee_id,
	first_name,
	last_name,
	salary
FROM employees
ORDER BY salary DESC 
LIMIT 5;


-- 7.Count the number of employees in each department.
SELECT 
d.department_name,
COUNT(employee_id) AS employee_count
FROM employees AS e
LEFT JOIN departments AS d
ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY COUNT(employee_id) ASC; 

-- 8.Find the average salary of all employees.

SELECT
ROUND(AVG(salary),2) AS avg_salary 
FROM employees;

-- 9. Retrieve employees whose names start with 'A'.
SELECT
first_name
FROM employees 
WHERE first_name LIKE 'A%';

-- 10. Retrieve employees who have 'Manager' in their job title.

SELECT * FROM employees;

SELECT 
first_name,
last_name,
job_title
FROM employees
WHERE LOWER(job_title) LIKE '%manager%';


-- 11.Retrieve employee details along with their department names. 
SELECT
e.*,
d.department_name
FROM employees AS e
LEFT JOIN departments AS d
ON d.department_id = e.department_id;

-- 12.Retrieve all employees, including those without a department.
SELECT * FROM employees;
SELECT * FROM departments;

SELECT 
e.*,
d.department_name
FROM employees AS e
LEFT JOIN departments AS d
ON e.department_id = d.department_id;

-- 13. Retrieve all departments, including those without employees.
SELECT 
e.*,
d.department_name
FROM departments AS d
LEFT JOIN employees AS e
ON e.department_id = d.department_id;

-- 14. Retrieve employees and their managers from the same table.
SELECT * FROM employees;

SELECT 
	e1.employee_id,
	CONCAT_WS(' ',e1.first_name,e1.last_name) AS employee_name,
	d.department_name,
	e2.employee_id AS manager_id,
	COALESCE(CONCAT_WS(' ',e2.first_name,e2.last_name),'Unknown') AS manager_name
FROM employees AS e1
JOIN employees AS e2
ON e1.manager_id = e2.employee_id
LEFT JOIN departments AS d
ON e1.department_id = d.department_id;

-- 15.Retrieve the department with the highest number of employees.

SELECT 
d.department_name,
COUNT(e.employee_id) AS employee_count
FROM employees AS e
LEFT JOIN departments AS d
ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY COUNT(e.employee_id) DESC
LIMIT 1;


-- 16 Find employees who earn more than the average salary in their department.

SELECT * FROM employees;

SELECT 
e.employee_id,
e.first_name,
e.last_name,
e.salary,
d.department_name
FROM employees AS e
LEFT JOIN departments AS d
ON e.department_id = d.department_id
WHERE e.salary >=(
				SELECT AVG(e2.salary) 
				FROM employees AS e2
                WHERE e2.department_id = e.department_id
                );
                
-- 17.Retrieve the department with the lowest average salary.

SELECT 
d.department_name,
ROUND(AVG(e.salary),2) AS department_avg_salary
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY AVG(e.salary) ASC
LIMIT 1;

-- 18.Find the second highest salary without using LIMIT
SELECT salary
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

SELECT 
salary
FROM 
(
	SELECT 
	salary,
	DENSE_RANK() OVER(ORDER BY salary DESC) AS salary_rank
	FROM employees
)ranking
WHERE salary_rank = 2;

SELECT 
MAX(salary)
FROM employees 
WHERE salary < (SELECT MAX(salary) FROM employees);


-- 19 Retrieve all employees from two different tables using UNION.

(SELECT
	employee_id,
	first_name,
	last_name,
	salary,
	department_id,
	manager_id
FROM employees1)
UNION 
(SELECT
	employee_id,
	first_name,
	last_name,
	salary,
	department_id,
	manager_id
FROM employees2);

-- 20 Find duplicate employees based on their email address.

SELECT
email,
COUNT(*) AS email_count
FROM employees
GROUP BY email
HAVING COUNT(*) > 1;


-- IF WE WANT TO SEE DUPLICATE ROWS based on salary
SELECT *
FROM employees
WHERE salary IN 
(SELECT 
salary
FROM employees
GROUP BY salary
HAVING COUNT(*) > 1
)
ORDER BY salary;

-- 21.Retrieve the total salary paid to employees in each department.
SELECT 
d.department_name,
ROUND(SUM(e.salary),2) AS Department_total_paid_salary
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY Department_total_paid_salary DESC;

-- 22.Retrieve employees along with their department’s total employee count.

SELECT
e.first_name,
e.last_name,
d.department_name,
COUNT(*) OVER(PARTITION BY d.department_name) AS employeeCountByDepartment
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id;


-- 23. Find the highest salary in each department.

SELECT
	department_name,
	salary
FROM (
	SELECT 
	e.salary,
	d.department_name,
	RANK() OVER(PARTITION BY d.department_name ORDER BY salary DESC) AS Department_salary_rank
	FROM employees AS e
	INNER JOIN departments AS d
	ON e.department_id = d.department_id
)ranking
WHERE Department_salary_rank= 1;

-- 24 Retrieve employees who have the same salary as someone else

SELECT *
FROM employees
WHERE salary IN  (
SELECT
salary
FROM employees
GROUP BY salary
HAVING COUNT(*) >1
)
ORDER BY salary;

-- 25 Retrieve the department with the highest average salary.

SELECT
d.department_name,
AVG(e.salary) AS Department_avg_salary
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY AVG(e.salary) DESC
LIMIT 1;


-- 26.Retrieve employees along with their salary rank in their department.
SELECT * FROM employees;

SELECT
	e.employee_id,
	e.first_name,
	e.last_name,
	e.salary,
	DENSE_RANK() OVER(PARTITION BY department_name ORDER BY salary DESC) AS SalaryRankByDepartment,
	d.department_id,
	d.department_name
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id;


-- 27. Find the second highest salary in each department.
SELECT *
FROM(
SELECT
	e.employee_id,
	e.first_name,
	e.last_name,
	d.department_name,
	salary,
	DENSE_RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) AS department_salary_rank
	FROM employees AS e
	LEFT JOIN departments AS d ON e.department_id = d.department_id
) ranking
WHERE department_salary_rank = 2;

--  28 Retrieve employees with their previous salary.

SELECT * FROM employees;

SELECT
employee_id,
first_name,
last_name,
salary,
LAG(salary) OVER() AS previous_salary
FROM employees;



 -- 29. Retrieve employees with their next salary.
 
 SELECT
 employee_id,
 first_name,
 last_name,
 salary,
 LEAD(salary) OVER() AS next_salary
 FROM employees;
 
--  30 . Find the difference between an employee’s salary and the department's average salary.

SELECT
employee_id,
first_name,
last_name,
salary,
AVG(salary) OVER(PARTITION BY department_id) AS department_avg_salary,
salary - AVG(salary) OVER(PARTITION BY department_id) AS diff_of_salary_and_dept_avg_salary
FROM employees;

-- 31. Retrieve employees who have the highest salary in their department.

SELECT *
FROM (
SELECT
	e.employee_id,
	e.first_name,
	e.last_name,
	d.department_id,
	d.department_name,
	e.salary,
	DENSE_RANK() OVER(PARTITION BY d.department_id ORDER BY salary DESC) AS department_salary_rank
	FROM employees AS e
	LEFT JOIN departments AS d ON e.department_id = d.department_id
)ranking
WHERE department_salary_rank = 1;

-- 32.Retrieve employees whose salary is above the average salary. 
SELECT
employee_id,
first_name,
last_name,
salary
FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 33.Retrieve departments with more than 10 employees.

SELECT
d.department_name,
COUNT(e.employee_id) AS employee_count
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING COUNT(e.employee_id) > 10;

-- 34. Retrieve employees who have no assigned department.

SELECT 
e.employee_id,
e.first_name,
e.last_name,
d.department_name
FROM employees AS e
LEFT JOIN departments AS d
ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

-- 35.Find the total number of employees who joined each year.
SELECT
YEAR(hire_date) AS hire_year,
COUNT(*) AS employee_hired_each_year
FROM employees
GROUP BY YEAR(hire_date)
ORDER BY employee_hired_each_year ASC;

-- 38 . Retrieve employees with their department names.
SELECT * FROM employees;

SELECT
e.employee_id,
e.first_name,
e.last_name,
COALESCE(d.department_name,'Unknown') AS department_name
FROM employees AS e
LEFT JOIN departments AS d
ON e.department_id = d.department_id;



-- 39.Find departments without employees

SELECT 
IFNULL(d.department_name,'Unknown') AS department_name
FROM departments AS d
LEFT JOIN employees AS e
ON d.department_id = e.department_id
WHERE e.department_id IS NULL;

-- 40. Retrieve all employees and the salary difference from their manager's salary.

SELECT * FROM employees;

SELECT 
	*,
	employee_salary-manager_salary AS Diff_of_employee_and_manager_salary
FROM (
SELECT
	e1.employee_id,
	CONCAT_WS(' ',e1.first_name,e1.last_name) AS employee_name,
	e1.salary AS employee_salary,
	e2.employee_id AS manager_id,
	CONCAT_WS(' ',e2.first_name,e2.last_name) AS manager_name,
	e2.salary AS manager_salary
FROM employees AS e1
JOIN employees AS e2 ON e1.manager_id= e2.employee_id
)t;

-- 46 Retrieve employees and their department’s highest salary.

SELECT
	employee_id,
	first_name,
	last_name,
	department_name,
	salary
FROM (
SELECT
	e.employee_id,
	e.first_name,
	e.last_name,
	d.department_name,
	e.salary,
	DENSE_RANK() OVER(PARTITION BY d.department_name ORDER BY salary DESC) AS SalaryRankingByDepartment
FROM employees AS e
INNER JOIN  departments AS d ON e.department_id = d.department_id
)ranking
WHERE SalaryRankingByDepartment = 1;


-- 48. Retrieve employees with odd-numbered IDs.

SELECT
employee_id,
first_name,
last_name,
email,
salary
FROM employees 
WHERE employee_id %2 = 1;







