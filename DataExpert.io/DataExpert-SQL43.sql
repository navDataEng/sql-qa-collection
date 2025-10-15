-- Question: Count Unique Conversation Threads
-- https://www.dataexpert.io/question/unique-conversation-threads


-- Approach 01: Using DISTINCT with LEAST and GREATEST to identify unique user pairs

SELECT
  COUNT(*) as count
FROM
  (
    SELECT DISTINCT
      LEAST(sender_id, receiver_id) AS user1_id,
      GREATEST(sender_id, receiver_id) AS user2_id
    FROM
      playground.messenger
  ) AS unique_threads;

-- Approach 02: Using CONCAT with CASE to create unique identifiers for user pairs

SELECT
  COUNT(DISTINCT
    CASE
      WHEN sender_id < receiver_id THEN CONCAT(sender_id, '-', receiver_id)
      ELSE CONCAT(receiver_id, '-', sender_id)
    END
  ) AS count
FROM
  playground.messenger;