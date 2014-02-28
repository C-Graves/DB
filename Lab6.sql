-- Cassandra Graves --
-- 	Lab 6 	    --
--     2/28/14	    --

-- Q1 --
select name as "Customer Name", city as "Customer City"
from customers
where city in ( select city
		from (  select products.city, sum(quantity) as sumQuantity
			from products
			group by products.city
			order by sumQuantity desc
			limit 1
		     ) as cityMostNumProd
	      )
order by customers asc
;
--No one lives in Newark...so is this okay?


-- Q2 --
--what makes this different from Q1?
select name as "Customer Name", city as "Customer City"
from customers
where city in ( select city
		from (  select products.city, sum(quantity) as sumQuantity
			from products
			group by products.city
			order by sumQuantity desc
			--limit 1 --taking this out makes it different?
		     ) as cityMostNumProd
	      )
order by customers asc
;


-- Q3 --
select name as "Above Average Priced Products"
from products
where priceUSD > ( select avg(priceUSD)
		    from products
		 )
order by priceUSD asc
;

-- Q4 --
select customers.name, pid, dollars
from orders,
     customers
where customers.cid = orders.cid
order by dollars desc
;

-- Q5 --
select customers.name,  coalesce( sum(dollars), 0)
from orders full outer join customers on customers.cid = orders.cid
group by customers.cid
order by customers.cid asc
;
--c005 prints 0 instead of <NULL> & full outer join includes c005 even though no orders placed yet

-- Q6 --
select customers.name as "Customer Name", products.name as "Product Purchased", agents.name as "Agent Name"
from orders,
     customers,
     products,
     agents
where customers.cid = orders.cid
  and agents.aid = orders.aid
  and products.pid = orders.pid
  and orders.ordno in(	select ordno 
			from orders
			where aid in ( 	select aid
					from agents
					where city = 'New York'
					)
			)
;

-- Q7 --
select  orders.ordno "Order That Is Wrong", 
	agents.name as "Agent That Messed Up", --or maybe it was entered wrong O.o 
	customers.name as "Customer Who Paid Wrong", 
	orders.qty, products.priceUSD, customers.discount, orders.dollars
from orders, products, customers, agents 
where orders.pid = products.pid 
  and orders.cid = customers.cid
  and orders.aid = agents.aid
  and ( orders.qty * products.priceUSD ) - 
	(orders.qty*products.priceUSD * (customers.discount / 100) ) != orders.dollars
--more important to find the incorrect orders.dollars when checking accuracy, which is why I used !=
;