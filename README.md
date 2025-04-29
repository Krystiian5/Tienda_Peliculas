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
