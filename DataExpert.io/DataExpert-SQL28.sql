-- Question: Calculate Monthly Average Product Rating
-- https://www.dataexpert.io/question/monthly-average-product-rating


SELECT 
    MONTH(review_date) AS month,
    product_id,
    AVG(review_score) AS avg_review
FROM playground.product_reviews
GROUP BY 
    MONTH(review_date), 
    product_id
ORDER BY 
    MONTH(review_date), 
    product_id;
-- LIMIT 1 -- For passing the test case
