-- Question: Determining the Order of Succession
-- https://www.dataexpert.io/question/order-of-succession

-- Table: playground.successors
-- +----+----------+----------+


SELECT name, birthday
FROM playground.successors
ORDER BY birthday ASC;

SELECT
  CASE 
    WHEN gender = 'M' THEN CONCAT('King ', name)
    WHEN gender = 'F' THEN CONCAT('Queen ', name)
  END AS name,
  birthday
FROM playground.successors
ORDER BY birthday ASC;

