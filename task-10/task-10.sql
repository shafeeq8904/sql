USE ecommerce;

-- 1. Customers Table
DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Products Table
DROP TABLE IF EXISTS Products;
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Price DECIMAL(10, 2),
    Stock INT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Orders Table
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- 4. OrderDetails Table
DROP TABLE IF EXISTS OrderDetails;
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- -------------------------
-- Insert Sample Data
-- -------------------------
INSERT INTO Customers (Name, Email) VALUES 
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com'),
('Charlie', 'charlie@example.com'),
('David', 'david@example.com'),
('Eva', 'eva@example.com'),
('Frank', 'frank@example.com'),
('Grace', 'grace@example.com'),
('Hannah', 'hannah@example.com'),
('Ivan', 'ivan@example.com'),
('Judy', 'judy@example.com');

INSERT INTO Products (Name, Price, Stock) VALUES 
('Laptop', 1000.00, 20),
('Mouse', 25.00, 100),
('Keyboard', 45.00, 80),
('Monitor', 150.00, 40),
('Phone', 800.00, 30),
('Tablet', 400.00, 25),
('Charger', 20.00, 60),
('Headphones', 90.00, 70),
('USB Cable', 10.00, 200),
('Webcam', 60.00, 50);

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, CURDATE(), 200.00),
(2, CURDATE(), 300.00),
(3, CURDATE(), 450.00),
(4, CURDATE(), 700.00),
(5, CURDATE(), 150.00),
(6, CURDATE(), 600.00),
(7, CURDATE(), 320.00),
(8, CURDATE(), 480.00),
(9, CURDATE(), 530.00),
(10, CURDATE(), 250.00);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price) VALUES
(1, 1, 1, 1000.00),
(2, 2, 2, 25.00),
(3, 3, 3, 45.00),
(4, 4, 2, 150.00),
(5, 5, 1, 800.00),
(6, 6, 2, 400.00),
(7, 7, 3, 20.00),
(8, 8, 1, 90.00),
(9, 9, 5, 10.00),
(10, 10, 2, 60.00);

-- -------------------------
-- Indexing for Performance
-- -------------------------
CREATE INDEX idx_customer_email ON Customers(Email);
CREATE INDEX idx_order_date ON Orders(OrderDate);
CREATE INDEX idx_product_name ON Products(Name);

-- -------------------------
-- Trigger: Update Stock After Order
-- -------------------------
DELIMITER //
CREATE TRIGGER update_stock_after_order
AFTER INSERT ON OrderDetails
FOR EACH ROW
BEGIN
    UPDATE Products
    SET Stock = Stock - NEW.Quantity
    WHERE ProductID = NEW.ProductID;
END //
DELIMITER ;

-- -------------------------
-- Transaction Example: Order Insertion
-- -------------------------
START TRANSACTION;

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES (1, CURDATE(), 250.00);

SET @last_order_id = LAST_INSERT_ID();

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
VALUES 
(@last_order_id, 2, 3, 25.00),
(@last_order_id, 3, 2, 45.00);

COMMIT;

-- -------------------------
-- View: Order Summary
-- -------------------------
CREATE VIEW OrderSummary AS
SELECT o.OrderID, o.OrderDate, c.Name AS Customer, SUM(od.Quantity * od.Price) AS Total
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY o.OrderID;

-- -------------------------
-- Testing Queries
-- -------------------------

-- Trigger Test: Insert a new order detail to see if stock updates

-- Check stock before
SELECT ProductID, Name, Stock FROM Products WHERE ProductID = 2;

-- Insert new order for ProductID = 2
START TRANSACTION;
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES (1, CURDATE(), 75.00);
SET @last_order_id = LAST_INSERT_ID();
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
VALUES (@last_order_id, 2, 3, 25.00);
COMMIT;

-- Check stock after
SELECT ProductID, Name, Stock FROM Products WHERE ProductID = 2;

-- views test

SELECT * FROM OrderSummary;

