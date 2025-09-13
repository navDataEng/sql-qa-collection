-- Question: Top Reviewed Customers per Product
-- https://www.dataexpert.io/question/top-reviewed-customers-per-product

-- Approach 1: Using GROUP BY

SELECT
    product_id,
    customer_id,
    MAX(review_score) AS review_score,
    MAX(helpful_votes) AS helpful_votes
FROM playground.product_reviews
GROUP BY product_id, customer_id
ORDER BY product_id;

-- Approach 2: Using CTE AND RANK()

WITH top_reviewed AS (
    SELECT
        product_id,
        customer_id,
        review_score, 
        helpful_votes,
        RANK() OVER(PARTITION BY product_id, customer_id 
            ORDER BY review_score DESC, helpful_votes) AS rnk
    FROM playground.product_reviews
)
SELECT
    product_id,
    customer_id,
    review_score, 
    helpful_votes
FROM top_reviewed
WHERE rnk = 1
ORDER BY product_id;
