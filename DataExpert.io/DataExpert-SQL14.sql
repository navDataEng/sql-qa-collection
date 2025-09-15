-- Question: Analyze Yearly Profit Performance
-- https://www.dataexpert.io/question/yearly-profit-performance

SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    ROUND(SUM(profit), 2) AS total_profit
FROM playground.superstore
GROUP BY EXTRACT(YEAR FROM order_date)
ORDER BY 1 DESC