# DataExpert.io

## Question 01: [Find Viewers with Multiple Article Views in a Day](https://www.dataexpert.io/question/find-multiple-article-viewers)

Write a SQL query to identify all viewers who viewed more than one article on the same day.

The table includes columns

1. viewer_id (the ID of the viewer),
2. article_id (the ID of the article viewed), and
3. view_date (the date of the view).

The result should contain a single column named `viewer_id`, listing each viewer who meets the criteria without duplicates, and should be sorted in ascending order of `viewer_id`.

These are the tables to query for this question:

- *`playground.views`*

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

- *`playground.answers`*

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

- *`playground.us_birth_stats`*

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

- *`playground.automobile`*

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

- *`playground.us_birth_stats`*

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

- *`playground.us_birth_stats`*

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

- *`playground.superstore`*

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

Given two tables, `playground.employees` and `playground.departments`, with employees containing id, full_name, and department, and departments containing id (unique department ID) and dep_name (department name).

Write a SQL query to build a table with one column, `dep_name`. This table should list all the departments that currently have no employees, sorted by the department id.

These are the tables to query for this question:

- *`playground.employees`*

  | Columns | DataTypes |
  |:---|:---|
  | id | int |
  | full_name | string |
  | department | int |

- *`playground.departments`*

  | Columns | DataTypes |
  |:---|:---|
  | id | int |
  | dep_name | string |

Your answer should include these columns:

- `dep_name` varchar

### ➡️ [Solution](DataExpert-SQL08.sql)

## Question 09: [Filtering Students in Active Clubs](https://www.dataexpert.io/question/active-club-members)

Given tables

- clubs (id: unique club id, name: club name)
- students (id: unique student id, name: student name, club_id: club's id)

Return a list from the students table for those who are in clubs that still exist in the clubs table.

The result should have three columns (id, name, club_id) and be sorted by students' ids (id) and include only those students whose club_id matches an id in the clubs table.

These are the tables to query for this question:

- *`playground.clubs`*

  | Columns | DataTypes |
  | :---| :---|
  | id | int |
  | name | string |

- *`playground.students`*

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

## Question 10: [Identifying the Bank Robber](https://www.dataexpert.io/question/bank-robber-identification)

Using table `playground.suspect`, filter out suspects who cannot be the bank robber based on the following clues:

- The robber is not taller than 170cm, and
- Their name matches the pattern "B. Gre?n" where the first letter of the name is "B" or "b" and the surname is similar to "Green" but with the fourth letter being unreadable and potentially any character.
- The match should be case-insensitive. For each suspect that fits these criteria, select their id, name, and surname.
- Order the results by suspect id in ascending order.

These are the tables to query for this question:

- *`playground.suspect`*

  | Columns | DataTypes |
  | :--- | :--- |
  | id | int |
  | name | string |
  | surname | string |
  | height | int |
  | weight | int |

Your answer should include these columns:

- `id` integer
- `name` varchar
- `surname` varchar

### ➡️ [Solution](DataExpert-SQL10.sql)

## Question 11: [Determining the Order of Succession](https://www.dataexpert.io/question/order-of-succession)

Given a table Successors with columns: name, birthday, and gender,

Write a SQL query to list the names of the King's children in order of their succession to the throne and their birthday("name", "birthday").

Succession is based on age seniority. Prefix the name with "King" for males and "Queen" for females. The result should be sorted by birthday in ascending order to determine the succession order.

These are the tables to query for this question:

- *`playground.successors`*

  | Columns | DataTypes |
  | :--- | :--- |
  | name | string |
  | birthday | date |
  | gender | string |

Your answer should include these columns:

- `name` varchar
- `birthday` date

### ➡️ [Solution](DataExpert-SQL11.sql)

## Question 12: [Top Reviewed Customers per Product](https://www.dataexpert.io/question/top-reviewed-customers-per-product)

Using the table playground.product_reviews, write a SQL query to identify, for each product, the customer who provided the highest review score.

If there are ties in review score, the customer with the most helpful votes should be considered top.

The output should include columns for `product_id`, `customer_id`, `review_score`, and `helpful_votes`, capturing the details of the top review for each product ordered in ascending order of `product_id`

These are the tables to query for this question:

- *`playground.product_reviews`*

  | Columns | DataTypes |
  | :--- | :--- |
  | seller_id | int |
  | customer_id | int |
  | product_id | int |
  | review_date | date |
  | review_score | double |
  | helpful_votes | int |

Your answer should include these columns:

- `product_id` integer
- `customer_id` integer
- `review_score` double
- `helpful_votes` integer

### ➡️ [Solution](DataExpert-SQL12.sql)

## Question 13: [Find US Customers Who Rented and Streamed Videos in Early February](https://www.dataexpert.io/question/us-customers-rented-streamed-early-feb)

Write a SQL query to return the US customers who rented a video on February 1st, 2023, and then streamed the same video between February 2nd and February 8th, 2023.

Use the tables `playground.rental` for rental data and `playground.streams` for streaming data.

The output should include unique user IDs of these customers ordered in ascending order.

These are the tables to query for this question:

- *`playground.rental`*

  | Columns | DataTypes |
  | :--- | :--- |
  | country | string |
  | rental_date | date |
  | rental_id | int |
  | user_id | int |

- *`playground.streams`*

  | Columns | DataTypes |
  | :--- | :--- |
  | country | string |
  | stream_date | date |
  | rental_id | int |
  | user_id | int |
  | device_type | string |
  | minutes_streamed | int |

Your answer should include these columns:

- `user_id` integer

### ➡️ [Solution](DataExpert-SQL13.sql)

## Question 14: [Question: Analyze Yearly Profit Performance](https://www.dataexpert.io/question/yearly-profit-performance)

Write a SQL query to analyze the profit performance of the company throughout the years using the `playground.superstore` table.

The output should include the year extracted from the order_date (order_year), the total annual profit (total_profit) rounded to two decimal places, and should be ordered by year in descending order.

These are the tables to query for this question:

- *`playground.superstore`*

| Columns        | DataTypes |
|----------------|-----------|
| row_id         | int       |
| order_id       | string    |
| order_date     | date      |
| ship_date      | date      |
| ship_mode      | string    |
| customer_id    | string    |
| customer_name  | string    |
| segment        | string    |
| country        | string    |
| city           | string    |
| state          | string    |
| postal_code    | int       |
| region         | string    |
| product_id     | string    |
| category       | string    |
| sub_category   | string    |
| product_name   | string    |
| sales          | string    |
| quantity       | string    |
| discount       | string    |
| profit         | double    |

Your answer should include these columns:

- `order_year` integer
- `total_profit` double

### ➡️ [Solution](DataExpert-SQL14.sql)

## Question 15: [Select Rows With Maximum Revenue](https://www.dataexpert.io/question/select-max-revenue-rows)

Write a SQL query to select rows from a given table that have the maximum revenue value for each id.

The resultant table should have three columns - "id", "rev", "content". Additionally, the results should be ordered in descending order by revenue.

These are the tables to query for this question:

- *`playground.revenue`*

  | Columns | DataTypes |
  | :--- | :--- |
  | id | int |
  | rev | int |
  | content | string |

Your answer should include these columns:

- `id` integer
- `rev` integer
- `content` varchar

### ➡️ [Solution](DataExpert-SQL15.sql)

## Question 16: [Salary Range Difference](https://www.dataexpert.io/question/salary-range-difference)

Calculate the difference between the sum of the highest salaries and the sum of the lowest salaries in the company.

The table `playground.employees_salary` contains columns "id" (unique employee ID), "name" (employee's name), and "salary" (employee's salary as a positive integer).

The result should be a single column `difference` with one row representing the calculated difference. If the "playground.employees_salary" table is empty, "difference" should be 0.

These are the tables to query for this question:

- *`playground.employees_salary`*

  | Columns | DataTypes |
  | :--- | :--- |
  | id | int |
  | name | string |
  |salary | int |

Your answer should include these columns:

- `difference` integer

### ➡️ [Solution](DataExpert-SQL16.sql)

## Question 17: [Find Product Prices](https://www.dataexpert.io/question/find-product-prices)

Using the table playground.product_prices, create a SQL query to find all products and their prices on 2023-08-17, assuming the initial price of all products was 10 before any price changes.

Order the results in ascending order of product_id.

These are the tables to query for this question:

- *`playground.product_prices`*
  
  | Columns | DataTypes |
  | :--- | :--- |
  | product_id | int |
  | new_price | int |
  | change_date | date |

Your answer should include these columns:

- `product_id` integer
- `price` integer

### ➡️ [Solution](DataExpert-SQL17.sql)

## Question 18: [Comparing State Fatal Collisions to the National Average](https://www.dataexpert.io/question/state-fatal-collisions)

Using `playground.bad_drivers`, write a SQL query to compare each state’s fatal collisions per billion miles to the national average.

Include a column that indicates whether the state is `Above Average` or `Below Average`.

The resultant table should have three columns, `state`, `fatal_collisions_per_billion_miles` and `comparison_to_national_avg`. Show the result ordered by state name asc.

These are the tables to query for this question:

- *`playground.bad_drivers`*

  | Columns | DataTypes |
  | :-- | :-- |
  | state | string |
  | fatal_collisions_per_billion_miles | double |
  | percent_speeding | int |
  | percent_alcohol_impaired | int |
  | percent_not_distracted | int |
  | percent_no_previous_accidents | int |
  | insurance_premiums | double |
  | losses_per_insured_driver | double |

Your answer should include these columns:

- `state` varchar
- `fatal_collisions_per_billion_miles` double
- `comparison_to_national_avg` varchar

### ➡️ [Solution](DataExpert-SQL18.sql)

## Question 19: [Who are the top 10 authors by number of reviews](https://www.dataexpert.io/question/top-10-authors-by-reviews)

Using bootcamp.books, find the top 10 authors by reviews, no_of_reviews is a string column with bad data, try your best to get the values to parse correctly

These are the tables to query for this question:

- *`bootcamp.books`*

  | Columns | DataTypes |
  | :-- | :-- |
  | s_no | int |
  | price | double |
  | ranks | int |
  | title | string |
  | no_of_reviews | string |
  | ratings | string |
  | author | string |
  | cover_type | string |
  | year | string |
  | genre | string |

Your answer should include these columns:

- `author` varchar
- `number_of_reviews` bigint

### ➡️ [Solution](DataExpert-SQL19.sql)

### ➡️ [Solution From DataExpert.io](https://www.linkedin.com/posts/eczachly_dataengineering-activity-7164347913316290560-hTF3/)

## Question 20: [Finding Highest Grade and Corresponding Course per Student](https://www.dataexpert.io/question/highest-grade-corresponding-course)

Using the table `playground.student_grades`, write a SQL query to find the highest grade and its corresponding course for each student.

In cases where there is a tie for the highest grade, select the course with the smallest course_id.

The output should include student_id, course_id, and the grade, with the results sorted by increasing student_id.

These are the tables to query for this question:

- *`playground.student_grades`*

  | Columns | DataTypes |
  | :--- | :--- |
  | student_id | int |
  | course_id | int |
  | grade | int |

Your answer should include these columns:

- `student_id` integer
- `course_id` integer
- `grade` integer

### ➡️ [Solution](DataExpert-SQL20.sql)

## Question 21: [Summarizing Foreign Competitors by Country with Total Summary](https://www.dataexpert.io/question/foreign-competitors-summary)

Given the `playground.foreign_competitors` table with columns: competitor and country, write a SQL query to calculate the number of competitors per country.

Additionally, include a final summary row that shows "Total:" and the total number of competitors.

The resulting table should have two columns: country and competitors, sorted by competitors and country names in ascending order, and include the summary row at the bottom.

These are the tables to query for this question:

- *`playground.foreign_competitors`*

  | Columns | DataTypes |
  | :--- | :--- |
  | competitor | string |
  | country | string |

Your answer should include these columns:

- `country` varchar
- `competitors` integer

### ➡️ [Solution](DataExpert-SQL21.sql)

## Question 22: [Identifying Active Businesses Based on Event Occurrences](https://www.dataexpert.io/question/active-businesses-identification)

Using the `playground.business_events` table, identify all active businesses. An active business is defined as one that has more than one event type with occurrences greater than the average occurrences of that event type among all businesses.

The goal is to filter businesses based on their activity level, comparing individual event occurrences to the overall average for those event types.

The result should be a table with one column called `business_id` with all the business ids that are active.

These are the tables to query for this question:

- *`playground.business_events`*

  | Columns | DataTypes |
  | :--- | :--- |
  | business_id | int |
  | event_type | string |
  | occurences | int |

Your answer should include these columns:

- `business_id` integer

### ➡️ [Solution](DataExpert-SQL22.sql)

## Question 23: [Calculate 3-Day Rolling Average of Posts per User](https://www.dataexpert.io/question/calculate-3-day-rolling-average)

Using the table `playground.posts`, write a SQL query to calculate the `3-day rolling average` of posts for each user.

The output should include columns: user_id, post_date, and third_rolling_avg, where third_rolling_avg is the 3-day rolling average of *post count* for each user, rounded to 2 decimal places.

The rolling average should be calculated over a specified 3-day period for each user, including the current day and the two preceding days. The result should be ordered in ascending order of post date

These are the tables to query for this question:

- *`playground.posts`*

  | Columns | DataTypes |
  | :--- | :--- |
  | user_id | int |
  | post_date | date |
  | post_count | int |

Your answer should include these columns:

- `user_id` integer
- `post_date` date
- `third_rolling_avg` double

### ➡️ [Solution](DataExpert-SQL23.sql)

## Question 24: [Top 2 Customers with Highest Sales Every Month](https://www.dataexpert.io/question/top-customers-monthly-sales)

Using the table `playground.sales`, Identify the top 2 customers based on their total sales for each month. Display the result based on asc order of their month and rank.

These are the tables to query for this question:

- *`playground.sales`*

  | Columns | DataTypes |
  | :--- | :--- |
  | id | int |
  | month | string |
  | sales  | int |

Your answer should include these columns:

- `id` integer
- `month` varchar
- `total_sales` integer
- `rank` integer

### ➡️ [Solution](DataExpert-SQL24.sql)

## Question 25: [Which states have high risk of fatal collisions involving Alcohol](https://www.dataexpert.io/question/high-risk-state-analysis)

Using `playground.bad_drivers`, determine the states and their percentage of alcohol impaired collisions where the risk of fatal collisions involving alcohol is significantly higher than the national average.

Consider a state as high-risk if its percent_alcohol_impaired is at least 20% higher than the national average. Show the output in descending order of the percent_alcohol_impaired.

These are the tables to query for this question:

- *`playground.bad_drivers`*

  | Columns | DataTypes |
  | :--- | :--- |
  | state | string |
  | fatal_collisions_per_billion_miles | double |
  | percent_speeding | int |
  | percent_alcohol_impaired | int |
  | percent_not_distracted | int |
  | percent_no_previous_accidents | int |
  | insurance_premiums | double |
  | losses_per_insured_driver | double |

Your answer should include these columns:

- `state` varchar
- `percent_alcohol_impaired` integer

### ➡️ [Solution](DataExpert-SQL25.sql)

## Question 26 : [Calculating Available Seats on Flights](https://www.dataexpert.io/question/available-seats-per-flight)

Calculate the number of seats not yet purchased for each flight. Use three tables: `playground.flights` (with columns: flight_id, plane_id), `playground.planes` (with columns: plane_id, number_of_seats), and `playground.purchases` (with columns: flight_id, seat_no).

Each row in purchases is unique for (flight_id, seat_no) pairs. For each flight_id, compute the free_seats as the number of seats not purchased.

Order the results by flight_id in ascending order. Ensure consistency in purchases, with no records for non-existing flight_ids or seat_nos.

These are the tables to query for this question:

- *`playground.flights`*

  | Columns | DataTypes |
  | :--- | :--- |
  | flight_id | int |
  | plane_id | int |

- *`playground.planes`*

  | Columns | DataTypes |
  | :--- | :--- |
  | plane_id | int |
  | number_of_seats | int |

- *`playground.purchases`*

  | Columns | DataTypes |
  | :--- | :--- |
  | flight_id | int |
  | seat_no | int |

Your answer should include these columns:

- `flight_id` integer
- `free_seats` integer

### ➡️ [Solution](DataExpert-SQL26.sql)
