-- Question: Finding Highest Grade and Corresponding Course per Student
-- https://www.dataexpert.io/question/highest-grade-corresponding-course


-- Approach 1:

WITH high_grade AS (
    SELECT
        student_id,
        MAX(grade) AS grade
    FROM playground.student_grades
    GROUP BY student_id
)
SELECT 
    g.student_id, 
    MIN(s.course_id) AS course_id,
    g.grade
FROM high_grade g
LEFT JOIN playground.student_grades s
    ON s.student_id = g.student_id 
   AND s.grade = g.grade
GROUP BY g.student_id, g.grade
ORDER BY g.student_id;

-- Approach 2:

WITH high_grade AS (
    SELECT 
        student_id,
        course_id,
        grade,
        RANK() OVER (
            PARTITION BY student_id 
            ORDER BY grade DESC, course_id
        ) AS rnk
    FROM playground.student_grades
)
SELECT 
    student_id,
    course_id,
    grade
FROM high_grade
WHERE rnk = 1
ORDER BY student_id;

