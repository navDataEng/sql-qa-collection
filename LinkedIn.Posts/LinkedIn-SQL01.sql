-- Finding the missing values from 1 to 10
-- https://www.linkedin.com/posts/adityabansal095_deloitte-hcl-sql-activity-7368127625434685440-2VvJ?utm_source=share&utm_medium=member_desktop&rcm=ACoAAFZBXa8BXofChK8REKpbKAQbFjIhBmKc3-g

Create Table Numbers (num int);
Insert into Numbers values (1),(2),(3),(5),(6),(9),(10);

select num from Numbers;

select rn 
from (
    select num, ROW_NUMBER() over (order by num) as rn
    from numbers
) t
where t.rn not in (
    select num from numbers
)