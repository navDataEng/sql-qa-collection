-- Question: Calculating Median Searches per User
-- https://www.dataexpert.io/question/calculate-median-searches


WITH Cumulative AS (
  SELECT
    searches, num_users,
    -- Calculate the total users across all rows
    SUM(num_users) OVER () AS total_users,
    -- Calculate the running total of users
    SUM(num_users) OVER (ORDER BY searches ASC) AS cumulative_users,
    -- Calculate the running total for the "previous" row
    SUM(num_users) OVER (ORDER BY searches ASC ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING) AS prev_cumulative_users
  FROM
    playground.search_freq
)
SELECT
  CAST(AVG(searches) AS DOUBLE) AS median
FROM
  Cumulative
WHERE
  -- A searches value is part of the median if its user range crosses the halfway point.
  cumulative_users >= total_users / 2.0
  AND
  -- This condition handles both odd and even counts.
  prev_cumulative_users < (total_users + 1) / 2.0;

