use DLithe_Bootcamp

--1. Triggers
--2 types
--DML Trigger
--DDL Trigger

create table TriggerT1
(
id int primary key,
item_name varchar(20),
price int
)
insert into TriggerT1 values(101,'TV',55000)
insert into TriggerT1 values(102,'Mobile',18000)
insert into TriggerT1 values(103,'Washing machine',25000)
select * from TriggerT1

--DML Trigger(Insert, Update, Delete)
--insert
create trigger Trig_insert
on TriggerT1
for insert
as begin 
print('You cannot insert into TriggerT1 table')
rollback Transaction
end

insert into TriggerT1 values(104,'Refregerator',65000)
--Executes the query
--Display Error message:
--You cannot insert into TriggerT1 table
--Msg 3609, Level 16, State 1, Line 29
--The transaction ended in the trigger. The batch has been aborted.
select * from TriggerT1

--Update
create trigger Trig_update
on TriggerT1
for update
as begin 
print('You cannot update TriggerT1 table')
rollback Transaction
end

update TriggerT1 set item_name='A/C', price=35000 where id=102

--Output:
--You cannot update TriggerT1 table
--Msg 3609, Level 16, State 1, Line 45
--The transaction ended in the trigger. The batch has been aborted.
select * from TriggerT1

--Delete
create trigger Trig_Delete
on TriggerT1
for delete
as begin 
print('You cannot Delete TriggerT1 table')
rollback Transaction
end

Delete from TriggerT1 where item_name='TV'
--Output
--You cannot Delete TriggerT1 table
--Msg 3609, Level 16, State 1, Line 61
--The transaction ended in the trigger. The batch has been aborted.

drop trigger Trig_insert
insert into TriggerT1 values(104,'Refregerator',65000)
--Now its inserting after dropping Trig_insert
select * from TriggerT1

drop trigger Trig_update
update TriggerT1 set item_name='A/C', price=35000 where id=102
--Update successful
select * from TriggerT1

drop trigger Trig_delete
Delete from TriggerT1 where item_name='TV'
--Delete successful
select * from TriggerT1



--For DML
--Creating trigger for insert,update,delete on TriggerT1 table
create trigger TriggerFor_DML
on TriggerT1
for insert,update,delete
as
BEGIN
    print 'You cannot perform dml operations on TriggerT1 table'
    ROLLBACK TRANSACTION
END

insert into TriggerT1 values(105,'Grainder',12000)
--Output:
--You cannot perform dml operations on TriggerT1 table
--Msg 3609, Level 16, State 1, Line 90
--The transaction ended in the trigger. The batch has been aborted.
select * from TriggerT1


update TriggerT1 set item_name='Fan', price=5000 where id=102
--Output:
--You cannot perform dml operations on TriggerT1 table
--Msg 3609, Level 16, State 1, Line 104
--The transaction ended in the trigger. The batch has been aborted.
select * from TriggerT1


Delete from TriggerT1 where item_name='Washing Machine'
--Output:
--You cannot perform dml operations on TriggerT1 table
--Msg 3609, Level 16, State 1, Line 111
--The transaction ended in the trigger. The batch has been aborted.
select * from TriggerT1

drop trigger TriggerFor_DML


--Inserted and Deleted Tables
--Inserted
create trigger Trig_inserted_T
on TriggerT1
for insert
as
	begin
		select * from inserted
	end

select * from TriggerT1
--Try to insert
insert into TriggerT1 values(105,'Grainder',12000)
--directly shows the inserted content instead of showing 1 row effected
select * from TriggerT1



--Deleted
create trigger Trig_deleted_T
on TriggerT1
for delete
as
	begin
		select * from deleted
	end

select * from TriggerT1

--Try to Delete
Delete from TriggerT1 where item_name='Washing Machine'
--directly shows the deleted content instead of showing 1 row effected
select * from TriggerT1


create table dropping(
id int,
t_name varchar(20)
)


--DDL Triggers
--for creating, altering, dropping
--Work on specific database
--2types
--database scope
--server scope

--Restrict the creation of the table.
create trigger tg_res_create_table 
on database
for create_table
as 
	begin
		print'You cannot create table in this database'
		rollback Transaction
	end

--Output:
--You cannot create table in this database
--Msg 3609, Level 16, State 2, Line 177
--The transaction ended in the trigger. The batch has been aborted.

create table task20_ddl
(
id int
)
select * from task20_ddl


--Restrict the altering of the table.

create trigger tg_res_alter_table 
on database
for alter_table
as 
	begin
		print'You cannot alter the table in this database'
		rollback Transaction
	end

alter table Student add place varchar(20)

--Output:
--You cannot alter the table in this database
--Msg 3609, Level 16, State 2, Line 201
--The transaction ended in the trigger. The batch has been aborted.
select * from Student






--Restrict the dropping of the table.
create trigger tg_res_drop_table 
on database
for drop_table
as 
	begin
		print'You cannot drop the table in this database'
		rollback Transaction
	end

drop table dropping
--Output:
--You cannot drop the table in this database
--Msg 3609, Level 16, State 2, Line 227
--The transaction ended in the trigger. The batch has been aborted.



--Diasble restricted trigger
--create
Disable trigger tg_res_create_table 
on database
create table task20_ddl
(
id int
)
--Successfully created and trigger diasbled
select * from task20_ddl

--Alter
Disable trigger tg_res_alter_table 
on database
alter table task20_ddl add place varchar(20)
--Table altered
select * from task20_ddl

--Delete
Disable trigger tg_res_drop_table 
on database
drop table task20_ddl
drop table dropping
select * from task20_ddl
select * from dropping

--Restrict Rename
create trigger tg_res_rename_table
on database
for rename
as
    begin
        print 'cannot rename the table in the database'
        rollback transaction
    end

select * from TriggerT1
sp_rename 'TriggerT1','TrigT'

--alter
alter trigger tg_res_rename_table
on database
for rename
as
    begin
        print 'An object has been renamed in the table in this database'
        rollback transaction
    end
select * from TriggerT1
sp_rename 'TriggerT1','TrigT'
Disable trigger tg_res_rename_table on database

select * from TrigT

create trigger tg_server_ddl
on all server
for create_table,alter_table, drop_table
as 
begin 
	print 'cannot perform dll in this server'
	rollback Transaction
End
create table server_ddl(id int)

--For/Alter[Instead of Trigger]
create trigger trg_insteadof
on TrigT
instead of insert
as 
select item_name from TrigT









--2. Transactions
--Transaction modes
--1. Auto Commit
--2. Explicit Transaction
--3. Implicit Transaction

--Commit
select * from Student
begin Transaction
	insert into student values(108,'Ranjith',87,97,89,'pass','mca')
	update Student set course='mba' where id=103;
commit Transaction
--commit changes
select * from Student

--RollBack
begin Transaction
	insert into Student values(109,'Sharan',90,97,99,'pass','bca')
	update Student set sname='Sharath' where id=105;
rollback Transaction
--undo changes
select * from Student

--Save point
begin Transaction
	insert into Student values(109,'Sharan',90,97,99,'pass','bca')
	save Transaction insert_Student
	--save point
	update Student set sname='Sharath' where id=105;
	rollback Transaction insert_Student
commit Transaction
--commit
select * from Student



--Implicit Transaction
--predefined global variable
--already created by SQL Server
--@@ global variable
set implicit_transactions on
select iif(@@options & 2=2,'implicit_transactions Mode ON','implicit_transactions Mode OFF') as Transaction_Mode






--3. Temporary Tables
--# for local access
--## for global access

--Select into

select * from Student
select id,sname,result,course into #Student_Details from Student
Select * from #Student_Details

--Create new table and using insert into select
create table #New_Student
(
id int,
sname varchar(20),
result varchar(6),
)

insert into #New_Student select id,sname,result from Student
select *from #New_Student