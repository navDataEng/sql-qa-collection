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

### ↪️ [Solution](DataExpert-SQL01.sql)

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

### ↪️ [Solution](DataExpert-SQL02.sql)


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

### ↪️ [Solution](DataExpert-SQL03.sql)

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

### ➡️ [Solution](DataExpert.io/DataExpert-SQL04.sql)