-- 1
create table Person (personId int, firstName varchar(255), lastName varchar(255))
Create table Address (addressId int, personId int, city varchar(255), state varchar(255))

insert into Person (personId, lastName, firstName) values ('1', 'Wang', 'Allen')
insert into Person (personId, lastName, firstName) values ('2', 'Alice', 'Bob')

insert into Address (addressId, personId, city, state) values ('1', '2', 'New York City', 'New York')
insert into Address (addressId, personId, city, state) values ('2', '3', 'Leetcode', 'California')

select p.firstname , p.lastname , a.city , a.state from person p
left join address a
on p.personid = a.personid

-- 2
Create table Employee (id int, name varchar(255), salary int, managerId int)
insert into Employee (id, name, salary, managerId) values ('1', 'Joe', '70000', '3')
insert into Employee (id, name, salary, managerId) values ('2', 'Henry', '80000', '4')
insert into Employee (id, name, salary, managerId) values ('3', 'Sam', '60000', NULL)
insert into Employee (id, name, salary, managerId) values ('4', 'Max', '90000', NULL)

select e2.name from employee e
join employee e2
on e.id = e2.managerid
where e.salary < e2.salary

--3 
CREATE TABLE Person (
    id INT,
    email VARCHAR(255)
);

INSERT INTO Person (id, email) VALUES (1, 'a@b.com');
INSERT INTO Person (id, email) VALUES (2, 'c@d.com');
INSERT INTO Person (id, email) VALUES (3, 'a@b.com');

select p.email from person p
join person p1
on p.id < p1.id
where p.email = p1.email

-- 4
truncate table person
INSERT INTO Person (id, email) VALUES
(1, 'john@example.com'),
(2, 'bob@example.com'),
(3, 'john@example.com');

delete from person 
where id not in(select min(id) from person group by email)

select * from person

--5
CREATE TABLE boys (
    Id INT PRIMARY KEY,
    name VARCHAR(100),
    ParentName VARCHAR(100)
);

CREATE TABLE girls (
    Id INT PRIMARY KEY,
    name VARCHAR(100),
    ParentName VARCHAR(100)
);

INSERT INTO boys (Id, name, ParentName) 
VALUES 
(1, 'John', 'Michael'),  
(2, 'David', 'James'),   
(3, 'Alex', 'Robert'),   
(4, 'Luke', 'Michael'),  
(5, 'Ethan', 'David'),    
(6, 'Mason', 'George');  


INSERT INTO girls (Id, name, ParentName) 
VALUES 
(1, 'Emma', 'Mike'),  
(2, 'Olivia', 'James'),  
(3, 'Ava', 'Robert'),    
(4, 'Sophia', 'Mike'),  
(5, 'Mia', 'John'),      
(6, 'Isabella', 'Emily'),
(7, 'Charlotte', 'George');

select distinct g.parentname from girls g
left join boys b
on g.parentname = b.parentname
where b.parentname is null

--6 CREATE SCHEMA Sales;
CREATE SCHEMA HR;

CREATE TABLE Sales.Orders
(
  orderid        INT IDENTITY PRIMARY KEY,
  custid         INT NULL,
  empid          INT NOT NULL,
  orderdate      DATETIME NOT NULL,
  requireddate   DATETIME NOT NULL,
  shippeddate    DATETIME NULL,
  shipperid      INT NOT NULL,
  freight        MONEY NOT NULL
    CONSTRAINT DFT_Orders_freight DEFAULT(0),
  shipname       NVARCHAR(40) NOT NULL,
  shipaddress    NVARCHAR(60) NOT NULL,
  shipcity       NVARCHAR(15) NOT NULL,
  shipregion     NVARCHAR(15) NULL,
  shippostalcode NVARCHAR(10) NULL,
  shipcountry    NVARCHAR(15) NOT NULL

select custid , sum(freight) as TotalWeight , min(freight) as LeastWeight from sales.orders
where freight > 50
group by custid

--7 
CREATE TABLE Cart1
(
Item  VARCHAR(100) PRIMARY KEY
);
GO

CREATE TABLE Cart2
(
Item  VARCHAR(100) PRIMARY KEY
);
GO

INSERT INTO Cart1 (Item) VALUES
('Sugar'),('Bread'),('Juice'),('Soda'),('Flour');
GO

INSERT INTO Cart2 (Item) VALUES
('Sugar'),('Bread'),('Butter'),('Cheese'),('Fruit');
GO

select c1.item as ITEMCART1 , c2.Item As ITEMCART2 from cart1 c1
full join cart2 c2
on c1.item = c2.item

--8
Create table Customers (id int, name varchar(255))
Create table Orders (id int, customerId int)
INSERT INTO Customers (id, name) VALUES (1, 'Joe');
INSERT INTO Customers (id, name) VALUES (2, 'Henry');
INSERT INTO Customers (id, name) VALUES (3, 'Sam');
INSERT INTO Customers (id, name) VALUES (4, 'Max');
INSERT INTO Orders (id, customerId) VALUES (1, 3);
INSERT INTO Orders (id, customerId) VALUES (2, 1);

select c.[name] from customers c
left join orders o
on c.id = o.customerid
where o.customerid is NULL

--9
Create table Students (student_id int, student_name varchar(20))
Create table Subjects (subject_name varchar(20))
Create table Examinations (student_id int, subject_name varchar(20))

insert into Students (student_id, student_name) values ('1', 'Alice')
insert into Students (student_id, student_name) values ('2', 'Bob')
insert into Students (student_id, student_name) values ('13', 'John')
insert into Students (student_id, student_name) values ('6', 'Alex')

insert into Subjects (subject_name) values ('Math')
insert into Subjects (subject_name) values ('Physics')
insert into Subjects (subject_name) values ('Programming')

insert into Examinations (student_id, subject_name) values ('1', 'Math')
insert into Examinations (student_id, subject_name) values ('1', 'Physics')
insert into Examinations (student_id, subject_name) values ('1', 'Programming')
insert into Examinations (student_id, subject_name) values ('2', 'Programming')
insert into Examinations (student_id, subject_name) values ('1', 'Physics')
insert into Examinations (student_id, subject_name) values ('1', 'Math')
insert into Examinations (student_id, subject_name) values ('13', 'Math')
insert into Examinations (student_id, subject_name) values ('13', 'Programming')
insert into Examinations (student_id, subject_name) values ('13', 'Physics')
insert into Examinations (student_id, subject_name) values ('2', 'Math')
insert into Examinations (student_id, subject_name) values ('1', 'Math')

select s.student_id , s.student_name , st.subject_name , count(e.student_id) as attended_exams from students s
join Examinations e
on s.student_id = e.student_id
join subjects st
on e.subject_name = st.subject_name
group by st.subject_name , s.student_id , s.student_name
order by s.student_id, st.subject_name desc
