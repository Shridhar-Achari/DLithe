create database DLithe2

use DLithe2

--Create Table
create table Trainees
(
Id int,
Name varchar(20),
Designation varchar(10)
)
--Alter Database Name
alter database DLithe2 modify Name=DLithe_Batch2

--use DLithe_Batch2
use DLithe_Batch2

--alter table
alter table Trainees alter column Name varchar(30)

--alter table add age
alter table Trainees add Age int

--drop
alter table trainees drop column Age

--drop table
drop table Trainees

Create table Student
(
id int,
sname varchar(20),
mark1 int,
mark2 int,
mark3 int,
result varchar(10)
);

alter table Student add course varchar(20);

select * from student

insert into Student values (101,'Ajith',71,67,86,'pass','bcom')
insert into Student values (102,'Mahesh',91,96,86,'pass','mca')
insert into Student values (103,'Kiran',28,31,34,'fail','mca')
insert into Student values (104,'Arun',78,91,56,'pass','bca')
insert into Student values (105,'Bharath',31,33,26,'fail','bcom')
insert into Student values (106,'Jayanth',89,91,89,'pass','mca')
insert into Student values (107,'Prasad',89,91,77,'pass','bca')

select * from Student

--Update
update Student set course='mba'where id=106

select * from Student

--Delete
delete from Student where id=102

select * from Student


create table bank
(
ifsc varchar(15),
b_name varchar(20),
place varchar(20)
)

insert into bank values('CNRB0010198','CANARA Bank','Kundapur')
insert into bank values('KARB0000165','Karnataka Bank','Mandya')
insert into bank values('HDFC0020123','HDFC Bank','Mysore')

select * from bank


--Truncate
truncate table bank

select * from bank
--Table values are deleted not table

--Schema
create schema Finance
create table Finance.Branch
(
id int,
bname varchar(20),
)


select * from Finance.Branch


drop schema Finance
--Cannot drop schema 'Finance' because it is being referenced by object 'Branch'.


select * from Student
--Select operator where condition
select * from Student where course ='mca'

--Relational operator
select * from Student where mark1<50
select * from Student where mark3>35


--Logical operator
select * from Student where result='pass' and course='bcom'
select * from Student where result='pass' or course='bcom'

--Range operator(between and )
select * from Student where id between 103 and 106

select * from student
-- IN and NOT IN 
select * from Student where course IN ('bca','mca')
select * from Student where course NOT IN ('bca','mca')

select * from Student
--LIKE Operator
select * from Student where sname LIKE 'J%'
--first letter J

select * from Student
select * from Student where sname LIKE '%h'
--Last letter h

select * from Student
select * from Student where sname LIKE '__a%'
--Third letter a

select * from Student
select * from Student where sname LIKE '[D-M]%'
--First letter between D and M followed by any character

select * from Student
select * from Student where sname LIKE '%t_'
--last but one letter with 't'

select * from Student
select * from Student where sname NOT LIKE '%h'
--Last letter not h

--Aggregate Functions
create table item
(
item_id int,
item_name varchar(20),
quantity int,
price int,
);

insert into item values(1001,'TV',10,45000)
insert into item values(1002,'Laptop',3,75000)
insert into item values(1003,'Grainder',2,25000)
insert into item values(1004,'Refrigerator',1,65000)
insert into item values(1005,'Washing Machine',6,18000)
insert into item values(1006,'Mobile',1,25000)
insert into item values(1007,'Bag',5,2500)
insert into item values(1008,'Shirt',2,750)
insert into item values(1009,'AC',2,50000)

select * from item
--max
select max(price) as 'Max_price' from item
--count
select count(item_name) as 'Total_count' from item
--avg
select avg(price) as 'Average_price' from item
--sum
select sum(quantity) as 'Total_Quantity' from item
--min
select min(price) as 'less Price' from item

--ORDER BY
select * from item order by item_name 

--order by name descending
select * from item order by item_name desc


--orderby price
select * from item order by price 


--Group By
select max(price) from item group by item_name 













 




