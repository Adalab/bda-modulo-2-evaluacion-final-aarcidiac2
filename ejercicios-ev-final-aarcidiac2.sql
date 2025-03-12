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



