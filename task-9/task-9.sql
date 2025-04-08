-- What are Stored Procedures and Functions?
--Stored Procedure: A saved set of SQL statements that can take input, perform operations, and return results. Great for encapsulating business logic.

--User-Defined Function (UDF): A function that returns a value (scalar or table). Useful for calculations or repeated logic

DELIMITER //

CREATE PROCEDURE GetTotalEmployees(IN startDate DATE, IN endDate DATE)
BEGIN
    SELECT count(*) AS totalEmloyees
    FROM employees
    WHERE HireDate BETWEEN startDate AND endDate;
END //

DELIMITER ;

-- Call It

CALL GetTotalEmployees('2024-01-01','2024-12-31')


--Scalar Function

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
