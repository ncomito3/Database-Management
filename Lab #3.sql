--Nicholas Comito Lab #3; Due 9/22/16--

--List the order number and total dollars of all orders.--
select ordnum, totalUSD
from orders;

--List the name and city of agents named Smith.--
select name, city
from agents
where name = 'Smith';

--List the id, name, and priceUSD of products with quantity more than 201,000.--
select pid, name, priceUSD
from products
where quantity > 201000;

--List the names and cities of customers in Duluth.--
select name, city
from customers
where city = 'Duluth';

--List the names of agents not in New York and not in Duluth.--
select name
from agents
where city NOT IN ('New York','Duluth');

--List all data for products in neither Dallas nor Duluth that cost US$1 or more.--
select *
from products
where 
	city NOT IN ('Dallas','Duluth')
		and 
	priceUSD >= 1.00;


--List all data for orders in February or March.--
select *
from orders
where 
	( mon = 'feb'
	     or
	  mon = 'mar');

--List all data for orders in February of US$600 or more.--
select *
from orders 
where 
	( mon = 'feb')
	     and 
	( totalUSD >= 600);

--List all orders from the customer whose cid is C005.--
select *
from orders
where cid = 'c005';

	