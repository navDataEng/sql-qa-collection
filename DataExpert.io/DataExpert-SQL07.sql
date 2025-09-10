-- Question: Customers with More Than 20 Orders
-- https://www.dataexpert.io/question/loyal-customers

-- Table: playground.superstore
-- +----------------+---------+

SELECT 
    customer_id, 
    customer_name, 
    COUNT(order_id) AS order_count
FROM 
    playground.superstore
GROUP BY 
    customer_id, customer_name
HAVING 
    COUNT(order_id) > 20
ORDER BY 
    order_count DESC, 
    customer_name ASC


