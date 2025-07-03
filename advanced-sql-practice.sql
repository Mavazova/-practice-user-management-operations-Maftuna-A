-- Task1: Join query to get customer names and their orders
SELECT orders.id, customers.first_name, customers.last_name, orders.orders_date, orders.total_amount
FROM orders
INNER JOIN customers ON orders.customer_id = customers.id;

-- Task 2: Total spending per customer
SELECT  customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id

-- Task 3: Customers who spent more than $200
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders 
GROUP BY customer_id 
HAVING SUM(total_amount) > 200;

-- TASK 4: Orders above average total 
SELECT id, order_date, total_amount
FROM orders
WHERE total_amount >= (SELECT AVG(total_amount) FROM orders);

-- TASK 5: Orders from customers with last name "Smith"
SELECT id, order_date, total_amount, customer_id
FROM orders
WHERE customer_id IN (SELECT id FROM customers WHERE last_name = "Smith");