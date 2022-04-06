create database DLithe_Bootcamp
use DLithe_Bootcamp

create table Seminar
(
s_id int,
name varchar(20),
topic varchar(20),
s_day varchar(9)
);

insert into Seminar values(1,'Shridhar','html','Monday');
insert into Seminar values(2,'Deepak','css','Tuesday');
insert into Seminar values(3,'Rohan','javascript','Wednesday');
insert into Seminar values(4,'Ameen','bootstrap','Thursday');

--DQL Statements
select * from Seminar

select name,topic from Seminar

