-- Question: Find US Customers Who Rented and Streamed Videos in Early February
-- https://www.dataexpert.io/question/us-customers-rented-streamed-early-feb

-- Table: playground.rental and playground.streams

SELECT DISTINCT r.user_id AS user_id
FROM playground.rental r
JOIN playground.streams s
    ON r.user_id = s.user_id
    AND r.rental_id = s.rental_id
WHERE r.country = 'US'
    AND r.rental_date = CAST('2023-02-01' AS date)
    AND s.stream_date BETWEEN CAST('2023-02-02' AS date) AND CAST('2023-02-08' AS date)
ORDER BY r.user_id
-- LIMIT 1;