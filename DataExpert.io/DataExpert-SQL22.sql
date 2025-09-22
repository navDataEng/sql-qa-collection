-- Question: Identifying Active Businesses Based on Event Occurrences
-- https://www.dataexpert.io/question/active-businesses-identification

WITH average_occurences AS (
    SELECT 
        event_type, 
        AVG(occurences) AS avg_occur
    FROM playground.business_events
    GROUP BY event_type
)
SELECT 
    business_id
FROM playground.business_events p
LEFT JOIN average_occurences a
    ON a.event_type = p.event_type
WHERE p.occurences > a.avg_occur
GROUP BY business_id
HAVING COUNT(p.event_type) > 1;
