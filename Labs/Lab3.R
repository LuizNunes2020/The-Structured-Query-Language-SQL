# Lab3: Date Functions and Nulls

## List the employeeid, firstname + lastname concatenated as ‘employee’, and the age of the employee  when they were hired.
SELECT EmployedId, CONCAT(FirstName," ", LastName) AS "Employee", AGE(hiredate, birthdate) AS "Hire Age" FROM employees

## Run a query to calculate your age as of today.  
SELECT AGE(CURRENT_DATE, '2004-01-20')

## List the employeeid, firstname + lastname concatenated as ‘employee’, and hire date for all employees hired in 1993  
SELECT EmployedId, CONTACT(FirstName, " ", LastName) AS "Employee", HireDate FROM employees
WHERE DATE_PART('year', HireDate) = 1993

