# Filtering and Sorting

## Filtering Records Using WHERE Clause

Filter employees based on their position:

```sql
SELECT * FROM Employees WHERE Position = 'Sales Executive';
```

## Sorting Results Using ORDER BY Clause

Sort employees by salary in ascending order:
```sql
SELECT * FROM Employees ORDER BY Salary ASC;
```

## Combining Conditions with AND / OR

Filter employees in a specific position and earning above a salary threshold:
```sql
SELECT * FROM Employees WHERE Position = 'Software Engineer' AND Salary > 70000;
```
Find employees who are either Project Managers or earn more than 80000:
```sql
SELECT * FROM Employees WHERE Position = 'Project Manager' OR Salary > 80000;
```