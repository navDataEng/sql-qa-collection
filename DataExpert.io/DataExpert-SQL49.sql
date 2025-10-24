-- Question: Summarizing Leisure Activity Resorts by Country
-- https://www.dataexpert.io/question/leisure-activity-resorts-by-country


-- Approach 01: Using Conditional Aggregation

SELECT
  country,
  SUM(CASE WHEN leisure_activity_type = 'Adventure park' THEN number_of_places ELSE 0 END) AS adventure_park,
  SUM(CASE WHEN leisure_activity_type = 'Golf' THEN number_of_places ELSE 0 END) AS golf,
  SUM(CASE WHEN leisure_activity_type = 'River cruise' THEN number_of_places ELSE 0 END) AS river_cruise,
  SUM(CASE WHEN leisure_activity_type = 'Kart racing' THEN number_of_places ELSE 0 END) AS kart_racing
FROM
  playground.country_activities
GROUP BY
  country
ORDER BY
  country;


-- Approach 02: Using PIVOT with Subquery to Exclude Unwanted Columns

SELECT
    country,
    COALESCE("'River cruise'", 0) AS "River cruise",
    COALESCE("'Golf'", 0) AS "Golf",
    COALESCE("'Adventure park'", 0) AS "Adventure park",
    COALESCE("'Kart racing'", 0) AS "Kart racing"
FROM (
    -- This subquery is the key.
    -- We select ONLY the columns needed for the pivot.
    -- This hides the 'region' column from the PIVOT operator.
    SELECT
        country,
        leisure_activity_type,
        number_of_places
    FROM
        playground.country_activities
)
PIVOT (
    -- The PIVOT runs on the subquery.
    -- Since 'region' is gone, it correctly groups by 'country'.
    SUM(number_of_places)
    FOR leisure_activity_type IN (
        'River cruise', 'Golf', 'Adventure park', 'Kart racing'
    )
)
ORDER BY
    country;

-- Approach 02: MS SQL Server Version

SELECT
    country,
    COALESCE("'River cruise'", 0) AS "River cruise",
    COALESCE("'Golf'", 0) AS "Golf",
    COALESCE("'Adventure park'", 0) AS "Adventure park",
    COALESCE("'Kart racing'", 0) AS "Kart racing"
FROM (
    -- This subquery is the key.
    -- We select ONLY the columns needed for the pivot.
    -- This hides the 'region' column from the PIVOT operator.
    SELECT
        country,
        leisure_activity_type,
        number_of_places
    FROM
        playground.country_activities
) AS SourceTable
PIVOT (
    -- The PIVOT runs on the subquery.
    -- Since 'region' is gone, it correctly groups by 'country'.
    SUM(number_of_places)
    FOR leisure_activity_type IN (
        [River cruise], [Golf], [Adventure park], [Kart racing]
    )
) AS PivotTable
ORDER BY
    country;