# Simple Aggregation and Grouping in MySQL

## Requirements

- Use aggregate functions like COUNT(), SUM(), or AVG() to compute totals or averages.
- Use the GROUP BY clause to aggregate data based on a specific column.
- Optionally, filter grouped results using the HAVING clause.

# Queries for Aggregation and Grouping

## 1. Counting Total Employees

```sql
SELECT COUNT(*) AS TotalEmployees FROM Employees;
```
- Explanation: COUNT(*) returns the total number of rows in the Employees table

## 2. Summing Up Total Salary Expenses

```sql
SELECT SUM(Salary) AS TotalSalaryExpenses FROM Employees;
```
- Explanation: SUM(Salary) computes the total sum of salaries paid to employees.

## 3. Counting Employees by Job Position

```sql
SELECT Position, COUNT(*) AS EmployeeCount 
FROM Employees 
GROUP BY Position;
```

# Explanation:

- GROUP BY Position groups employees by their job positions.
- COUNT(*) counts how many employees are in each position.

# 4. Calculating the Average Salary (Rounded to 2 Decimal Places)

```sql
SELECT ROUND(AVG(Salary), 2) AS AverageSalary FROM Employees;
```

# Explanation:

- AVG(Salary) calculates the average salary of all employees.
- ROUND(AVG(Salary), 2) ensures two decimal places in the result.

# 5. Filtering Groups with the HAVING Clause

```sql
SELECT Position, AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY Position
HAVING Avg(salary) > 60000;
```

# Explanation

- HAVING Avg(salary) > 60000,  filters out positions that have osalary greater than 60000.