USE joins_data;

-- left anti join
-- select *
-- from a 
-- left join b
-- on a.key = b.key
-- where b.key is null

-- get all customers who have't placed any order
SELECT * FROM customers; 
SELECT * FROM orders; 

SELECT
c.customer_id,
c.customer_name
FROM customers AS c
LEFT JOIN orders AS od
ON c.customer_id = od.customer_id
WHERE od.customer_id IS NULL;


-- RIGHT ANTI JOIN
-- get all customers without matching customers

SELECT
c.customer_id,
c.customer_name,
od.order_id
FROM customers AS c
RIGHT JOIN orders AS od
ON c.customer_id = od.customer_id
WHERE c.customer_id IS NULL;


-- FULL ANTI JOIN
-- LEFT ANTI JOIN OR RIGHT ANTI JOIN


-- GET ALL customers along with their orders, but only for customers who have placed an order(without using inner joins)

SELECT
c.*
FROM customer AS c
LEFT JOIN orders AS od
ON c.customer_id = od.customer_id
WHERE od.customers IS NOT NULL;


-- cross join 
SELECT *
FROM customers 
CROSS JOIN orders; 






