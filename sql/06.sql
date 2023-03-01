/*
 * Management wants to purchase new films that they don't already have.
 * Select a list of all films in the film table that are not in the inventory table.
 *
 * HINT:
 * This can be done by either using a LEFT JOIN or by using the NOT IN clause and a subquery.
 */



 select film.title from film left join inventory using (film_id) where inventory.inventory_id is null group by inventory_id, film.title order by film.title asc;
