--1
select p.productid , p.productname , sum(s.quantity) as sumed , sum(s.quantity * p.price) as s into #monthlysales from products p
join sales s
on p.ProductID = s.ProductID
where month(saledate) = 04
group by p.ProductID , p.ProductName
select * from #monthlysales

--2 
create view vw_ProductSalesSummary as 
select p.* , s.quantity from products p
join sales s
on p.ProductID = s.ProductID
select * from vw_ProductSalesSummary

--3 
create function fn_GetTotalRevenueForProduct(@ProductID INT)
returns table
as
return
(select p.productid , sum(s.quantity * p.price) as sm from products p
join sales s
on p.ProductID = s.ProductID
where p.productid = @productid
group by p.productid)

--4 
create function fn_GetSalesByCategory(@Category VARCHAR(50)) 
returns table
as 
return 
(select p.ProductName , sum(s.quantity) as totalquantity , sum(p.price * s.quantity) as totalrevenue from products p
join sales s
on p.ProductID = s.ProductID
where p.Category = @category
group by p.productname)

--5 
create function fn_isprime(@n int)
returns varchar(3)
as
begin
declare @i int=2
if @n<=1 return 'no'
while @i<=sqrt(@n)
begin
if @n%@i=0 return 'no'
set @i+=1
end
return 'yes'
end

--6 
create function fn_GetNumbersBetween(@start int , @end int)
returns table
as 
return
(with cte as (select @start as n
union all
select n + 1 from cte
where n + 1 < @end
)
select * from cte)

--7
create function empy(@n int)
returns table
as 
return (
select distinct salary
from employee
order by salary desc
offset (@n - 1) rows fetch next @n row only) 
select * from empy(2)

--8 
with cte as(
select requester_id as id from request_accepted 
union all
select accepter_id from request_accepted)
select top 1 id , count(id) as c from cte
group by id
order by c desc

--9 
create view vw_CustomerOrderSummary as
with cte as (select count(order_id) as o , sum(amount) as s, max(order_date) as d , customer_id from orders group by customer_id)
select c.customer_id , c.name , isnull(cte.o , 0) as totalorders, isnull(cte.s , 0) as totalsales, cte.d from customers c
join cte 
on c.customer_id = cte.customer_id ;
select * from vw_CustomerOrderSummary

--10
with cte as(
select rownumber,testcase from gaps where rownumber=1
union all
select g.rownumber,isnull(g.testcase,cte.testcase) as testcase
from gaps g 
join cte on g.rownumber=cte.rownumber+1)
select * from cte option(maxrecursion 0);



