-- Question: Summarizing Foreign Competitors by Country with Total Summary
-- https://www.dataexpert.io/question/foreign-competitors-summary

-- Approach 1:

WITH count_comp AS (
  SELECT country, COUNT(competitor) AS competitors
  FROM playground.foreign_competitors
  GROUP BY country
)
SELECT country, competitors
FROM count_comp
UNION
SELECT 'Total' AS country, SUM(competitors) AS competitors
FROM count_comp
ORDER BY competitors ASC, country ASC;

-- Approach 2:

SELECT country, COUNT(competitor) AS competitors
FROM playground.foreign_competitors
GROUP BY country
UNION ALL
SELECT 'Total:' AS country, COUNT(competitor) AS competitors
FROM playground.foreign_competitors
ORDER BY 
    CASE WHEN country = 'Total:' THEN 1 ELSE 0 END,
    competitors ASC,
    country ASC;
