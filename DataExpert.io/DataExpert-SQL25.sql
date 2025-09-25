-- Question: Which states have high risk of fatal collisions involving Alcohol
-- https://www.dataexpert.io/question/high-risk-state-analysis

-- Approach 1: Using CTE to calculate national average first

WITH alcohol_impaired AS (
    SELECT 
        state,
        percent_alcohol_impaired,
        AVG(percent_alcohol_impaired) OVER () AS national_avg
    FROM playground.bad_drivers
)
SELECT 
    state, 
    percent_alcohol_impaired
FROM alcohol_impaired
WHERE percent_alcohol_impaired > national_avg * 1.20
ORDER BY percent_alcohol_impaired DESC, state ASC;

-- Approach 2: Using subquery in WHERE clause

SELECT 
    state,
    percent_alcohol_impaired
FROM 
    playground.bad_drivers
WHERE 
    percent_alcohol_impaired >= 1.2 * (
        SELECT AVG(percent_alcohol_impaired)
        FROM playground.bad_drivers
    )
ORDER BY 
    percent_alcohol_impaired DESC;
