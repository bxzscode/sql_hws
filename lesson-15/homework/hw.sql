--1
select * from employees 
where salary in(select min(salary) from employees)

--2
select * from products p
where price > (select avg(price) from products)

--3 
select * from employees
where id = (select id from departments where department_name = 'sales')

--4 
select * from customers
where customer_id not in(select order_id from orders)

--5 
select * from products
where price in (select max(price) from products group by category_id)

--6 
select * from departments
where id in (select top 1 department_id from employees group by department_id order by avg(salary) desc)

--7 
select * from employees
where salary > (select avg(salary) from employees)

--8
select * from students
where student_id in(select top 1 student_id from grades order by grade desc)

--9 
select * from (select * , dense_rank() over(partition by category_id order by price desc) as [rank] from products) t
where [rank] = 3

--10
select * from employees e1
where e1.salary > (select avg(salary) from employees) and e1.salary < (select max(salary) from employees e where e1.department_id = e.department_id)

