-- Question: Most Popular Fuel System for Each Fuel Type
-- https://www.dataexpert.io/question/popular-fuel-system-by-fuel-type


WITH famous_system AS (
    SELECT 
        fuel_type,
        fuel_system,
        COUNT(*) AS total_cars,
        ROW_NUMBER() OVER (
            PARTITION BY fuel_type 
            ORDER BY COUNT(*) DESC
        ) AS rn
    FROM playground.automobile
    GROUP BY fuel_type, fuel_system
)
SELECT 
    fuel_type,
    fuel_system,
    total_cars
FROM famous_system
WHERE rn = 1
ORDER BY fuel_type;
