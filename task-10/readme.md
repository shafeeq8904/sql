
#  E-Commerce SQL Database Project

##  Overview

This project provides a comprehensive SQL-based implementation of an eCommerce platform's backend database. It covers database design, indexing, triggers, transactions, views, and sample data to simulate real-world operations.

---

##  Schema Design

### 1. `Customers` Table
Stores customer information.
```sql
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### 2. `Products` Table
Stores product catalog.
```sql
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Price DECIMAL(10, 2),
    Stock INT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### 3. `Orders` Table
Stores customer orders.
```sql
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
```

### 4. `OrderDetails` Table
Stores detailed line items per order.
```sql
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
```

---

##  Sample Data

Each table is inserted with 10 records .

---

##  Indexing for Performance
```sql
CREATE INDEX idx_customer_email ON Customers(Email);
CREATE INDEX idx_order_date ON Orders(OrderDate);
CREATE INDEX idx_product_name ON Products(Name);
```
- Improves search performance for frequently filtered columns.

---

##  Trigger

**Trigger:** Automatically updates the `Stock` of a product after a new entry is added to `OrderDetails`.

```sql
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
```

###  Test Trigger
```sql
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
VALUES (1, 2, 2, 25.00);
```
- Automatically deducts 2 units of product ID 2 from `Products`.

---

##  Transactions

Used to ensure atomic operations during multi-table updates (e.g. placing an order).

```sql
START TRANSACTION;

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES (1, CURDATE(), 250.00);

SET @last_order_id = LAST_INSERT_ID();

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
VALUES 
(@last_order_id, 2, 3, 25.00),
(@last_order_id, 3, 2, 45.00);

COMMIT;
```

Rollback with `ROLLBACK;` if any query fails.

---

##  Views

**View:** Summarizes orders by joining customer and order data.

```sql
CREATE VIEW OrderSummary AS
SELECT o.OrderID, o.OrderDate, c.Name AS Customer, SUM(od.Quantity * od.Price) AS Total
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY o.OrderID;
```

###  Test View
```sql
SELECT * FROM OrderSummary;
```

---

##  Testing Queries

- Products low in stock:
```sql
SELECT * FROM Products WHERE Stock < 50;
```

- Customers with Gmail:
```sql
SELECT * FROM Customers WHERE Email LIKE '%@gmail.com';
```

- Total orders and sales:
```sql
SELECT COUNT(*) AS TotalOrders, SUM(TotalAmount) AS TotalSales FROM Orders;
```

---

##  Keywords Highlighted
- `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `AUTO_INCREMENT`
- `TRIGGER`, `TRANSACTION`, `COMMIT`, `ROLLBACK`
- `VIEW`, `INDEX`, `JOIN`, `GROUP BY`
- `START TRANSACTION`, `LAST_INSERT_ID()`

---
