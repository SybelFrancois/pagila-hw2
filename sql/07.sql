/*
 * A group of social scientists is studying American movie watching habits.
 * To help them, select the titles of all films that have never been rented by someone who lives in the United States.
 *
 * NOTE:
 * Not every film in the film table is available in the store's inventory,
 * and you should only return films in the inventory.
 *
 * HINT:
 * This can be solved either with a LEFT JOIN or with the NOT IN operator.
 * You may choose whichever solution makes the most sense to you.
 */

select title
from film
where film_id not in (
  select distinct film.film_id
  from rental
  join inventory on rental.inventory_id = inventory.inventory_id
  join film on inventory.film_id = film.film_id
  join customer on rental.customer_id = customer.customer_id
  join address on customer.address_id = address.address_id
  join city on address.city_id = city.city_id
  join country on city.country_id = country.country_id
  where country.country = 'United States'
  )
  and film.film_id in (
    select distinct inventory.film_id from inventory
  ) order by title;

