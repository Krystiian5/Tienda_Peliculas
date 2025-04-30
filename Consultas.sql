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

SELECT 	CONCAT(a."first_name", ' ' , a."last_name") AS "Nombre_Actores",
		title AS "Titulo_Pelicula"
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

-- 21.  ¿Cuál es la media de duración del alquiler de las películas?

SELECT Round(AVG(rental_duration),2) AS "Media_Duracion"
FROM film f ;

-- 22. Crea una columna con el nombre y apellidos de todos los actores y actrices.

SELECT CONCAT (first_name, ' ', last_name ) AS Nombre_completo
FROM actor a ;

-- 23. Números de alquiler por día, ordenados por cantidad de alquiler de forma descendente.

SELECT 	date (rental_date) AS "Fecha",
		count (*) AS "Cantidad_Alquileres"
FROM rental
GROUP BY date (rental_date )
ORDER BY "Cantidad_Alquileres" DESC ;

-- 24. Encuentra las películas con una duración superior al promedio.

SELECT 	title AS "Titulo_Pelicula", 
		length AS "Duracion" 
FROM film f 
WHERE length > (SELECT Round(AVG(length),2)
				FROM film f );

-- 25. Averigua el número de alquileres registrados por mes.

SELECT 	To_Char (rental_date, 'YYYY-MM') AS  "Mes",
		COUNT(*) AS "Cantidad_Alquileres"
FROM rental r 
GROUP BY "Mes" 
ORDER BY "Mes" 
;

-- 26. Encuentra el promedio, la desviación estándar y varianza del total pagado.

SELECT 	ROUND (AVG(amount),2) AS "Promedio",
		ROUND (stddev(amount),2) AS "Desviacion_Estandar",
		ROUND (Variance (amount),2) AS "Varianza"
FROM payment p 
;

-- 27. ¿Qué películas se alquilan por encima del precio medio?

SELECT 	title AS "Titulo_Pelicula",
		rental_rate AS "Precio_Alquiler"
FROM film f 
WHERE (rental_rate) > ( 
						SELECT 	ROUND (AVG(rental_rate),2)
						FROM film f2  	
										);
-- 28. Muestra el id de los actores que hayan participado en más de 40 películas.

SELECT 	actor_id , 
		count (film_id) AS "Cantidad_Peliculas"
FROM film_actor fa 
GROUP BY actor_id 
HAVING COUNT(film_id) > 40 ;

/* 29. Obtener todas las películas y, si están disponibles en el inventario, 
 mostrar la cantidad disponible.*/

SELECT 	f.title AS "Titulo_Pelicula",
		COUNT(inventory_id) AS "Cantidad_Disponible"
FROM film f 
LEFT JOIN inventory i 
ON f.film_id = i.film_id
GROUP BY f.title 
ORDER BY "Cantidad_Disponible" DESC 
;

-- 30. Obtener los actores y el número de películas en las que ha actuado.

SELECT 	concat(first_name , ' ' , last_name ) AS "Actor_Nombre_Completo" ,
		count (film_id) AS "Cantidad_Peliculas"
FROM film_actor fa 
INNER JOIN actor a 
ON fa.actor_id = a.actor_id
GROUP BY a.actor_id 
ORDER BY "Cantidad_Peliculas" DESC 
 ;

/* 31. Obtener todas las películas y mostrar los actores que han actuado en ellas, 
 incluso si algunas películas no tienen actores asociados. */

SELECT 	f.title AS "Titulo_Pelicula",
		concat(a.first_name , ' ' , a.last_name ) AS "Actor_Nombre_Completo"
FROM film f 
LEFT JOIN film_actor fa ON f.film_id = fa.film_id
LEFT JOIN actor a ON fa.actor_id =a.actor_id
ORDER BY f.title, "Actor_Nombre_Completo" 
;

/* 32. Obtener todos los actores y mostrar las películas en las que han
actuado, incluso si algunos actores no han actuado en ninguna película.*/

SELECT 	f.title AS "Titulo_Pelicula",
		concat(a.first_name , ' ' , a.last_name ) AS "Actor_Nombre_Completo"
FROM film f 
RIGHT JOIN film_actor fa ON f.film_id = fa.film_id
RIGHT JOIN actor a ON fa.actor_id =a.actor_id
ORDER BY f.title, "Actor_Nombre_Completo" 
;

-- 33. Obtener todas las películas que tenemos y todos los registros de alquiler.

SELECT 	f.title AS "Titulo_Pelicula",
		r.rental_id ,
		r.rental_date AS "Fecha_Alquiler",
		r.return_date AS "Fecha_Devolucion",
		r.customer_id
FROM film f 
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
;

-- 34. Encuentra los 5 clientes que más dinero se hayan gastado con nosotros.

SELECT 	c.customer_id AS "Identificador",
		CONCAT (c.first_name , ' ', c.last_name ) AS "Cliente_Nombre_Completo",
		ROUND(SUM(p.amount),2) AS "Gasto_Total"
FROM customer c  
INNER JOIN payment p  ON c.customer_id = p.customer_id
GROUP BY c.customer_id, "Cliente_Nombre_Completo" 
ORDER BY "Gasto_Total" DESC
LIMIT 5
;

-- 35. Selecciona todos los actores cuyo primer nombre es 'Johnny'.

SELECT CONCAT ("first_name", ' ', "last_name") AS "Nombre_Completo"
FROM actor a
WHERE first_name  ILIKE 'Johnny'
;

-- 36. Renombra la columna “first_name” como Nombre y “last_name” como Apellido.

SELECT 	first_name  AS "Nombre",
		last_name AS "Apellido"
FROM actor a ;

-- 37. Encuentra el ID del actor más bajo y más alto en la tabla actor.

SELECT 	actor_id ,
		CONCAT (first_name, ' ', last_name ) AS "Nombre_Completo"
FROM actor a 
WHERE 	actor_id = (	SELECT MIN (actor_id)
						FROM actor a2 ) 
	OR	actor_id = (SELECT MAX (actor_id )
					FROM actor a2 )
;

-- 38.  Cuenta cuántos actores hay en la tabla “actor”.

SELECT COUNT(*) AS "Total_Actores"
FROM actor a 
;

-- 39. Selecciona todos los actores y ordénalos por apellido en orden ascendente.

SELECT 	first_name AS "Nombre",
		last_name AS "Apellido"
FROM actor a 
ORDER BY "Apellido" 
;

-- 40. Selecciona las primeras 5 películas de la tabla “film”.

SELECT 	film_id ,
		title AS "Titulo_Pelicula"
FROM film f 
LIMIT 5;

/* 41. Agrupa los actores por su nombre y cuenta cuántos actores tienen el mismo nombre. 
¿Cuál es el nombre más repetido?*/

SELECT 	first_name AS "Nombre",
		COUNT(*) AS "Numero_Actores"
FROM actor a 
GROUP BY a.first_name
ORDER BY "Numero_Actores" DESC 
;

-- 42. Encuentra todos los alquileres y los nombres de los clientes que los realizaron.

SELECT 	rental_id ,
		CONCAT (first_name, ' ', last_name ) AS "Cliente_Nombre_Completo",
		rental_date AS "Fecha_Alquiler"
FROM rental r 
INNER JOIN customer c ON r.customer_id = c.customer_id
ORDER BY "Fecha_Alquiler" 
;

/* 43. Muestra todos los clientes y sus alquileres si existen, incluyendo 
aquellos que no tienen alquileres. */

SELECT 	c.customer_id ,
		rental_id ,
		CONCAT (first_name, ' ', last_name ) AS "Cliente_Nombre_Completo",
		rental_date AS "Fecha_Alquiler"
FROM customer c 
LEFT JOIN rental r ON c.customer_id = r.customer_id
;

/* 44. Realiza un CROSS JOIN entre las tablas film y category. ¿Aporta valor
esta consulta? ¿Por qué? Deja después de la consulta la contestación. */

SELECT *
FROM film f 
CROSS JOIN category c ;

/* No aporta un valor analítico realista ya que simplemente está uniendo ambas tablas generando 
 combinaciones hipotéticas.*/

-- 45. Encuentra los actores que han participado en películas de la categoría 'Action'.






