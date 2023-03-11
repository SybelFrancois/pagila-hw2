/*
 * Management is planning on purchasing new inventory.
 * Films with special features cost more to purchase than films without special features,
 * and so management wants to know if the addition of special features impacts revenue from movies.
 *
 * Write a query that for each special_feature, calculates the total profit of all movies rented with that special feature.
 *
 * HINT:
 * Start with the query you created in pagila-hw1 problem 16, but add the special_features column to the output.
 * Use this query as a subquery in a select statement similar to answer to the previous problem.
 */



select t.special_feature, sum(t.profit) as profit  
from (select unnest(film.special_features) as special_feature, 
      SUM(payment.amount) as profit 
      from film 
      join inventory using (film_id) 
      join rental using (inventory_id) 
      join payment using (rental_id) 
      group by film.film_id, unnest(film.special_features)) t 
      group by  t.special_feature 
      order by t.special_feature asc;
