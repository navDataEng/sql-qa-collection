# DataExpert.io

## Question 01: [Find Viewers with Multiple Article Views in a Day](https://www.dataexpert.io/question/find-multiple-article-viewers)

Write a SQL query to identify all viewers who viewed more than one article on the same day. 

The table includes columns
1. viewer_id (the ID of the viewer), 
2. article_id (the ID of the article viewed), and
3. view_date (the date of the view). 
    
The result should contain a single column named `viewer_id`, listing each viewer who meets the criteria without duplicates, and should be sorted in ascending order of `viewer_id`.

These are the tables to query for this question:
- *playground.views*    

    | Columns    | DataType |
    |:----------:|:--------:|
    | article_id | int |
    | author_id  | int |
    | viewer_id  | int |
    | view_date  | date |

Your answer should include these columns:
- `viewer_id` integer

### ➡️ [Solution](DataExpert-SQL01.sql)

## Question 02: [Check Test Answers](https://www.dataexpert.io/question/check-test-answers)
    
Create a SQL query to evaluate test answers stored in a table named `playground.answers` with 
1. columns id (unique question ID), 
2. correct_answer (string), and 
3. given_answer (which can be NULL). 

Return a table with columns id and checks, where checks is `"no answer"` if given_answer is NULL, `"correct"` if given_answer matches correct_answer, and `"incorrect"` otherwise. Order the results by `id`.

These are the tables to query for this question:
- *playground.answers*

    | Columns | DataType |
    | :---   | :---|
    | id      | int |
    | correct_answer | string |
    | given_answer | string |

Your answer should include these columns:
- `id` integer
- `checks` varchar

### ➡️ [Solution](DataExpert-SQL02.sql)

## Question 03: [Total Number of Births Per Year](https://www.dataexpert.io/question/total-births-per-year)

Write a SQL query to calculate the total number of births recorded for each year in the `playground.us_birth_stats table`. Order the results by `year`.

These are the tables to query for this question:
- *playground.us_birth_stats*

  | Columns | DataType |
  | :--- | :---|
  | year | int |
  | month | int |
  | date_of_month | int |
  | day_of_week | int |
  | births | int |

Your answer should include these columns:
- `year` integer
- `total_births` integer

### ➡️ [Solution](DataExpert-SQL03.sql)

## Question 04: [Cars with Above Average Engine Size](https://www.dataexpert.io/question/cars-above-average-engine-size)

Create a SQL query to identify cars that have an engine size above the average across all cars in the dataset. 

The result should include the `brand`, `fuel_type`, and `engine size`, ordered by engine size in descending order and then brand_name in asc order.

These are the tables to query for this question:
- *playground.automobile*

  | Columns           | DataType      |
  |-------------------|--------------|
  | brand_name        | string       |
  | fuel_type         | string       |
  | aspiration        | string       |
  | door_panel        | string       |
  | design            | string       |
  | wheel_drive       | string       |
  | engine_location   | string       |
  | engine_type       | string       |
  | cylinder_count    | string       |
  | engine_size       | int          |
  | fuel_system       | string       |
  | bore              | double       |
  | stroke            | double       |
  | compression_ratio | double       |
  | horse_power       | int          |
  | top_RPM           | int          |
  | city_mileage      | int          |
  | highway_mileage   | int          |
  | price_in_dollars  | int          |

Your answer should include these columns:
- `brand_name` varchar
- `fuel_type` varchar
- `engine_size` integer

### ➡️ [Solution](DataExpert-SQL04.sql)

## Question 05: [Average Number of Births by Day of the Week](https://www.dataexpert.io/question/average-births-per-day-of-week)

Create a SQL query that finds the average number of births for each day of the week across all years in the `playground.us_birth_stats` table. 

Cast the average as an `integer`. Order the results by the day of the week.

These are the tables to query for this question:
- *playground.us_birth_stats*

  | Columns        | DataType |
  |:---------------|:---------|
  | year           | int      |
  | month          | int      |
  | date_of_month  | int      |
  | day_of_week    | int      |
  | births         | int      |

Your answer should include these columns:
- `day_of_week` integer
- `average_births` integer

### ➡️ [Solution](DataExpert-SQL05.sql)

## Question 06: [Month with the Highest Total Births](https://www.dataexpert.io/question/highest-birth-month)

Determine the month with the highest total number of births in the `playground.us_birth_stats` table. 

The output should show the month and the total number of births.

These are the tables to query for this question:
- *playground.us_birth_stats*

  | Columns        | DataType |
  |:-------------- |:---------|
  | year           | int      |
  | month          | int      |
  | date_of_month  | int      |
  | day_of_week    | int      |
  | births         | int      |

Your answer should include these columns:
- `month` integer
- `total_births` integer

### ➡️ [Solution](DataExpert-SQL06.sql)

## Question 07: [Customers with More Than 20 Orders](https://www.dataexpert.io/question/loyal-customers)

Write a SQL query to display all loyal customers from the `playground.superstore` table. A customer is considered loyal if they have placed more than 20 orders. 

The query should return the `customer ID`, `customer name`, and the `total number of orders` for each of these customers. 

Display the result in descending order of their orders and then ascending order of their names.

These are the tables to query for this question:
- *playground.superstore*

  | Columns        | DataType |
  |:-------------- |:---------|
  | row_id         | int      |
  | order_id       | string   |
  | order_date     | date     |
  | ship_date      | date     |
  | ship_mode      | string   |
  | customer_id    | string   |
  | customer_name  | string   |
  | segment        | string   |
  | country        | string   |
  | city           | string   |
  | state          | string   |
  | postal_code    | int      |
  | region         | string   |
  | product_id     | string   |
  | category       | string   |
  | sub_category   | string   |
  | product_name   | string   |
  | sales          | string   |
  | quantity       | string   |
  | discount       | string   |
  | profit         | double   |

Your answer should include these columns:
- `customer_id` varchar
- `customer_name` varchar
- `order_count` integer

### ➡️ [Solution](DataExpert-SQL07.sql)

## Question 08: [Identifying Empty Departments](https://www.dataexpert.io/question/empty-departments-list)

Given two tables, `playground.employees` and `playground.departments`, with employees containing id, full_name, and department, and departments containing id (unique department ID) and dep_name (department name), 

Write a SQL query to build a table with one column, `dep_name`. This table should list all the departments that currently have no employees, sorted by the department id.

These are the tables to query for this question:
- *playground.employees*

  | Columns | DataTypes |
  |:---|:---|
  | id | int |
  | full_name | string |
  | department | int |

- *playground.departments*

  | Columns | DataTypes |
  |:---|:---|
  | id | int |
  | dep_name | string |

Your answer should include these columns:
- `dep_name` varchar

### ➡️ [Solution](DataExpert-SQL08.sql)

## Question 09: [Filtering Students in Active Clubs](https://www.dataexpert.io/question/active-club-members)

Given tables 
  - clubs (id: unique club id, name: club name) and 
  - students (id: unique student id, name: student name, club_id: club's id), 

Return a list from the students table for those who are in clubs that still exist in the clubs table. 

The result should have three columns (id, name, club_id) and be sorted by students' ids (id) and include only those students whose club_id matches an id in the clubs table.

These are the tables to query for this question:
- *playground.clubs*

  | Columns | DataTypes |
  | :---| :---|
  | id | int |
  | name | string |

- *playground.students*

  | Columns | DataTypes |
  | :--- | :--- |
  | id | int |
  | name | string |
  | club_id | int |

Your answer should include these columns:
- `id` integer
- `name` varchar
- `club_id` integer

### ➡️ [Solution](DataExpert-SQL09.sql)