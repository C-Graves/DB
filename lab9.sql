--Cassandra Graves
--Lab 9
--4/15/2014



CREATE TABLE Spacecrafts(
	scID			TEXT NOT NULL,
	name			TEXT NOT NULL,
	tailNumber		INT,
	weightTONS		INT,
	fuelType		TEXT,
	crewCapacity		INT,
	PRIMARY KEY(scID)
);

CREATE TABLE People(
	pID			TEXT NOT NULL,
	firstName		TEXT NOT NULL,
	lastName		TEXT NOT NULL,
	age			INT,
	PRIMARY KEY(pID)
);

CREATE TABLE Engineers(
	pID			TEXT NOT NULL REFERENCES People(pID),
	highestDegree		TEXT,
	favVideoGame		TEXT
);

CREATE TABLE Operators(
	pID			TEXT NOT NULL REFERENCES People(pID),
	chairPreference		TEXT,
	favoriteDrink		TEXT
);

CREATE TABLE Astronauts(
	pID			TEXT NOT NULL REFERENCES People(pID),
	yearsFlying		INT,
	golfHandicap		INT,
	UNIQUE (pID)
);

CREATE TABLE Crews(
	pID			TEXT NOT NULL REFERENCES Astronauts(pID),
	scID			TEXT NOT NULL REFERENCES Spacecrafts(scID)
);

CREATE TABLE Suppliers(
	supNo			INT NOT NULL,
	name			TEXT NOT NULL,
	paymentTerms		TEXT,
	PRIMARY KEY(supNo)
);

CREATE TABLE Parts(
	partNo			INT NOT NULL,
	name			TEXT NOT NULL,
	description		TEXT,
	PRIMARY KEY(partNo)
);

CREATE TABLE Systems(
	sysNo			INT NOT NULL,
	name			TEXT NOT NULL,
	description		TEXT,
	PRIMARY KEY(sysNo)
);

CREATE TABLE Catalog(
	orderNo			INT NOT NULL,
	supNo			INT NOT NULL REFERENCES Suppliers(supNo),
	partNo			INT NOT NULL REFERENCES Parts(partNo),
	sysNo			INT NOT NULL REFERENCES Systems(sysNo),
	scID			TEXT NOT NULL REFERENCES Spacecrafts(scID),
	PRIMARY KEY(orderNo)
);

CREATE TABLE Zips(
	zipcode			INT NOT NULL,
	city			TEXT NOT NULL,
	state			TEXT NOT NULL,
	PRIMARY KEY(zipcode)
);

CREATE TABLE SupplierLocations(
	supNo			INT NOT NULL REFERENCES Suppliers(supNo),
	streetAddress		TEXT,
	zipcode			INT REFERENCES Zips(zipcode)
);


--Spacecrafts
INSERT INTO Spacecrafts
(scID, name, tailNumber, weightTONS, fuelType, crewCapacity)
VALUES('sc001','Endeavour',42,172000,'MMH/N2O4',200);

INSERT INTO Spacecrafts
(scID, name, tailNumber, weightTONS, fuelType, crewCapacity)
VALUES('sc002','Columbia',9,240000,'ATREX',31);

--People
INSERT INTO People
(pID, firstName, lastName, age)
VALUES('p001','Farrell','Clinton','25');

INSERT INTO People
(pID, firstName, lastName, age)
VALUES('p002','Ormond','Barrett',30);

INSERT INTO People
(pID, firstName, lastName, age)
VALUES('p003','Rube','Hedley',41);

INSERT INTO People
(pID, firstName, lastName, age)
VALUES('p004','Wilton','Eldridge',24);

INSERT INTO People
(pID, firstName, lastName, age)
VALUES('p005','Jackson','Waters',28);

--Engineers
INSERT INTO Engineers(pID, highestDegree, favVideoGame)
VALUES('p001', 'PhD', 'Tetris');

--Operators
INSERT INTO Operators(pID, chairPreference, favoriteDrink)
VALUES('p003','NorSap 2000', 'Jack Daniels');

--Astronauts
INSERT INTO Astronauts(pID, yearsFlying, golfHandicap)
VALUES('p002',3,16);

INSERT INTO Astronauts(pID, yearsFlying, golfHandicap)
VALUES('p004',1,21);

INSERT INTO Astronauts(pID, yearsFlying, golfHandicap)
VALUES('p005',5,9);

--Crews
INSERT INTO Crews(scID, pID)
VALUES('sc001','p004');

INSERT INTO Crews(scID, pID)
VALUES('sc001','p005');

INSERT INTO Crews(scID, pID)
VALUES('sc002','p002');

--Suppliers
INSERT INTO Suppliers(supNo, name, paymentTerms)
VALUES(001,'Parts-R-Us','Cash-Only');

INSERT INTO Suppliers(supNo, name, paymentTerms)
VALUES(002,'All Things Space','Cash-Only');

--Parts
INSERT INTO Parts(partNo, name, description)
VALUES(88, 'ImportantThing', 'Shiny');

INSERT INTO Parts(partNo, name, description)
VALUES(99, 'Thingy', 'Not shiny');

--Systems
INSERT INTO Systems(sysNo, name, description)
VALUES(4, 'Dust Detector', 'Dirty');

INSERT INTO Systems(sysNo, name, description)
VALUES(44, 'Altimeter', 'Complicated');

--Zips
INSERT INTO Zips(zipcode, city, state)
VALUES(10940,'Middletown','NY');

INSERT INTO Zips(zipcode, city, state)
VALUES(12601,'Poughkeepsie','NY');

--SupplierLocations
INSERT INTO SupplierLocations(supNo, streetAddress, zipcode)
VALUES(001,'1 Main St',12601);

INSERT INTO SupplierLocations(supNo, streetAddress, zipcode)
VALUES(002,'3 Blue Ave',10940);

--Catalog
INSERT INTO Catalog(orderNo, supNo, partNo, sysNo, scID)
VALUES(1000, 001, 88, 4, 'sc001');

INSERT INTO Catalog(orderNo, supNo, partNo, sysNo, scID)
VALUES(1001, 001, 99, 44, 'sc001');

INSERT INTO Catalog(orderNo, supNo, partNo, sysNo, scID)
VALUES(1002, 002, 99, 4, 'sc002');

INSERT INTO Catalog(orderNo, supNo, partNo, sysNo, scID)
VALUES(1003, 002, 88, 44, 'sc002');





--Also, age shouldn't be just an INT but for time sake I haven't written extra for it


--Something like this is needed for checking crew sizes of space crafts
--but I can't figure it out
--CREATE FUNCTION chkSize() returns INT as $$
--declare 
--   curCrew int;
-- begin
--  select curCrew = count(pID) from Crew group by scID;
--  return curCrew;
-- end; 
--$$ LANGUAGE plpgsql