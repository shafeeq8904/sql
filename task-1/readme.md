# Employee Database Setup

## Objective

- This guide provides the SQL commands needed to:

- Create a table named Employees.

- Insert sample data into the table.

- Retrieve the stored data using SELECT.

## Prerequisites

- MySQL database installed.

- Access to a MySQL database (via command-line, MySQL Workbench, or any database tool).

- A database named new_app (or modify the script to use your database).

# Commands

## 1. Create the Employees Table

This command creates the Employees table with columns for employee details.

```sql
CREATE TABLE IF NOT EXISTS Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Position VARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE
);

```

## Explanation:

- EmployeeID INT AUTO_INCREMENT PRIMARY KEY: A unique identifier for each employee that auto-increments.

- Name VARCHAR(50) NOT NULL: Stores the employee's name (mandatory field).

- Position VARCHAR(50): Stores the employee's job title.

-  DECIMAL(10,2): Stores the salary with two decimal places.

- HireDate DATE :  stores the hire date to the current date.

## 2. Insert Sample Data

Once the table is created, insert sample employee records:

```sql
INSERT INTO Employees (Name, Position, Salary, HireDate) VALUES
('John Doe', 'Software Engineer', 75000.00, '2024-01-15'),
('Jane Smith', 'Project Manager', 85000.00, '2023-09-01'),
('Alice Johnson', 'HR Manager', 62000.00, '2022-07-10'),
('Bob Brown', 'Sales Executive', 54000.00, '2021-03-25');
```
## Explanation:

- INSERT INTO Employees (...) VALUES (...): Adds new records into the Employees table.

## 3. Retrieve Data from the Table

```sql
SELECT * FROM Employees;
```
