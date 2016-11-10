/*
Nick Comito
Database Management
Normalization 2
11/10/16
*/


--Create Database.  Delete any tables that may already exist
Drop table if exists People, Actors, Directors, MovieActors, MovieDirectors, Movie;

--Create People Table--
Create table People (
	pid			integer not null,
	firstName		text not null,
	lastName		text not null,
	SpouseName		text,
	address			varchar,
primary key (pid)
);

--Create Actors Table--
Create table Actors (
	pid			integer not null references People(pid),
	DOB			date,
	SAGAnniversaryDate	date, 
	heightInches		integer,
	weightLBS		integer, 
	hairColor		text,
	eyeColor		text,
	favoriteColor		text,
primary key (pid)
);

--Create Directors Table--
Create table Directors (
	pid 			integer not null references People(pid),
	filmSchoolAttended	text,
	DGAnniversaryDate	date,
	favoriteLensMaker	text,
primary key (pid)
);

--Create Movie Table--
Create table movie (
	mid			integer not null,
	movieTitle		text not null,
	releaseDate		date,
	totalSalesUSD		numeric,
	USDomesticBoxOfficeUSD	numeric,
	foreignBoxOfficeUSD	numeric,
	DVDBlueRaySalesUSD	numeric,
primary key (mid)
);

--Create MovieActors Table--
Create table MovieActors (
	pid			integer not null references People(pid),
	mid			integer not null references Movie(mid),
primary key (pid, mid)
);

--Create MovieDirectors Tables--
Create table MovieDirectors (
	pid			integer not null references People(pid),
	mid			integer not null references Movie(mid),
primary key (pid,mid)
);


--Insert Statements for People Table--

Insert into people (pid, firstName, lastName, SpouseName, address)
	    values (1001, 'Bruce',   'Willis', 'Anne',     '123 South North Rd, Hollywood, CA, 90210');

Insert into people (pid, firstName, lastName, SpouseName, address)
	    values (1002, 'Mark',   'Wahlberg', 'Holly',   '7 Springield Ave, Boston, MA, 03345');

Insert into people (pid, firstName, lastName, SpouseName, address)
	    values (1003, 'Daniel',   'Craig', 'Lisa',   '15 3rd Ave, New York, NY, 11234');

Insert into people (pid, firstName, lastName, SpouseName, address)
	    values (1004, 'Sean',   'Connery', 'Pam',    '007 Bond Ave, Agentville, CA, 70070');

Insert into people (pid, firstName, lastName, SpouseName, address)
	    values (1005, 'Will',   'Smith',  'Jada',   '1778 Fresh Prince Blvd Ave, Bel-Aire, CA, 90288');

Insert into people (pid, firstName, lastName, SpouseName, address)
	    values (1006, 'Steven', 'Spielberg', 'Mrs. Spielberg', '33 Legend Ave, Houston, TX, 00090');

Insert into people (pid, firstName, lastName, SpouseName, address)
	    values (1007, 'Nick',   'Comito', 'Some Lucky Lady',   'Alans Classroom, Marist College, NY, 12601');

--Insert Statements for Actors Table--

Insert into actors (pid,  DOB,       SAGAnniversaryDate, heightInches, weightLBS, hairColor, eyeColor, favoriteColor)
	    values (1001, '10-4-1955',  '12-17-1986',         72,           194,      'brown',   'brown',   'blue' );

Insert into actors (pid,    DOB,       SAGAnniversaryDate, heightInches, weightLBS, hairColor, eyeColor, favoriteColor)
	    values (1002, '11-8-1965', '12-17-1986',         68,           187,      'brown',   'brown',   'orange' );

Insert into actors (pid,    DOB,       SAGAnniversaryDate, heightInches, weightLBS, hairColor, eyeColor, favoriteColor)
	    values (1003, '5-25-1970', '8-15-1993',         74,           200,      'brown',   'green',   'black' );

Insert into actors (pid,    DOB,       SAGAnniversaryDate, heightInches, weightLBS, hairColor, eyeColor, favoriteColor)
	    values (1004, '7-18-1940', '9-19-1983',         73,           210,      'black',   'blue',   'red' );	    

Insert into actors (pid,    DOB,       SAGAnniversaryDate, heightInches, weightLBS, hairColor, eyeColor, favoriteColor)
	    values (1005, '6-15-1974', '9-21-2000',         71,           220,      'black',   'brown',   'blue' );


--Insert Statements for Directors table--

Insert into directors (pid, filmSchoolAttended, DGAnniversaryDate, favoriteLensMaker)
	    values    (1002, 'NYU',              '6-8-2005',       'Kodak Lens');

Insert into directors (pid, filmSchoolAttended, DGAnniversaryDate, favoriteLensMaker)
	    values    (1006, 'USC',              '3-20-1990',       'The most expensive one');

Insert into directors (pid, filmSchoolAttended, DGAnniversaryDate, favoriteLensMaker)
	    values    (1007, 'Marist College',  '12-12-2012',       'The cheapest one');


--Insert Statements for Movie table--

Insert into movie (mid, movieTitle,          releaseDate, totalSalesUSD, USDomesticBoxOfficeUSD, foreignBoxOfficeUSD, DVDBlueRaySalesUSD)
	    values(1,  'Saving Private Ryan', '7-24-1998', 172000000,   101000000,                49000000,                12000000);

Insert into movie (mid, movieTitle,          releaseDate,  totalSalesUSD, USDomesticBoxOfficeUSD, foreignBoxOfficeUSD, DVDBlueRaySalesUSD)
	    values(2,  'You Only Live Twice', '6-13-1967', 156000000,    90000000,                50000000,                16000000);

Insert into movie (mid, movieTitle,   releaseDate,  totalSalesUSD, USDomesticBoxOfficeUSD, foreignBoxOfficeUSD, DVDBlueRaySalesUSD)
	    values(3,  'I am Legend', '6-13-1967',  200000000,     120000000,               70000000,                10000000);

Insert into movie (mid, movieTitle, releaseDate,  totalSalesUSD, USDomesticBoxOfficeUSD, foreignBoxOfficeUSD, DVDBlueRaySalesUSD)
	    values(4,  'Red Foxes', '9-25-2015',   300000000,    200000000,               150000000,                50000000);


--Instert Statements for MovieActors--

Insert into movieActors (pid, mid)
	    values      (1001, 3);

Insert into movieActors (pid, mid)
	    values      (1001, 4);

Insert into movieActors (pid, mid)
	    values      (1002, 4);

Insert into movieActors (pid, mid)
	    values      (1003, 1);

Insert into movieActors (pid, mid)
	    values      (1004, 2);

Insert into movieActors (pid, mid)
	    values      (1004, 4);

Insert into movieActors (pid, mid)
	    values      (1005, 3);
	    


--Insert movieDirectors--

Insert into movieDirectors (pid, mid)
	    values         (1002, 3);

Insert into movieDirectors (pid, mid)
	    values         (1006, 1);

Insert into movieDirectors (pid, mid)
	    values         (1006, 4);

Insert into movieDirectors (pid, mid)
	    values         (1007, 2);

Insert into movieDirectors (pid, mid)
	    values         (1007, 4);



--Write a query to show all the directors with whom actor “Sean Connery” has worked.--

select distinct p_directors.*
from people p_actors, people p_directors, movie m, movieDirectors md, movieActors ma
where m.mid = md.mid
 and md.pid = p_directors.pid 
 and ma.pid = p_actors.pid 
 and ma.mid = m.mid
 and p_actors.firstName = 'Sean'
 and p_actors.lastName = 'Connery'
;

	  


