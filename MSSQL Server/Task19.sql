use DLithe_Bootcamp

create table Customers
(
cust_id int primary key identity(101,1),
cust_name varchar(20) not null,
cust_addr varchar(20) not null,
)
create table Orders(
ord_id int primary key identity(10,1),
ord_date date not null,
c_id int foreign key References Customers(cust_id)
)
create table Products
(
prd_id int primary key identity(1,1),
prd_name varchar(20) not null,
o_id int foreign key References Orders(Ord_id)
)
insert into Customers values('Manu','Mysore')
insert into Customers values('Abhi','Bangalore')
insert into Customers values('Ganesh','Kundapur')
insert into Customers values('Rakesh','Udupi')
select * from Customers

insert into Orders values('02/10/2022',103)
insert into Orders values('03/15/2022',101)
insert into Orders values('01/21/2022',103)
insert into Orders values('03/18/2022',102)
insert into Orders values('02/25/2022',104)
select * from Orders

insert into Products values('Mobile',13)
insert into Products values('TV',12)
insert into Products values('Eashing Machine',15)
insert into Products values('Bag',14)
insert into Products values('Laptop',16)
select * from Products

select * from Customers
select * from Orders
select * from Products

--Tables Created (Customers, Orders, Products)

--1. SUB QUERIES
--Subquery is a query within a sql statement 
--2 types
--CORRELATED SUBQUERY
--NON CORRELATED SUBQUERY

--subquery
select * from Customers where cust_id in(select cust_id from Customers where cust_addr='Bangalore')

--Where in subquery (One Table)
select * from Customers where cust_id in (select cust_id from Customers where cust_name like 'M%')
select * from Customers

--Where in (Two Tables)
select * from Orders where c_id in (select cust_id from Customers)
select * from Customers

--Where in (Two Tables) with where condition
select * from Orders where c_id in (select cust_id from Customers where cust_addr='Kundapur')


--SELECT SUBQUERY
select ord_id, ord_date,(select prd_id from Products where Products.o_id=Orders.ord_id)Product_No from Orders
select * from Products
select * from Orders

--FROM SUBQUERY
select c.cust_id,c.cust_name,c.cust_addr from (select avg(c_id) as Customer_id from Orders)as o, Customers as c where c.cust_id>o.Customer_id
select * from Customers

--INSERT SUBQUERY
--Create table Customer_NEW table to insert subquery
--the column name should be mathing in the subsquery to implement

create table Customer_NEW
(
cust_id int,
cust_name varchar(20),
cust_addr varchar(20)
)
--INSERT SUBQUERY
insert into Customer_NEW select * from Customers where cust_id in (select cust_id from Customers where cust_addr like 'M%')
select * from Customer_NEW


--UPDATE SUBQUERY
select * from Customers
select * from Orders
update Orders set ord_date='04/12/2022' where c_id in (select cust_id from Customers where cust_name='Abhi')
select * from Orders


--DELETE SUBQUERY
select * from Products
select * from Orders
delete from Products where o_id in (select ord_id from orders where ord_id=14)
select * from Products



--2. FUNCTIONS
 --Set of operations or actions 
--2 types 
--System defined and 
--User defined 
-- In user defined 3 types 
--1. Scalar valued
--2. Inline table valued
--3. Multi statement table valued 


--User Defined
--1. Scalar valued
create function cube_fun(@a int)
returns int
as 
	begin
		return @a*@a*@a
	end

--calling the function
select dbo.cube_fun(3) as Cube_Value


--Scalar Month
select * from Orders
create function calc_month(@cdate date)
returns int
as
begin
    Declare @month int  
    set @month=datediff(month,@cdate,getdate()) 
    return @month
end


--Month difference using scalar valued function
select ord_id,ord_date,c_id,dbo.calc_month(ord_date) as Order_monthdiff from Orders

--Month difference using scalar valued function in select list and where clause
select ord_id,ord_date,c_id,dbo.calc_month(ord_date) as Orders_Month_Diff from Orders where ord_id>13;

--Inline table valued Functions
select * from Student
create function fun_get_mark3(@id int)
returns table 
as return (select * from Student where id=@id)
--return table value for the student id 103
select * from fun_get_mark3(103)


--Multi Statement Table Valued
create function fun_get_res()
returns @table Table(id int,sname varchar(20),mark1 int,mark2 int,mark3 int,result varchar(20),course varchar(20))
as
begin
	insert into @table
	select id,sname,mark1,mark2,mark3,result,course from Student where result='pass'
	return
end
select * from fun_get_res()


--3. grouping sets
--It is an extension to group by
Select * from Student
select * from Student where course='bcom'
--group by
select course, sum(mark3) as tot_mark3 from Student group by course
--group by set
select course, sum(mark3) as tot_mark3 from Student group by GROUPING SETS
(
(course,mark3)
)

use DLithe_Bootcamp

--ROLL UP -Extension of groupby
select * from Student
select course ,sum(mark2) from Student group by course
select course ,sum(mark2) from Student group by rollup(course)
--Prints rollup(Total as null)

--COALESCE(Replace the null with an actual value)
select coalesce(course,'Total_Marks_in_Sub1') as std_course, sum(mark1) as Total_mark1 from Student group by rollup(course)

--CUBE
select coalesce(course,'Total_Marks_in_Sub1') as std_course, sum(mark1) as Total_mark1 from Student group by cube(course)
select coalesce (course, 'Overall_mark1') as Course_Details, sum(mark1) as Total_Mark1,sname from Student group by cube(course,sname) order by course,sname
select * from Student order by course


--4. STORED PROCEDURES
--These are pre compiled SQL Statements
-- Automatically Executed.
--saves time(Avoid writing the queries again and again)

select * from Student
create procedure proc_std
as 
	begin
		select * from Student where id=104;
	end

exec proc_std

--Input Parameters
create procedure inpproc_stdres(@result varchar(10))
as 
begin 
	select * from Student where result=@result
end

execute inpproc_stdres 'pass'
--another way
exec inpproc_stdres @result='fail'



--Output parameters
create procedure outproc_stdmark3(@max_mark3 int output)
as
begin
	select @max_mark3=max(mark3) from Student
end

--Declare
declare @results int
execute outproc_stdmark3 @results output
print @results
select * from Student

