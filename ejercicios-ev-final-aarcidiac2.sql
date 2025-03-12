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

-- 3. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos


