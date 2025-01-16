# Lab4: Using the GROUP BY

## List the total (unitprice * quantity) as “Total Value” by orderid for the top 5 orders.  (That is, the five orders with the highest Total Value.)  
SELECT (UnitPrice * Quantity) AS "Total Value", OrderId from orderdetails
GROUP BY OrderId 
ORDER BY OrderId DESC 
LIMIT 5

## How many products does Northwinds have in inventory?  
SELECT COUNT(ProductId) FROM orderdetails
WHERE UnitsStock > 0

## How many products are out of stock? 
SELECT COUNT(ProductId) FROM orderdetails
WHERE UnitsStock = 0

## From which supplier(s) does Northwinds carry the fewest products? 
SELECT SupplierId, COUNT(DISTINCT ProductId) FROM products
GROUP BY SupplierId 
ORDER BY 2

## Which Northwinds employees (just show their employeeid) had over 100 orders ? 
SELECT EmployeeId, COUNT(OrderId) AS "Orders" from order
GROUP BY EmployeeId
HAVING COUNT(OrderId) > 100
ORDER BY 2 DESC