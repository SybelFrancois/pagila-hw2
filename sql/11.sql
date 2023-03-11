/*
 * List the name of all actors who have appeared in a movie that has the 
 'Behind the Scenes' special_feature
 */



with t as (
  select film_id
  from film
  where 'Behind the Scenes' = any(special_features)
)
select distinct actor.first_name || ' ' || actor.last_name as "Actor Name"
from actor
join film_actor on actor.actor_id = film_actor.actor_id
join t on film_actor.film_id = t.film_id
join inventory on t.film_id = inventory.film_id
join rental on inventory.inventory_id = rental.inventory_id
join payment on rental.rental_id = payment.rental_id
order by "Actor Name";

