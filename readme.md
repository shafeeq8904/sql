# SQL Commands Documentation

# 1. Basic SQL Commands

## 1.1 Database Operations

- CREATE DATABASE database_name;Creates a new database.
- USE database_name;Selects a database to work with.
- DROP DATABASE database_name;Deletes an existing database (Use with caution!).

## 1.2 Table Operations

- CREATE TABLE table_name (column1 datatype, column2 datatype, ...);Creates a new table with specified columns and data types.
- DROP TABLE table_name;Deletes a table and all its data.
- ALTER TABLE table_name ADD column_name datatype;Adds a new column to a table.
- ALTER TABLE table_name DROP COLUMN column_name;Removes a column from a table.

## 1.3 Data Manipulation

- INSERT INTO table_name (column1, column2) VALUES (value1, value2);Inserts new data into a table.
- SELECT * FROM table_name;Retrieves all records from a table.
- UPDATE table_name SET column1 = value1 WHERE condition;Updates specific records in a table.
- DELETE FROM table_name WHERE condition;Removes specific records from a table.

# 2. Filtering and Sorting

## 2.1 Filtering Data

- SELECT * FROM table_name WHERE column_name = 'value';Retrieves records based on a condition.
- SELECT * FROM table_name WHERE column_name > value;Retrieves records where the column value is greater than a specific value.
- SELECT * FROM table_name WHERE column_name BETWEEN value1 AND value2;Retrieves records within a specified range.
- SELECT * FROM table_name WHERE column_name IN ('value1', 'value2');Retrieves records that match any of the specified values.

## 2.2 Sorting Data

- SELECT * FROM table_name ORDER BY column_name ASC;Sorts records in ascending order.
- SELECT * FROM table_name ORDER BY column_name DESC;Sorts records in descending order.

# 3. Aggregation and Grouping

## 3.1 Aggregate Functions

- SELECT COUNT(*) FROM table_name;Returns the total number of records.
- SELECT SUM(column_name) FROM table_name;Returns the sum of values in a column.
- SELECT AVG(column_name) FROM table_name;Returns the average value of a column.
- SELECT MAX(column_name) FROM table_name;Retrieves the maximum value in a column.
- SELECT MIN(column_name) FROM table_name;Retrieves the minimum value in a column.

## 3.2 Grouping Data

- SELECT column_name, COUNT(*) FROM table_name GROUP BY column_name;Groups data and counts occurrences.
- SELECT column_name, SUM(sales) FROM table_name GROUP BY column_name;Groups data and calculates sum.

## 3.3 Filtering Grouped Data

- SELECT column_name, COUNT() FROM table_name GROUP BY column_name HAVING COUNT() > 5;Filters grouped results based on a condition.