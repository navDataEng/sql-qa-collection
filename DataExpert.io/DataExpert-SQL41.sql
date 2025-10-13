-- Question: Check Second Sale Brand Preference Match
-- https://www.dataexpert.io/question/second-item-preferred-brand-match

-- Approach 01: Using CTE and Window Functions

WITH sold_preferred_brand AS (
  SELECT
    u.user_id,
    u.preferred_brand,
    i.item_brand,
    ROW_NUMBER() OVER (PARTITION BY u.user_id ORDER BY o.order_date) AS rn,
    COUNT(o.order_date) OVER (PARTITION BY u.user_id) AS sold_count
  FROM
    playground.users u
    LEFT JOIN playground.orders o ON u.user_id = o.seller_id
    LEFT JOIN playground.items i ON o.item_id = i.item_id
)
SELECT
  user_id AS seller_id,
  CASE
    WHEN preferred_brand = item_brand
    AND sold_count >= 2 THEN 'yes'
    ELSE 'no'
  END AS has_pref_brand
FROM
  sold_preferred_brand
WHERE
  sold_count < 2
UNION ALL
SELECT
  user_id,
  CASE
    WHEN preferred_brand = item_brand
    AND sold_count >= 2 THEN 'yes'
    ELSE 'no'
  END AS has_pref_brand
FROM
  sold_preferred_brand
WHERE
  rn = 2;

-- Approach 02:

-- Step 1: Create a CTE to rank all sales for each seller by date.
WITH ranked_sales AS (
  SELECT
    u.user_id,
    u.preferred_brand,
    i.item_brand,
    -- Use a window function to assign a rank to each sale for a given seller
    ROW_NUMBER() OVER (PARTITION BY u.user_id ORDER BY o.order_date) AS sale_rank
  FROM
    playground.users u
    JOIN playground.orders o ON u.user_id = o.seller_id
    JOIN playground.items i ON o.item_id = i.item_id
),
-- Step 2: Create a second CTE to isolate only the second sale (where rank = 2)
-- and check if the item brand matches the preferred brand.
second_sale_details AS (
  SELECT
    user_id,
    CASE WHEN preferred_brand = item_brand THEN 'yes' ELSE 'no' END AS pref_brand_on_second_sale
  FROM
    ranked_sales
  WHERE
    sale_rank = 2 -- Filter on the calculated rank here
)
-- Step 3: Select all users and LEFT JOIN them with the second sale details.
-- This ensures that every user is included, even those with 0 or 1 sale.
SELECT
  u.user_id AS seller_id,
  -- If a user has a record in the second_sale_details CTE, use that result.
  -- Otherwise (for users with < 2 sales), default the value to 'no'.
  COALESCE(s.pref_brand_on_second_sale,'no') AS has_pref_brand
FROM
  playground.users u
  LEFT JOIN second_sale_details s ON u.user_id = s.user_id
ORDER BY
  u.user_id;