-- Date Diff : DATEDIFF(end, start) gives number of days between two dates.

select OrderID , Product , OrderDate , DATEDIFF(CURDATE(), OrderDate) AS DaysSinceOrder
from orders;

-- Filter Orders from the Last 30 Days

SELECT * FROM Orders
WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;


-- Date Add

select OrderID , Product , OrderDate , DATE_ADD(OrderDate , INTERVAL 7 DAY)
from orders;

-- Date Format

select OrderID , Product , OrderDate , DATE_FORMAT(OrderDate, '%M %d, %Y') AS FormattedDate
from orders;