USE Sakila;

-- 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados.

SELECT DISTINCT(title)
FROM film

-- 2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".

SELECT *
FROM film -- Miro un momento la tabla para ver en qué columna está la clasificaicón

SELECT title
FROM film
WHERE rating = 'PG-13';

-- 3. Encuentra el título  y la descripción de todas las películas que contengan la palabra 'amazing' en su descripción

SELECT title, description
FROM film
WHERE description LIKE '%amazing%';

-- 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos

SELECT title
FROM film
WHERE length > 120;

-- 5. Recupera los nombres de todos los actores.

SELECT first_name
FROM actor;

-- 6.Encuentra el nombre y apellido de los actores que tengan 'Gibson' en su apellido.

SELECT first_name, last_name
FROM actor
WHERE last_name LIKE '%gibson%';

-- 7. Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.

SELECT actor_id, first_name
FROM actor 
WHERE actor_id >10 AND actor_id < 20;

-- 8. Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación

SELECT title
FROM film
WHERE rating NOT IN ('R', 'PG-13');

-- 9. Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento.

SELECT rating, COUNT(*) AS num_pelis
FROM film
GROUP BY rating;

/* 10.Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, 
su nombre y apellido junto con la cantidad de películas alquiladas.*/

SELECT rental.customer_id, COUNT(*) AS pelis_alquiladas, customer.first_name, customer.last_name
FROM rental
INNER JOIN customer
ON rental.customer_id = customer.customer_id
GROUP BY rental.customer_id, customer.first_name, customer.last_name;

-- 11. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.

SELECT category.name AS categoria, COUNT(*) AS num_alquileres  -- Info que me pide el ejercicio
FROM rental
INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id 
INNER JOIN film_category ON film_category.film_id = inventory.film_id
INNER JOIN category ON film_category.category_id = category.category_id
GROUP BY category.name;


-- 12 Encuentra el promedio de duración de las películas para cada clasifiación de la tabla film y muestra la clasificación junto con el promedio de duración.

SELECT rating, AVG(length)
FROM film
GROUP BY rating;

-- 13. Encuentra el nombre y apellido de los actores que aparecen en la película con title 'Indian Love'.

SELECT first_name, last_name
FROM actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
INNER JOIN film ON film_actor.film_id = film.film_id
WHERE film.title = 'Indian Love';

-- 14. Muestra el título de todas las películas que contengan la palabra 'dog' o 'cat' en su descripción

SELECT title
FROM film
WHERE description LIKE '%dog%' OR '%cat%';

-- 15 Hay algún actor o actriz que no aparezca en ninguna película en la tabla film_actor. 

SELECT actor.first_name, actor.last_name
FROM actor
LEFT JOIN film_actor ON actor.actor_id = film_actor.actor_id -- Con left join podemos asegurarnos de mantener todos los registros de actor aunq no haya coincidencias con film actor
WHERE film_actor.film_id IS NULL; 

-- 16.Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.

SELECT title
FROM film
WHERE release_year > 2005 AND release_year < 2010;

-- 17. Encuentra el título de todas las películas que son de la misma categoría que 'Family'

SELECT title
FROM film
INNER JOIN film_category ON film_category.film_id = film.film_id
INNER JOIN category ON category.category_id = film_category.category_id
WHERE category.name = 'Family';

-- 18. Muestra el nombre y apellido de los actores aparecen en más de 10 películas

SELECT first_name, last_name, COUNT(film_actor.film_id) AS num_pelis
FROM actor
INNER JOIN film_actor ON film_actor.actor_id = actor.actor_id
GROUP BY first_name, last_name
HAVING COUNT(film_actor.film_id) > 10;

-- 19. Encuentra el título de todas las películas que son 'R' y tienen una duración mayor a 2 horas en la tabla film

SELECT title
FROM film
WHERE rating = 'R' AND length > 120;


