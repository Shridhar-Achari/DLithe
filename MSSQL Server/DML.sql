create database Department
use Department

create table Employee
(
id int,
name varchar(20),
dept varchar(10)
)

--DML Statements
insert into Employee values(101,'Ram','sales');

select * from Employee

select id as Emp_id, name as Emp_name from Employee

insert into Employee values(102,'Ramesh','HR');
insert into Employee values(103,'Raju','Marketing');
insert into Employee values(104,'Girish','Sales');
insert into Employee values(105,'Harish','HR');

select * from Employee


