create database projects;
use projects;

#DATA CLEANING

select * from hr;
# to change column name
Alter table hr
change column id emp_id varchar(20)NULL;
#to understand datatypes of each column
describe hr;

SET sql_safe_updates = 0;# To update column in table safely

#changing the datatype of birthdate column from string to date
#converting all dates to same format ----'''
UPDATE HR
SET birthdate = case 
WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
ELSE null
END;  

ALTER TABLE hr
MODIFY COLUMN birthdate DATE;

select birthdate from hr;

#similarly for hire_date
UPDATE HR
SET hire_date = case 
WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
ELSE null
END;  

ALTER TABLE hr
MODIFY COLUMN hire_date DATE;
 
select hire_date from hr;

#term_date 
UPDATE hr
SET termdate = if(termdate IS NOT NULL AND termdate!='',date(str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC')),'0000-00-00')
where True;

set sql_mode = 'ALLOW_INVALID_DATES';

alter table hr
modify column termdate DATE;

select termdate from hr; 
 
 #adding age column and determing age of each employee.
 
 ALTER TABLE hr ADD column age INT;
 UPDATE hr
 SET age = timestampdiff(YEAR,birthdate,CURDATE());
 
 SELECT birthdate,age FROM hr
 
 