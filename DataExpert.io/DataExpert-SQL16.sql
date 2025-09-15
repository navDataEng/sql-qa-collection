-- Question: Salary Range Difference
-- https://www.dataexpert.io/question/salary-range-difference

-- Approach 1: Using CTEs and Window Functions

WITH sal_agg AS (
  SELECT 
    id, name, salary,
    MAX(salary) OVER() AS max, 
    MIN(salary) OVER() AS min
  FROM playground.employees_salary
  GROUP BY id, name, salary
), max_sal_sum AS (
  SELECT SUM(salary) AS max_sum
  FROM sal_agg
  WHERE salary = max
), min_sal_sum AS (
  SELECT SUM(salary) AS min_sum
  FROM sal_agg
  WHERE salary = min
)
SELECT COALESCE(max_sum - min_sum, 0) AS difference
FROM max_sal_sum
JOIN min_sal_sum ON 1 = 1;

-- Approach 2: Using CTE with Conditional Aggregation

WITH sal_range AS (
  SELECT 
    salary,
    MAX(salary) OVER() AS max_sal,
    MIN(salary) OVER() AS min_sal
  FROM playground.employees_salary
)
SELECT COALESCE(
         SUM(CASE WHEN salary = max_sal THEN salary END), 0
       ) 
       - COALESCE(
         SUM(CASE WHEN salary = min_sal THEN salary END), 0
       ) AS difference
FROM sal_range;



