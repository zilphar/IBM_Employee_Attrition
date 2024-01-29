-- working with the imb_employee_attrition dataset 

-- 1. structure of the table (includes the column names and the datatype contained in each)
DESCRIBE ibm_employee_attrition;

-- gives a sample of the table data 
SELECT *
FROM ibm_employee_attrition
LIMIT 5;

-- determining the total number of employees/ the rows in the table (returns 412)
SELECT COUNT(EmployeeNumber) AS total_no_of_employees
FROM ibm_employee_attrition;

-- The number of columns in the table (returns 34)
SELECT COUNT(*) no_of_columns
FROM information_schema.columns
WHERE Table_name = "ibm_employee_attrition";

-- 2. different types of data contained in the table 

-- the different types of Business travel and How frequent each is used by customers 
SELECT DISTINCT BusinessTravel, COUNT(EmployeeNumber) AS no_of_travels
FROM ibm_employee_attrition
GROUP BY BusinessTravel
ORDER BY no_of_travels DESC;

-- age of employees (all employees are 18 years and above)
SELECT COUNT(EmployeeNumber)
FROM ibm_employee_attrition
WHERE Age >= 18;

-- calculating average age of employees 
WITH AverageAgeCTE AS ( 
	SELECT Department, AVG(Age) AS average_age
    FROM ibm_employee_attrition
    GROUP BY Department
    ORDER BY average_age DESC
)
SELECT *
FROM AverageAgeCTE; 

-- Different departments and the number of employees in each (the research and development department has the most employees)
SELECT DISTINCT Department, COUNT(EmployeeNumber) AS no_of_employees
FROM ibm_employee_attrition
GROUP BY Department
ORDER BY no_of_employees DESC;

-- Education field of the employees
SELECT DISTINCT EducationField 
FROM ibm_employee_attrition; 

-- employees job roles
SELECT DISTINCT JobRole, COUNT(EmployeeNumber) AS no_of_employees
FROM ibm_employee_attrition
GROUP BY JobRole
ORDER BY no_of_employees DESC;

-- Employee gender returns (262 males, and 150 females)
SELECT Gender, COUNT(EmployeeNumber) AS no_of_employees
FROM ibm_employee_attrition
GROUP BY Gender
ORDER BY no_of_employees DESC;

-- Income of employees in dollars
SELECT MAX(MonthlyIncome) as Max_income, MIN(MonthlyIncome) AS Min_income, AVG(MonthlyIncome) AS Avg_income
FROM ibm_employee_attrition;

-- distance from home of employees (most employees live near the organization)
SELECT DISTINCT DistanceFromHome, COUNT(EmployeeNumber) AS no_of_employees 
FROM ibm_employee_attrition
GROUP BY DistanceFromHome
ORDER BY no_of_employees DESC;

-- 3. Employee attrition 

-- job satisfacion 
SELECT JobSatisfaction, COUNT(EmployeeNumber) AS no_of_employees
FROM ibm_employee_attrition
GROUP BY JobSatisfaction
ORDER BY no_of_employees DESC;

-- replacing the values in job satisfaction with the actual description (1 'Low', 2 'Medium', 3 'High', 4 'Very High')
SELECT 
	CASE JobSatisfaction
		 WHEN 1 THEN "low"
		 WHEN 2 THEN "Medium"
         WHEN 3 THEN "High"
         WHEN 4 THEN "Very High"
		 END AS Jobsatisfaction, 
		 COUNT(EmployeeNumber) AS no_of_employees
FROM ibm_employee_attrition
GROUP BY JobSatisfaction
ORDER BY no_of_employees DESC;

-- changing the data type in JobSatisfaction from number (int) to text (VARCHAR)
ALTER TABLE ibm_employee_attrition
MODIFY COLUMN JobSatisfaction text(25); 

-- employees that get overtime 
SELECT OverTime, COUNT(EmployeeNumber) AS no_of_employees
FROM ibm_employee_attrition
GROUP BY OverTime;

-- a larger number of employees in the research department receive/ do not recieve overtime
SELECT DISTINCT Department, COUNT(EmployeeNumber) AS no_of_employees
FROM ibm_employee_attrition
WHERE Overtime = "Yes"
GROUP BY Department;


SELECT DISTINCT Department, COUNT(EmployeeNumber) AS no_of_employees
FROM ibm_employee_attrition
WHERE OverTime = "No"
GROUP BY Department;

-- identifying employees with highest monthly income 
WITH HighIncomeCTE AS (
	SELECT EmployeeNumber, Age, Department, JobRole, MonthlyIncome
    FROM ibm_employee_attrition
    WHERE MonthlyIncome >= 8000)

SELECT *
FROM HighIncomeCTE;

-- OR one can use 
SELECT EmployeeNumber, Age, Department, JobRole, MonthlyIncome
FROM ibm_employee_attrition
WHERE MonthlyIncome >= 8000;


-- Identifying employees who have stayed longer at the company (Looked at the average stay of employees and then looked at the employees who have stayed a time longer than the average)
SELECT EmployeeNumber, Age, Department, Gender, JobRole, MonthlyIncome
FROM ibm_employee_attrition
WHERE YearsAtCompany >= (SELECT AVG(YearsAtCompany)
					     FROM  ibm_employee_attrition); 

-- Gender based analysis on Jobsatisfaction (average satisfaction ranges from 2.6 in males and 2.7 in females on a scale of 1 to 4)
SELECT Gender, Over18, ROUND(AVG(JobSatisfaction), 2) AS average_satisfaction
FROM ibm_employee_attrition
GROUP BY Gender, Over18
ORDER BY average_satisfaction;

-- performance rating 
SELECT DISTINCT PerformanceRating
FROM ibm_employee_attrition;


