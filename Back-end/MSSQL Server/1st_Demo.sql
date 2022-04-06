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

