-- basic level tasks :
create table employeees (EmpID INT , Name varchar(50) , Salary decimal(10,2))
insert into employeees values 
     ( 1 , 'John' , 877.87),
     ( 2 , 'Kevin' , 908.23),
     ( 3 , 'Ace' , 224.65);

select * from employeees;

update employeees 
set salary = 7000
where EmpID = 1;

delete from employeees 
where empid = 2;

-- Delete - mostly used for removing specific rows with command where
-- Truncate - removing all rows
-- Drop removing data structures with data

Alter table employeees
Alter column Name varchar(100);

Alter table employeees
Add department varchar(50);

Alter table employeees
alter column salary float;

Create table Departments (DepID INT Primary Key , DepName Varchar(50))

Truncate table employeees;

-- Intermediate level tasks :

insert into Departments values
    ( 1 , 'accounting' ),
    ( 2 , 'Sales' ),
    ( 3 , 'Marketing' ),
    ( 4 , 'Analytics' ),
    ( 5 , 'Main' );

select * from Departments;

alter table Departments
add Salary Decimal(10,2)

update departments
set Salary = 32494
where DepID = 1
update departments
set Salary = 4563
where DepID = 2
update departments
set Salary = 334
where DepID = 3
update departments
set Salary = 1000
where DepID = 4
update departments
set Salary = 9980
where DepID = 5


update departments
set DepName = 'Management'
where salary > 5000

truncate table employeees;

Alter table employeees
drop column department;

exec sp_rename 'Employeees' , 'StaffMembers';
select * from StaffMembers;

DROP TABLE Departments;

-- Advanced level tasks:

Create table Products ( ProID INT Primary Key, ProName varchar, Category varchar, Price Decimal(10,2) Check (Price > 0)) 

alter table Products
add StockQuantity INT Default(50)
select*from Products;

EXEC sp_rename 'Products.Category', 'ProCategory', 'COLUMN';

insert into Products values
    (1 , 'watch' , 'ST' , 76,45 , 432),
    (2 , 'Clothes' , 'B' , 5,5 , 33),
    (3 , 'Iphone' , 'C' , 1000,1 , 1),
    (4 , 'HPlap' , 'BL' , 555,9 , 100),
    (5 , 'Monitor' , 'D' , 230,4 , 27);

select * into Products_backup
from Products;

EXEC sp_rename 'Products' , 'Inventory' ;

alter table Inventory
alter column Price FLOAT;
go
select * from Inventory;

alter table Inventory
add ProductCode INT identity(1000 , 50);
select * from Inventory;
