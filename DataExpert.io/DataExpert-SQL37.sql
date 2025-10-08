-- Question: Countries and Their Preferences for Beer, Spirit, and Wine
-- https://www.dataexpert.io/question/countries-drink-preferences


WITH pivot_data AS (
  SELECT country, 'Beer' AS preferred_drink, beer_servings AS servings FROM playground.drinks
  UNION ALL
  SELECT country, 'Spirit', spirit_servings FROM playground.drinks
  UNION ALL
  SELECT country, 'Wine', wine_servings FROM playground.drinks
),
ranks AS (
  SELECT country, preferred_drink, servings,
         ROW_NUMBER() OVER (PARTITION BY country ORDER BY servings DESC) AS rnk
  FROM pivot_data
)
SELECT country, preferred_drink
FROM ranks
WHERE rnk = 1 AND preferred_drink IN ('Spirit','Wine') AND servings > 0
ORDER BY country;
