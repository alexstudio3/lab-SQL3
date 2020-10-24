use sakila;

-- SQL Self and cross join

-- Get all pairs of actors that worked together
select * 
from film_actor as fa
join film_actor as fa2 
where fa.actor_id <> fa2.actor_id 
and fa.film_id = fa2.film_id;


-- not done
-- Get all pairs of customers that have rented the same film 
-- more than 3 times. 
-- Q 
select c1.customer_id, c2.customer_id, count(*) as num_films
from sakila.customer c1

inner join rental r1 on r1.customer_id = c1.customer_id
inner join inventory i1 on r1.inventory_id = i1.inventory_id
inner join film f1 on i1.film_id = f1.film_id
inner join inventory i2 on i2.film_id = f1.film_id
inner join rental r2 on r2.inventory_id = i2.inventory_id
inner join customer c2 on r2.customer_id = c2.customer_id

where c1.customer_id <> c2.customer_id
group by c1.customer_id, c2.customer_id
having count(*) > 3
order by num_films desc;

-- Get all possible pairs of actors and films.
-- cross join
-- select * from db.table1 as alias1 cross join db.table2 as alias2

select * from actor as a 
-- join film_actor as b
cross join film as c;




