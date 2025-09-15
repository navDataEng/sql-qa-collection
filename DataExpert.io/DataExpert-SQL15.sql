-- Question: Select Rows With Maximum Revenue
-- https://www.dataexpert.io/question/select-max-revenue-rows

-- Approach 1: Using CTE

WITH max_rev AS (
  SELECT id, MAX(rev) AS rev
  FROM playground.revenue
  GROUP BY id
)
SELECT r.id, m.rev, r.content
FROM playground.revenue r
JOIN max_rev m
ON r.id = m.id AND r.rev = m.rev
ORDER BY r.rev DESC;

-- Approach 2: Using Subquery with JOIN

SELECT r1.id, r2.rev, r1.content
FROM playground.revenue r1
JOIN (
  SELECT id, MAX(rev) AS rev
  FROM playground.revenue
  GROUP BY id
) r2
ON r1.id = r2.id AND r1.rev = r2.rev
ORDER BY r2.rev DESC;