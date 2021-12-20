/*identificadores, sino que los reemplaces por su correspondiente descripción. Para
esto, vas a tener que realizar JOINS.
Por ejemplo, si quiero mostrar un reporte de películas más alquiladas, en lugar de
mostrar el ID de película, debemos mostrar el título.
Manos a la obra:

1. Generar un reporte que responda la pregunta: ¿cuáles son los diez clientes
que más dinero gastan y en cuantos alquileres lo hacen?*/

select customer.first_name, customer.last_name, sum(payment.amount) gasto, count(payment.payment_id)
from payment
join customer on payment.customer_id = customer.customer_id
group by customer.customer_id
order by gasto desc
limit 10;

/*2. Generar un reporte que indique: el id del cliente, la cantidad de alquileres y
el monto total para todos los clientes que hayan gastado más de 150 dólares
en alquileres.*/
select customer.first_name, customer.last_name, sum(payment.amount) gasto, count(payment.payment_id)
from payment
join customer on payment.customer_id = customer.customer_id
group by customer.customer_id
having gasto>150
order by gasto desc;

/*3. Generar un reporte que responda a la pregunta: ¿cómo se distribuyen la
cantidad y el monto total de alquileres en los meses pertenecientes al año
2005? (tabla payment).*/

select customer.first_name, customer.last_name, sum(payment.amount) gasto, count(payment.payment_id), payment.payment_date
from payment
join customer on payment.customer_id = customer.customer_id
group by customer.customer_id
having payment.payment_date > "2004/12/31";

/*4. Generar un reporte que responda a la pregunta: ¿cuáles son los 5 inventarios
más alquilados? (columna inventory_id en la tabla rental) Para cada una de
ellas, indicar la cantidad de alquileres.*/

select count(inventory_id), inventory_id from rental
group by inventory_id;

/*1. Generar un reporte que responda a la pregunta: Para cada tienda
(store), ¿cuál es la cantidad de alquileres y el monto total del dinero
recaudado por mes?*/

select staff.*, payment.*, count(rental_id), sum(amount)
from store 
join staff on store.manager_staff_id = staff.staff_id
join payment on payment.staff_id = staff.staff_id
group by month(payment_date);


/*2. Generar un reporte que responda a la pregunta: ¿cuáles son las 10 películas
que generan más ingresos? ¿ Y cuáles son las que generan menos ingresos?
Para cada una de ellas indicar la cantidad de alquileres. */

select sum(payment.amount) * count(rental.rental_id) as taquillera, film.title, count(rental.rental_id)
from film
join inventory on film.film_id = inventory.film_id
join rental on rental.inventory_id = inventory.inventory_id
join payment on payment.rental_id = rental.rental_id
group by film.title
order by taquillera desc
limit 10;

select sum(payment.amount) * count(rental.rental_id) as taquillera, film.title, count(rental.rental_id)
from film
join inventory on film.film_id = inventory.film_id
join rental on rental.inventory_id = inventory.inventory_id
join payment on payment.rental_id = rental.rental_id
group by film.title
order by taquillera
limit 10;




/*3. ¿Existen clientes que no hayan alquilado películas?*/

select rental_id, customer.customer_id
from customer
left join rental on customer.customer_id = rental.customer_id
where isnull(rental.rental_id);


/*4. Nivel avanzado: El jefe de stock quiere discontinuar las películas (film) con
menos alquileres (rental). ¿Qué películas serían candidatas a discontinuar?
Recordemos que pueden haber películas con 0 (Cero) alquileres.*/

select *
from film
left join inventory on film.film_id = inventory.film_id
left join rental on rental.inventory_id = inventory.inventory_id
where isnull(rental.rental_id);



select count(*) from actor;

-- Sobre la tabla “Payment” calcular la cantidad de pagos y la suma total de monto (amount) para el cliente 
-- (Customer_id) “10”

select count(rental_id),sum(payment.amount) from payment
group by customer_id
having customer_id = 10;

select count(active) from customer
where active = 0;

-- Necesitamos obtener un reporte con todas las peliculas (Films) de Acción. Veamos la siguiente consulta
 SELECT * 
  FROM sakila.film
  JOIN film_category
  ON film.film_id = film_category.film_id
  join category on category.category_id = film.film_id
  where category.name = "Action";

