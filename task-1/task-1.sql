USE new_app;

CREATE TABLE IF NOT EXISTS Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Position VARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE
);

INSERT INTO Employees (Name, Position, Salary, HireDate) VALUES
('John Doe', 'Software Engineer', 75000.00, '2024-01-15'),
('Jane Smith', 'Project Manager', 85000.00, '2023-09-01'),
('Alice Johnson', 'HR Manager', 62000.00, '2022-07-10'),
('Bob Brown', 'Sales Executive', 54000.00, '2021-03-25');

SELECT * FROM Employees;



