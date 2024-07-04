USE sakila;

-- Subqueries Lab:

-- Write SQL queries to perform the following tasks using the Sakila database:

-- 1) Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.

-- Using Subquery
SELECT COUNT(*)
FROM inventory
WHERE film_id = (SELECT film_id FROM film WHERE title = "HUNCHBACK IMPOSSIBLE");

-- Using Joins 
SELECT COUNT(*)
FROM inventory i
JOIN film f
USING (film_id)
WHERE f.title = "HUNCHBACK IMPOSSIBLE";

-- 2) List all films whose length is longer than the average length of all the films in the Sakila database.

-- Total avg_lenght off all films:
SELECT ROUND(AVG(length), 2) AS avg_length FROM film;

SELECT * 
FROM film
WHERE length > (SELECT ROUND(AVG(length), 2) AS avg_length FROM film);

-- 3) Use a subquery to display all actors who appear in the film "Alone Trip".

SELECT a.*
FROM actor a
JOIN film_actor fa 
USING (actor_id)
WHERE fa.film_id = (SELECT film_id FROM film WHERE title = 'Alone Trip');

-- Bonus:

-- 4) Sales have been lagging among young families, and you want to target family movies for a promotion. 
--    Identify all movies categorized as family films.
--    Since there is no contetx I'll assume 'Family films' are category_id = 9

SELECT * 
FROM film f
JOIN film_category fc USING (film_id)
WHERE fc.category_id = 9;

-- 5) Retrieve the name and email of customers from Canada using both subqueries and joins. 
-- To use joins, you will need to identify the relevant tables and their primary and foreign keys.

-- Info we need:
-- What from customer table: names, email 
-- Join: customer with address on (address_id)
-- Join: address with city on (city_id)
-- Join: city with country on (country_id)
-- Get: country from country table 

SELECT cu.*
FROM customer cu
JOIN address a 
USING (address_id)
JOIN city ci
USING (city_id)
JOIN country co
USING (country_id) 
WHERE co.country = 'Canada';


