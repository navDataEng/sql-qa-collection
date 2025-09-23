-- Question: Top 2 Customers with Highest Sales Every Month
-- https://www.dataexpert.io/question/top-customers-monthly-sales


WITH sum_sal AS (
    SELECT 
        id,
        month,
        SUM(sales) AS total_sales
    FROM playground.sales
    GROUP BY id, month
), mon_rank AS (
    SELECT 
        id,
        month,
        total_sales,
        CASE 
            WHEN month = 'Jan' THEN 1
            WHEN month = 'Feb' THEN 2
            ELSE 3 
        END AS mon_num,
        RANK() OVER (
            PARTITION BY month 
            ORDER BY total_sales DESC
        ) AS rank
    FROM sum_sal
)
SELECT 
    id,
    month,
    total_sales,
    rank
FROM mon_rank
WHERE rank < 3
ORDER BY mon_num, rank;
