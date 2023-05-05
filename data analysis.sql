# DATA Analysis

-- 1. what is the gender breakdown of employees in the company?
SELECT gender, count(*) AS COUNT
FROM hr
WHERE age >=18 AND termdate= '0000-00-00'
GROUP BY gender;

-- 2. What is the race/ethnicity breakdown of employees in the commpany?
SELECT race,COUNT(*) AS count
FROM hr
WHERE age >= 18 AND termdate = '0000-00-00'
Group BY race 
ORDER BY count(*) DESC;

-- 3. What is the age distribution of employees in the company?
SELECT
min(age) as youngest,
max(age) as oldest
FROM hr
WHERE age >= 18 AND termdate = '0000-00-00';

SELECT 
CASE
    WHEN age>=18 AND age<=24 THEN '18-24'
    WHEN age>=25 AND age<=34 THEN '25-34'
    WHEN age>=35 AND age<=44 THEN '35-44'
    WHEN age>=45 AND age<=54 THEN '45-54'
    ELSE '55+'
END as age_group
from hr 
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY age_group
ORDER BY age_group;
    
 -- 4. How many employees work at headquarters versus remote locations?
 SELECT location , count(*) AS count
 FROM hr
 WHERE age >= 18 AND termdate = '0000-00-00'
 GROUP BY location;
 
 -- 5.What is the average length of employement for employees who have been terminated?
 SELECT  
    avg(datediff(termdate,hire_date))/365 as avg_years_employement
from hr
WHERE termdate <= curdate() AND age >= 18 AND termdate = '0000-00-00';

-- 6.How does the gender distribution vary across departments and job titles?
SELECT department ,gender,count(*) AS count
from hr
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY department ,gender
order by department;
      
  
    
