# Lab 6: Inner JOINS

## List each order and its Total Value (unitprice * quantity) for all orders shipping into France in descending Total Value order.  
SELECT D.OrderId, SUM(UnitPrice * Quantity) AS "Total Value" FROM orderdetails D 
INNER JOIN orders O ON D.OrderId = O.OrderId
WHERE ShipCountry = 'France'
GROUP BY D.orderid
ORDER BY 2 DESC

## Create a Suppliers List showing Supplier CompanyName, and names of all the products sold by each supplier located in Japan.   
SELECT CompanyName, ProductName FROM products P 
INNER JOIN Suppliers S ON P.supplierid = S.supplierid
WHERE Country = 'Japan'

## Create a “Low Performers” list showing the employees who have less than $100,000 in total sales.  List the employee’s LastName, FirstName followed by their total sales volume (the total dollar value of their orders.)    

SELECT LastName, FirstName, TO CHAR(SUM(UnitPrice * Quantity), '999,999.99') AS "Total Sales" FROM employees E 
INNER JOIN orders O ON E.employeeid = O.employeeid
INNER JOIN orderdetails D ON O.orderid = D.orderid
GROUP BY LastName, FirstName
HAVING SUM(UnitPrice * Quantity) < 100000
ORDER BY 3