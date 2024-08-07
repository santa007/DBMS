-- DML - CRUD

-- Insert a row with your name and all the other fields in students table
-- Create
USE `jedi_academy`;
INSERT INTO `students` (`id`, `first_name`, `last_name`, `email`)
values (10, "Shantanu", "Gupta", "shantanu@gmail.com");

-- set all the addresses to null 
-- UPDATE `students` set `address`=null;
-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.

-- set address to mars where id<5
update `students` 
set address = 'Mars' 
where id<5;

-- set address to jupiter and id ot 200 where id >5
update `students` 
set iq=200, address='Jupiter' 
where id>=5;

-- Delete - DML
-- Delete rows where Id = 10 or 11
Delete from `students` 
where id=10 or id=11; 
-- we can also use the IN keyword to delete multiple ids together 
Delete from `students` where id in(9, 12, 13, 14);

delete from `students` 
where first_name in ('Korg', 'Jane') 
and id in(1,2,3,4,5,6,7,8,9);
--   Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.

select 10*10; 
-- get all columns of all student
SELECT * from students;

-- get first and last names of all students 
SELECT `first_name`, `last_name` 
from students; 

-- Aliases 
SELECT s.`first_name` as 'First Name', s.`last_name` as 'Last Name'
from `students` s; 

-- Get all last names of students call this column : 'FAMILY_NAME'
SELECT s.`last_name` as 'FAMILY NAME' from `students` s ;

-- Get all unique last names 
SELECT distinct s.`last_name` as 'FAMILY NAME' from `students` s ;

-- Get all unique addresses 
select `address` from `students`;

-- Get all unique addresses where address is not null
select `address` from `students`
where `address` is not null; 

-- select all students where iq <150
select * from `students` where iq<150;

-- get all students whose iq>100 and <150
select * from students where iq between 100 and 150 ;

-- String matching 
-- Get all users named Tantia 
select * from `students` where `first_name`="Tantia";


-- Get all users named Tantia or Mycroft
Select * from students where first_name="Tantia" or first_name= "Mycroft";
select * from students where first_name in('Tantia','Mycroft');

-- Get all users who are not named Tantia or Mycroft
select * from students where first_name not in('Tantia','Mycroft');
select * from students where first_name not like 'Tantia' and first_name not like 'Mycorft';


-- Using the LIKE pattern matching clause 

-- wildcards
-- to use wildcards we need to use the like keyword
-- % - any number of characters
-- _ matches exactly one character

-- All users whose name starts with T
select * from students where first_name like 'T%';

-- get all students whose last name ends with Walker
select * from students where last_name like '%Walker';

-- get top 5 smartest students 
select * from students 
order by iq desc, first_name
limit 5;

-- get all students that do not have a batch id 
select * from students where batch_id is null;
