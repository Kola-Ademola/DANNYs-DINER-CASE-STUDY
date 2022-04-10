-- QUERY 1 SOLUTION

SELECT sales.customer_id,
	   SUM(menu.price) AS total_amount_spent
FROM dannys_diner.sales
JOIN dannys_diner.menu USING(product_id)
GROUP BY sales.customer_id
ORDER BY total_amount_spent DESC;

-- From the above we can clearly see that Customer A is the highest spending customer

-- QUERY 2 SOLUTION

SELECT customer_id,
	   COUNT(DISTINCT order_date) AS days_visited
FROM dannys_diner.sales
GROUP BY customer_id
ORDER BY days_visited DESC;

-- From the above we can clearly see that Customer B has visited more days

-- QUERY 3 SOLUTION

SELECT customer_id,
		MIN(order_date) AS first_order,
                product_id
FROM sales
GROUP BY customer_id;

-- From the result Customer A, B & C first purchased item 1, 2 & 3 respectively

-- QUERY 4 SOLUTION

SELECT customer_id,
		product_id,
                COUNT(product_id) AS prod_count
FROM sales
GROUP BY customer_id, product_id
ORDER BY product_id DESC;

-- From the result its clear that item 3 is the most purchased of all items

-- QUERY 5 SOLUTION

WITH prod_count_cte AS (
	SELECT customer_id,
		product_id,
                COUNT(product_id) AS prod_count
	FROM sales
	GROUP BY customer_id, product_id)
SELECT customer_id,
		product_id,
                MAX(prod_count) AS popular_product
FROM prod_count_cte
GROUP BY customer_id
ORDER BY popular_product;


-- QUERY 6 SOLUTION
SELECT s.customer_id,
		 s.order_date,
                 s.product_id
FROM sales s
JOIN members m USING(customer_id)
WHERE s.order_date IN(
	SELECT order_date
        FROM sales 
        WHERE order_date >= join_date
)
GROUP BY customer_id;

-- From the result we can see that customer A & B bought product 2 & 1 respectively after becoming members

-- QUERY 7 SOLUTION

SELECT s.customer_id,
		 s.order_date,
                 s.product_id
FROM sales s
JOIN members m USING(customer_id)
WHERE s.order_date IN(
	SELECT order_date
        FROM sales 
        WHERE order_date < join_date
)
GROUP BY customer_id;

-- From the result we can see that customer A & B bought product 1 & 2 just before becoming members

-- QUERY 8 SOLUTION

SELECT s.customer_id,
		 s.order_date,
                 s.product_id,
                 COUNT(s.product_id) AS prod_count,
                 SUM(mm.price) AS amount_spent
FROM sales s
JOIN members m USING(customer_id)
JOIN menu mm USING(product_id)
WHERE s.order_date IN(
	SELECT order_date
        FROM sales 
        WHERE order_date < join_date
)
GROUP BY customer_id;

-- From the result Customer A bought 2 items spending $25 whille Customer B bought 3 items spending $45

-- QUERY 9 SOLUTION

SELECT s.customer_id,
		s.product_id,
                SUM(CASE(s.product_id)
			WHEN 1 THEN m.price * 20
                        ELSE m.price * 10
                        END) AS customer_point
FROM sales s
JOIN menu m USING(product_id)
GROUP BY s.customer_id
ORDER BY customer_point DESC;

-- From the result Customer B is clearly the one with the highest point

-- QUERY 10 SOLUTION

SELECT s.customer_id,
		s.product_id,
                SUM(m.price * 20) AS customer_point
FROM sales s
JOIN menu m USING(product_id)
JOIN members mm USING(customer_id)
WHERE order_date BETWEEN mm.join_date AND '2021-02-01'
GROUP BY s.customer_id
ORDER BY customer_point DESC;

-- Customer A has the highest point in this case

-- BONUS QUERY 1 SOLUTION

SELECT s.customer_id,
		s.order_date,
                m.product_name,
                m.price,
		IF (s.order_date >= mm.join_date, 'Y', 'N') AS member_status
FROM sales s
JOIN menu m USING(product_id)
LEFT JOIN members mm USING(customer_id);

-- BONUS QUERY 2 SOLUTION

WITH member_cte AS(
	SELECT s.customer_id,
			s.order_date,
			m.product_name,
			m.price,
			IF(s.order_date >= mm.join_date, 'Y', 'N') AS member_status
FROM sales s
JOIN menu m USING(product_id)
LEFT JOIN members mm USING(customer_id))

SELECT *,
		CASE
			WHEN member_status = 'N' THEN NULL
                        ELSE DENSE_RANK() OVER(PARTITION BY customer_id, member_status ORDER BY order_date)
                        END AS ranking
FROM member_cte