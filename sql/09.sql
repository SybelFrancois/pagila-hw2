/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */


 select t.special_features, count(title)  from (select title, rating, unnest(special_features) as special_features from film) t group by t.special_features order by t.special_features;
