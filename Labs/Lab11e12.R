# Lab 11 e 12: Using a VIEW and The CASE Statement

## Create a "TopCustomers" view  using the following SELECT statement to populate the view. 
DROP TABLE TopCostumers IF exists
CREATE VIEW TopCostumers AS
  SELECT companyname, sum(unitprice * quantity) as "Total Sales" FROM customers C
  INNER JOIN orders O ONC.customerid = O.customerid 
  INNER JOIN orderdetails D ON O.orderid = D.orderid
  GROUP BY companyname
  ORDER BY 2 DESC LIMIT 5

## Run a Query Against Your View to ensure that it works
SELECT * FROM TopCostumers

## Let’s drop and recreate your view from Lab 11, adding a CASE expression.  Add a third column to your view called “Assessment”.
DROP TABLE TopCostumers IF EXISTS

CREATE VIEW TopCostumers AS
  SELECT companyname, 
  CASE 
    WHEN SUM(unitprice * quantity) < 60000 THEN 'NeedsFocus'
    WHEN SUM(unitprice * quantity) < 110000 THEN 'Average'
    ELSE 'Outstanding'
  END "Assessment"
  FROM customers C
  INNER JOIN orders O ONC.customerid = O.customerid 
  INNER JOIN orderdetails D ON O.orderid = D.orderid
  GROUP BY companyname
  ORDER BY 2 DESC LIMIT 5
  
  
  ## Run a Query Against Your View to see the CASE results
  SELECT * FROM TopCostumers
  