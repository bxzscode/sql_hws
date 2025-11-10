-- easy lvl
-- 1
with thousand as (
select 1 as n 
union all
select n +1 from thousand where n < 1000
)
select n from thousand option (maxrecursion 0)

--2
select * from employees e
join (select employeeid , sum(salesamount) as totalsales from sales 
group by employeeid) as d
on e.EmployeeID = d.EmployeeID

--3 
with cte as (
select avg(salary) as [avg] from employees) 
select * from cte

--4 
select * from sales s
join (
select productid , max(salesamount) as [madmax] from sales
group by productid
) as t 
on s.ProductID = t.productid

--5
with numbers as ( 
select 1 as num
union all
select num * 2 from numbers
where num * 2 < 1000000
)
select * from numbers

-- 6
with cte as (
select count(employeeid) as counted from sales
group by productid
having count(employeeid) > 5 )
select firstname , lastname , employeeid from employees 

--7
with cte as (select * from sales where salesamount > 500)
select * from products 

--8
with e as (select avg(salary) as [avg] from employees)
select * from employees e1
where e1.salary > (select [avg] from e)

--medium lvl
--1
select top 5 e.employeeid , s.counted , e.firstname from employees e
join (select employeeid , count(productid) as counted from sales group by employeeid) s
on e.EmployeeID = s.EmployeeID
order by e.employeeid desc

--2 
select p.productname , t.al from (
select productid , sum(salesamount) as al from sales group by productid) as t
join products p
on p.ProductID = t.ProductID

-- 3
with factorial as(
select number , 1 as factoria , 1 as cnt from numbers1
union all
select number , factoria * (cnt + 1) , cnt + 1
from factorial
where cnt + 1 <= number )

select number , factoria from factorial
where cnt = number 
order by number

--4
with part as (select id , substring(string , 1 , 1) as letter , 1 as position , string from example
union all
select id , substring(string , position + 1 , 1) as letter , position + 1 , string from part
where position + 1 <= len(string)
)
select * from part

-- 5
with tbl as (select month(saledate) as months , salesamount , 
lag(salesamount) over (order by month(saledate)) as prevmonth from sales)
select months , salesamount , prevmonth , salesamount - prevmonth as diff from tbl

--6
select e.EmpID, e.EmpName, e.Salary, q.Quarter, q.TotalSales from employees e
join (select employeeid , datepart(quarter , saledate) as quarter , sum(salesamount) as totalsales from sales
group by employeeid , datepart(quarter , saledate)
having sum(salesamount) > 1500 ) as q
on e.EmpID = q.EmployeeID

-- hard lvl
-- 1
with fibonacci (n, fib1, fib2) as (
select 1 as n, 0 as fib1, 1 as fib2
union all
select n + 1, fib2, fib1 + fib2 from fibonacci
where n < 20 )
select n, fib1 as fibonaccinumber from fibonacci;

--2
select * from FindSameCharacters
where vals is not null and len(replace(vals , substring(vals , 1 , 1) , '')) = 0

--3
declare @n int = 5;
with cte as (
select 1 as n, cast(1 as varchar(max)) as seq
union all
select n + 1, seq + cast(n + 1 as varchar(max)) from cte
where n + 1 <= @n)
select n, seq
from cte option(maxrecursion 0);

--4
with cte as (
select employeeid, max(salesamount) as maxy from sales
where saledate >= DATEADD(MONTH, -6, GETDATE())
group by employeeid
)
select e.empid, e.empname, c.maxy from employees e
join cte c on e.empid = c.employeeid


