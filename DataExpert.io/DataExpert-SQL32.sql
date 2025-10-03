-- Question: Analyze Engine Efficiency by Fuel Type
-- https://www.dataexpert.io/question/analyze-engine-efficiency


SELECT
    fuel_type,
    ROUND(AVG(city_mileage), 2) AS avg_city_mileage,
    ROUND(AVG(highway_mileage), 2) AS avg_highway_mileage,
    ROUND(AVG(highway_mileage) / AVG(city_mileage), 2) AS efficiency_ratio
FROM
    playground.automobile
GROUP BY
    fuel_type
ORDER BY
    efficiency_ratio DESC;