/* 1.Data - numbers , facts , texts. Information overall
Database - collection of data , we can control , change , store and analyse data in it
relational database - database that are stored and controlled in related tables
table - combination of rows and columns with data's in it */

 -- 2.Security , High availability , Scalability and performance , data integration , recovery

-- 3. Windows Authentication , SQL Server Authentication , Azure Active Directory Authentication

-- 4 - 9 : 


create database schoolDB;
go 
create table SCHOOL ( StudentID int Primary key , name varchar(50) , age int );

select * from school ;

insert into school values
     (23 , 'Johnny' , 15),
     (76 , 'Kevin' , 19),
     (12 , 'Henry' , 17);

/* Difference between sql , sql server and ssms
sql - language to manage data
sql server - microsoft's database system
ssms - tool to manage sql server and run sql queries

DQL , data quaery language = select
DDL , Data definition language = create . alter , drop , truncate
DML , Data manipulation language = insert , update , delete
DCL , Data control language = Grant , revoke - for database administrators
TCL , transaction control language  commit , rollback
