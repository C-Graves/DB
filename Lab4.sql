-- Cassandra Graves --
-- 	Lab 4 	    --
--     2/14/14	    --

-- Q1 --
select city
from agents
where aid in (	select aid
		from orders
		where cid in(	select cid
				from customers
				where name = 'Basics'
			    )
	     )
;

-- Q2 --
select distinct pid
from orders
where aid in (	select aid
		from orders
		where cid in (	select cid
				from customers
				where city = 'Kyoto'
			     )
	     )
order by pid asc
;

-- Q3 --
select cid, name
from customers
where cid not in (	select distinct cid
			from orders
			where aid = 'a03'
		 )
;

-- Q4 --
select cid, name
from customers
where cid in (  select distinct cid
		from orders
		where pid = 'p01'
				intersect
					select distinct cid
					from orders
					where pid = 'p07'
	     )

;

-- Q5 --
select distinct pid
from orders
where cid in (	select distinct cid
		from orders
		where aid = 'a03'
	     )
order by pid asc
;

-- Q6 --
select name, discount
from customers
where cid in (	select cid
		from orders
		where aid in (	select aid
				from agents
				where city = 'Dallas'
				or city = 'Duluth'
			     )
	     )
;

-- Q7 --
select cid, name
from customers
where discount in (	select discount
			from customers
			where city = 'Dallas'
			   or city = 'Kyoto'
		  )

;
