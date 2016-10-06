/*
Nick Comito
Professor Labouser
Database Management
Lab 5: SQL Queries - The Joins Three-quel
Due 10/6/16
*/

-- (1) Show the cities of agents booking an order for a customer whose id is 'c006'. Use joins this time; no subqueries.--

select a.city 
from agents a join orders o on a.aid = o.aid
where o.cid = 'c006'; 


-- (2) Show the ids of products ordered through any agent who makes at least one order for a customer in Kyoto, sorted by pid from highest to lowest. Use joins; no subqueries.----SubQuery That Works--

select distinct o1.pid
from orders o full outer join orders o1 on o.aid = o1.aid, customers c -- o1 is used since orders needs to be used twice.
where c.city = 'Kyoto'
  and c.cid = o.cid
order by o1.pid DESC


-- (3) Show the names of customers who have never placed an order. Use a subquery.--

select name 
from customers
where cid not in (select cid
		  from orders)
;

-- (4) Show the names of customers who have never placed an order. Use an outer join. --

select name
from customers c left outer join orders o on c.cid = o.cid
where o.cid is NULL;


-- (5) Show the names of customers who placed at least one order through an agent in their own city, along with those agent(s') names.--

select distinct c.name, a.name
from customers c, agents a, orders o
where c.city = a.city
  and c.cid = o.cid
  and a.aid = o.aid;


-- (6) Show the names of customers and agents living in the same city, along with the name of the shared city, regardless of whether or not the customer has ever placed an order with that agent.

select distinct c.name, a.name, c.city 
from customers c, agents a
where c.city = a.city;

-- (7) Show the name and city of customers who live in the city that makes the fewest different kinds of products. (Hint: Use count and group by on the Products table.)

select c.name, c.city
from customers c
where c.city in (select p.city
		 from products p
		 group by p.city
		 order by count(p.pid) ASC
		 limit 1)
;

