--Filter employees based on Position (e.g., Sales Executives)
SELECT * FROM Employees WHERE Position = 'Sales Executive';

--Filter employees with a salary greater than 60,000
SELECT * FROM Employees WHERE Salary > 60000;


--Sort employees by Salary in ascending order
SELECT * FROM Employees ORDER BY Salary ASC;

--Sort employees by HireDate in descending order
SELECT * FROM Employees ORDER BY HireDate DESC;


--Find employees in the 'Software Engineer' position with a salary above 70,000
SELECT * FROM Employees WHERE Position = 'Software Engineer' AND Salary > 70000;

--Find employees who are either 'Project Managers' or earn more than 85,000
SELECT * FROM Employees WHERE Position = 'Project Manager' OR Salary > 85000;

