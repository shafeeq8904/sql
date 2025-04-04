--  Counting Total Employees
SELECT COUNT(*) AS TotalEmployees FROM Employees;

-- Calculating the Average Salary (Rounded to 2 Decimal Places)
SELECT ROUND(AVG(Salary), 2) AS AverageSalary FROM Employees;

-- Summing Up Total Salary Expenses
SELECT SUM(Salary) AS TotalSalaryExpenses FROM Employees;

-- Counting Employees by Job Position
SELECT Position, COUNT(*) AS EmployeeCount 
FROM Employees 
GROUP BY Position;

--  Filtering Groups with the HAVING Clause     
SELECT Position, AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY Position
HAVING Avg(salary) > 60000;