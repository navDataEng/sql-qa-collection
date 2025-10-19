-- Question: Year-on-Year Growth Rate Calculation
-- https://www.dataexpert.io/question/year-on-year-growth-rate

-- DataLemur: https://datalemur.com/questions/yoy-growth-rate

-- Approach 01: This approach uses window functions to calculate the YoY growth rate.

WITH year_spend AS (
  SELECT
    EXTRACT(YEAR FROM transaction_date) AS year,
    product_id,
    SUM(spend) AS total_spend
  FROM
    user_transactions
  GROUP BY
    EXTRACT(YEAR FROM transaction_date),
    product_id
),
yoy_growth AS (
  SELECT
    year,
    product_id,
    total_spend AS current_year_spend,
    LAG(total_spend) OVER (PARTITION BY product_id ORDER BY year) AS previous_year_spend
  FROM
    year_spend
)
SELECT
  year,
  product_id,
  current_year_spend,
  previous_year_spend,
  ROUND(
    (current_year_spend - previous_year_spend) * 100 / previous_year_spend,
    2
  ) AS yoy_rate
FROM
  yoy_growth
ORDER BY
  product_id,
  year;

-- Approach 02: This approach uses a self-join.
-- It's a more traditional method that works on older database systems that may not support window functions like LAG().

-- Step 1: Create a CTE to aggregate the total spend for each product and year.
WITH yearly_spend AS (
    SELECT
        EXTRACT(YEAR FROM transaction_date) AS year,
        product_id,
        SUM(spend) AS total_spend
    FROM
        playground.dates
    GROUP BY
        year,
        product_id
)

-- Step 2: Join the CTE to itself to align current and previous year's data on the same row.
SELECT
    current_year.year,
    current_year.product_id,
    current_year.total_spend AS current_year_spend,
    -- If there's no match for the previous year, COALESCE will default the spend to 0.
    COALESCE(previous_year.total_spend, 0) AS previous_year_spend,
    -- Calculate the YoY rate, handling the case where previous year's spend is 0.
    CASE
        WHEN COALESCE(previous_year.total_spend, 0) = 0 THEN NULL
        ELSE ROUND(((current_year.total_spend - previous_year.total_spend) / previous_year.total_spend) * 100, 2)
    END AS yoy_rate
FROM
    yearly_spend AS current_year
-- LEFT JOIN ensures we keep all records from the current year, even if there's no data for the previous year.
LEFT JOIN
    yearly_spend AS previous_year
    -- The join condition matches the same product ID and links the current year to the immediate preceding year.
    ON current_year.product_id = previous_year.product_id
    AND current_year.year = previous_year.year + 1
ORDER BY
    current_year.product_id,
    current_year.year;
