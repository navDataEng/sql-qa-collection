# SQL QA Collections

## DataExpert.io

### Question 01: [Find Viewers with Multiple Article Views in a Day](https://www.dataexpert.io/question/find-multiple-article-viewers)

Write a SQL query to identify all viewers who viewed more than one article on the same day. 

The table includes columns
1. viewer_id (the ID of the viewer), 
2. article_id (the ID of the article viewed), and
3. view_date (the date of the view). 
    
The result should contain a single column named `viewer_id`, listing each viewer who meets the criteria without duplicates, and should be sorted in ascending order of `viewer_id`.

These are the tables to query for this question:
- playground.views
    - article_id int
    - author_id int
    - viewer_id int
    - view_date date

Your answer should include these columns:
`viewer_id` integer

↪️ [Solution](DataExpert-SQL01.sql)
-

### Question 02: [Check Test Answers](https://www.dataexpert.io/question/check-test-answers)
    
Create a SQL query to evaluate test answers stored in a table named `playground.answers` with 
1. columns id (unique question ID), 
2. correct_answer (string), and 
3. given_answer (which can be NULL). 

Return a table with columns id and checks, where checks is `"no answer"` if given_answer is NULL, `"correct"` if given_answer matches correct_answer, and `"incorrect"` otherwise. Order the results by `id`.

These are the tables to query for this question:
- playground.answers
    - id int
    - correct_answer string
    - given_answer string

Your answer should include these columns:
- id integer
- checks varchar

↪️ [Solution](DataExpert-SQL02.sql)
-

### Question 03: [Find Viewers with Multiple Article Views in a Day](https://www.dataexpert.io/question/find-multiple-article-viewers)

Write a SQL query to calculate the total number of births recorded for each year in the `playground.us_birth_stats table`. Order the results by `year`.

These are the tables to query for this question:
- playground.us_birth_stats
    - year int
    - month int
    - date_of_month int
    - day_of_week int
    - births int

Your answer should include these columns:
- year integer
- total_births integer

↪️ [Solution](DataExpert-SQL03.sql)
-