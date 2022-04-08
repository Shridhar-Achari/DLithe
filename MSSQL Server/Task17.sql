create database Institute
use Institute

--1. Constarints in SQL Server 
--Constraints Primarykey, unique key, foreign key, check, Default

--Create table with primary key, unique,check, default
create table Students
(
std_id int primary key identity(1,1),
std_name varchar(20) unique not null,
mark int check (mark>35),
course varchar(10) default 'MCA'
)

insert into Students values('Ramesh',71,'MCA')
select * from Students
--insert into Students values('ganesh',31,'MCA')
--Gives Message: The INSERT statement conflicted with the CHECK constraint "CK__Students__mark__3D5E1FD2". The conflict occurred in database "Institute", table "dbo.Students", column 'mark'.
insert into Students values('Ganesh',39,'MCA')
select * from Students

insert into Students values('Nikhil',91,'BCOM')
select * from Students

insert into Students(std_name,mark)values('Manish',66)
--prints course MCA default
select * from Students



--2. Identity
create table Orders
(
order_id int identity(1,1),
oname varchar(20),
qty int
)

insert into Orders values('Mobile',8)
select * from Orders
insert into Orders values('Wshing machine',2)
insert into Orders values('TV',4)
insert into Orders values('Grainder',3)
select * from Orders


insert into Orders values(5,'DSLR',2)
--not allowed
--Display message: An explicit value for the identity column in table 'Orders' can only be specified when a column list is used and IDENTITY_INSERT is ON.

set identity_insert Orders ON

insert into Orders(order_id,oname) values(5,'DSLR')
select * from orders

--Reset the identity column value
dbcc checkident(Orders,reseed,0);

set identity_insert Orders OFF

insert into Orders values('Iron box',3)
insert into Orders values('Heater',2)
insert into Orders values('Gas Stove',1)
select * from Orders

-- To know current seed
select ident_current('Orders')


--3. Explore the following
--a. String Functions
--ASCII-Returns the ASCII value for the specific character 

use Department
select * from Employee

select ascii(name) as ascii_code_of_1st_char from Employee;

--CHARINDEX
--Search for "p" in string "Employee", and return position:
select charindex('p','Employee') AS MatchPosition;

--CONCAT
--Add two strings together
select concat('Hello','World!') as StringConcated;

--LOWER
--Converts a string to lower-case
select lower('Hello World!') as StringLower;

--UPPER
--Converts a string to upper-case
select upper('Hello World!') as StringUpper;

--REVERSE
--Reverses a string and returns the result
select reverse('Hello World!') as StringReverse;

--Trim
--	Removes leading and trailing spaces (or other specified characters) from a string
select trim('     Helli World!     ') as TrimmedString;

--LTRIM
--Remove leading spaces from a string:
select ltrim('       Hello World!') as StringLtrim;






--b. Math Function
use DLithe_Bootcamp
Select * from Student
--MIN
--Returns the minimum value in a set of values
select min(mark1) as Minimum_Mark1 from Student;

--MAX
--Returns the minimum value in a set of values
select max(mark3) as Minimum_Mark3 from Student;

--COUNT
--Returns the number of records
select count(id) as total_students from Student

--AVG
--Returns the average value
select avg(mark1) as mark1_average from Student;

--SUM
--Calculates the sum
select * from item
select sum(quantity) as Tot_qty from item 

--POWER
--Returns the value of a number raised to the power of anoter number
select power(5,2);

--SQUARE
--Return the square of a number
select square(6);


--ABS
--Returns Absolute value of a number
select abs(-162.7) as absolute_num;


--c. DateTime Function
--CURRENT_TIMESTAMP
--Return the current date and time
select current_timestamp;

--GETDATE
--Returns the current database system date and time 
select getdate();

--SYSDATETIME
--Returns the date and time of the sql server
select sysdatetime() as System_Date_Time;

--DAY
--Returns the day of the month for a specific date
select day('2022/04/08') as Exact_Day;

--MONTH
--Returns the month
select month('2022/04/08') as Exact_Month;

--YEAR
--Returns year part of a date
select year('2022/04/08') as Exact_Year;


















