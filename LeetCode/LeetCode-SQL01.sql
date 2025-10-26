-- 1407. Top Travellers
-- https://leetcode.com/problems/top-travellers/description/

-- SQL Schema

Create Table If Not Exists Users (id int, name varchar(30))
Create Table If Not Exists Rides (id int, user_id int, distance int)

Truncate table Users

insert into Users (id, name) values ('1', 'Alice')
insert into Users (id, name) values ('2', 'Bob')
insert into Users (id, name) values ('3', 'Alex')
insert into Users (id, name) values ('4', 'Donald')
insert into Users (id, name) values ('7', 'Lee')
insert into Users (id, name) values ('13', 'Jonathan')
insert into Users (id, name) values ('19', 'Elvis')

Truncate table Rides

insert into Rides (id, user_id, distance) values ('1', '1', '120')
insert into Rides (id, user_id, distance) values ('2', '2', '317')
insert into Rides (id, user_id, distance) values ('3', '3', '222')
insert into Rides (id, user_id, distance) values ('4', '7', '100')
insert into Rides (id, user_id, distance) values ('5', '13', '312')
insert into Rides (id, user_id, distance) values ('6', '19', '50')
insert into Rides (id, user_id, distance) values ('7', '7', '120')
insert into Rides (id, user_id, distance) values ('8', '19', '400')
insert into Rides (id, user_id, distance) values ('9', '7', '230')


-- SQL Query : Oracle

WITH top_travellers AS (
  SELECT
    u.id,
    u.name AS name,
    SUM(COALESCE(r.distance, 0)) AS travelled_distance
  FROM users u
  LEFT JOIN rides r
      ON u.id = r.user_id
  GROUP BY u.id,u.name
  ORDER BY travelled_distance DESC,name
)
SELECT
  name "name",
  travelled_distance "travelled_distance"
FROM top_travellers;

-- SQL Query : MySQL

SELECT
  u.name name,
  SUM(COALESCE(r.distance, 0)) travelled_distance
FROM users u
LEFT JOIN rides r ON u.id = r.user_id
GROUP BY u.id 
ORDER BY travelled_distance DESC, name;