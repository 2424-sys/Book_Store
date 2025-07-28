create database book_store;

use book_store;

-- Find all books with a price greater than $50.

SELECT *
FROM books
WHERE price > 50;

-- Count how many books exist in each genre.

SELECT genre, COUNT(*) AS book_count
FROM books
GROUP BY genre;

-- What is the total revenue from all order items?

SELECT SUM(total_price) AS total_revenue
FROM order_items;

-- Find the top 5 orders with the highest total amount.

SELECT *
FROM orders
ORDER BY total_amount DESC
LIMIT 5;

--  How many books have been ordered in total? (sum of all quantities

SELECT SUM(quantity) AS total_books_ordered
FROM order_items;

-- List all customers who have placed at least one order

SELECT DISTINCT c.customer_id, c.name, c.email
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

-- . Which customer spent the most overall? Show name and total spent.

SELECT c.name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 1;

-- list all orders placed in the year 2025

SELECT *
FROM orders
WHERE order_date LIKE '2025-%';

-- List order items with the book title and quantity ordered

SELECT b.title, oi.quantity
FROM order_items oi
JOIN books b ON oi.book_id = b.book_id;

-- Find the most ordered book (by total quantity sold)

SELECT b.title, SUM(oi.quantity) AS total_quantity
FROM order_items oi
JOIN books b ON oi.book_id = b.book_id
GROUP BY b.title
ORDER BY total_quantity DESC
LIMIT 1;

-- Show the top 3 genres with the highest average book price

SELECT genre, AVG(price) AS average_price
FROM books
GROUP BY genre
ORDER BY average_price DESC
LIMIT 3;

--  Find the total number of books ordered per genre

SELECT b.genre, SUM(oi.quantity) AS total_quantity
FROM order_items oi
JOIN books b ON oi.book_id = b.book_id
GROUP BY b.genre
ORDER BY total_quantity DESC;

