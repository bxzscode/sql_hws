-- 1

-- 1.1 
CREATE TABLE InputTbl (
    col1 VARCHAR(10),
    col2 VARCHAR(10)
);
    INSERT INTO InputTbl (col1, col2) VALUES 
('a', 'b'),
('a', 'b'),
('b', 'a'),
('c', 'd'),
('c', 'd'),
('m', 'n'),
('n', 'm');

select distinct
case when col1 < col2 then col1 else col2 end as col1,
case when col1 < col2 then col2 else col1 end as col2
from inputtbl

-- 1.2

select distinct iif(col1 < col2 , col1 , col2) as col1 , iif(col1 < col2 , col2 , col1) as col2
from inputtbl

-- 2

CREATE TABLE TestMultipleZero (
    A INT NULL,
    B INT NULL,
    C INT NULL,
    D INT NULL
);

INSERT INTO TestMultipleZero(A,B,C,D)
VALUES 
    (0,0,0,1),
    (0,0,1,0),
    (0,1,0,0),
    (1,0,0,0),
    (0,0,0,0),
    (1,1,1,0);

select * from testmultiplezero
where (A + B + C +D) <> 0

-- 3

create table section1(id int, name varchar(20))
insert into section1 values (1, 'Been'),
       (2, 'Roma'),
       (3, 'Steven'),
       (4, 'Paulo'),
       (5, 'Genryh'),
       (6, 'Bruno'),
       (7, 'Fred'),
       (8, 'Andro')

select * from section1
where ID % 2 = 1

-- 4

select top 1 * from section1
order by ID asc

-- 5 

select top 1 * from section1
order by ID desc

-- 6

select * from section1
where [name] like 'b%'

-- 7 

CREATE TABLE ProductCodes (
    Code VARCHAR(20)
);

INSERT INTO ProductCodes (Code) VALUES
('X-123'),
('X_456'),
('X#789'),
('X-001'),
('X%202'),
('X_ABC'),
('X#DEF'),
('X-999');

select * from productcodes
where Code like '%/_%'
escape '/'
