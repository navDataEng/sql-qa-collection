-- Question: Finding Actors by Favorite Movie Genre
-- https://www.dataexpert.io/question/actors-by-favorite-genre


-- Approach 01

WITH common_genre AS (
    SELECT TOP 1
        genre
    FROM
        playground.movies
    GROUP BY
        genre
    ORDER BY
        COUNT(*) DESC
    --LIMIT 1
)
SELECT
    g.actor,
    g.age
FROM
    playground.actor_ages g
LEFT JOIN
    playground.starring_actors a
    ON g.actor = a.actor
LEFT JOIN
    playground.movies m
    ON a.movie_name = m.movie
CROSS JOIN
    common_genre c
WHERE
    m.genre = c.genre
ORDER BY
    g.age DESC,
    g.actor;