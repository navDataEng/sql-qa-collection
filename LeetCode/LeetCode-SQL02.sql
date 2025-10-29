--


WITH unbanned AS (
  SELECT
    request_at,
    SUM(CASE WHEN status LIKE 'cancelled%' THEN 1 ELSE 0 END) AS cancelled_today,
    COUNT(*) AS total_requested
  FROM trips t
  LEFT JOIN users c ON c.users_id = t.client_id
  LEFT JOIN users d ON d.users_id = t.driver_id
  WHERE c.banned = 'No' 
    AND d.banned = 'No' 
    AND request_at BETWEEN '2013-10-01' AND '2013-10-03'
  GROUP BY request_at
)
SELECT
  request_at AS "Day",
  ROUND(cancelled_today / total_requested, 2) AS "Cancellation Rate"
FROM unbanned;