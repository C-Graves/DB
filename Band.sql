--Cassandra Graves
--Band Database
--4/25/2014


----------------------------------------------------------------------------------------------------------
CREATE TABLE Participants(
	pID			TEXT NOT NULL,
	fName			TEXT NOT NULL,
	lName			TEXT NOT NULL,
	birthdate		DATE,
	poloSize		TEXT,
	PRIMARY KEY(pID)
);
----------------------------------------------------------------------------------------------------------
CREATE TABLE Ensembles(
	eID			TEXT NOT NULL,
	name			TEXT NOT NULL,
	room			TEXT,
	startTime		TIME,
	PRIMARY KEY(eID)
);
----------------------------------------------------------------------------------------------------------
CREATE TABLE EboardPositions(
	role			TEXT NOT NULL,
	name			TEXT NOT NULL,
	PRIMARY KEY(role)
);
----------------------------------------------------------------------------------------------------------
CREATE TABLE KKPsiMembers(
	pID			TEXT NOT NULL REFERENCES Participants(pID),
	class			TEXT
);
----------------------------------------------------------------------------------------------------------
CREATE TABLE TBSMembers(
	pID			TEXT NOT NULL REFERENCES Participants(pID),
	class			TEXT
);
----------------------------------------------------------------------------------------------------------
CREATE TABLE EboardMembers(
	pID			TEXT NOT NULL REFERENCES Participants(pID),
	role			TEXT NOT NULL REFERENCES EboardPositions(role),
	term			TEXT
);
----------------------------------------------------------------------------------------------------------
CREATE TABLE ConcertInsts(
	pID			TEXT NOT NULL REFERENCES Participants(pID),
	inst			TEXT,
	part			INT
);
----------------------------------------------------------------------------------------------------------
CREATE TABLE PepInsts(
	pID			TEXT NOT NULL REFERENCES Participants(pID),
	inst			TEXT,
	part			INT
);
----------------------------------------------------------------------------------------------------------
CREATE TABLE MarchingInsts(
	pID			TEXT NOT NULL REFERENCES Participants(pID),
	inst			TEXT,
	part			INT
);
----------------------------------------------------------------------------------------------------------
CREATE TABLE Conductors(
	pID			TEXT NOT NULL REFERENCES Participants(pID),
	startDate		DATE
);
----------------------------------------------------------------------------------------------------------
CREATE TABLE Students(
	pID			TEXT NOT NULL REFERENCES Participants(pID),
	gradYear		INT NOT NULL,
	major			TEXT,
	minor			TEXT,
	scholarship		BOOLEAN
);
----------------------------------------------------------------------------------------------------------
CREATE TABLE Employees(
	pID			TEXT NOT NULL REFERENCES Participants(pID),
	shift			TEXT NOT NULL CHECK(shift='day' or shift='night')
);
----------------------------------------------------------------------------------------------------------
CREATE TABLE EnrolledIn(
	pID			TEXT NOT NULL REFERENCES Participants(pID),
	eID			TEXT NOT NULL REFERENCES Ensembles(eID)
);
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------------
INSERT INTO Participants(pID, fName, lName, birthdate, poloSize)
VALUES('p001','Arthur','Himmelberger','1951-11-26','L');
INSERT INTO Participants(pID, fName, lName, birthdate, poloSize)
VALUES('p002','Cassandra','Graves','1992-5-7','M');
INSERT INTO Participants(pID, fName, lName, birthdate, poloSize)
VALUES('p003','Brian','Veltre','1992-3-1','L');
INSERT INTO Participants(pID, fName, lName, birthdate, poloSize)
VALUES('p004','Michael','Napolitano','1982-8-8','XL');
INSERT INTO Participants(pID, fName, lName, birthdate, poloSize)
VALUES('p005','Derek','Daffara','1994-12-2','XL');
INSERT INTO Participants(pID, fName, lName, birthdate, poloSize)
VALUES('p006','Sara','Lacey','1992-4-2','L');
INSERT INTO Participants(pID, fName, lName, birthdate, poloSize)
VALUES('p007','Erin','Gates','1995-3-21','M');
INSERT INTO Participants(pID, fName, lName, birthdate, poloSize)
VALUES('p008','Elizabeth','Grisafi','1992-11-25','M');

select *
from Participants;
----------------------------------------------------------------------------------------------------------
INSERT INTO Ensembles(eID, name, room, startTime)
VALUES('e001','Symphonic Band','MU4001','19:45:00');
INSERT INTO Ensembles(eID, name, room, startTime)
VALUES('e002','Wind Symphony','MU4001','21:30:00');
INSERT INTO Ensembles(eID, name, room, startTime)
VALUES('e003','Woodwind Ensemble','MU3204','18:30:00');
INSERT INTO Ensembles(eID, name, room, startTime)
VALUES('e004','Brass Ensemble','MU4001','18:30:00');
INSERT INTO Ensembles(eID, name, room, startTime)
VALUES('e005','Handbell Choir','MU2220','17:00:00');
INSERT INTO Ensembles(eID, name, room, startTime)
VALUES('e006','Percussion Ensemble','MU4001','17:00:00');
INSERT INTO Ensembles(eID, name, room, startTime)
VALUES('e007','Guitar Ensemble','MU4001','18:30:00');
INSERT INTO Ensembles(eID, name, room, startTime)
VALUES('e008','Orchestra','MU2220','18:30:00');
INSERT INTO Ensembles(eID, name, room, startTime)
VALUES('e009','Jazz Foxes','MU4001','21:00:00');
INSERT INTO Ensembles(eID, name, room, startTime)
VALUES('e010','Flute Choir','MU2220','18:30:00');

select *
from Ensembles;


----------------------------------------------------------------------------------------------------------
INSERT INTO EboardPositions(role,name)
VALUES('P','President');
INSERT INTO EboardPositions(role,name)
VALUES('VPC','Vice President of Concert Bands');
INSERT INTO EboardPositions(role,name)
VALUES('VPP','Vice President of Athletic Bands');
INSERT INTO EboardPositions(role,name)
VALUES('S','Secretary');
INSERT INTO EboardPositions(role,name)
VALUES('T','Treasurer');
INSERT INTO EboardPositions(role,name)
VALUES('OL','Orchestra Liaison');
INSERT INTO EboardPositions(role,name)
VALUES('W','Webmaster');
INSERT INTO EboardPositions(role,name)
VALUES('A','Advisor');

select *
from EboardPositions;
----------------------------------------------------------------------------------------------------------
INSERT INTO KKPsiMembers(pID,class)
VALUES('p002','Rho');
INSERT INTO KKPsiMembers(pID,class)
VALUES('p003','Rho');
INSERT INTO KKPsiMembers(pID,class)
VALUES('p004','Beta');
INSERT INTO KKPsiMembers(pID,class)
VALUES('p005','Upsilon');
INSERT INTO KKPsiMembers(pID,class)
VALUES('p007','Chi');
INSERT INTO KKPsiMembers(pID,class)
VALUES('p008','Tau');

select *
from KKPsiMembers;
----------------------------------------------------------------------------------------------------------
INSERT INTO TBSMembers(pID,class)
VALUES('p006','Nu');

select *
from TBSMembers;
----------------------------------------------------------------------------------------------------------
INSERT INTO EboardMembers(pID, role, term)
VALUES('p002','P','2013-2014');
INSERT INTO EboardMembers(pID, role, term)
VALUES('p003','VPC','2013-2014');
INSERT INTO EboardMembers(pID, role, term)
VALUES('p004','A','2013-2014');
INSERT INTO EboardMembers(pID, role, term)
VALUES('p005','W','2013-2014');
INSERT INTO EboardMembers(pID, role, term)
VALUES('p006','OL','2013-2014');
INSERT INTO EboardMembers(pID, role, term)
VALUES('p004','A','2014-2015');
INSERT INTO EboardMembers(pID, role, term)
VALUES('p005','P','2014-2015');
INSERT INTO EboardMembers(pID, role, term)
VALUES('p007','S','2014-2015');

select *
from EboardMembers;
----------------------------------------------------------------------------------------------------------
INSERT INTO ConcertInsts(pID, inst, part)
VALUES('p002','Alto Saxophone', 1); 
INSERT INTO ConcertInsts(pID, inst, part)
VALUES('p003','Bari Saxophone', 1); 
INSERT INTO ConcertInsts(pID, inst, part)
VALUES('p005','String Bass', 1); 
INSERT INTO ConcertInsts(pID, inst, part)
VALUES('p006','String Bass', 1); 
INSERT INTO ConcertInsts(pID, inst, part)
VALUES('p007','Flute', 2); 
INSERT INTO ConcertInsts(pID, inst, part)
VALUES('p008','Tuba', 1); 

select *
from ConcertInsts;
----------------------------------------------------------------------------------------------------------
INSERT INTO PepInsts(pID, inst, part)
VALUES('p002','Alto Saxophone', 1); 
INSERT INTO PepInsts(pID, inst, part)
VALUES('p003','Bari Saxophone', 1); 
INSERT INTO PepInsts(pID, inst, part)
VALUES('p005','Sousaphone', 2); 
INSERT INTO PepInsts(pID, inst, part)
VALUES('p006','Baritone', 1); 
INSERT INTO PepInsts(pID, inst, part)
VALUES('p007','Mellophone', 2); 
INSERT INTO PepInsts(pID, inst, part)
VALUES('p008','Sousaphone', 1); 

select *
from PepInsts;
----------------------------------------------------------------------------------------------------------
INSERT INTO MarchingInsts(pID, inst, part)
VALUES('p002','Alto Saxophone', 1); 
INSERT INTO MarchingInsts(pID, inst, part)
VALUES('p003','Bari Saxophone', 1); 
INSERT INTO MarchingInsts(pID, inst, part)
VALUES('p005','Sousaphone', 2); 
INSERT INTO MarchingInsts(pID, inst, part)
VALUES('p006','Baritone', 1); 
INSERT INTO MarchingInsts(pID, inst, part)
VALUES('p007','Mellophone', 2); 
INSERT INTO MarchingInsts(pID, inst, part)
VALUES('p008','Sousaphone', 1); 

select *
from MarchingInsts;
----------------------------------------------------------------------------------------------------------
INSERT INTO Conductors(pID, startDate)
VALUES('p001','1986-1-1');
INSERT INTO Conductors(pID, startDate)
VALUES('p004','2004-6-1');

select *
from Conductors;
----------------------------------------------------------------------------------------------------------
INSERT INTO Students(pID, gradYear, major, minor, scholarship)
VALUES('p002',2014,'Computer Science', 'Music', true);
INSERT INTO Students(pID, gradYear, major, minor, scholarship)
VALUES('p003',2014,'Information Systems', 'Music', true);
INSERT INTO Students(pID, gradYear, major, minor, scholarship)
VALUES('p005',2016,'Business', 'Music', true);
INSERT INTO Students(pID, gradYear, major, minor, scholarship)
VALUES('p006',2014,'Psychology', 'Music', true);
INSERT INTO Students(pID, gradYear, major, minor, scholarship)
VALUES('p007',2017,'Psychology', 'Music', true);
INSERT INTO Students(pID, gradYear, major, minor, scholarship)
VALUES('p008',2015,'Environmental Science', 'Policy', false);

select *
from Students;
----------------------------------------------------------------------------------------------------------
INSERT INTO Employees(pID,shift)
VALUES('p004','night');
INSERT INTO Employees(pID,shift)
VALUES('p007','day');

select *
from Employees;
----------------------------------------------------------------------------------------------------------
INSERT INTO EnrolledIn(pID,eID)
VALUES('p001','e001');
INSERT INTO EnrolledIn(pID,eID)
VALUES('p001','e002');
INSERT INTO EnrolledIn(pID,eID)
VALUES('p002','e001');
INSERT INTO EnrolledIn(pID,eID)
VALUES('p002','e002');
INSERT INTO EnrolledIn(pID,eID)
VALUES('p002','e003');
INSERT INTO EnrolledIn(pID,eID)
VALUES('p003','e001');
INSERT INTO EnrolledIn(pID,eID)
VALUES('p003','e002');
INSERT INTO EnrolledIn(pID,eID)
VALUES('p003','e009');
INSERT INTO EnrolledIn(pID,eID)
VALUES('p004','e005');
INSERT INTO EnrolledIn(pID,eID)
VALUES('p005','e001');
INSERT INTO EnrolledIn(pID,eID)
VALUES('p005','e002');
INSERT INTO EnrolledIn(pID,eID)
VALUES('p005','e008');
INSERT INTO EnrolledIn(pID,eID)
VALUES('p005','e009');
INSERT INTO EnrolledIn(pID,eID)
VALUES('p006','e001');
INSERT INTO EnrolledIn(pID,eID)
VALUES('p006','e002');
INSERT INTO EnrolledIn(pID,eID)
VALUES('p006','e008');
INSERT INTO EnrolledIn(pID,eID)
VALUES('p006','e009');
INSERT INTO EnrolledIn(pID,eID)
VALUES('p007','e001');
INSERT INTO EnrolledIn(pID,eID)
VALUES('p007','e002');
INSERT INTO EnrolledIn(pID,eID)
VALUES('p007','e003');
INSERT INTO EnrolledIn(pID,eID)
VALUES('p007','e008');
INSERT INTO EnrolledIn(pID,eID)
VALUES('p007','e010');
INSERT INTO EnrolledIn(pID,eID)
VALUES('p008','e001');
INSERT INTO EnrolledIn(pID,eID)
VALUES('p008','e002');
INSERT INTO EnrolledIn(pID,eID)
VALUES('p008','e005');

select *
from EnrolledIn;
----------------------------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW GreekLifeMembers AS
select p.pID, p.fName, p.lName
from Participants as p
where p.pID in (select pID
		from TBSMembers)
   or p.pID in (select pID
		from KKPsiMembers)
;
  
select * from greeklifemembers

----------------------------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW PaidBoardMembers AS
select p.pID, p.fName, p.lName, e.shift, em.role, em.term
from Participants as p, Employees as e, EboardMembers as em
where p.pID = e.pID
  and p.pID = em.pID
order by em.term asc;
;
  
select * from PaidBoardMembers

----------------------------------------------------------------------------------------------------------
--report a roster of names and instruments that students play
select p.pID, p.fName, p.lName, 
	mar.inst as MarchingInstrument, 
	pep.inst as PepInstrument, 
	con.inst as ConcertInstrument
from Participants as p, Students as s,
     MarchingInsts as mar, PepInsts as pep, ConcertInsts as con
where p.pID = s.pID
  and mar.pID = p.pID
  and pep.pID = p.pID
  and con.pID = p.pID
order by p.lName ASC;
;
  
----------------------------------------------------------------------------------------------------------
create or replace function EnsembleEnrolled(text, REFCURSOR) returns refcursor as 
$$
declare
   ensembleNumber	text       := $1; 
   resultset   		REFCURSOR  := $2;
begin
   open resultset for 
      select ens.eID, ens.name,COUNT(p.pID)
      from   Ensembles as ens, EnrolledIn as ei, participants as p
      where ens.eID = ei.eID
        and ei.pID = p.pID
        and ens.eID = ensembleNumber
        group by ens.eID;
   return resultset;

end;
$$ 
language plpgsql;


select EnsembleEnrolled('e008', 'results');
Fetch all from results;

----------------------------------------------------------------------------------------------------------

create role admin;
grant all privileges
on all tables in schema public
to admin;

create role leader;
grant select
on all tables in schema public
to leader;

----------------------------------------------------------------------------------------------------------
