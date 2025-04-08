-- Employees who earn more than the average salary (Non-Correlated)

SELECT Name, Salary 
FROM Employees
WHERE Salary > (
    SELECT AVG(Salary) FROM Employees
);

-- Employees who earn more than the average salary in their own position (Correlated):

SELECT Name, Position, Salary
FROM Employees e1
WHERE Salary > (
    SELECT AVG(Salary) 
    FROM Employees e2
    WHERE e2.Position = e1.Position
);
