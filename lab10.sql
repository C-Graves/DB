--- Cassandra Graves ---
-------- 4/25/14 -------
-------- LAB 10 --------

-- 1 --
-- Function PreReqsFor(courseNum)
-- to return the immediate prerequisite for the passed-in course number.
--
create or replace function PreReqsFor(int, REFCURSOR) returns refcursor as 
$$
declare
   courseNumber	int       := $1;  --course number in question
   resultset   	REFCURSOR := $2;  --immediate prerequisite for given course number
begin
   open resultset for 
      select c1.num as GivenCourseNum, c1.name as GivenCourseName, prereqnum PreReqNum, c2.name as PreReqName
      from   courses as c1, Prerequisites, courses as c2
      where c1.num = prerequisites.coursenum
	and c2.num = prerequisites.prereqnum
	and c1.num = courseNumber;
   return resultset;
end;
$$ 
language plpgsql;


select PreReqsFor(308, 'results');
Fetch all from results;
select PreReqsFor(221, 'results');
Fetch all from results;
select PreReqsFor(220, 'results');
Fetch all from results;
select PreReqsFor(499, 'results');
Fetch all from results;
select PreReqsFor(120, 'results');
Fetch all from results;


-- 2 --
-- Function IsPreReqFor(courseNum)
-- to return the immediate prerequisite for the passed-in course number.
--
create or replace function IsPreReqFor(int, REFCURSOR) returns refcursor as 
$$
declare
   courseNumber	int       := $1;  --course number in question
   resultset   	REFCURSOR := $2;  --immediate prerequisite of given course number
begin
   open resultset for 
      select prereqnum as GivenCourseNum, c2.name as GivenCourseName, coursenum as NextCourseNum, c1.name as NextCourseName
      from   courses as c1, Prerequisites, courses as c2
      where c1.num = prerequisites.coursenum
	and c2.num = prerequisites.prereqnum
	and prereqnum = courseNumber;
   return resultset;
end;
$$ 
language plpgsql;


select IsPreReqFor(220, 'results');
Fetch all from results;
select IsPreReqFor(308, 'results');
Fetch all from results;
select IsPreReqFor(221, 'results');
Fetch all from results;
select IsPreReqFor(120, 'results');
Fetch all from results;
select IsPreReqFor(499, 'results');
Fetch all from results;