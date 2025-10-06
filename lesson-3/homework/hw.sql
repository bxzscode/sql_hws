create database class_3 
go 
use class_3

-- bulk insert importing/exporting data , constraints 

create table employees ( ID int , Name varchar(50))

BULK INSERT Employees
FROM 'C:\Users\Trump\Desktop\1 , John.txt'
WITH 
(
    FIRSTROW = 1,               -- Skips the header row
    FIELDTERMINATOR = ',',      -- Change this to the correct delimiter (comma, tab, etc.)
    ROWTERMINATOR = '\n',       -- New line as row separator
    
);

SELECT * FROM Employees;

-- faqat txt yoki csv filelarni import qivosa boladi , bulk insert orqali

create table task (Name varchar(50) , Count INT)

-- task
BULK INSERT task
FROM 'C:\Users\Trump\Downloads\Telegram Desktop\test.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
select * from task


-- IMPORT / EXPORT

-- constraints 

-- identity

create table [identity] (ID int identity(1 , 1), name varchar(50))

insert into [identity] values ('ALICE'), ('BOB'); -- identity ishlatildimi boldi 1 qoshib keturadi , insertga yozish shartmas. name yozsa boldi faqat
select * from [identity]

-- null/not null - null digani duplikat qabul qiloladi yoki yoq

create table check_nulll (ID int not null , name varchar(50) null)

insert into check_nulll values (1 , null)
select * from check_nulll

update check_nulll
set name = 'Alex'
where name is null

-- unique

-- Primary key , foreign key 
-- primary key - bitta tableda bita boladi kopincha ID da. unique + not null

id int Primary key

-- foreign key -- ulab qoyasan birorta valuega , yoq odamga nimadir qb qoyomedi shunda. check qiladi birinchi agar exist bosda keyin insert qilinadi

create table orders (ID int Primary key , valu_e int , DepID int foreign key references orders(ID)) 

insert into orders values (1 , 24 , 2)
insert into orders values (2 , 30 , 3)


---

alter table employees1
add constraints fk_departmentID
foreign key ( departmentID) references department(departmentID)

alter table employees2
drop constraints 

-- check

countrypop int check(countrypop >0) -- agar 0 dan kichik bolgan valueni umuman accept qilmaydi

-- default constraint

HireDate date default Getdate() -- hech qanaqa value berilmasayam , default hozirgi vaqtni avtomaticheski qoyadi with using getdate()

Alter table orders
add constraint fk_orders_customers
Foreign key(CustomerID)
References Customers(Customer ID)
On delete cascade
On update cascade
