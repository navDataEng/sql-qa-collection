-- Check Test Answers
-- https://www.dataexpert.io/question/check-test-answers

/* Create a SQL query to evaluate test answers stored in a table named playground.answers with columns id (unique question ID), correct_answer (string), and given_answer (which can be NULL). Return a table with columns id and checks, where checks is "no answer" if given_answer is NULL, "correct" if given_answer matches correct_answer, and "incorrect" otherwise. Order the results by id.

These are the tables to query for this question:
playground.answers
id int
correct_answer string
given_answer string
Your answer should include these columns:
id integer
checks varchar
*/

SELECT id,
       CASE 
           WHEN given_answer IS NULL THEN 'no answer'
           WHEN given_answer = correct_answer THEN 'correct'
           ELSE 'incorrect'
       END AS checks
FROM playground.answers
ORDER BY id;    