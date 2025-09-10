-- Question: Average Number of Births by Day of the Week
-- https://www.dataexpert.io/question/average-births-per-day-of-week

-- Table: playground.us_birth_stats
-- +--------------+---------+

SELECT
  day_of_week,
  cast(AVG(births) as int) as average_births
From playground.us_birth_stats
GROUP BY day_of_week
ORDER BY day_of_week
