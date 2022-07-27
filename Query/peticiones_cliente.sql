-- La empresa está interesada en saber cuánto han gastado cada uno de sus clientes

select
	customers.first_name as nombre,
	customers.last_name as apellido,
	SUM (orders.ammount) as total
from
	customers
inner join 
	orders
on
	customers.pk_customer = orders.fk_customers
group by
	customers.pk_customer
order  by 
	total desc
	-- La empresa quiere saber en donde tiene mayor presencia.

select 
	Countries.name_country as pais,
	SUM (orders.ammount) as ventas
from
	countries
inner join 
	orders
on
	countries.pk_countries = orders.fk_delivery_countries
group by
	countries.pk_countries
order by
	ventas desc;
--La empresa está interesada en saber cuántas transacciones hace cada cliente al mes


select 
	c.pk_customer as id,
	c.first_name as nombre,
	extract (month from o.order_date) as mes,
	count(o.pk_order) as cantidad_transacciones
from
	customers c
inner join
	orders o
on
	c.pk_customer = o.fk_customers
group by 
	id,
	nombre,
	mes
order by 
	nombre

	
--La empresa está interesada en conocer cuál es el mes con mayor número de transacciones
select 
	extract (month from orders.order_date) as mes,
	count(orders.ammount)
from 
	orders 
group by 
	mes
order by 
	count desc
limit 3
	
	
--La empresa está interesada en saber en qué mes se movió la mayor cantidad de dinero
	
select 
	extract (month from orders.order_date) as mes,
	sum(orders.ammount)
from 
	orders 
group by 
	mes
order by 
	sum desc
limit 3
	
--La empresa está interesada en saber en cuál mes se crearon la mayor cantidad de cuentas
	
select 
	extract (month from c.date_create_account) as mes,
	count(*) as cuentas_creadas
from 
	customers c 
group by
	mes
order by
	cuentas_creadas desc
limit 3
