/*
 * Management wants to advertise to actors,
 * and needs a list of all actors who are not also customers.
 *
 * Assume that if an entry in the customer and actor table share a first_name and last_name,
 * then they represent the same person.
 * Then select all actors who are not also customers.
 *
 * HINT:
 * This can be solved using either a LEFT JOIN or the NOT IN operator.
 */

SELECT DISTINCT
    actor.last_name,
    actor.first_name
FROM actor
INNER JOIN film_actor USING (actor_id)
INNER JOIN film USING (film_id)
INNER JOIN inventory USING (film_id)
INNER JOIN rental USING (inventory_id)
LEFT JOIN customer USING (customer_id)
ORDER BY actor.last_name, actor.first_name
;
