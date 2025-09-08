-- Find Viewers with Multiple Article Views in a Day
-- https://www.dataexpert.io/question/find-multiple-article-viewers

SELECT viewer_id
FROM playground.views
GROUP BY view_date, viewer_id
HAVING COUNT(DISTINCT article_id)>1
ORDER BY viewer_id