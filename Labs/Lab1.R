#Lab 1: SELECT Statements

## List all the products in the Northwinds database showing productid, productname, quantity per unit, unitprice, and unitsinstock.
SELECT Productid, Productname, QuantityPerUnit, UnitPrice, UnitsInstock FROM products

## For all employees at Northwinds, list the first name and last name concatenated together with a blank space in-between, and the YEAR when they were hired.  
SELECT CONCAT(FirstName," ", LastName) AS FullName, strftime('%Y', HireDate) AS HireYear FROM employees

## For all products in the Northwinds database, list the productname, unitprice, unitsinstock,  and the total value of the inventory of that product as “Total Value”.  (HINT:  total value = unitsinstock * unitprice.) 
SELECT ProductName, UnitPrice, UnitsInstock, (UnitsInstock * UnitPrice) AS "Total Value" FROM products

## For all employees at Northwinds, list the first name and last name concatenated together with a blank space in-between with a column header “Name”, and the name of the month (spelled out) for each employee’s birthday.  
SELECT CONCAT(FirstName," ", LastName) AS "Name",  strftime('%m', BirthDate) AS 'Birthday Month' FROM employees