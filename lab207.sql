USE sakila;

SELECT * FROM film_category;

-- 1. How many films are there for each of the categories in the category table

SELECT fc.category_id, COUNT(film_id) AS Number_films
FROM sakila.film_category fc
INNER JOIN sakila.film c
USING (film_id)
GROUP BY fc.category_id; 

-- 2. Display the total amount rung up by each staff member in August of 2005

SELECT s.first_name, s.last_name, SUM(p.amount) AS Total_amount
FROM sakila.staff s
INNER JOIN sakila.payment p
USING (staff_id)
GROUP BY p.staff_id;

-- 3. Which actor has appeared in the most films?

SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS Number_appearences
FROM sakila.actor a
INNER JOIN sakila.film_actor fa
USING (actor_id)
GROUP BY actor_id
ORDER BY Number_appearences DESC
LIMIT 1;

-- 4. Most active customer (the customer that has rented the most number of films)

SELECT c.first_name, c.last_name, COUNT(r.rental_id) AS Total_Rentals
FROM sakila.rental as r
INNER JOIN sakila.customer AS c 
USING(customer_id)
GROUP BY customer_id
ORDER BY Total_Rentals DESC
LIMIT 1;

-- 5. Display the first and last names, as well as the address, of each staff member.

SELECT s.first_name, s.last_name, a.address
FROM sakila.staff s
INNER JOIN sakila.address a
USING(address_id);

-- 6. List each film and the number of actors who are listed for that film.

SELECT f.title, COUNT(actor_id) AS Number_actors
FROM sakila.film f
INNER JOIN sakila.film_actor fa
USING (film_id)
GROUP BY title;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

SELECT last_name, first_name, SUM(p.amount) AS Total_paid
FROM sakila.payment p
INNER JOIN sakila.customer c
USING(customer_id)
GROUP BY customer_id
ORDER BY last_name ASC;

-- 8. List number of films per category.

SELECT c.name, COUNT(fc.film_id) AS Number_films
FROM sakila.category c
INNER JOIN sakila.film_category fc
USING(category_id)
GROUP BY category_id;

SELECT c2.name genre, COUNT(c2.name) appear 
FROM category c2 
INNER JOIN film_category fc 
ON c2.category_id = fc.category_id 
INNER JOIN film_actor fa 
ON fc.film_id = fa.film_id 
JOIN actor a ON fa.actor_id = a.actor_id 
WHERE a.actor_id = 1
GROUP by c2.name, c2.category_id
ORDER by appear ASC;

