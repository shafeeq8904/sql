#  Task 5: Subqueries and Nested Queries

## Objective
- To filter or compute data using subqueries inside SELECT or WHERE clauses.
- Understand the use and difference between correlated and non-correlated subqueries.

## Table Used: Employees

```sql
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Position VARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE
);
```

# Query 1: Employees Who Earn More Than Average Salary (Non-Correlated Subquery)

```sql
SELECT Name, Salary 
FROM Employees
WHERE Salary > (
    SELECT AVG(Salary) FROM Employees
);

```

## Explanation:
- Subquery: SELECT AVG(Salary) FROM Employees calculates the overall average salary.
- Main query: Selects only those employees whose Salary is greater than the average.
- Non-Correlated: The inner query runs once, independently of the outer query.

# Query 2: Employees Who Earn More Than Their Position’s Average (Correlated Subquery)

```sql
SELECT Name, Position, Salary
FROM Employees e1
WHERE Salary > (
    SELECT AVG(Salary) 
    FROM Employees e2
    WHERE e2.Position = e1.Position
);

```

## Explanation:
- Subquery: SELECT AVG(Salary) FROM Employees e2 WHERE e2.Position = e1.Position calculates average salary for the same position.
- Main query: Filters employees whose salary is above their own role's average.
- Correlated: The subquery refers to e1.Position from the outer query, so it runs once per row in the outer query.

