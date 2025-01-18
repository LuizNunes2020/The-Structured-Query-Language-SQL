# Lab 8: Creating TABLES

## Create an “items” table with the following schema: 
## items itemIDintegerprimary key, 
## itemcode, varchar(5)null,
## itemnamevarchar(40) not null default “ “,
## quantity integernot null default 0,
## price decimal (9,2)not null default 0

DROP TABLE IF EXISTS items;


CREATE TABLE items
(
  itemid        INT           PRIMARY KEY,
  itemcode    VARCHAR(5)          NULL,
  itemname    VARCHAR(40)     NOT NULL default “ “,
  quantity      INT           NOT NULL default 0,
  price       DECIMAL(9,2)    NOT NULL default 0
)


## Populate your new table with data from the Products table
## Consisting of productid, 
## concat(supplierid, categoryid,discontinued),
## productname, unitsinstock, unitprice

INSERT INTO items
(SELECT productid,
  concat(supplierid, categorid, discontinued) ,
  productname, unitsinstock, unitprice
  FROM products
);


## Verify that your table was created and populated successfully

SELECT * FROM items;
