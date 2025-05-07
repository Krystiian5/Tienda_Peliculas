![image alt](https://github.com/Krystiian5/Videoclub_Mediterraneo/blob/main/Data/Logo.jpeg?raw=true)

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
	-- Logo.jpeg
--- Esquema_BBDD
    -- 1. Diagrama.png #Esquema de Base de Datos
    -- 2. Diagrama_Vista.png #Diagrama con Vista creada actor_num_peliculas
--- README.md #Archivo Readme
--- Consultas_Resueltas.sql #Archivo SQL con las consultas resueltas
```

## 4. Estructura del Proyecto 🧩

### 1. Preparación.
- Creación de una nueva conexión con el nombre de Proyecto_SQL en DBeaver.
- Creamos una nueva base de datos en la conexión creada llamada Tienda_Peliculas.
- Vinculamos la base de datos originales descargadas con la base de datos creada en Dbeaver llamada Tienda_Peliculas.
- Creación del Esquema de Base de Datos en el que vemos que se incluyen las tablas: "payment, rental, customer,  store, staff, address, city, country, inventory, actor, film_actor, film, film_category, category y language".
- Revisión de claves primarias, foráneas y relaciones entre tablas para una mayor comprensión de los datos.

### 2. Consultas Básicas sobre tablas individuales.

- Se realizan múltiples consultas para:
    - Filtrar (WHERE) datos por condiciones específicas, o filtrar (HAVING) usando funciones de agregación para datos específicos.
    - Ordenar (ORDER BY) datos alfabéticamente o numéricamente.
    - Agrupar (GROUP BY) datos por condiciones específicas.
    - Agregar funciones de agregación (AVG, MAX, MIN, COUNT) para obtener resúmenes por columnas clave.

- Ejemplos: 

    - Listar actores llamados 'Johnny'.
    - Contar el  número total de actores.
    - Obtener el actor con ID más alto o más bajo.
    - Renombrar columnas para mejorar comprensión y lectura.

### 3. Consultas Multi-tabla (JOINS) y Relaciones entre tablas.
- Se establecen relaciones lógicas entre tablas usando:
    - INNER JOIN: para combinar datos cuando existe coincidencia.
    - LEFT JOIN: para incluir todos los registros de una tabla aunque no haya coincidencia.
    - CROSS JOIN: para generar combinaciones cartesianas (Empleados con tiendas).
- Se exploran relaciones como:
    - Actores ↔ Películas.
    - Películas ↔ Categorías.
    - Clientes ↔ Alquileres ↔ Películas ↔ Inventario.

### 4. Subconsultas.

- Se utilizan subbconsultas correlacionadas y no correlacionadas como por ejemplo para:
    - Comparar duraciones con una película específica.
    - Encontrar alquileres posteriores a un evento determinado.
    - Contar películas alquiladas por cada cliente o por categoría.
    - Identificar películas aún no devueltas.

### 5. Vistas.
- Se crea una vista que puede ser reutilizada **actor_num_peliculas** que muestra los actores junto al número de películas en las que han participado.

### 6. Estructuras Temporales y CTEs.
- Uso de Common Table Expressions (CTEs) mediante WITH para consultas temporales:
    - cliente_rentas_temporal: total de alquileres por cliente.
    - peliculas_alquiladas: películas alquiladas al menos 10 veces.
### 7. Buenas prácticas.
- Se emplean:
    - Formato SQL estandarizado: uso de mayúsculas para palabras reservadas y alias con significado.
    - Separación de lógica en pasos (CTEs).
    - Formato legible y tabulado.
    - Comentarios en consultas complejas.
    - Validación de resultados tras cada consulta.

## 5. Resultados Clave del Análisis 📊

### Análisis de Películas 🎥
- Se identifican todas las películas del videoclub y sus categorías.
- Se obtiene la duración total de películas dentro de la categoría 'Action'.
- Se analizan los títulos con duración igual a otras películas específicas.
- Se listan películas alquiladas más de 8 días, incluyendo número exacto de días.

### Clientes 👥

- Se identifican que los clientes con más de 7 películas distintas alquiladas son clientes frecuentes. Estos datos pueden usarse para estrategias de fidelización.
- Se identifican los 5 clientes con mayor gasto total.
- Se listan los clientes que aún tienen películas sin devolver.

### Actores 🎭 

- Se listan todos los actores y las películas en las que han trabajado.
- Se identifican actores que no han actuado en ninguna película.
- Se determinaron actores que han trabajado en películas de categorías específicas (‘Action’, ‘Sci-Fi’) y los que no han trabajado en ‘Music’.

### Alquileres 📅 
- Se exploraran los alquileres realizados después del primer alquiler de la película ‘Spartacus Cheaper’.
- Se analizan películas más alquiladas por categoría y por cliente.
- Se exploran los clientes que realizaron alquileres pero aún no han devuelto películas.

### Inventario y Tiendas 🏪
- Se realiza un CROSS JOIN entre tiendas y personal para obtener todas las combinaciones posibles.
- Se listan qué películas están en qué inventario y si fueron alquiladas.
### Categorías 📁 
- Se encontran cuántas películas fueron estrenadas en 2006 por categoría.
- Se listan películas que comparten categoría con 'Animation'.
- Se identifican las categorías más alquiladas mediante subconsultas y agregaciones.

## Recomendaciones Futuras 🚀 

- Corregir los valores NULL en columnas como  original_language_id que dificultan el análisis.
- Agregar nuevas columnas calculadas como:
    - Duración real del alquiler en días.
    - Clientes con deudas activas (películas no devueltas).






