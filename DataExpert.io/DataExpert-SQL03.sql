-- Question: Total Number of Births Per Year
-- https://www.dataexpert.io/question/total-births-per-year

-- Table: playground.us_birth_stats
-- +----------------+---------+

SELECT year, SUM(births) AS total_births
FROM playground.us_birth_stats
GROUP BY year
ORDER BY year;