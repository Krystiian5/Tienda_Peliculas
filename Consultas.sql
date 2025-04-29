/* 1. Crea el esquema de la BBDD.

Esquema generado y guardado en archivo con formato .png.
*/

-- 2. Muestra los nombres de todas las películas con una clasificación por edades de ‘R’.

SELECT "title" AS "Nombre_Pelicula",
		"rating" AS  "Clasificacion_Edad"
FROM "film" f
WHERE "rating" = 'R';

-- 3. Encuentra los nombres de los actores que tengan un “actor_id” entre 30 y 40.

SELECT CONCAT("first_name",' ', "last_name" ) as "Nombre_Completo",
		actor_id
FROM "actor" a
WHERE actor_id BETWEEN 30 AND 40
;

-- 4. Obtén las películas cuyo idioma coincide con el idioma original.

SELECT COUNT(film_id) AS "Numero_Peliculas"
FROM film f 
WHERE language_id  = original_language_id 
;


-- 5. Ordena las películas por duración de forma ascendente.

SELECT 	title AS "Titulo",
		length AS "Duracion_Pelicula"
FROM film f 
ORDER BY f.length ;

-- 6. Encuentra el nombre y apellido de los actores que tengan ‘Allen’ en su apellido.

SELECT CONCAT ("first_name", ' ', "last_name") AS "Nombre_Completo"
FROM actor a
WHERE last_name ILIKE 'Allen'
;

/* 7. Encuentra la cantidad total de películas en cada clasificación de la tabla “film” 
 	y muestra la clasificación junto con el recuento.
*/

SELECT 	rating, 
		COUNT(film_id) AS "Total_Peliculas"
FROM film f 
GROUP BY rating 
ORDER BY "Total_Peliculas" DESC ;

/* 8. Encuentra el título de todas las películas que son ‘PG-13’ o tienen una 
 	duración mayor a 3 horas en la tabla film.
 	*/

SELECT title , rating , length
FROM film f 
WHERE rating = 'PG-13' OR length > 180
;

-- 9. Encuentra la variabilidad de lo que costaría reemplazar las películas.

SELECT ROUND(variance(replacement_cost),2) AS "Variabilidad_Coste_Reemplazo"
FROM film f 
;

-- 10. Encuentra la mayor y menor duración de una película de nuestra BBDD.

SELECT 	MAX (length) AS "Pelicula_Mas_Larga",
		MIN (length) AS "Pelicula_Menos_Larga"
FROM film f 
;

-- 11. Encuentra lo que costó el antepenúltimo alquiler ordenado por día.

SELECT r.rental_id, rental_date , amount 
FROM payment p 
INNER JOIN rental r 
ON p.rental_id = r.rental_id 
ORDER BY r.rental_date DESC 
LIMIT 1
OFFSET 2;

/* 12. Encuentra el título de las películas en la tabla “film” que no sean ni ‘NC17’ 
ni ‘G’ en cuanto a su clasificación. */

SELECT 	title AS "Titulp_Pelicula", 
		rating AS "Clasificacion"
FROM  film f 
WHERE rating <> 'NC-17' AND rating <> 'G'
;

/* 13. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film 
 y muestra la clasificación junto con el promedio de duración. */

SELECT rating AS "Clasificacion",
ROUND(AVG(length),2) AS "Promedio_Duracion"
FROM film f 
GROUP BY f.rating ;

-- 14. Encuentra el título de todas las películas que tengan una duración mayor a 180 minutos.

SELECT 	title AS "Titulo_Pelicula",
		length AS "Duracion"
FROM film f 
WHERE length > 180;

-- 15. ¿Cuánto dinero ha generado en total la empresa?

SELECT SUM(amount) AS "Total_Ingresos"
FROM payment p 
;

-- 16. Muestra los 10 clientes con mayor valor de id

SELECT 	customer_id ,
		CONCAT("first_name", ' ', "last_name") AS "Nombre_Cliente"
FROM customer c 
ORDER BY c.customer_id DESC 
LIMIT 10;

-- 17.  Encuentra el nombre y apellido de los actores que aparecen en la película con título ‘Egg Igby’.

SELECT CONCAT(a."first_name", ' ' , a."last_name") AS "Nombre_Actores"
FROM actor a  
INNER JOIN film_actor f ON a.actor_id = f.actor_id
INNER JOIN film f2 ON f.film_id = f2.film_id 
WHERE title ILIKE 'Egg Igby';

-- 18. Selecciona todos los nombres de las películas únicos.

SELECT DISTINCT (title) AS "Titulo_Pelicula"
FROM film f 
;

/* 19.Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos 
 en la tabla “film”.*/

SELECT 	f.title AS "Titulo_Pelicula",
		c."name" AS "Categoria",
		f.length AS "Duracion"
FROM film f 
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
WHERE c."name" ILIKE 'Comedy' AND f.length > 180
;

/* 20. Encuentra las categorías de películas que tienen un promedio de duración superior a 110 minutos 
 	y muestra el nombre de la categoría junto con el promedio de duración.*/
 
SELECT 	c."name" AS "Categoria",
		ROUND(AVG (length),2) AS "Promedio_Duracion"
FROM film f 
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
GROUP BY c."name"
HAVING ROUND(AVG (length),2) > 110;













