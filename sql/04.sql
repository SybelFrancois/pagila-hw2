/*
 * Select the titles of all films that the customer with
 customer_id=1 has rented more than 1 time.
 *
 * HINT:
 * It's possible to solve this problem both wi
 th and without subqueries.
 */

select title from film join inventory using (film_id) 
join rental using (inventory_id)  
where rental.customer_id =1 
group by film.film_id having count(*) > 1;
