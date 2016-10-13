/* 
Nick Comito
Database Management
Lab #6: Interesting and Painful Queries
*/

-- 1) Display the name and city of customers who live in any city that makes the most different kinds of products. 
--(There are two cities that make the most different products. Return the name and city of customers from either one of those.)

select name, city
from customers
where city in (select city 
	       from products p
	       group by p.city
	       order by count (p.city) DESC
	       limit 1);


-- 2) Display the names of products whose priceUSD is strictly below the average priceUSD, in reverse-alphabetical order.

select name
from products
where priceUSD < (select avg(priceUSD)
		  from products)
Order by name DESC;


-- 3) Display the customer name, pid ordered, and the total for all orders, sorted by total from low to high.

select c.name, o.pid, o.totalUSD
from orders o inner join customers c on o.cid = c.cid
order by o.totalUSD ASC;

-- 4) Display all customer names (in alphabetical order) and their total ordered, and nothing more. Use coalesce to avoid showing NULLs.

select c.name, coalesce (sum (o.qty),0) as "Order Total"
from orders o right outer join customers c on o.cid = c.cid 
group by c.name
order by c.name ASC;



-- 5) Display the names of all customers who bought products from agents based in New York along with the names of the products they 
--    ordered, and the names of the agents who sold it to them.

select c.cid, c.name, p.name, a.name
from orders o inner join customers c on o.cid = c.cid
	      inner join products  p on o.pid = p.pid
	      inner join agents    a on o.aid = a.aid
where a.city = 'New York';



-- 6) Write a query to check the accuracy of the dollars column in the Orders table. This means calculating Orders.totalUSD from data 
--    in other tables and comparing those values to the values in Orders.totalUSD. Display all rows in Orders where Orders.totalUSD is 
--    incorrect, if any.


select * 
from (select o.*, o.qty*p.priceUSD*(1-(c.discount/100)) as "Discounted Payment"
      from orders o inner join products   p on o.pid = p.pid
	            inner join customers  c on o.cid = c.cid) as "alias"
where totalUSD <> "Discounted Payment";


-- 7) What’s the difference between a LEFT OUTER JOIN and a RIGHT OUTER JOIN? Give example queries in SQL to demonstrate. (Feel free to 
--   use the CAP database to make your points here.)

/* 

The difference between a left and right outer join is what table will be displyed and how the comparison will be made.  If a left outer join
is used, the results will include all values in the left table even if the right table does not have a match.  If the right table does not
have a match, the result will be NULL.  If a right outer join is used, the results wil include all of the vlues in the right table,  If the
left table does not have a match, that field will be NULL.
*/

--Left outer join example

select *
from orders o left outer join customers c on c.cid = o.cid;

--Right outer join example

select *
from orders o right outer join customers c on c.cid = o.cid;

/*
In the examples given, their are no NULL fields in the lef outer join because it is displaying the results of the orders. In the right outer join,
customers is the right table so all customers will be displayed even if they did not place an order.  Weyland (c005) did not place an orde
which is why some of the fields are NULL.