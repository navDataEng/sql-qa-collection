-- Question: Total Server Fleet Uptime in Full Days
-- https://www.dataexpert.io/question/server-fleet-uptime-full-days

WITH pivot_table AS (
  SELECT 
    session_id,
    MAX(CASE WHEN session_status = 'start' THEN session_time END) AS start_time,
    MIN(CASE WHEN session_status = 'stop' THEN session_time END) AS stop_time
  FROM playground.sessions
  GROUP BY session_id
)
SELECT 
  SUM(EXTRACT(DAY FROM (stop_time - start_time))) AS total_uptime_days
FROM pivot_table;
