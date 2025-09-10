-- Question: Identifying Empty Departments
-- https://www.dataexpert.io/question/empty-departments-list

-- Tables: playground.employees and playground.departments
-- +----------------+-----------+------------------------+

SELECT dep_name
FROM playground.employees E
FULL JOIN playground.departments D
    ON E.department = D.id
WHERE E.id IS NULL