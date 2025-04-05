# SQL JOINs Documentation

## What is a JOIN?

- A JOIN is used in SQL to combine rows from two or more tables based on a related column (usually a foreign key).

## Customer Table Creation and inserting the Data

```sql
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(100)
);

INSERT INTO Customers (CustomerID, Name, Email) VALUES
(1, 'shafeeq', 'shafeeq@example.com'),
(2, 'affan', 'affan@example.com'),
(3, 'Harish', 'harish@example.com');

```

```sql
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    Product VARCHAR(50),
    Quantity INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (CustomerID, Product, Quantity, OrderDate) VALUES
(1, 'Laptop', 1, '2024-01-10'),
(1, 'Mouse', 2, '2024-01-15'),
(2, 'Keyboard', 1, '2024-02-01')
```

# 1. INNER JOIN
```sql
select  orders.OrderID , orders.Product , orders.Quantity , orders.OrderDate , customers.Name
From orders
INNER JOIN customers
ON orders.CustomerID = customers.CustomerID ;
```

## Explanation
- Returns only the records that have matching values in both tables.
- Only matching CustomerID records appear.

# 2. LEFT JOIN

```sql
SELECT 
    Customers.Name AS CustomerName,
    Orders.Product,
    Orders.Quantity,
    Orders.OrderDate
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
```
## Explanation

- Returns all records from the left table (Customers), and the matched records from the right table (Orders). If there's no match, NULL is shown.
