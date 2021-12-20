 -- 1. a) Crear una vista denominada “vista_mostrar_pais” que devuelva un reporte de los países.
 
 create view vista_mostrar_pais as
 select * from country;
 
 
-- b) Invocar la vista creada.

select * from vista_mostrar_pais;

-- 2. a) Crear una vista que devuelva un resumen con el apellido y nombre (en una
-- sola columna denominada “artista”) de los artistas y la cantidad de
-- filmaciones que tienen. Traer solo aquellos que tengan más de 25
-- filmaciones y ordenarlos por apellido.

create view resumen_actor as
select concat(first_name, " ", last_name) as artista, count(film_actor.film_id) total
from actor
join film_actor on actor.actor_id = film_actor.actor_id
group by artista
having total > 25
order by last_name;

-- b) Invocar la vista creada.

select * from resumen_actor;

-- c) En la misma invocación de la vista, traer aquellos artistas que tienen menos de 33 filmaciones.

select * from resumen_actor
having total < 33;

-- d) Con la misma sentencia anterior, ahora, mostrar el apellido y nombre de
-- los artistas en minúsculas y traer solo aquellos artistas cuyo apellido
-- comience con la letra "a".

select lower(artista) artista, total from resumen_actor
having total < 33 and artista like "a%";

-- e) Eliminar la vista creada.

drop view resumen_actor;


-- 3. a) Crear una vista que devuelva un reporte del título de la película, el apellido
-- y nombre (en una sola columna denominada “artista”) de los artistas y el
-- costo de reemplazo. Traer solo aquellas películas donde su costo de
-- reemplazo es entre 15 y 27 dólares, ordenarlos por costo de reemplazo.

create view replacement as
select title, concat(first_name, "",last_name ) artista, film.replacement_cost
from film
join actor on actor.actor_id = film.film_id
where film.replacement_cost > 15 and film.replacement_cost < 27
order by film.replacement_cost;

-- b) Invocar la vista creada.

select * from replacement;

-- c) En la misma invocación de la vista, traer aquellas películas que comienzan con la letra "b".

select * from replacement
where artista like "b%";

-- d) Modificar la vista creada agregando una condición que traiga los artistas
-- cuyo nombre termine con la letra "a" y ordenarlos por mayor costo de reemplazo.

select * from replacement
where artista like "%a"
order by film.replacement_cost desc;


