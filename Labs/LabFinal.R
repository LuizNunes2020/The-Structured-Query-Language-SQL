# Final Lab

## List  the names of the cities in alphabetical order where Classic Models has offices
SELECT DISTINCT FROM offices
WHERE Officecode IS NOT NULL
ORDER BY City 

## List the EmployeeNumber, LastName, FirstName, Extension for all employees working out of the Paris office. 
SELECT employeenumber, lastname, firstname, extension FROM employees E
INNER JOIN offices O ON E.officecode = O.officecode
WHERE city = "Paris"

## List the ProductCode, ProductName, ProductVendor, QuantityInStock and ProductLine for all products with a QuantityInStock between 200 and 1200. 
SELECT productcode, productname, productvendor, quantityinstock, productline FROM products
WHERE quantityinstock BETWEEN 200 AND 1200

## (Use a SUBQUERY) List the ProductCode, ProductName, ProductVendor, BuyPrice and MSRP for the least expensive (lowest MSRP) product sold by ClassicModels.  (“MSRP” is the Manufacturer’s Suggested Retail Price.)
SELECT productcode, productname, productvendor, buyprice, msrp FROM products
WHERE msrp = (SELECT MIN(msrp) FROM products)

## What is the ProductName and Profit of the product that has the highest profit (profit = MSRP minus BuyPrice).
SELECT productname, (msrp - buyprice) AS "Profit" FROM procucts
ORDER BY 2 DESC
LIMIT 1

## List the country and the number of customers from that country for all countries having just two  customers.  List the countries sorted in ascending alphabetical order. Title the column heading for the count of customers as “Customers”
SELECT DISTINCT country, COUNT(DISTINCT customername) AS "Customers" FROM customers
GROUP BY country
HAVING COUNT(DISTINCT customername) = 2
ORDER BY 1

## List the ProductCode, ProductName, and number of orders for the products with exactly 25 orders.  Title the column heading for the count of orders as “OrderCount”.
SELECT P.productcode, productname, COUNT(DISTINCT ordernumber) FROM products P
INNER JOIN orderdetails O ON P.productcode = D.productcode
GROUP BY P.productcode, productname
HAVING COUNT(DISTINCT ordernumber) = 25

## List the EmployeeNumber, Firstname + Lastname  (concatenated into one column in the answer set, separated by a blank and referred to as ‘name’) for all the employees reporting to Diane Murphy or Gerard Bondur
SELECT employeenumber, CONCAT (firstname, ' ', lastname) AS "Name" FROM employees
WHERE reportsto IN (
  SELECT employeenumber FROM employees
  WHERE (firstname = 'Diane' AND lastname = 'Murphy')
  OR
  firstname = 'Gerard' AND lastname = 'Bondur'
)


## List the EmployeeNumber, LastName, FirstName of the president of the company (the one employee with no boss.)
SELECT employeenumber, lastname, firstname FROM employees
WHERE reportsto IS NULL


## List the ProductName for all products in the “Classic Cars” product line from the 1950’s. 
SELECT productname FROM products
WHERE productine = 'Classic Cars' AND productname LIKE "195%"
ORDER BY productname

## List the month name and the total number of orders for the month in 2004 in which ClassicModels customers placed the most orders
SELECT TO_CHAR(orderdate, 'month'), COUNT(DISTINCT D.ordernumber) AS "Orders" FROM orders O
INNER JOIN orderdetails D ON O.ordernumber = D.ordernumber 
INNER JOIN products P ON D.productcode = P.productcode
WHERE DATE_PART('year', orderdate) = 2004
GROUP BY TO_CHAR(orderdate, 'month')
ORDER BY 2 DESC 
LIMIT 1

## List the firstname, lastname of employees who are Sales Reps who have no assigned customers. 
SELECT firstname, lastname FROM employees
LEFT OUTER JOIN customers ON salesrepemployeenumber = employeenumber
WHERE jobtitle = "Sales Rep" AND customername IS NULL

## List the customername of customers from Switzerland with no orders.
SELECT customername FROM customers C
LEFT OUTER JOIN orders O ON C.customernumber = O.customernumber
WHERE country = 'Switzerland' AND ordernumber IS NULL

## List the customername and total quantity of products ordered for customers who have ordered more than 1650 products across all their orders
SELECT customername, SUM(quantityordered) AS "Total Quantity" FROM customers C
INNER JOIN orders O ON C.customernumber = O.customernumber
INNER JOIN orderdetails D ON O.ordernumber = D.ordernumber
GROUP BY customername
HAVING SUM(quantityordered) > 1650

## Create a NEW table named “TopCustomers” with three columns: CustomerNumber (integer), ContactDate (DATE) and  OrderTotal (a real number.)  None of these columns can be NULL.  
CREATE TABLE "topcustomers"
(
  customernumber   INT    NOT NULL,
  contactdate      DATE   NOT NULL,
  ordertotal       REAL   NOT NULL,
  CONSTRAINT PKTopCustomers PRIMARY KEY (customernumber)
)

## Populate the new table “TopCustomers” with the CustomerNumber, today’s date, and the total value of all their orders (PriceEach * quantityOrdered) for those customers whose order total value is greater than $140,000.
INSERT INTO topcustomers
(SELECT C. customernumber, CURRENT_DATE, SUM(priceeach * quantityordered)::real FROM customers C, orders O, orderdetails D
  WHERE C.customernumber = O.customernumber AND O.ordernumber = D.ordernumber
  GROUP BY C.customernumber, CURRENT_DATE
  HAVING SUM(priceeach + quantityordered) > 140000
)

## List the contents of the TopCustomers table in descending OrderTotal sequence. 
SELECT * FROM topcustomers.
ORDER BY ordertotal DESC

## Add a new column to the TopCustomers table called OrderCount (integer)
ALTER TABLE topcustomers
ADD COLUMN ordercount INT

## Update the Top Customers table, setting the OrderCount to a random number between 1 and 10.  Hint:  use (RANDOM() *10)
UPDATE topcustomers
SET ordercount = RANDONM()*10

## List the contents of the TopCustomers table in descending OrderCount sequence. (10 rows)
SELECT * FROM topcustomers
ORDER BY 4 DESC

## Drop the TopCustomers table.
DROP TABLE topcustomers