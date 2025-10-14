-- Question: Find Top 3 Commonly Bought Product Pairs
-- https://www.dataexpert.io/question/commonly-bought-product-pairs


-- Approach 01: Self-join the transactions table to find product pairs

SELECT
  t1.product_name AS product1,
  t2.product_name AS product2,
  COUNT(*) AS freq
FROM
  playground.product_transactions t1
JOIN
  playground.product_transactions t2 ON t1.transaction_id = t2.transaction_id
  AND t1.product_name < t2.product_name -- Avoid self-joins and duplicate pairs
GROUP BY
  t1.product_name,
  t2.product_name
ORDER BY
  freq DESC,
  product1,
  product2
LIMIT 3;

-- Approach 02: Using CTE to assign row numbers and then self-join

WITH unique_pair AS (
  SELECT
    *,
    ROW_NUMBER() OVER (PARTITION BY transaction_id ORDER BY product_name) AS rn
  FROM
    playground.product_transactions
)
SELECT
  t1.product_name AS product1,
  t2.product_name AS product2,
  COUNT(*) AS freq
FROM
  unique_pair t1
JOIN
  unique_pair t2
    ON t1.transaction_id = t2.transaction_id
    --AND t1.product_name < t2.product_name
WHERE
  t1.rn < t2.rn -- Avoid self-joins and duplicate pairs
GROUP BY
  t1.product_name,
  t2.product_name
ORDER BY
  freq DESC,
  product1,
  product2
LIMIT 3;