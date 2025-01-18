# Lab 5: Practice Using Subqueries

## List the productid, productname, unitprice of the lowest priced product Northwinds sells. 
SELECT ProductId, ProductName, UnitPrice FROM products
WHERE UnitPrice = (
  SELECT MIN(UnitPrice) FROM products
)

## How many orders in the orders table have a bad customerID (either missing or not on file in the customers table.) 
SELECT COUNT(OrderId), CustomerId FROM ordersdetails
WHERE CustomerId NOT IN (
  SELECT CustomerId FROM customers 
)

## Use a subquery in a SELECT to list something interesting.  
SELECT firstname,
SELECT(COUNT(orderid)
       FROM orders O
       WHERE E.employeeid = O.employeeid
)
FROM employees E

## Use a subquery in a FROM to list something interesting. 
SELECT productid
FROM (SELECT productid, SUM(unitprice * quantity)
      FROM orderdetails
      GROUP BY productid
      ORDER BY 2 DESC LIMIT 5
) A