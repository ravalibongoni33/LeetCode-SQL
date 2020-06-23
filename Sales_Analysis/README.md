# Sales Analysis I

## Description

Table: Product

+--------------+---------+<br/>
| Column Name  | Type    |<br/>
+--------------+---------+<br/>
| product_id   | int     |<br/>
| product_name | varchar |<br/>
| unit_price   | int     |<br/>
+--------------+---------+<br/>

product_id is the primary key of this table.

Table: Sales

+-------------+---------+<br/>
| Column Name | Type    |<br/>
+-------------+---------+<br/>
| seller_id   | int     |<br/>
| product_id  | int     |<br/>
| buyer_id    | int     |<br/>
| sale_date   | date    |<br/>
| quantity    | int     |<br/>
| price       | int     |<br/>
+------ ------+---------+<br/>

This table has no primary key, it can have repeated rows.
product_id is a foreign key to Product table.

Write an SQL query that reports the best seller by total sales price, If there is a tie, report them all.

The query result format is in the following example:

Product table:

+------------+--------------+------------+<br/>
| product_id | product_name | unit_price |<br/>
+------------+--------------+------------+<br/>
| 1          | S8           | 1000       |<br/>
| 2          | G4           | 800        |<br/>
| 3          | iPhone       | 1400       |<br/>
+------------+--------------+------------+<br/>

Sales table:

+-----------+------------+----------+------------+----------+-------+<br/>
| seller_id | product_id | buyer_id | sale_date  | quantity | price |<br/>
+-----------+------------+----------+------------+----------+-------+<br/>
| 1         | 1          | 1        | 2019-01-21 | 2        | 2000  |<br/>
| 1         | 2          | 2        | 2019-02-17 | 1        | 800   |<br/>
| 2         | 2          | 3        | 2019-06-02 | 1        | 800   |<br/>
| 3         | 3          | 4        | 2019-05-13 | 2        | 2800  |<br/>
+-----------+------------+----------+------------+----------+-------+<br/>


Result table:

+-------------+<br/>
| seller_id   |<br/>
+-------------+<br/>
| 1           |<br/>
| 3           |<br/>
+-------------+<br/>
Both sellers with id 1 and 3 sold products with the most total price of 2800.

[Click here to review the tables in right format](https://https://leetcode.com/problems/sales-analysis-i/)

## Psuedo code (My Approach)

1. Get the total price of each seller <br/>
SELECT SUM(PRICE)
    FROM Sales
    GROUP BY seller_id
2. Get the top seller by ordering in desc <br/>
ORDER BY price DESC
LIMIT 1
3. select the seller with high total price <br/>
SELECT seller_id
FROM Sales
GROUP BY seller_id
HAVING SUM(price) = (SELECT SUM(price)
					 FROM Sales
                     GROUP BY seller_id
                     ORDER BY price DESC
                     LIMIT 1 )
