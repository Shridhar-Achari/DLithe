use DLithe_Bootcamp

--1. Primary & foreign key Constraints 

--Primary key
create table Employee
(
emp_id int primary key,
emp_name varchar(20),
basic_pay int,
);

--Created foreign key for the column empno from employees table emp_id
create table Department
(
d_no int primary key,
d_name varchar(20),
empno int constraint empno_fk references Employee(emp_id)
);

insert into Employee values(10,'Sharath',20000)
insert into Employee values(11,'Ganesh',30000)
insert into Employee values(12,'Ajith',45000)
insert into Employee values(13,'Manoj',25000)
insert into Employee values(14,'Abhi',30000)

select * from Employee

insert into Department values(1001,'HR',10)
insert into Department values(1002,'DevOps',11)
insert into Department values(1003,'Testing',12)
insert into Department values(1004,'UX/UI',13)
insert into Department values(1005,'Business',14)

select * from Department

select * from Employee

--2. Referential Integrity Constraints

--BY DEFAULT- ON DELETE NO ACTION/ON UPDATE NO ACTION
--delete
delete from Employee where emp_id=12
--Raise an error
--Msg 547, Level 16, State 0, Line 39
--The DELETE statement conflicted with the REFERENCE constraint "empno_fk". The conflict occurred in database "DLithe_Bootcamp", table "dbo.Department", column 'empno'.
--The statement has been terminated.

select * from Employee

--Update
update Employee set emp_id=10001 where emp_id=10
--Raise an error
--Msg 547, Level 16, State 0, Line 49
--The UPDATE statement conflicted with the REFERENCE constraint "empno_fk". The conflict occurred in database "DLithe_Bootcamp", table "dbo.Department", column 'empno'.
--The statement has been terminated.


--Alter table removed foreign key
alter table Department drop constraint empno_fk

--Alter table add constraint foreign key on delete cascade
alter table Department add constraint empno_fk foreign key(empno) references Employee(emp_id) on delete cascade

select * from Employee
select * from Department

delete from Employee where emp_id=12
select * from Employee
--emp_id 12 deleted


alter table Department drop constraint empno_fk
--update cascade
alter table Department add constraint empno_fk foreign key(empno) references Employee(emp_id) on update cascade

select * from Employee
select * from Department

update Employee set emp_id=101 where emp_id=10
select * from Employee
select * from Department


alter table Department drop constraint empno_fk
--ON DELETE SET NULL/ON UPDATE SET NULL
--delete set null
alter table Department add constraint empno_fk foreign key(empno) references Employee(emp_id) on delete set null

delete from Employee where emp_id=11

select * from Employee

alter table Department drop constraint empno_fk
--Update set null
alter table Department add constraint empno_fk foreign key(empno) references Employee(emp_id) on update set null

update Employee set emp_id=103 where emp_id=13
select * from Employee
select * from Department

drop table Department
--delete set default
create table Department
(
d_no int primary key,
d_name varchar(20),
empno int default 100 constraint empno_fk references Employee(emp_id) on delete set default
);
select * from Employee
insert into Department values(10001,'IT',14)
insert into Department values(10002,'HR',101)
insert into Department values(10003,'DevOps',103)
select * from Department
delete from Employee where emp_id=101
--Reflect Error
--Msg 547, Level 16, State 0, Line 112
--The DELETE statement conflicted with the FOREIGN KEY constraint "empno_fk". The conflict occurred in database "DLithe_Bootcamp", table "dbo.Employee", column 'emp_id'.
--The statement has been terminated.





--3. INDEX
--1. Clustered Index
--2. Non clustered index
--we can create index for large tables based on requirement
use DLithe_Bootcamp

select * from Student
select * from Student;
create clustered index index_id on Student(id)
select id from Student

--Clustered index is created default it is useful to search particular column from large table
-- Non Clustered index is created for Unique Key
create index index_course on Student(course)
 select course from Student

 select * from Student

 create index ind_mark3 on Student(mark3)
 select mark3 from Student where mark3>75

 create index index_mark2 on Student(mark2) 
 select mark2 from Student where mark2>70;
 select * from Student





--4. Sequences
--Unique Number- Primary key
create sequence dbo.sequenceOrder
as int start with 1
increment by 1

select * from sys.sequences where name='sequenceOrder'

create table seq_Order
(
ord_id int primary key,
ord_date date,
ord_name varchar(20)
);
select next value for dbo.sequenceOrder
insert into seq_Order values(next value for dbo.sequenceOrder,'11/04/2022','TV')
select * from seq_Order

delete from seq_Order
select * from seq_Order

alter sequence sequenceOrder restart with 1
insert into seq_Order values(next value for dbo.sequenceOrder,'09/04/2022','Mobile')
select * from seq_Order

drop sequence sequenceOrder



--5. VIEWS
--View Virtual tables
--2 types 
--1. Simple View and
--2. Complex Views

--Simple view
create view view_mark3 as select id,sname,mark3, iif( mark3 >35,'Pass','Fail')as Remark from Student
select * from view_mark3

create table project
(
pro_id int primary key,
pro_name varchar(20),
dept_no int constraint deptno_fk references Department(d_no)
)
select * from Department
insert into project values(51,'Retail',10001)
insert into project values(52,'Food',10002)
insert into project values(53,'Bank',10003)

select * from project

--Complex view
create view view_project_assign as select e.emp_id,e.emp_name,d.d_name from Employee as e full join Department as d on e.emp_id=d.empno full join project as p on d.d_no=p.dept_no

select * from view_project_assign
select * from Employee
select * from Department
select * from project



--6. SYNONYM
--Alias for the table 
select * from project

create synonym Proj for dbo.project

select * from Proj

--drop synonym
drop synonym if exists Proj

select * from Proj
































