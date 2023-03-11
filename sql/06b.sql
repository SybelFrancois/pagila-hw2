/*
 * This problem is the same as 06.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */



 select film.title from film 
 where film.film_id not in (select inventory.film_id from inventory) 
 group by film.title order by film.title asc;
