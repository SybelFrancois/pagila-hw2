/*
 * Use a subquery to select the film_id and title columns
 * for all films whose rental_rate is greater than the average.
 * Use the film table and order by title.
 *
 * HINT:
 * The postgresqltutorial.com website has a solution for this problem.
 */


 select t.film_id, t.title
from (
  select film_id, title, rental_rate
  from film
) t
where t.rental_rate > (select avg(rental_rate) from film)
order by t.title;

