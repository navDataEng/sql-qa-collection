-- Question: Who are the top 10 authors by number of reviews?
-- https://www.dataexpert.io/question/top-10-authors-by-reviews

-- Answer from DataExpert.io: 
-- https://www.linkedin.com/posts/eczachly_dataengineering-activity-7164347913316290560-hTF3/

-- Approach 1:

SELECT author,
       SUM(CAST(REPLACE(no_of_reviews, ',', '') AS BIGINT)) AS number_of_reviews
FROM bootcamp.books
WHERE TRIM(no_of_reviews) <> ''
GROUP BY author
ORDER BY number_of_reviews DESC
--LIMIT 10;

-- Approach 2:

SELECT author,
       SUM(CAST(REGEXP_REPLACE(no_of_reviews, '[^0-9]', '') AS BIGINT)) AS number_of_reviews
FROM bootcamp.books
GROUP BY author
ORDER BY number_of_reviews DESC
--LIMIT 10;


-- Approach 3:

WITH cleaned AS (
  SELECT author,
         CAST(REGEXP_REPLACE(no_of_reviews, '[^0-9]', '') AS BIGINT) AS reviews
  FROM bootcamp.books
)
SELECT author,
       SUM(reviews) AS number_of_reviews
FROM cleaned
GROUP BY author
ORDER BY number_of_reviews DESC
--LIMIT 10
