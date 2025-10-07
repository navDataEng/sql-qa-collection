-- Question: Determining Optimal Packaging for Christmas Gifts
-- https://www.dataexpert.io/question/optimal-gift-packaging

-- Approach 01: Using Joins, Ranking Functions, and Aggregation to find the best fit package for each gift

WITH package_numbers AS (
    SELECT 
        p.package_type,
        RANK() OVER (PARTITION BY gift_name ORDER BY p.length * p.width * p.height) AS rnk
    FROM playground.gifts g
    LEFT JOIN playground.packages p
        ON p.length >= g.length
       AND p.width >= g.width
       AND p.height >= g.height
)
SELECT 
    package_type,
    COUNT(*) AS number
FROM package_numbers
WHERE rnk = 1
GROUP BY package_type
ORDER BY package_type;

-- Approach 02: Using Join, MIN Function, and Aggregation to find the best fit package for each gift

WITH pkg_match AS (
    SELECT 
        g.gift_name,
        p.package_type,
        p.length * p.width * p.height AS volume,
        MIN(p.length * p.width * p.height) 
            OVER (PARTITION BY g.gift_name) AS min_vol
    FROM playground.gifts g
    JOIN playground.packages p
      ON p.length >= g.length
     AND p.width  >= g.width
     AND p.height >= g.height
)
SELECT 
    package_type,
    COUNT(gift_name) AS number
FROM pkg_match
WHERE volume = min_vol
GROUP BY package_type
ORDER BY package_type;
