--


WITH MultiComponentBugs AS (
    -- 1. Find the bug numbers that are linked to more than one component
    SELECT
        bug_num
    FROM
        playground.bug_component
    GROUP BY
        bug_num
    HAVING
        COUNT(component_id) > 1
),
ComponentBugCounts AS (
    -- 2. Calculate the total number of bugs associated with each component
    SELECT
        component_id,
        COUNT(DISTINCT bug_num) AS bugs_in_component
    FROM
        playground.bug_component
    GROUP BY
        component_id
)
-- 3. Join everything to get the final output
SELECT
    B.title AS bug_title,
    C.title AS component_title,
    CBC.bugs_in_component
FROM
    playground.bug_component AS BC
JOIN
    playground.bug AS B ON BC.bug_num = B.num
JOIN
    playground.component AS C ON BC.component_id = C.id
JOIN
    MultiComponentBugs AS MCB ON BC.bug_num = MCB.bug_num -- Filter for multi-component bugs
JOIN
    ComponentBugCounts AS CBC ON BC.component_id = CBC.component_id -- Attach the total bug count for the component
ORDER BY
    CBC.bugs_in_component DESC,
    bug_title ASC;