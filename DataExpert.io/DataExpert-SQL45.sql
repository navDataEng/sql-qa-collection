-- Question: Identify Department for Reduction
-- https://www.dataexpert.io/question/department-reduction-criteria

WITH less_than_5 AS (
    SELECT 
        d.id AS dept_id,
        d.name AS dep_name,
        e.*,
        SUM(salary) OVER (PARTITION BY d.id) AS total_salary,
        COUNT(*) OVER (PARTITION BY d.id) AS emp_number
    FROM 
        playground.dept d
    LEFT JOIN 
        playground.emp e 
        ON d.id = e.department
), 
odd_departments AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (ORDER BY total_sal DESC, emp_count DESC, dept_id) AS seq
    FROM 
        less_than_5
    WHERE 
        emp_count <= 5
)
SELECT DISTINCT 
    dep_name,
    emp_number,
    total_salary
FROM 
    odd_departments
WHERE 
    seq % 2 = 1
ORDER BY 
    total_sal DESC, 
    emp_count DESC, 
    dep_name ASC;
