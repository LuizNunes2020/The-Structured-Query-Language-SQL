# Lab 9: Modifying Tables and Columns with ALTER

## Check to make sure that your ‘items’ table from Lab 8 is available and full of data
SELECT * FROM items

## Change the name of the ‘items’ table to ‘demo’  
ALTER TABLE items
RENAME TO "demo"

## Change the name of the ‘itemcode’ column to ‘itemclass’ 
ALTER TABLE demo
RENAME COLUMN "itemcode" TO "itemclass"

## Add a new column ‘iteminfo’ to your ‘demo’ table  
ALTER TABLE demo
ADD COLUMN "iteminfo" VARCHAR(5) NULL

## Add some data to your new column, copying the values from the itemclass column
UPDATE demo
SET "iteminfo" = "itemclass";

## Take another look at your ALTERed table 
SELECT * FROM demo;