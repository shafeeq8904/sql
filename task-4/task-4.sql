USE new_app;

-- Create Customers table
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100)
);

-- Create Orders table with foreign key to Customers
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    Product VARCHAR(50),
    Quantity INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert sample data into Customers table

--inner join
select  orders.OrderID , orders.Product , orders.Quantity , orders.OrderDate , customers.Name
From orders
INNER JOIN customers
ON orders.CustomerID = customers.CustomerID ;

--left join
SELECT 
    Customers.Name AS CustomerName,
    Orders.Product,
    Orders.Quantity,
    Orders.OrderDate
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
