-- Question: Identify Products Sold Exclusively in January 2024
-- https://www.dataexpert.io/question/products-exclusive-jan-sales

SELECT 
    p.product_id AS product_id,
    p.product_name AS product_name
FROM playground.products p
JOIN playground.product_sales s 
    ON s.product_id = p.product_id
   AND s.sale_date BETWEEN DATE '2024-01-01' AND DATE '2024-01-31'
LIMIT 1;


-- SQL Server Version: Joining tables and filtering by date range

SELECT 
    p.product_id AS product_id,
    p.product_name AS product_name
FROM playground.products p
JOIN playground.product_sales s 
    ON s.product_id = p.product_id
   AND s.sale_date BETWEEN CAST('2024-01-01' as DATE) AND CAST('2024-01-31' AS DATE)
--LIMIT 1;
