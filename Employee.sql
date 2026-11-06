
create database companyDB;
use companyDB;
CREATE TABLE Employee(
	EMPID INT PRIMARY KEY,
    ENAME VARCHAR(50),
    AGE INT,
    GENDER VARCHAR(10),
    DEPARTMENT VARCHAR(30),
    SALARY INT,
    CITY VARCHAR(30)
    );
INSERT INTO Employee VALUES
(1, 'PRALHAD', 21, 'MALE', 'IT', 950000, 'MUMBAI'),
(2, 'RAHUL', 45, 'MALE', 'ACCOUNTS', 75000, 'DELHI'),
(3, 'SUTOSH', 25, 'MALE', 'SALES', 30000, 'HYDERABAD'),
(4, 'RIYA', 30, 'FEMALE', 'HR', 45000, 'MUMBAI'),
(5, 'SUSHMITA', 21, 'FEMALE', 'IT', 25000, 'CHENNAI'),
(6, 'HRITIK', 40, 'MALE', 'ACCOUNTS', 60000, 'BANGALORE'),
(7, 'SATISH', 35, 'MALE', 'IT', 75000, 'PUNE'),
(8, 'RUPAL', 28, 'FEMALE', 'HR', 35000, 'PUNE');

-- Display all employees
select * from Employee;

-- Display only name and salary
SELECT ENAME, SALARY FROM Employee;

-- FIND SALARY GREATER THAN 30000
SELECT * FROM Employee WHERE SALARY > 30000;


-- Find Employee working in IT
SELECT * FROM Employee WHERE DEPARTMENT = 'IT';

-- Find Employees from IT Department earning more than 30000
SELECT * FROM Employee 
WHERE DEPARTMENT = 'IT' 
AND SALARY > 30000;
-- find Employees working in HR or ACCOUNTS 
SELECT * FROM Employee
WHERE DEPARTMENT = 'HR' 
OR DEPARTMENT = 'ACCOUNTS';


-- Find Employees whose salaries are between 25000 and 40000
SELECT * FROM Employee 
WHERE SALARY BETWEEN 25000 AND 40000;
