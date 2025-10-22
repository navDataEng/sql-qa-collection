-- Question: Who are the top 10 NBA players by consecutive 20+ point seasons?
-- https://www.dataexpert.io/question/consecutive-20-point-seasons


WITH qualifying_seasons AS (
    SELECT player_name,season
    FROM bootcamp.nba_player_seasons
    WHERE pts > 20),
season_groups AS (
    SELECT player_name,season,season - ROW_NUMBER() OVER (PARTITION BY player_name ORDER BY season) AS grp
    FROM qualifying_seasons),
streaks AS (
    SELECT player_name, grp, COUNT(*) AS consecutive_seasons
    FROM season_groups
    GROUP BY player_name, grp),
player_best_streaks AS (
    SELECT player_name, MAX(consecutive_seasons) AS max_consecutive_seasons
    FROM streaks
    GROUP BY player_name),
ranked_players AS (
    SELECT player_name,max_consecutive_seasons,
        dense_rank() OVER (ORDER BY max_consecutive_seasons DESC) AS rnk
    FROM player_best_streaks)
SELECT player_name, max_consecutive_seasons AS consecutive_seasons
FROM ranked_players
WHERE rnk <= 10
ORDER BY consecutive_seasons DESC,
    player_name ASC;