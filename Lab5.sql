-- Cassandra Graves --
-- 	Lab 5 	    --
--     2/21/14	    --

-- Q1 --
select agents.city
from orders,
     customers,
     agents
where orders.cid = customers.cid
  and orders.aid = agents.aid
  and customers.name = 'Basics'
;

-- Q2 --
select distinct ordr.pid
from customers join orders as ord on customers.cid = ord.cid
right join orders as ordr on ordr.aid = ord.aid
where customers.city = 'Kyoto'
order by ordr.pid asc
;

-- Q3 --
select name
from customers
where cid not in ( select distinct cid
		   from orders
		 )
order by cid asc
;

-- Q4 --
select customers.name
from orders full outer join customers on orders.cid = customers.cid
where orders.ordno is null
;

-- Q5 --
select distinct customers.name as "Customer Name", 
		agents.name as "Agent Name", 
		customers.city as "City"
from orders,
     agents,
     customers
where orders.cid = customers.cid
  and orders.aid = agents.aid
  and customers.city = agents.city
;

-- Q6 --
select customers.name as "Customer Name", agents.name as "Agent Name", agents.city as "City"
from customers inner join agents on customers.city = agents.city
;

-- Q7 --
select name as "Customer Name", city as "Customer City"
from customers
where city in ( select city
		from (  select products.city, sum(quantity) as sumQuantity
			from products
			group by products.city
			order by sumQuantity asc
			limit 1
		     ) as cityLeastNumProd
	      )
;