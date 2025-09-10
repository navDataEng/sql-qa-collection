-- Question: Filtering Students in Active Clubs
-- https://www.dataexpert.io/question/active-club-members

-- Table: playground.clubs and playground.students
-- +------------------+--------------+------+-----+

SELECT
    s.id,
    s.name,
    s.club_id
FROM playground.students s
RIGHT JOIN playground.clubs c
    ON s.club_id = c.id
WHERE s.id IS NOT NULL
ORDER BY s.id;