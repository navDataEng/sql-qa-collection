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
    1. article_id int
    2. author_id int
    3. viewer_id int
    4. view_date date

Your answer should include these columns:
`viewer_id` integer

↪️ [Solution](DataEngineerSQL01.sql)

### Question 02: [Check Test Answers](https://www.dataexpert.io/question/check-test-answers)
    
Create a SQL query to evaluate test answers stored in a table named `playground.answers` with 
1. columns id (unique question ID), 
2. correct_answer (string), and 
3. given_answer (which can be NULL). 

Return a table with columns id and checks, where checks is `"no answer"` if given_answer is NULL, `"correct"` if given_answer matches correct_answer, and `"incorrect"` otherwise. Order the results by `id`.

These are the tables to query for this question:
- playground.answers
1. id int
2. correct_answer string
3. given_answer string

Your answer should include these columns:
- id integer
- checks varchar

↪️ [Solution](DataEngineerSQL02.sql)

### Question 03: 