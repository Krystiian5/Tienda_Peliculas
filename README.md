# Tienda_Peliculas

- Creamos nueva conexión con el nombre de Proyecto_SQL.
- Creamos una nueva base de datos en la conexión creada llamada Tienda_Peliculas.
- Vinculamos la base de datos descargados con la base de datos creada en Dbeaver llamada Tienda_Peliculas.

# Consultas Resueltas

1. **Crea el esquema de la BBDD.** Generamos el diagrama para poder analizar todas las tablas en la base de datos proporcionada y guardamos el diagrama en formato .png.
2. **Muestra los nombres de todas las películas con una clasificación por edades de ‘R’.** Vemos que hay un total de 195 películas clasificadas por edades R.
3. **Encuentra los nombres de los actores que tengan un “actor_id” entre 30 y 40.** Añadimos a la función básica del WHERE el BETWEEN.
4. **Obtén las películas cuyo idioma coincide con el idioma original.** Añadimos la función de agregación de COUNT y vemos que hay 0 resultados, ya que en la columna de original_language_id no hay ningún dato.
5. **Ordena las películas por duración de forma ascendente.** Añadimos la función de ordenación. El ORDER BY ya las ordena por defecto de manera Ascendente. Igualmente se puede añadir ASC.
6. **Encuentra el nombre y apellido de los actores que tengan ‘Allen’ en su apellido.** Introducimos el ILIKE para que encuentre en el apellido la palabra Allen sin tener encuenta las mayúsculas y vemos que hay un total de 3 personas con ese apellido.
7. **Encuentra la cantidad total de películas en cada clasificación de la tabla “film” y muestra la clasificación junto con el recuento.** Agrupamos la columna de rating y la ordenamos de manera descendente para ver que la clasificación con mayor número de películas es la de PG-13 con un total de 223 y la menor sería G con un total de 178 películas.
8. **Encuentra el título de todas las películas que son ‘PG-13’o tienen una duración mayor a 3 horas en la tabla film.** Entendemos que la columna Length está en minutos. Por lo que pondriamos la condición de sacar los títulos que sean de PG-13 OR las que tengan una Length de más de 180 minutos.
9. **Encuentra la variabilidad de lo que costaría reemplazar las películas.** Aplicamos la función de varianza redondeándola a 2 decimales y lo que costaría reemplazar las películas sería 36,61.
10. **Encuentra la mayor y menor duración de una película de nuestra BBDD.** Utilizamos las funciones de agregación de MAX y MIN y vemos que las películas más largas son de 185 minutos y las menos largas de 46 minutos.
11. **Encuentra lo que costó el antepenúltimo alquiler ordenado por día.** Utilizamos el INNER JOIN para obtener los datos de las tablas de payments y rental. Lo ordenamos de manera descendente y le aplicamos un limite de 1 con un OFFset de 2 ya que queremos obtener el antepenúltimo día. Vemos que el coste fue de 0.
12. **Encuentra el título de las películas en la tabla “film” que no sean ni ‘NC17’ ni ‘G’ en cuanto a su clasificación.** Utilizamos el where con los símbbolos <> (distinto a ).
13. **Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.** Utilizamos AVG para calcular el promedio y luego agrupamos "rating" para que calcule el promedio de cada clasificación.
14. **Encuentra el título de todas las películas que tengan una duración mayor a 180 minutos.** En el Where utilizamos > (mayor a ). Vemos que hay un total de 39 películas con más de 180 minutos de duración.
15. **¿Cuánto dinero ha generado en total la empresa?** Utilizamos la función de Agregación SUM y sumamos la columna amounnt de la tabla payments. Nos da un total de 67.416,51.
16. **Muestra los 10 clientes con mayor valor de id** Ordenamos el customer_id de manera descendente y le aplicamos un limite de 10. Concatenamos el nombre completo del cliente para que esté más claro.
17. **Encuentra el nombre y apellido de los actores que aparecen en la película con título ‘Egg Igby’.** Utilizamos 2 INNER JOIN, primero el de la tabla actor con la de film_actor y luego con la de film. Concatenamos nombre y apellidos de actores y vemos que hay 5 actores que aparecen en esa película específica.
18. **Selecciona todos los nombres de las películas únicos.** Utilizamos el Distinct para que saque los valores únicos, eliminando duplicados si los hubiese.
19. **Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla “film”.** Utilizamos el JOIN para unir las tablas de film, film_category y category. Filtramos con el where por comedia y duración de más de 180 minutos. Vemos que hay 3 películas con esas características.
20. **Encuentra las categorías de películas que tienen un promedio de duración superior a 110 minutos y muestra el nombre de la categoría junto con el promedio de duración.** Utilizamos el JOIN para conectar la tabla film con film_id y category. Agrupamos el nombre de las categorías. Calculamos el promedio de duración por categoría y filtramos con un HAVING para obtener el promedio  que sea mayor a 110  minutos.
21. **¿Cuál es la media de duración del alquiler de las películas?** Sacamos la media de la columna de rental_duration de la tabla films y nos da 4,99.
22. **Crea una columna con el nombre y apellidos de todos los actores y actrices.** Concatenamos el nombre y apellidos de la tabla actor.
23. **Números de alquiler por día, ordenados por cantidad de alquiler de forma descendente.** Extraemos la fecha sin la hora con Date (Rental_Date), contamos cuantos alquileres hay en esa fecha y agrupamos por fecha de cada día. Por último ordenamos de manera descendente y vemos que el día con más cantidad de alquileres fue el 31/07/2005.
24. **Encuentra las películas con una duración superior al promedio.** Realizamos primero la subconsulta de cuánto es el promedio de duración de cada película y luego la añadimos a la consulta principal para seleccionar solo las películas que superen ese promedio de duración.
25. **Averigua el número de alquileres registrados por mes.** Extraemos la fecha con el mes y el año y agrupamos por meses.
26. **Encuentra el promedio, la desviación estándar y varianza del total pagado.** Aplicamos las funciones de promedio, desviación estándar y varianza.
27. **¿Qué películas se alquilan por encima del precio medio?** Creamos una subconsulta para calcular el precio promedio de alquiler (2,98) y la integramos a la consulta principal que nos devolverá los títulos de las películas por encima de ese precio.
28. **Muestra el id de los actores que hayan participado en más de 40 películas.** La tabla film_actor relaciona actores con películas. Agrupamos el actor_id, y filtramos contando el total de películas mayor a 40. Solo hay dos actores/es con más de 40 películas.
29. **Obtener todas las películas y, si están disponibles en el inventario, mostrar la cantidad disponible.** Unimos las tablas de film y inventory utilizando un LEFT JOIN para asegurarnos de que aparezcan todas las películas, haya en inventario o no. Agrupamos por título y ordenamos de manera descendente.
30. **Obtener los actores y el número de películas en las que ha actuado.** Unimos las tablas de actor y film_actor con un INNER JOIN. Agrupamos por actor_id y ordenamos de manera descendente para ver que la actriz con mayor número de películas es Gina Degeneres.
31. **Obtener todas las películas y mostrar los actores que han actuado en ellas, incluso si algunas películas no tienen actores asociados.** Unimos las tablas film, film_actor y actor con un LEFT JOIN desde la tabla film para asegurar que todas las películas estén incluidas.
32. **Obtener todos los actores y mostrar las películas en las que han actuado, incluso si algunos actores no han actuado en ninguna película.** Unimos las tablas actor, film_actor y film con un RIGHT JOIN desde la tabla actor para asegurar que todos los actores estén incluidos.
33. **Obtener todas las películas que tenemos y todos los registros de alquiler.** Combinamos las tablas film, inventory y rental con un LEFT JOIN para que muestre todas las películas, incluso las no alquiladas.
34. **Encuentra los 5 clientes que más dinero se hayan gastado con nosotros.** Sumamos los pagos realizados por cada cliente. Agrupamos por cliente y lo ordenamos de mayor a menor, con un límite de 5 para que aparezcan los 5 primeros.
35. **Selecciona todos los actores cuyo primer nombre es 'Johnny'.** Introducimos el ILIKE para que encuentre en el nombre la palabra Johnny sin tener encuenta las mayúsculas y vemos que hay un total de 2 personas con ese nombre.
