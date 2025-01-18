# Lab2: Adding Conditions Using the WHERE Clause

## List the customerid, companyname, and country for all customers NOT in the U.S.A.
SELECT CustomerId, CompanyName, Country FROM customers
WHERE Country != "U.S.A"

## For all products in the Northwinds database, list the productname, unitprice, unitsinstock,  and the total value of the inventory of that product as “Total Value” for all products with a Total Value greater than $1000.  (HINT:  total value = unitsinstock * unitprice) 
SELECT ProductName, UnitPrice, UnitsInstock, (Unitsinstock * UnitPrice) as "Total Value" FROM productplots
WHERE (unitsinstock * unitprice) > 1000

## List the productid, productname, and quantityperunit for all products that come in bottles.   
SELECT ProductId, ProductName, QuantityPerUnit FROM products
WHERE quantityperunit LIKE '%bottle%'

## List the productid, productname, and unitprice for all products whose categoryid is an ODD number.   (HINT:  categoryid is a one digit integer less than 9 …) 
SELECT ProductId, ProductName, UnitPrice FROM products 
WHERE CategoryId %in% (1,3,5,7,9)

## List the orderid,  customerid, and shippeddate for orders that shipped to Canada  in December 1996 through the end of January 1997.
SELECT OrderId, CustomerId, ShippedDate FROM orders
WHERE shipcountry = 'Canada' AND shippeddate BETWEEN '1996-12-01' AND '1997-01-31'
