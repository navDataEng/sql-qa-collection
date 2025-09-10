-- Cars with Above Average Engine Size
-- https://www.dataexpert.io/question/cars-above-average-engine-size

-- Table: playground.automobile
-- +----------------+---------+

-- Approach 1: Using Subquery
SELECT 
    brand_name,
    fuel_type,
    engine_size
FROM playground.automobile
WHERE engine_size > 
        (SELECT AVG(engine_size) AS avg_engine_size
            FROM playground.automobile)
ORDER BY engine_size DESC, brand_name ASC;

-- Approach 2: Using CTE
WITH avg_size as (
    SELECT 
      brand_name,
      fuel_type,
      engine_size,
      AVG(engine_size) OVER() as avg_engine_size
    FROM playground.automobile
)
SELECT
  brand_name,
  fuel_type,
  engine_size 
FROM avg_size 
WHERE engine_size>avg_engine_size
ORDER BY engine_size DESC, brand_name ASC;
