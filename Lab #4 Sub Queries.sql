/* Nick Comito
Database Management
Lab #4: SQL Queries - The Subqueries Sequel
Due 9/29/16 */


-- (1) Get the cities of agents booking an order for a customer whose cid is 'c006'.--

select city
from agents
where aid in (select aid
	      from orders
              where cid = 'c006')
;


-- (2) Get the ids of products ordered through any agent who takes at least one order from a customer in Kyoto, sorted by pid from highest to lowest. --

select distinct pid
from orders
where aid in (select aid 
	      from orders
	      where cid in (select cid 
			    from customers 
			    where city = 'Kyoto')
	      )
order by pid DESC;

-- (3) Get the ids and names of customers who did not place an order through agent a03.--

select name, cid
from customers
where cid not in (select distinct cid 
		  from orders
		  where aid = 'a03')
;

-- (4) Get the ids of customers who ordered both product p01 and p07.--

select distinct name, cid
from customers
where cid in (select cid 
	      from orders
	      where pid = 'p01'
	      AND cid in (select cid
			  from orders
			  where pid = 'p07')
	      )
;

-- (5) Get the ids of products not ordered by any customers who placed any order through agent a08 in pid order from highest to lowest.--

select distinct pid 
from orders 
where cid not in (select cid 
		  from orders
		  where aid = 'a08')
order by pid DESC;

-- (6) Get the name, discounts, and city for all customers who place orders through agents in Dallas or New York.--

select name, discount, city
from customers
where cid in (select cid
	      from orders
	      where aid in (select aid 
			    from agents
			    where city in ('Dallas', 'New York')
			    )
	     )
;

--(7) Get all customers who have the same discount as that of any customers in Dallas or London--

select *
from customers
where discount in (select discount
		   from customers
		   where city in ('Dallas', 'London')
		   )
;

-- 8) Check Constraints--

/* 
A check constraint is used in databases in order to specify certain requirements that must be met in a table of the database. 
It defines properties that the data must comply with. Check constraints are important for databses because they make sure intergrity 
is maintained. Check constraints are specific to domain integrity, which defines the valid values for database columns. An advantage 
of a check constraint besides integrity is that it limits the value range of a column. A check constraint on a single column limits 
the values of that column while a check constraint on a table  limits the value of certain columns based on other columns and rows. 
Some examples of check constraints could be for a restaurant rating agency.  The agency can rate the restaurants from 1-5 stars but 
cannot go above 5 or below 1 for each rating. Another example could be a check constraint for anything requires someone to be of a 
certain age. For example, a financial institution that handles investments and retirement plans would need to check if someone was 
65 to see if they qualify for investment options.  Check constraints are not alway ncessary.  An example of a bad check constraint would 
be for phone numbers and social security numbers.  The values of these two categories are different for every person and it would serve no
purpose in restricting the input of them. Another bad example would be putting a key constraint on a column that could potentially have duplicate
values.  If that constraint is on a primary key it wil only occur one time.
*/



