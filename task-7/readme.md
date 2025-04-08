# Task 7: Window Functions and Ranking

## Objective:

- To leverage window functions in SQL to perform advanced row-wise computations, such as assigning ranks and comparing rows within partitions (groups).

# SQL Concepts Used:
- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- LEAD() / LAG()
- OVER(), PARTITION BY, and ORDER BY clauses

## Table Used:

```sql
CREATE TABLE IF NOT EXISTS Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Position VARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE
);
```

# Description of Each Query:

## 1. ROW_NUMBER() – Unique Row Numbers Within Groups

```sql
SELECT Name, Position, Salary,
ROW_NUMBER() OVER (PARTITION BY Position ORDER BY Salary DESC) AS rownum
FROM Employees;

```
- Assigns a unique row number to each employee within their position group based on descending salary.
- Even if salaries tie, they get different numbers.

## 2. RANK() – Ranking With Gaps for Ties

```sql
SELECT Name, Position, Salary,
RANK() OVER (PARTITION BY Position ORDER BY Salary DESC) AS RankPosition
FROM Employees;

```
- Assigns ranks to employees grouped by Position and ordered by salary.
- Tied salaries get the same rank, but next ranks are skipped.

## 3. DENSE_RANK() – Ranking Without Gaps for Ties

```sql
SELECT Name, Position, Salary,
DENSE_RANK() OVER (PARTITION BY Position ORDER BY Salary DESC) AS RankPosition
FROM Employees;

```

- Same as RANK(), but no gaps in ranks if salaries are tied.

## 4. LEAD() and LAG() – Accessing Adjacent Rows

```sql
SELECT Name, Position, Salary,
LEAD(Salary) OVER (PARTITION BY Position ORDER BY Salary DESC) AS NextSalary,
LAG(Salary) OVER (PARTITION BY Position ORDER BY Salary DESC) AS PreviousSalary
FROM Employees;

```

- LEAD() gives the next salary in the sorted order within the same position group.
- LAG() gives the previous salary.
- Helps with row comparisons (e.g., salary differences between employees).