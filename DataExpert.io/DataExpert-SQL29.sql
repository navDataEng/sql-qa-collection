-- Question: Transform workers_info Table to Exclude NULL Values
-- https://www.dataexpert.io/question/exclude-null-values-workers-info


SELECT
    id,
    'name' AS column_name,
    CAST(name AS VARCHAR) AS value
FROM
    playground.workers_info
WHERE
    name IS NOT NULL

UNION ALL

SELECT
    id,
    'date_of_birth' AS column_name,
    CAST(date_of_birth AS VARCHAR) AS value
FROM
    playground.workers_info
WHERE
    date_of_birth IS NOT NULL

UNION ALL

SELECT
    id,
    'salary' AS column_name,
    CAST(salary AS VARCHAR) AS value
FROM
    playground.workers_info
WHERE
    salary IS NOT NULL

ORDER BY
    id ASC,
    column_name ASC;
