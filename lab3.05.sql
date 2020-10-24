-- lab 3.05
use sakila;
-- How many copies of the film Hunchback Impossible exist in the inventory system?


-- Customers who spent more than the average.

-- calculate the average of sum amount 
-- 
select customer_id, sum(amount) as sum_amount
from payment 
group by customer_id;

-- 285 rows




