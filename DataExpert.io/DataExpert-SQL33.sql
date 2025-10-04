-- Question: Filtering Dance Contest Scores
-- https://www.dataexpert.io/question/dance-contest-score-filtering

-- Approach 01: Using CTEs to identify and exclude extreme scores

WITH EXCLUDE AS (
    SELECT
        arbiter_id AS id,
        first_criterion AS criterion
    FROM
        playground.dance_scores
    UNION ALL
    SELECT
        arbiter_id AS id,
        second_criterion AS criterion
    FROM
        playground.dance_scores
    UNION ALL
    SELECT
        arbiter_id AS id,
        third_criterion AS criterion
    FROM
        playground.dance_scores
), MIN_MAX AS (
    SELECT
        id,
        MAX(criterion) AS max_val,
        MIN(criterion) AS min_val
    FROM
        EXCLUDE
    GROUP BY
        id
), FILTER AS (
    SELECT
        arbiter_id
    FROM
        playground.dance_scores s
    LEFT JOIN
        MIN_MAX m ON m.id = s.arbiter_id
    GROUP BY
        arbiter_id
    HAVING
        -- The filtering logic: keeps judges who have less than 3 extreme scores (i.e., max or min)
        SUM(
            CASE WHEN first_criterion IN (m.max_val, m.min_val) THEN 1 ELSE 0 END +
            CASE WHEN second_criterion IN (m.max_val, m.min_val) THEN 1 ELSE 0 END +
            CASE WHEN third_criterion IN (m.max_val, m.min_val) THEN 1 ELSE 0 END
        ) < 3
)
SELECT
    *
FROM
    playground.dance_scores
WHERE
    arbiter_id IN (SELECT arbiter_id FROM FILTER)
ORDER BY
    1;

-- Approach 02:

WITH JudgeExtremeCounts AS (
    SELECT
        s.arbiter_id
    FROM
        playground.dance_scores s
    GROUP BY
        s.arbiter_id
    HAVING
        -- 1. Calculate the judge's own highest score (max_val) and lowest score (min_val)
        --    using GREATEST and LEAST across the three criteria.
        -- 2. Sum the number of criteria that equal this max_val or min_val.
        SUM(
            CASE WHEN s.first_criterion IN (GREATEST(s.first_criterion, s.second_criterion, s.third_criterion), LEAST(s.first_criterion, s.second_criterion, s.third_criterion)) THEN 1 ELSE 0 END +
            -- Check 2nd Criterion
            CASE WHEN s.second_criterion IN (GREATEST(s.first_criterion, s.second_criterion, s.third_criterion), LEAST(s.first_criterion, s.second_criterion, s.third_criterion)) THEN 1 ELSE 0 END +
            -- Check 3rd Criterion
            CASE WHEN s.third_criterion IN (GREATEST(s.first_criterion, s.second_criterion, s.third_criterion), LEAST(s.first_criterion, s.second_criterion, s.third_criterion)) THEN 1 ELSE 0 END
        ) < 2
        -- Filter Logic: We KEEP judges who have an extreme count of less than 2 (i.e., 0 or 1).
        -- This correctly implements the rule to EXCLUDE judges who hit their extreme "for at least two criteria."
)
SELECT
    ds.arbiter_id,
    ds.first_criterion,
    ds.second_criterion,
    ds.third_criterion
FROM
    playground.dance_scores ds
WHERE
    ds.arbiter_id IN (SELECT arbiter_id FROM JudgeExtremeCounts)
ORDER BY
    ds.arbiter_id;
