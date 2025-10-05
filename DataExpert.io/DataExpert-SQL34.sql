-- Question: Identify Products Sold Exclusively in January 2024
-- https://www.dataexpert.io/question/products-exclusive-jan-sales

-- Approach 01: Using GROUP BY and HAVING to filter products
SELECT p.product_id, p.product_name
FROM playground.products p
JOIN playground.product_sales s 
  ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name
HAVING MIN(s.sale_date) >= DATE '2024-01-01'
   AND MAX(s.sale_date) <= DATE '2024-01-31';

-- Approach 02: Using COUNT with CASE to ensure all sales are within January 2024
SELECT p.product_id, p.product_name
FROM playground.products p
JOIN playground.product_sales s 
  ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name
HAVING COUNT(DISTINCT CASE 
                        WHEN s.sale_date < DATE '2024-01-01' 
                          OR s.sale_date > DATE '2024-01-31' 
                        THEN 1 END) = 0;

-- Approach 03: Using EXCEPT to find products sold only in January 2024
SELECT p.product_id, p.product_name
FROM playground.products p
WHERE p.product_id IN (
    SELECT product_id
    FROM playground.product_sales
    WHERE sale_date BETWEEN DATE '2024-01-01' AND DATE '2024-01-31'
    EXCEPT
    SELECT product_id
    FROM playground.product_sales
    WHERE sale_date < DATE '2024-01-01'
       OR sale_date > DATE '2024-01-31'
);

-- Approach 04: Using NOT EXISTS to filter products
SELECT DISTINCT p.product_id, p.product_name
FROM playground.products p
JOIN playground.product_sales s 
  ON p.product_id = s.product_id
WHERE s.sale_date BETWEEN DATE '2024-01-01' AND DATE '2024-01-31'
  AND NOT EXISTS (
      SELECT 1
      FROM playground.product_sales s2
      WHERE s2.product_id = p.product_id
        AND (s2.sale_date < DATE '2024-01-01' 
             OR s2.sale_date > DATE '2024-01-31')
  );

-- Approach 05: Using CTEs to flag products sold in and out of January 2024
WITH sales_flag AS (
  SELECT product_id,
         MAX(CASE WHEN sale_date BETWEEN DATE '2024-01-01' AND DATE '2024-01-31' THEN 1 ELSE 0 END) AS in_jan,
         MAX(CASE WHEN sale_date < DATE '2024-01-01' OR sale_date > DATE '2024-01-31' THEN 1 ELSE 0 END) AS outside_jan
  FROM playground.product_sales
  GROUP BY product_id
)
SELECT p.product_id, p.product_name
FROM playground.products p
JOIN sales_flag f ON p.product_id = f.product_id
WHERE f.in_jan = 1 AND f.outside_jan = 0;

-- Approach 06: Using window functions to determine min and max sale dates per product
SELECT DISTINCT p.product_id, p.product_name
FROM playground.products p
JOIN (
    SELECT product_id,
           MIN(sale_date) OVER (PARTITION BY product_id) AS min_date,
           MAX(sale_date) OVER (PARTITION BY product_id) AS max_date
    FROM playground.product_sales
) s ON p.product_id = s.product_id
WHERE s.min_date >= DATE '2024-01-01'
  AND s.max_date <= DATE '2024-01-31';

-- SQL Server Version: Joining tables and filtering by date range
SELECT p.product_id, p.product_name
FROM playground.products p
JOIN playground.product_sales s 
  ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name
HAVING MIN(s.sale_date) >= CAST('2024-01-01' AS DATE)
   AND MAX(s.sale_date) <= CAST('2024-01-31' AS DATE);
