-- Question: Calculate 3-Day Rolling Average of Posts per User
-- https://www.dataexpert.io/question/calculate-3-day-rolling-average


SELECT 
    user_id,
    post_date,
    ROUND(
        AVG(post_count) OVER (
            PARTITION BY user_id 
            ORDER BY post_date 
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ), 2
    ) AS third_rolling_avg
FROM playground.posts
ORDER BY post_date;
