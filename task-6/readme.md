# Task 6: Date and Time Functions

## Objective
- Manipulate and query data based on date and time values using SQL built-in functions.

# Table Used: Orders

```sql
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    Product VARCHAR(100),
    Quantity INT,
    OrderDate DATE,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
```

# Queries and Explanations

## 1. Calculate Days Since Order using DATEDIFF()

```sql
SELECT OrderID, Product, OrderDate, 
DATEDIFF(CURDATE(), OrderDate) AS DaysSinceOrder
FROM Orders;

```

##  Explanation:

- DATEDIFF(end, start) returns the number of days between two dates.
- Here, it calculates how many days have passed since each order was placed.

## 2. Filter Orders from the Last 30 Days

```sql
SELECT * 
FROM Orders
WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;

```

##  Explanation:

- CURDATE() gives today’s date.
- INTERVAL 30 DAY subtracts 30 days.
- This query filters all orders placed in the last 30 days.

## 3. Add Days to a Date using DATE_ADD()

```sql
SELECT OrderID, Product, OrderDate, 
DATE_ADD(OrderDate, INTERVAL 7 DAY) AS ExpectedDelivery
FROM Orders;

```

## Explanation:

- DATE_ADD(date, INTERVAL X DAY) adds X days to a given date.
- Useful for calculating future dates, like estimated delivery.

## 4. Format a Date using DATE_FORMAT()

```sql
SELECT OrderID, Product, OrderDate, 
DATE_FORMAT(OrderDate, '%M %d, %Y') AS FormattedDate
FROM Orders;

```

##  Explanation:

- DATE_FORMAT() changes how the date is displayed.
- %M %d, %Y formats it as: April 02, 2025.

