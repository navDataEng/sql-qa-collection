-- Question: Identifying the Bank Robber
-- https://www.dataexpert.io/question/bank-robber-identification

-- Table: playground.suspect
-- +----+-------+----------+

SELECT 
    id,
    name,
    surname
FROM playground.suspect
WHERE height <= 170 
    AND UPPER(name) LIKE 'B%' 
    AND surname LIKE 'Gre_n'
ORDER BY id;