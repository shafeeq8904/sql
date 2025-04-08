# Task 9: Stored Procedures and User-Defined Functions

## Objective:

- To encapsulate business logic within reusable SQL components such as:
- Stored Procedures – for performing operations and returning result sets.
- User-Defined Functions (UDFs) – for returning values based on calculations or logic.

##  Table Used: Employees

```sql
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Position VARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE
);
```

# Stored Procedure: GetTotalEmployees

## Purpose:

- Count how many employees were hired between two specific dates

```sql
DELIMITER //

CREATE PROCEDURE GetTotalEmployees(IN startDate DATE, IN endDate DATE)
BEGIN
    SELECT COUNT(*) AS totalEmloyees
    FROM employees
    WHERE HireDate BETWEEN startDate AND endDate;
END //

DELIMITER ;

```

##  Execution:

```sql
CALL GetTotalEmployees('2024-01-01', '2024-12-31');
```

##  Explanation:
**DELIMITER** // – Changes the command terminator temporarily so we can use ; inside the procedure.

**CREATE PROCEDURE** – Defines a stored procedure named GetTotalEmployees.

**IN** startDate, **IN** endDate – Input parameters to the procedure.

**BEGIN ... END** – Wraps the body of the procedure.

**BETWEEN** – Filters employees hired within the specified date range.


# Scalar Function: GetEmployeeCount

## Purpose:

- Returns the count of employees hired within a date range as a single scalar value.

```sql
DELIMITER //

CREATE FUNCTION GetEmployeeCount(startDate DATE, endDate DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;

    SELECT COUNT(*) INTO total
    FROM employees
    WHERE HireDate BETWEEN startDate AND endDate;

    RETURN total;
END //

DELIMITER ;
```

## Execution:

```sql
SELECT GetEmployeeCount('2024-01-01', '2024-12-31') AS TotalHiredEmployees;

```

## Explanation:
**CREATE FUNCTION** – Defines a user-defined function.

**RETURNS INT** – The function returns a single integer value.

**DETERMINISTIC** – Indicates the function returns the same result for the same inputs.

**DECLARE** – Creates a local variable total.

**SELECT INTO** – Assigns the result of the query into the variable.

**RETURN** – Returns the final computed value.

##  Difference Between Stored Procedure and Function:
Feature	Stored |  Procedure | 	User-Defined Function (Scalar)
| --------------- | --------------- | --------------- |
Returns |	Can return zero or more result sets | 	Returns a single value
Called | via	CALL ProcedureName(...)	| Used in SELECT, WHERE, etc. |
DML Allowed | 	Yes (INSERT, UPDATE, DELETE) |	Limited (mostly for read-only logic) |
Can use IN/OUT | 	Yes (multiple parameters) | Usually takes input, returns one value |
Part of SELECT |	No | Yes |

