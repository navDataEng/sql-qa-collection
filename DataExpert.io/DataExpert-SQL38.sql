-- Question: Most Frequently Purchased Sub-Category in Each Region
-- https://www.dataexpert.io/question/subcat-per-region

WITH sub_category AS (
  SELECT 
    region,
    sub_category,
    COUNT(*) AS purchase_count,
    ROW_NUMBER() OVER (PARTITION BY region ORDER BY COUNT(*) DESC) AS rn
  FROM playground.superstore
  GROUP BY region, sub_category
)
SELECT 
  region,
  sub_category,
  purchase_count
FROM sub_category
WHERE rn = 1
ORDER BY region;
