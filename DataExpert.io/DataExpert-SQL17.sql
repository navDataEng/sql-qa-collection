-- Question: Find Product Prices
-- https://www.dataexpert.io/question/find-product-prices

-- Approach 1:

WITH max_date AS (
  SELECT product_id, MAX(change_date) AS last_date
  FROM playground.product_prices
  WHERE change_date <= CAST('2023-08-17' AS DATE)
  GROUP BY product_id
)
SELECT p.product_id,
       COALESCE(c.new_price, 10) AS price
FROM (SELECT DISTINCT product_id FROM playground.product_prices) p
LEFT JOIN max_date m
  ON p.product_id = m.product_id
LEFT JOIN playground.product_prices c
  ON c.product_id = m.product_id AND c.change_date = m.last_date
ORDER BY p.product_id;

-- Approach 2:

WITH latest_change AS (
  SELECT product_id, new_price, change_date,
         ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS rn
  FROM playground.product_prices
  WHERE change_date <= CAST('2023-08-17' AS DATE)
)
SELECT p.product_id,
       COALESCE(l.new_price, 10) AS price
FROM (SELECT DISTINCT product_id FROM playground.product_prices) p
LEFT JOIN latest_change l 
  ON p.product_id = l.product_id AND l.rn = 1
ORDER BY p.product_id;

-- Approach 3:

SELECT p.product_id,
       COALESCE((
         SELECT top 1 new_price
         FROM playground.product_prices c
         WHERE c.product_id = p.product_id
           AND c.change_date <= CAST('2023-08-17' AS DATE)
         ORDER BY c.change_date DESC
         --LIMIT 1
       ), 10) AS price
FROM (SELECT DISTINCT product_id FROM playground.product_prices) p
ORDER BY p.product_id;
