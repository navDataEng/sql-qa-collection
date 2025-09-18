-- Question: Comparing State Fatal Collisions to the National Average
-- https://www.dataexpert.io/question/state-fatal-collisions

-- Approach 1:

WITH national_average AS (
  SELECT *, AVG(fatal_collisions_per_billion_miles) OVER() AS national_avg
  FROM playground.bad_drivers
)
SELECT state, fatal_collisions_per_billion_miles,
       CASE 
         WHEN fatal_collisions_per_billion_miles > national_avg THEN 'Above Average' 
         ELSE 'Below Average'
       END AS comparison_to_national_avg
FROM national_average
ORDER BY state;

-- Approach 2:

WITH national_average AS (
  SELECT AVG(fatal_collisions_per_billion_miles) AS national_avg
  FROM playground.bad_drivers
)
SELECT b.state, b.fatal_collisions_per_billion_miles,
       CASE 
         WHEN b.fatal_collisions_per_billion_miles > n.national_avg THEN 'Above Average' 
         ELSE 'Below Average'
       END AS comparison_to_national_avg
FROM national_average n
CROSS JOIN playground.bad_drivers b
ORDER BY state;
