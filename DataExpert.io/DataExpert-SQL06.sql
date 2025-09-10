-- Question: Month with the Highest Total Births
-- https://www.dataexpert.io/question/highest-birth-month

-- Table: playground.us_birth_stats
-- +----------------+-------------+

-- Approach 1:
SELECT 
    month, 
    SUM(births) AS total_births
FROM playground.us_birth_stats
GROUP BY month
ORDER BY total_births DESC
LIMIT 1;

SELECT 
    TOP 1 month, 
    SUM(births) AS total_births
FROM playground.us_birth_stats
GROUP BY month
ORDER BY total_births DESC;

-- Approach 2:
WITH sum_of_births AS (
    SELECT 
        month,
        SUM(births) AS total_births,
        ROW_NUMBER() OVER(ORDER BY SUM(births) DESC) AS rn
    FROM playground.us_birth_stats
    GROUP BY month
)
SELECT month, total_births
FROM sum_of_births
WHERE rn = 1;
