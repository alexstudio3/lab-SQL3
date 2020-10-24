
-- lab 3.2
use sakila;

-- Write a query to display for each store its store ID, city, and country.
-- store, address, city, country

select s.store_id, c.city, co.country
from store as s
join address as a
on s.address_id = a.address_id 
join city as c
on a.city_id = c.city_id
join country as co
on co.country_id = c.country_id;

-- Write a query to display how much business, in dollars, each store brought in.
-- store, customer, payment
 select s.store_id, SUM(p.amount)
 from store as s
 join customer as cu
 on s.store_id = cu.customer_id
 join payment as p
 on cu.customer_id = p.customer_id
 group by s.store_id;

-- What is the average running time of films by category?
-- film, film_category
select fc.category_id, avg(f.length)
from film as f
join film_category as fc
on f.film_id = fc.film_id
group by fc.category_id;

-- Which film categories are longest? - cateogires have the longest films
-- film, category
select fc.category_id, max(f.length)
from film as f
join film_category as fc
on f.film_id = fc.film_id
group by fc.category_id
order by max(f.length);

-- Display the most frequently rented movies in descending order.
-- film, inventory, rental
select f.film_id, count(rental_id) as frequency
from film as f 
join inventory as i 
on f.film_id = i.film_id
join rental as r
on r.inventory_id = i.inventory_id 
group by f.film_id
order by frequency desc;

-- List the top five genres in gross revenue in descending order.
-- category, film
select fc.category_id, sum(p.amount) as gross_rev
from film as f
join film_category as fc 
on f.film_id = fc.film_id
join inventory as i 
on i.film_id = f.film_id
join rental as r
on r.inventory_id = i.inventory_id
join payment as p
on p.rental_id = r.rental_id
group by fc.category_id
order by gross_rev 
limit 5;

-- Is "Academy Dinosaur" available for rent from Store 1?
select * 
from film f
join inventory as i 
on i.film_id = f.film_id
join rental as r 
on r.inventory_id = i.inventory_id
where f.title = "Academy Dinosaur" and i.store_id = 1;

-- yes , if we have moved the films to store 1 
-- Q - inventory id is 1? inventory id is from 1-8, means we have 8 copies?


