# Task 8: Common Table Expressions (CTEs) and Recursive Queries

## Objective:
- To simplify complex queries and process hierarchical data using:
- Non-recursive CTEs for better readability and modular logic.
- Recursive CTEs for navigating hierarchical relationships such as organizational structures.

## Table Used: Employees


| Column Name | Data Type | Description |
| --------------- | --------------- | --------------- |
EmployeeID | INT (PK) |	Unique identifier for each employee
Name |	VARCHAR(50)	| Employee's name
ManagerID |	INT (FK) |	Foreign key referencing another employee as the manager

```sql
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    ManagerID INT,
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
);

```

# Non-Recursive CTE

## Purpose:
- Break down a complex query into logical steps. For example, calculate average salary, and then use it in a filtered query.

```sql
WITH averageSalary AS (
    SELECT AVG(Salary) AS avgSal
    FROM Employees
)

SELECT *
FROM Employees
WHERE Salary > (SELECT avgSal FROM averageSalary);

```

## Explanation:
- averageSalary is a non-recursive CTE that calculates the average salary.
- The outer query selects all employees whose salary is above the average.
- This makes the SQL modular and more readable, especially for complex business logic.

 Part 2: Recursive CTE
📝 Purpose:
Build a hierarchical view of employees and their managers (i.e., organization tree).

#  Part 2: Recursive CTE

## Purpose:
Build a hierarchical view of employees and their managers (i.e., organization tree).

```sql
WITH RECURSIVE employeeHierarchy AS (

    SELECT *, 1 AS Level
    FROM Employees
    WHERE ManagerID IS NULL

    UNION ALL

    SELECT e.EmployeeID, e.Name, e.ManagerID, eh.Level + 1
    FROM Employees e
    JOIN employeeHierarchy eh ON e.ManagerID = eh.EmployeeID
)

SELECT * FROM employeeHierarchy;

```

##  Explanation:
- Base case: Select top-level employees who have no manager (ManagerID IS NULL) and assign Level = 1.
- Recursive step: Join the original table with the CTE itself to find employees reporting to the previously found ones, incrementing the Level each time.
- This continues recursively until no more rows can be found (i.e., recursion stops automatically).
- The Level column represents the depth in the organization hierarchy.