-- Question: Determining the Soccer Series Winner
-- https://www.dataexpert.io/question/soccer-series-winner


-- Approach 01: Using CTEs to Calculate Wins, Goal Differences, and Away Goals

WITH first_team_overall_not_host_goals AS (
  SELECT
    SUM(first_team_score) AS first_team_not_host_goals
  FROM
    playground.scores
  WHERE
    match_host <> 1
),
second_team_overall_not_host_goals AS (
  SELECT
    SUM(second_team_score) AS second_team_not_host_goals
  FROM
    playground.scores
  WHERE
    match_host <> 2
),
match_winners AS (
  SELECT
    COUNT(match_id) AS total_matches,
    SUM(CASE WHEN first_team_score > second_team_score THEN 1 ELSE 0 END) AS first_team_wins,
    SUM(CASE WHEN first_team_score < second_team_score THEN 1 ELSE 0 END) AS second_team_wins,
    SUM(first_team_score) - SUM(second_team_score) AS first_team_goal_difference,
    SUM(second_team_score) - SUM(first_team_score) AS second_team_goal_difference,
    MAX(first_team_not_host_goals) AS first_team_not_host_goals,
    MAX(second_team_not_host_goals) AS second_team_not_host_goals
  FROM
    playground.scores
  CROSS JOIN
    first_team_overall_not_host_goals
  CROSS JOIN
    second_team_overall_not_host_goals
)
SELECT
  CASE
    WHEN first_team_wins > second_team_wins THEN 1
    WHEN first_team_wins < second_team_wins THEN 2
    WHEN first_team_wins = second_team_wins
    AND first_team_goal_difference > second_team_goal_difference THEN 1
    WHEN first_team_wins = second_team_wins
    AND first_team_goal_difference < second_team_goal_difference THEN 2
    WHEN first_team_wins = second_team_wins
    AND first_team_goal_difference = second_team_goal_difference
    AND first_team_not_host_goals > second_team_not_host_goals THEN 1
    WHEN first_team_wins = second_team_wins
    AND first_team_goal_difference = second_team_goal_difference
    AND first_team_not_host_goals < second_team_not_host_goals THEN 2
    ELSE 0
  END AS winner
FROM
  match_winners;


-- Approach 02: Consolidated CTE for Series Winner Determination

-- Step 1: Create a single CTE to aggregate all stats at once.
WITH series_stats AS (
    SELECT
        -- Rule 1 Stat: Calculate total wins for each team.
        SUM(CASE WHEN first_team_score > second_team_score THEN 1 ELSE 0 END) AS first_team_wins,
        SUM(CASE WHEN second_team_score > first_team_score THEN 1 ELSE 0 END) AS second_team_wins,

        -- Rule 2 Stat: Calculate total goals scored by each team for goal difference comparison.
        SUM(first_team_score) AS first_team_total_goals,
        SUM(second_team_score) AS second_team_total_goals,

        -- Rule 3 Stat: Calculate away goals for each team.
        SUM(CASE WHEN match_host = 2 THEN first_team_score ELSE 0 END) AS first_team_away_goals,
        SUM(CASE WHEN match_host = 1 THEN second_team_score ELSE 0 END) AS second_team_away_goals
    FROM
        playground.scores
)

-- Step 2: Apply the winning logic using a CASE statement on the aggregated stats.
SELECT
    CASE
        -- Rule 1: Check for the winner based on the most wins.
        WHEN first_team_wins > second_team_wins THEN 1
        WHEN second_team_wins > first_team_wins THEN 2

        -- Rule 2: If wins are tied, check for goal difference.
        -- This is equivalent to 'first_team_goal_difference > second_team_goal_difference'.
        WHEN first_team_total_goals > second_team_total_goals THEN 1
        WHEN second_team_total_goals > first_team_total_goals THEN 2

        -- Rule 3: If wins and goal difference are tied, check for away goals.
        WHEN first_team_away_goals > second_team_away_goals THEN 1
        WHEN second_team_away_goals > first_team_away_goals THEN 2

        -- If all criteria are tied, there is no winner.
        ELSE 0
    END AS winner
FROM
    series_stats;


-- Approach 03: Detailed Multi-CTE Breakdown for Clarity

-- Step 1: Process each match to determine individual match results and away goals.
WITH match_results AS (
    SELECT
        -- Determine the winner of each individual match
        CASE
            WHEN first_team_score > second_team_score THEN 1
            WHEN second_team_score > first_team_score THEN 2
            ELSE 0 -- A draw
        END AS match_winner,
        -- Pass scores through for total goal calculation
        first_team_score,
        second_team_score,
        -- Identify and pass through away goals for each team
        CASE WHEN match_host = 2 THEN first_team_score ELSE 0 END AS first_team_away_goals,
        CASE WHEN match_host = 1 THEN second_team_score ELSE 0 END AS second_team_away_goals
    FROM
        playground.scores
),

-- Step 2: Aggregate the per-match results into a single summary row for the whole series.
series_summary AS (
    SELECT
        -- Rule 1: Count total wins for each team from the match_winner column.
        SUM(CASE WHEN match_winner = 1 THEN 1 ELSE 0 END) AS first_team_wins,
        SUM(CASE WHEN match_winner = 2 THEN 1 ELSE 0 END) AS second_team_wins,
        -- Rule 2: Sum total goals for each team.
        SUM(first_team_score) AS first_team_total_goals,
        SUM(second_team_score) AS second_team_total_goals,
        -- Rule 3: Sum total away goals for each team.
        SUM(first_team_away_goals) AS first_team_total_away_goals,
        SUM(second_team_away_goals) AS second_team_total_away_goals
    FROM
        match_results
)

-- Step 3: Apply the final winning logic based on the aggregated series summary.
SELECT
    CASE
        -- Rule 1: Compare total wins.
        WHEN first_team_wins > second_team_wins THEN 1
        WHEN second_team_wins > first_team_wins THEN 2
        -- Rule 2: Compare goal difference (if wins are tied).
        WHEN first_team_total_goals > second_team_total_goals THEN 1
        WHEN second_team_total_goals > first_team_total_goals THEN 2
        -- Rule 3: Compare away goals (if wins and goal difference are tied).
        WHEN first_team_total_away_goals > second_team_total_away_goals THEN 1
        WHEN second_team_total_away_goals > first_team_total_away_goals THEN 2
        -- No winner if all else is equal.
        ELSE 0
    END AS winner
FROM
    series_summary;
