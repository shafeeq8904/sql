-- ROW_NUMBER() – Assign a unique row number within each department

select Name, Position, Salary,
row_number() over(partition by Position order by Salary desc) as rownum
from employees;

-- RANK() – Assign rank with gaps for ties
select Name, Position, Salary,
RANK() OVER (PARTITION BY Position ORDER BY Salary DESC) AS RankPosition
from employees;

-- DENSE_RANK() – Rank without gaps for ties
select Name, Position, Salary,
DENSE_RANK() OVER (PARTITION BY Position ORDER BY Salary DESC) AS RankPosition
from employees;

-- LEAD() and LAG() – Look ahead or behind
select Name, Position, Salary,
LEAD(Salary) OVER (PARTITION BY Position ORDER BY Salary DESC) AS NextSalary,
LAG(Salary) OVER (PARTITION BY Position ORDER BY Salary DESC) AS PreviousSalary
from employees;