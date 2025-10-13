-- Question: Optimizing Stock of Prime and Non-Prime Items in a Warehouse
-- https://www.dataexpert.io/question/warehouse-item-optimization

-- DataLemur: https://datalemur.com/questions/prime-warehouse-storage


-- Approach 01:

WITH batch_details AS (
  SELECT
    -- Use conditional aggregation to get both batch footages in one pass.
    SUM(CASE WHEN item_type = 'prime_eligible' THEN square_footage ELSE 0 END) AS prime_footage,
    SUM(CASE WHEN item_type = 'not_prime' THEN square_footage ELSE 0 END) AS not_prime_footage,
    -- Also get the item counts per batch.
    SUM(CASE WHEN item_type = 'prime_eligible' THEN 1 ELSE 0 END) AS prime_item_count,
    SUM(CASE WHEN item_type = 'not_prime' THEN 1 ELSE 0 END) AS not_prime_item_count
  FROM inventory
)
-- Calculate and union the results for both item types.
SELECT
  'prime_eligible' AS item_type,
  (FLOOR(500000 / prime_footage) * prime_item_count) AS item_count
FROM batch_details

UNION ALL

SELECT
  'not_prime' AS item_type,
  -- The modulo operator (%) efficiently finds the remaining space.
  (FLOOR((500000 % prime_footage) / not_prime_footage) * not_prime_item_count) AS item_count
FROM batch_details

-- Order the final output as requested.
ORDER BY item_type DESC;


-- Approach 02:

WITH cte AS (
  SELECT
    item_type,
    SUM(square_footage) AS total_sf,
    COUNT(item_id) AS number_of_items
  FROM
    inventory
  GROUP BY
    item_type
)
SELECT
  item_type,
  FLOOR(500000 / total_sf) * number_of_items AS item_count
FROM
  cte
WHERE
  item_type = 'prime_eligible'

UNION ALL

SELECT
  item_type,
  FLOOR(
    (
      500000 - (
        (
          SELECT
            FLOOR(500000 / total_sf)
          FROM
            cte
          WHERE
            item_type = 'prime_eligible'
        ) * (
          SELECT
            total_sf
          FROM
            cte
          WHERE
            item_type = 'prime_eligible'
        )
      )
    ) / total_sf
  ) * number_of_items AS item_count
FROM
  cte
WHERE
  item_type = 'not_prime'
ORDER BY
  item_type DESC;
