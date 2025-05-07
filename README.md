# 🎬 Proyecto SQL: Análisis Lógico de Base de Datos de Videoclub_Mediterraneo

## 1. Descripción General y Objetivo del Proyecto 🧾
En este proyecto vamos a aplicar y demostrar competencias en SQL mediante el uso de PostgreSQL y la herramienta DBeaver y tiene como objetivo realizar un  análisis detallado de una base de datos relacional de nuestra empresa de alquiler de películas. Para ello se van a realizar múltiples consultas SQL para explorar las relaciones entre clientes, películas, actores, alquileres, tiendas y personal.

## 2. Herramientas Utilizadas 🛠️

- **PostgreSQL:** Sistema gestor de base de datos relacional.
- **DBeaver:** Entorno gráfico para conexión, consulta y análisis de datos en bases de datos SQL.
- **GitHub:** Para la entrega del proyecto.

## 3. Estructura del Repositorio
```bash
--- Data
	-- BBDD_Proyecto.sql #Base de Datos Originales
	-- EnunciadoDataProject_SQL.Lógica.pdf #Enunciado Consultas
	-- Logo.png
--- Esquema_BBDD
    -- 1. Diagrama.png #Esquema de Base de Datos
    -- 2. Diagrama_Vista.png #Diagrama con Vista creada actor_num_peliculas
--- README.md #Archivo Readme
--- Consultas_Resueltas.sql #Archivo SQL con las consultas resueltas
```

## 4. Estructura del Proyecto 🧩

### 1.  Preparación
- Creación del Esquema de Base de Datos en el que vemos que se incluyen las tablas: "payment, rental, customer,  store, staff, address, city, country, inventory, actor, film_actor, film, film_category, category y language".
- Revisión de claves primarias, foráneas y relaciones entre tablas para una mayor comprensión de los datos.

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
36. **Renombra la columna “first_name” como Nombre y “last_name” como Apellido.** De la tabla actor por ejemplo, le damos un alias a ambas columnas para cambiarle el nombre.
37. **Encuentra el ID del actor más bajo y más alto en la tabla actor.** Realizamos una subconsulta con el MIN y el MAX y la incluimos en la consulta principal.
38. **Cuenta cuántos actores hay en la tabla “actor”.** Hacemos un COUNT de toda la tabla de actor.
39. **Selecciona todos los actores y ordénalos por apellido en orden ascendente.** Damos alias al first_name y last_name y ordenamos por apellido de forma ascendente.
40. **Selecciona las primeras 5 películas de la tabla “film”.** Añadimos un LIMIT de 5.
41. **Agrupa los actores por su nombre y cuenta cuántos actores tienen el mismo nombre. ¿Cuál es el nombre más repetido?** Agrupamos por nombre, contamos todos los actores y ordenamos de manera descendente y vemos que los nombres que más se repiten son Keneth, Penelope y Julia.
42. **Encuentra todos los alquileres y los nombres de los clientes que los realizaron.** Unimos las tablas de rental y customer y las ordenamos por ejemplo por fecha de alquiler.
43. **Muestra todos los clientes y sus alquileres si existen, incluyendo aquellos que no tienen alquileres.** Para ello utilizamos unn LEFT JOIN desde customer hacia rental para asegurarnos de que incluya a todos los clientes aunque no hayan alquilado nada.
44. **Realiza un CROSS JOIN entre las tablas film y category. ¿Aporta valor esta consulta? ¿Por qué? Deja después de la consulta la contestación.** No aporta un valor analítico realista ya que simplemente está uniendo ambas tablas generando combinaciones hipotéticas.
45. **Encuentra los actores que han participado en películas de la categoría 'Action'.** Usamos el JOIN para conectar las tablas de actor, film_actor, film, film_category y category. Filtramos por la palabra Action. Utilizamos el Distinct en SELECT para evitar duplicados y que los actores solo salgan una vez aunque hayan aparecido en varias películas.
46. **Encuentra todos los actores que no han participado en películas.** Unimos las tablas de actor y film_actor con un LEFT JOIN para que incluya todos los actores incluyendo los que no tienen registros en film_actor. Filtramos por Nulos y no hay resultados. Por lo que todos los actores están asociados a al menos una película.
47. **Selecciona el nombre de los actores y la cantidad de películas en las que han participado** Unimos las tablas de Actor y film_actor, agrupamos por actor_id y contamos cantidad de películas. Ordenamos de manera ascendente para ver el actor con más películas.
48. **Crea una vista llamada “actor_num_peliculas” que muestre los nombres de los actores y el número de películas en las que han participado.** Creamos una vista con el código anterior. Con esto hemos creado una tabla virtual que podremos utilizar para futuras consultas.
49. **Calcula el número total de alquileres realizados por cada cliente.** Unimos las tablas customer y rental. Agrupamos a los clientes, y contamos el total de alquileres. Lo ordenamos de manera descendente para ver los clientes que van de mayor número de alquileres a menos.
50. **Calcula la duración total de las películas en la categoría 'Action'.** Unimos las tablas de film, film_category y category. Agrupamos por category name y sumamos la duración total. Nos da un resultado de 7.143 minutos.
51. **Crea una tabla temporal llamada “cliente_rentas_temporal” para almacenar el total de alquileres por cliente.** Creamos tabla temporal y usamos el código de la consulta 49.
52. **Crea una tabla temporal llamada “peliculas_alquiladas” que almacene las películas que han sido alquiladas al menos 10 veces.** Creamos tabla temporal e integramos el código para calcular el total de peliculas alquiladas y filtrarlas por al menos 10 veces.
53. **Encuentra el título de las películas que han sido alquiladas por el cliente con el nombre ‘Tammy Sanders’ y que aún no se han devuelto. Ordena los resultados alfabéticamente por título de película.** Unimos las tablas de rental, customer, inventory y film. Filtramos por el nombre y apellido del cliente y que la fecha de devolución sea null. Ordenamos por titulo y vemos que hay tres películas que dicho cliente no ha devuelto.
54. **Encuentra los nombres de los actores que han actuado en al menos una película que pertenece a la categoría ‘Sci-Fi’. Ordena los resultados alfabéticamente por apellido.** Unimos las tablas de actor, film_actor, film_category y category. Filtramos por la categoría Sci-Fi y usamos el DISTINCT para que cada actor solo aparezca una vez.
55. **Encuentra el nombre y apellido de los actores que han actuado en películas que se alquilaron después de que la película ‘Spartacus Cheaper’ se alquilara por primera vez. Ordena los resultados alfabéticamente por apellido.** Creamos una subconsulta para obtener la fecha en la que se  alquiló por primera vez la película Spartacus Cheaper y nos obtiene que fue el 8 de Julio de 2005 a las 6:43. Integramos esta subconsulta a la consulta principal. Utilizamos DISTINCT para que no se repitan los nombres de los actores.
56. **Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría ‘Music’.** Creamos una subconsulta con los actores que sí han actuado en películas de la categoría Music. La añadimos a la consulta principal con un  filtro WHERE NOT IN para que incluya los actores que no están en esa categoría.
57. **Encuentra el título de todas las películas que fueron alquiladas por más de 8 días.** Unimos las tablas film, inventory y rental para vincular los títulos con los alquileres. Filtramos los casos en los que el rental date y el renturn date sea mayor a 8 días. Añadimos una columna para ver el total de días alquiladas y observamos que todas las películas que han sido alquiladas y devueltas, ha sido en menos de 24 horas.
58. **Encuentra el título de todas las películas que son de la misma categoría que ‘Animation’.** Creamos una subconsulta para obtener el category_id de 'Animation' y filtramos por las películas que tienen ese mismo category_id. Ordenamos por título de película.
59. **Encuentra los nombres de las películas que tienen la misma duración que la película con el título ‘Dancing Fever’. Ordena los resultados alfabéticamente por título de película.** Primero realizamos una subconsulta para ver cuánto dura la película 'Dancing Fever' y luego en la consulta principal buscamos el título de todas las películas filtrando por esa misma duración. Vemos que hay un total de 8 películas con la misma duración que Dancing Fever incluyendo esta misma.
60. **Encuentra los nombres de los clientes que han alquilado al menos 7 películas distintas. Ordena los resultados alfabéticamente por apellido.** Unimos las tablas customer, rental, inventory y film para vincular los clientes con las películas. Agrupamos por customer id, first y last name. Filtramos con un COUNT Distinct para ver cuántas películas diferentes ha alquilado cada cliente y filtramos por un mínimo de 7.
61. **Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.** Unimos las tablas rental, inventory, film, film_category y category para vincular las películas alquiladas con el nombre de la categoría. Agrupamos por categorías y se cuenta el total de alquileres. Ordenamos de mayor a menor para obtener que la categoría con mayores alquileres es la de 'Sports'.
62. **Encuentra el número de películas por categoría estrenadas en 2006.** Unimos las tablas de film, film_category y category, filtrando por el año de estreno que sea en 2006. Ordenamos por número de películas por categoría y vemos que la categoría Sports es la que tiene más películas estrenadas en 2006 (74 en total).
63. **Obtén todas las combinaciones posibles de trabajadores con las tiendas que tenemos.** Para obtener esto, utilizamos un CROSS JOIN que nos va a combinar cada empleado con cada tienda sin condiciones de emparejamiento.
64. **Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.** Unimos las tablas de rental y customer con un LEFT JOIN para asegurarnos de incluir a todos los clientes, incluso los que no han alquilado nada si los hubiera. Agrupamos por customer ID y ordenamos de manera descendente para ver qué cliente con mayor número de alquileres, que en este caso es Eleanor Hunt.


