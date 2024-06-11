Question 1
select employee_name ,max(salary) from employees group by department_id;
+---------------+-------------+
| employee_name | max(salary) |
+---------------+-------------+
| John Doe | 100000 |
| Alice Brown | 120000 |
| Chaly Black | 80000 |
+---------------+-------------+
Question 2
SELECT product_id, sales_date, sales_amount, AVG(sales_amount) OVER ( PARTITION BY 
product_id ORDER BY sales_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW ) AS 
moving_average FROM sales where sales_date BETWEEN '2023-06-01' AND '2023-06-04' ORDER BY 
product_id, sales_date;
+------------+------------+--------------+---------------------+
| product_id | sales_date | sales_amount | moving_average|
+------------+------------+--------------+---------------------+
| 1 | 2023-06-01 | 100 | 100.0000 |
| 1 | 2023-06-02 | 150 | 125.0000 |
| 1 | 2023-06-03 | 200 | 150.0000 |
| 1 | 2023-06-04 | 250 | 175.0000 |
| 2 | 2023-06-01 | 300 | 300.0000 |
| 2 | 2023-06-02 | 350 | 325.0000 |
| 2 | 2023-06-03 | 400 | 350.0000 |
| 2 | 2023-06-04 | 450 | 375.0000 |
+------------+------------+--------------+---------------------+
Question 3
SELECT c.customer_name FROM customer c JOIN purchases p ON c.customer_id = p.customer_id 
GROUP BY c.customer_id, c.customer_name HAVING COUNT(DISTINCT p.category_id) = (SELECT 
COUNT(*) FROM categories);
+---------------+
| customer_name |
+---------------+
| Alice |
Question 4
select product_name from product group by product_name having count(distinct(price))>1 ;
+--------------+
| product_name |
+--------------+
| laptop |
| Tablet |
Question 5
SELECT salary FROM employees ORDER BY salary DESC LIMIT 1 OFFSET 1;
+--------+
| salary |
+--------+
| 110000 |
Question 6
SELECT c.customer_id, c.customer_name, COALESCE(SUM(s.price), 0) AS total_sales FROM 
customer c LEFT JOIN sale s ON c.customer_id = s.customer_id GROUP BY c.customer_id, 
c.customer_name ORDER BY c.customer_id;
+-------------+---------------+-------------+
| customer_id | customer_name | total_sales |
+-------------+---------------+-------------+
| 1 | Alice | 800 |
| 2 | Bob | 300 |
| 3 | Chaly | 0 |
Question 7
SELECT d.department_name, AVG(e.salary) AS average_salary FROM employees e JOIN 
department d ON e.department_id = d.department_id GROUP BY e.department_id, 
d.department_name HAVING COUNT(e.employee_id) > 5;
+-----------------+----------------+
| department_name | average_salary |
+-----------------+----------------+
| HR | 96666.6667 |
Question 8
select employee_name from employee where manager_id is null;
+---------------+
| employee_name |
+---------------+
| John Doe |
| Charlie black |
Question 9
UPDATE orders SET order_date = '2023-07-23' WHERE order_id = 2045; COMMIT;