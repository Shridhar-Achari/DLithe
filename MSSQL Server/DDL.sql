--DDL Statements
--Create database
create database Student

use Student

--Alter Database
alter database Student modify name=College

use College

--Create table
create table Student
(
id int,
sname varchar(20),
mark int
)

--Alter table change column name
alter table Student alter column sname varchar(15)

--Alter table add column
alter table Student add course varchar(10)

--Alter table drop column
alter table Student drop column mark

select * from Student

use College

--drop database
drop database College