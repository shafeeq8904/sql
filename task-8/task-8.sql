--Non-Recursive CTE 
-- Break a complex query into logical parts (e.g., find average order quantity, then filter only above-average orders).

with averageSalary AS (
	select AVG(Salary) as avgSal
    from employees
)

select * from employees
where Salary > (select avgSal from averageSalary);


-- recursive CTE
with RECURSIVE employeeHierarchy  as (
	select * ,
    1 as Level
    from employees
    where ManagerID is null
    
    union all
    
    select e.EmployeeID , e.Name , e.ManagerID ,
    level +1 
    from employees e
    join employeeHierarchy eh
    on e.ManagerID = eh.EmployeeID
)

select * from employeeHierarchy;