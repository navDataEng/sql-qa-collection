-- Question: Calculate Average Lead Time for Each Shipping Option
-- https://www.dataexpert.io/question/average-lead-time-shipping-option

-- Approach: Snowflake
SELECT 
    ship_mode,
    COUNT(*) AS total_shipping_service,
    ROUND(AVG(CAST(ship_date - order_date AS DECIMAL(10, 2))), 2) AS avg_lead_time
FROM 
    playground.superstore
GROUP BY 
    ship_mode
ORDER BY 
    ship_mode DESC;

-- Approach 02

SELECT
    ship_mode,
    COUNT(T1.row_id) AS total_shipping_service,
    ROUND(
        AVG(
            EXTRACT(DAY FROM (T1.ship_date - T1.order_date))
        ), 2
    ) AS avg_lead_time
FROM
    playground.superstore AS T1
GROUP BY
    ship_mode
ORDER BY
    ship_mode DESC;
