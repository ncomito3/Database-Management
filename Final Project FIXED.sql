/*
Nick Comito
Database Management Final Project
NCAA Football Datbase
12/08/16
*/

DROP VIEW  IF EXISTS OffensiveAthletes;
DROP VIEW  IF EXISTS DefensiveAthletes;
DROP VIEW  IF EXISTS SpecialTeamsAthletes;
DROP TABLE IF EXISTS AthletePositions;
DROP TABLE IF EXISTS OffensiveStats;
DROP TABLE IF EXISTS DefensiveStats;
DROP TABLE IF EXISTS SpecialTeamsStats;
DROP TABLE IF EXISTS TeamPositions;
DROP TABLE IF EXISTS Positions;
DROP TABLE IF EXISTS Athletes;
DROP TABLE IF EXISTS Coaches;
DROP TABLE IF EXISTS CollegeTeams;
DROP TABLE IF EXISTS Person;
DROP TABLE IF EXISTS StatsTable;

		----Create Statements For Tables---

-- Person --
CREATE TABLE Person (
  Pid          varchar(10) not null unique,
  LastName     text, 
  FirstName    text, 
  DOB          date,
  PhoneNumber  BIGINT,
  primary key(Pid)
);


-- CollegeTeams -- 
CREATE TABLE CollegeTeams (
  CollegeID            varchar(10) not null,
  CollegeName		text not null,
  NCAADivision         integer not null check (NCAADivision >= 1 and NCAADivision <= 3 ),    
  Conference           text not null,
  SubConference        text,
  City                 text not null,
  State                text not null,
 primary key(CollegeID)
);


-- Athletes --
CREATE TABLE Athletes (
  Aid        	    varchar(10) not null references Person(Pid),
  CollegeID	    varchar(10) not null references CollegeTeams(CollegeID),
  HeightInches      BIGINT, 
  WeightPounds      BIGINT,
  GPA               decimal(3,2) check (GPA >= 0.00 and GPA <= 4.00),
  CollegeStartDate  date not null,
 primary key(Aid)
);        


-- Coaches Table --
CREATE TABLE Coaches (
  Cid              varchar(10) not null references Person(Pid),
  CollegeID	    varchar(10) not null references CollegeTeams(CollegeID),
  CoachTitle        text,
  CoachingDebut     date,
 primary key(Cid)
);

--Positions Table--

CREATE TABLE Positions (
  PositionID	    text unique not null,
  PositionType	    text,
 primary key(PositionID)
);


CREATE TABLE TeamPositions (
  CollegeID         varchar(10) not null references CollegeTeams(CollegeID),
  PositionID	    text not null references Positions(PositionID),
 primary key(CollegeID, PositionID)
);

--AthletePositions Table: Shows the positions that each athlete plays for their respective College Team--

CREATE TABLE AthletePositions (
  Aid         	    varchar(10) not null references Athletes(Aid),
  PositionID	    text not null references Positions(PositionID),
 primary key (Aid, PositionID) 
);

--Create StatsTable--

CREATE TABLE StatsTable (
  Sid         	    varchar(10) not null,
  Description	    text,
 primary key(Sid)
);

--OffensiveStats Table: Shows the stats relate to offensive posotions and pereformance of Athletes who play these positions--

CREATE TABLE OffensiveStats (
  Aid	            varchar(10) not null references Athletes(Aid),
  PositionID	    text not null references Positions(PositionID) check (PositionID = 'QB' or PositionID = 'RB' or PositionID = 'FB' or PositionID = 'WR' or PositionID = 'TE' or PositionID = 'OL'),
  Sid         	    varchar(10) not null references StatsTable(Sid),
  Performance	    varchar(15),
 primary key(Sid, Aid, PositionID)
);


--DefensiveStats Table: Shows the stats relate to defensive posotions and pereformance of Athletes who play these positions--

CREATE TABLE DefensiveStats (
  Aid	            varchar(10) not null references Athletes(Aid),
  PositionID	    text not null references Positions(PositionID) check (PositionID = 'DL' or PositionID = 'LB' or PositionID = 'CB' or PositionID = 'S'),
  Sid         	    varchar(10) not null references StatsTable(Sid),
  Performance	    varchar(15),
 primary key(Sid, Aid, PositionID)
);


--SpecialTeamsStats Table: Shows the stats relate to special team posotions and pereformance of Athletes who play these positions--

CREATE TABLE SpecialTeamsStats (
  Aid	            varchar(10) not null references Athletes(Aid),
  PositionID	    text not null references Positions(PositionID) check (PositionID = 'K' or PositionID = 'P' or PositionID = 'H' or PositionID = 'LS' or PositionID = 'KR' or PositionID = 'PR'),
  Sid         	    varchar(10) not null references StatsTable(Sid),
  Performance	    varchar(15),
 primary key(Sid, Aid, PositionID)
);


			--Insert Statements--

--Insert Statements for Person Table--

INSERT INTO Person( Pid, LastName, FirstName, DOB, PhoneNumber )
  VALUES          ('p01', 'Smith', 'Mike', '10-15-1996', 5164458872);

INSERT INTO Person( Pid, LastName, FirstName, DOB, PhoneNumber )
  VALUES          ('p02', 'Peppers', 'Jabril', '1-2-1995', 6675467723);

INSERT INTO Person( Pid, LastName, FirstName, DOB, PhoneNumber )
  VALUES          ('p03', 'Jackson', 'Lamar', '3-4-1995', 2233445667);

INSERT INTO Person( Pid, LastName, FirstName, DOB, PhoneNumber )
  VALUES          ('p04' ,'Parady' ,'Jim', '6-8-1961', 7908876645);

INSERT INTO Person( Pid, LastName, FirstName, DOB, PhoneNumber )
  VALUES          ('p05' ,'Comito', 'Nick', '7-4-1996', 1118675309);

INSERT INTO Person( Pid, LastName, FirstName, DOB, PhoneNumber )
  VALUES          ('p06' ,'Sweeny' ,'Dabo' , '9-17-1966', 4456734467);

INSERT INTO Person( Pid, LastName, FirstName, DOB, PhoneNumber )
  VALUES          ('p07', 'Saban', 'Nick', '9-4-1960', 1122211122);

INSERT INTO Person( Pid, LastName, FirstName, DOB, PhoneNumber )
  VALUES          ('p08' ,'McCaffery' ,'Christian', '4-9-1996', 7788879932);

INSERT INTO Person( Pid, LastName, FirstName, DOB, PhoneNumber )
  VALUES          ('p09' ,'Jackson Jr', 'Bo', '9-10-1995', 7789045093);

INSERT INTO Person( Pid, LastName, FirstName, DOB, PhoneNumber )
  VALUES          ('p10' ,'Sanders Jr' ,'Deion' , '6-26-1996', 5567241123);

INSERT INTO Person( Pid, LastName, FirstName, DOB, PhoneNumber )
  VALUES          ('p11' ,'Jones' ,'Chris' , '10-17-1996', 4456775467);

INSERT INTO Person( Pid, LastName, FirstName, DOB, PhoneNumber )
  VALUES          ('p12', 'Miles', 'Les', '12-4-1955', 1122871122);

INSERT INTO Person( Pid, LastName, FirstName, DOB, PhoneNumber )
  VALUES          ('p13' ,'Watson' ,'DeSean', '4-9-1995', 9088879932);

INSERT INTO Person( Pid, LastName, FirstName, DOB, PhoneNumber )
  VALUES          ('p14' ,'Revis', 'Lance', '8-10-1995', 7789090093);

INSERT INTO Person( Pid, LastName, FirstName, DOB, PhoneNumber )
  VALUES          ('p15' ,'Lovett' ,'John' , '6-18-1996', 6167241753);

--Insert Statements for CollegeTeams Table--

INSERT INTO CollegeTeams( CollegeID, CollegeName, NCAADivision, Conference, SubConference, City, State )
  VALUES                ('c01','Clemson University', '1','ACC','Atlantic',  'Clemson', 'South Carolina' );

INSERT INTO CollegeTeams( CollegeID, CollegeName, NCAADivision, Conference, SubConference, City, State )
  VALUES                ('c02', 'Michigan University', '1', 'Big Ten', 'East', 'Ann Arbor', 'Michigan' );

INSERT INTO CollegeTeams( CollegeID, CollegeName, NCAADivision, Conference, SubConference, City, State )
  VALUES                ('c03', 'Penn State University', '1', 'Big Ten', 'East', 'University Park', 'Pennsylvania' );

INSERT INTO CollegeTeams( CollegeID, CollegeName, NCAADivision, Conference, SubConference, City, State )
  VALUES                ('c04', 'Marist College', '1', 'Pioneer', '', 'Poughkeepsie', 'New York' );

INSERT INTO CollegeTeams( CollegeID, CollegeName, NCAADivision, Conference, SubConference, City, State )
  VALUES                ('c05', 'Alabama University', '1', 'SEC', 'West', 'Tuscaloosa', 'Alabama' );

INSERT INTO CollegeTeams( CollegeID, CollegeName, NCAADivision, Conference, SubConference, City, State )
  VALUES                ('c06', 'C.W Post University', '2', 'ECAC', 'North', 'Brookville', 'New York');

INSERT INTO CollegeTeams( CollegeID, CollegeName, NCAADivision, Conference, SubConference, City, State )
  VALUES                ('c07', 'Union College', '3', 'Liberty League', '', 'Schenectady', 'New York' );

INSERT INTO CollegeTeams( CollegeID, CollegeName, NCAADivision, Conference, SubConference, City, State )
  VALUES                ('c08', 'Stanford University', '1', 'Pac-12', 'South', 'Stanford', 'California' );

INSERT INTO CollegeTeams( CollegeID, CollegeName, NCAADivision, Conference, SubConference, City, State )
  VALUES                ('c09', 'Notre Dame', '1', 'Independent', '', 'South Bend', 'Indiana' );

INSERT INTO CollegeTeams( CollegeID, CollegeName, NCAADivision, Conference, SubConference, City, State )
  VALUES                ('c10', 'Harvard University', '1', 'IVY', '', 'Cambridge', 'Massachusetts' );

INSERT INTO CollegeTeams( CollegeID, CollegeName, NCAADivision, Conference, SubConference, City, State )
  VALUES                ('c11', 'Princeton University', '1', 'IVY', '', 'Princeton', 'New Jersey' );

INSERT INTO CollegeTeams( CollegeID, CollegeName, NCAADivision, Conference, SubConference, City, State )
  VALUES                ('c12', 'Louisiana State University', '1', 'SEC', 'East', 'Baton Rouge', 'Louisiana');


--Insert Statements for Athletes Table--

INSERT INTO Athletes( Aid, CollegeID, HeightInches, WeightPounds, GPA, CollegeStartDate )
  VALUES            ('p01', 'c03', '72', '210', '3.83', '9-1-2014');     	    

INSERT INTO Athletes( Aid, CollegeID, HeightInches, WeightPounds, GPA, CollegeStartDate )
  VALUES            ('p02', 'c02', '71', '205', '3.12', '8-24-2013');

INSERT INTO Athletes( Aid, CollegeID, HeightInches, WeightPounds, GPA, CollegeStartDate )
  VALUES            ('p03', 'c12', '75', '217', '2.98', '9-4-2013' );     	    

INSERT INTO Athletes( Aid, CollegeID, HeightInches, WeightPounds, GPA, CollegeStartDate )
  VALUES            ('p05', 'c03', '67', '170', '4.00', '8-23-2014');  	    

INSERT INTO Athletes( Aid, CollegeID, HeightInches, WeightPounds, GPA, CollegeStartDate )
  VALUES            ('p08', 'c08', '72', '205', '3.57', '8-15-2014');

INSERT INTO Athletes( Aid, CollegeID, HeightInches, WeightPounds, GPA, CollegeStartDate )
  VALUES            ('p09', 'c05', '70', '220', '3.18', '9-4-2015' );     	    

INSERT INTO Athletes( Aid, CollegeID, HeightInches, WeightPounds, GPA, CollegeStartDate )
  VALUES            ('p10', 'c09', '74', '195', '0.00', '8-25-2016' );


INSERT INTO Athletes( Aid, CollegeID, HeightInches, WeightPounds, GPA, CollegeStartDate )
  VALUES            ('p11', 'c06', '66', '165', '3.79', '8-23-2013');  	    

INSERT INTO Athletes( Aid, CollegeID, HeightInches, WeightPounds, GPA, CollegeStartDate )
  VALUES            ('p13', 'c01', '75', '215', '3.09', '8-15-2013');

INSERT INTO Athletes( Aid, CollegeID, HeightInches, WeightPounds, GPA, CollegeStartDate )
  VALUES            ('p14', 'c07', '70', '220', '3.00', '9-4-2013' );     	    

INSERT INTO Athletes( Aid, CollegeID, HeightInches, WeightPounds, GPA, CollegeStartDate )
  VALUES            ('p15', 'c11', '74', '210', '3.67', '8-25-2014' );


---Insert Statements for Coaches Table---

INSERT INTO Coaches( Cid, CollegeID, CoachTitle, CoachingDebut )
  VALUES            ('p04', 'c04', 'Head Coach', '9-16-2002' );

INSERT INTO Coaches( Cid, CollegeID, CoachTitle, CoachingDebut )
  VALUES            ('p05', 'c01', 'Head Coach', '8-27-1996' );

INSERT INTO Coaches( Cid, CollegeID, CoachTitle, CoachingDebut )
  VALUES           ('p07', 'c05', 'Head Coach', '10-6-1991' );

INSERT INTO Coaches( Cid, CollegeID, CoachTitle, CoachingDebut )
  VALUES           ('p12', 'c12', 'Head Coach', '9-6-1987' );

--Insert Statements for Position Table 

INSERT INTO Positions(PositionID, PositionType )
  VALUES            ('QB', 'Offense' );

INSERT INTO Positions(PositionID, PositionType )
  VALUES            ('RB', 'Offense' );

INSERT INTO Positions(PositionID, PositionType )
  VALUES            ('FB', 'Offense' );

INSERT INTO Positions(PositionID, PositionType )
  VALUES            ('TE', 'Offense' );

INSERT INTO Positions(PositionID, PositionType )
  VALUES            ('WR', 'Offense' );

INSERT INTO Positions(PositionID, PositionType )
  VALUES            ('OL', 'Offense' );

INSERT INTO Positions(PositionID, PositionType )
  VALUES            ('DL', 'Defense' );

INSERT INTO Positions(PositionID, PositionType )
  VALUES            ('LB', 'Defense' );

INSERT INTO Positions(PositionID, PositionType )
  VALUES            ('CB', 'Defense' );

INSERT INTO Positions(PositionID, PositionType )
  VALUES            ('S', 'Defense' );

INSERT INTO Positions(PositionID, PositionType )
  VALUES            ('K', 'Special Teams' );

INSERT INTO Positions(PositionID, PositionType )
  VALUES            ('P', 'Special Teams' );

INSERT INTO Positions(PositionID, PositionType )
  VALUES            ('H', 'Special Teams' );

INSERT INTO Positions(PositionID, PositionType )
  VALUES            ('LS', 'Special Teams' );

INSERT INTO Positions(PositionID, PositionType )
  VALUES            ('KR', 'Special Teams' );

INSERT INTO Positions(PositionID, PositionType )
  VALUES            ('PR', 'Special Teams' );


--Insert Statements for TeamPositions

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c01', 'QB');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c01', 'RB'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c01', 'FB');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c01', 'TE');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c01', 'WR'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c01', 'OL');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c01', 'DL');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c01', 'LB'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c01', 'CB');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c01', 'S');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c01', 'K'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c01', 'P');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c01', 'H');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c01', 'LS');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c01', 'KR'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c01', 'PR');

--------------------
INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c02', 'QB');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c02', 'RB'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c02', 'FB');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c02', 'TE');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c02', 'WR'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c02', 'OL');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c02', 'DL');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c02', 'LB'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c02', 'CB');
  
INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c02', 'S');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c02', 'K'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c02', 'P');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c02', 'H');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c02', 'LS');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c02', 'KR'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES      		('c02','PR');


------

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c03', 'QB');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c03', 'RB'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c03', 'FB');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c03', 'TE');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c03', 'WR'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c03', 'OL');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c03', 'DL');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c03', 'LB'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c03', 'CB');
  
INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c03', 'S');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c03', 'K'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c03', 'P');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c03', 'H');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c03', 'LS');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c03', 'KR'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES      		('c03','PR');

---

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c04', 'QB');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c04', 'RB'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c04', 'FB');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c04', 'TE');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c04', 'WR'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c04', 'OL');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c04', 'DL');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c04', 'LB'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c04', 'CB');
  
INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c04', 'S');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c04', 'K'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c04', 'P');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c04', 'H');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c04', 'LS');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c04', 'KR'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES      		('c04','PR');

-----


INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c05', 'QB');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c05', 'RB'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c05', 'FB');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c05', 'TE');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c05', 'WR'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c05', 'OL');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c05', 'DL');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c05', 'LB'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c05', 'CB');
  
INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c05', 'S');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c05', 'K'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c05', 'P');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c05', 'H');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c05', 'LS');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c05', 'KR'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES      		('c05','PR');

-----

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c06', 'QB');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c06', 'RB'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c06', 'FB');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c06', 'TE');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c06', 'WR'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c06', 'OL');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c06', 'DL');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c06', 'LB'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c06', 'CB');
  
INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c06', 'S');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c06', 'K'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c06', 'P');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c06', 'H');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c06', 'LS');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c06', 'KR'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES      		  ('c06','PR');

-----

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c07', 'QB');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c07', 'RB'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c07', 'FB');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c07', 'TE');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c07', 'WR'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c07', 'OL');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c07', 'DL');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c07', 'LB'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c07', 'CB');
  
INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c07', 'S');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c07', 'K'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c07', 'P');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c07', 'H');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c07', 'LS');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c07', 'KR'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES      		('c07','PR');

---

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c08', 'QB');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c08', 'RB'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c08', 'FB');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c08', 'TE');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c08', 'WR'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c08', 'OL');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c08', 'DL');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c08', 'LB'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c08', 'CB');
  
INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c08', 'S');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c08', 'K'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c08', 'P');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c08', 'H');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c08', 'LS');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c08', 'KR'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES      		  ('c08','PR');


-------
INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c09', 'QB');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c09', 'RB'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c09', 'FB');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c09', 'TE');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c09', 'WR'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c09', 'OL');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c09', 'DL');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c09', 'LB'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c09', 'CB');
  
INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c09', 'S');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c09', 'K'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c09', 'P');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c09', 'H');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c09', 'LS');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c09', 'KR'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES      		  ('c09','PR');


-----


INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c10', 'QB');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c10', 'RB'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c10', 'FB');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c10', 'TE');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c10', 'WR'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c10', 'OL');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c10', 'DL');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c10', 'LB'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c10', 'CB');
  
INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c10', 'S');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c10', 'K'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c10', 'P');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c10', 'H');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c10', 'LS');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c10', 'KR'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES      		  ('c10','PR');

-----

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c11', 'QB');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c11', 'RB'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c11', 'FB');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c11', 'TE');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c11', 'WR'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c11', 'OL');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c11', 'DL');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c11', 'LB'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c11', 'CB');
  
INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c11', 'S');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c11', 'K'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c11', 'P');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c11', 'H');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c11', 'LS');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c11', 'KR'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES      		  ('c11','PR');


------

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c12', 'QB');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c12', 'RB'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c12', 'FB');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c12', 'TE');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c12', 'WR'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c12', 'OL');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c12', 'DL');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c12', 'LB'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c12', 'CB');
  
INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c12', 'S');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c12', 'K'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c12', 'P');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c12', 'H');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c12', 'LS');

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES                 ('c12', 'KR'); 

INSERT INTO TeamPositions(CollegeID, PositionID)
  VALUES      		  ('c12','PR');




--Insert Statements for AthletePositions

INSERT INTO AthletePositions(AID, PositionID)
  VALUES                   ('p01', 'QB');

INSERT INTO AthletePositions(AID, PositionID)
  VALUES                    ('p02', 'QB');

INSERT INTO AthletePositions(AID, PositionID)
  VALUES                    ('p02', 'RB');

INSERT INTO AthletePositions(AID, PositionID)
  VALUES                    ('p02', 'LB');

INSERT INTO AthletePositions(AID, PositionID)
  VALUES                    ('p02', 'PR');

INSERT INTO AthletePositions(AID, PositionID)
  VALUES                    ('p03', 'QB');

INSERT INTO AthletePositions(AID, PositionID)
  VALUES                    ('p05', 'WR');

INSERT INTO AthletePositions(AID, PositionID)
  VALUES                    ('p05', 'KR'); 

INSERT INTO AthletePositions(AID, PositionID)
  VALUES                    ('p08', 'RB');

INSERT INTO AthletePositions(AID, PositionID)
  VALUES                    ('p08', 'S');

INSERT INTO AthletePositions(AID, PositionID)
  VALUES                    ('p09', 'LB');

INSERT INTO AthletePositions(AID, PositionID)
  VALUES                    ('p10', 'WR');

INSERT INTO AthletePositions(AID, PositionID)
  VALUES                    ('p10', 'KR');

INSERT INTO AthletePositions(AID, PositionID)
  VALUES                    ('p11', 'K');

INSERT INTO AthletePositions(AID, PositionID)
  VALUES                    ('p11', 'P');

INSERT INTO AthletePositions(AID, PositionID)
  VALUES                    ('p13', 'QB');
      
INSERT INTO AthletePositions(AID, PositionID)
  VALUES                    ('p13', 'H');

INSERT INTO AthletePositions(AID, PositionID)
  VALUES                   ('p14', 'OL');

INSERT INTO AthletePositions(AID, PositionID)
  VALUES                    ('p14', 'LS');

INSERT INTO AthletePositions(AID, PositionID)
  VALUES                    ('p15', 'QB');

INSERT INTO AthletePositions(AID, PositionID)
  VALUES                    ('p15', 'RB');

INSERT INTO AthletePositions(AID, PositionID)
  VALUES                    ('p15', 'TE');


  
----Insert Statements for StatsTable---

INSERT INTO StatsTable(Sid, Description)
  VALUES              ('001', 'Passer Rating');

INSERT INTO StatsTable(Sid, Description)
  VALUES              ('002', 'Passing TD');

INSERT INTO StatsTable(Sid, Description)
  VALUES              ('003', 'Interceptions Thrown');

INSERT INTO StatsTable(Sid, Description)
  VALUES              ('004', 'Total Passing Yard');

INSERT INTO StatsTable(Sid, Description)
  VALUES              ('005', 'Rushing  TD');

INSERT INTO StatsTable(Sid, Description)
  VALUES              ('006', 'Rushing Yards per carry');

INSERT INTO StatsTable(Sid, Description)
  VALUES              ('007', 'Rushing yards per game');

INSERT INTO StatsTable(Sid, Description)
  VALUES              ('008', 'Total Rushing Yards');

INSERT INTO StatsTable(Sid, Description)
  VALUES              ('009', 'Fumbles');

INSERT INTO StatsTable(Sid, Description)
  VALUES              ('010', 'Receiving TD');

INSERT INTO StatsTable(Sid, Description)
  VALUES              ('011', 'Receiving Yards per Catch');

INSERT INTO StatsTable(Sid, Description)
  VALUES              ('012', 'Receivng Yards Per Game');

INSERT INTO StatsTable(Sid, Description)
  VALUES              ('013', 'Total Receiving Yards');

INSERT INTO StatsTable(Sid, Description)
  VALUES              ('014', 'Dropped Passes');

INSERT INTO StatsTable(Sid, Description)
  VALUES              ('015', 'Tackles');

INSERT INTO StatsTable(Sid, Description)
  VALUES              ('016', 'Forced Fumbles');

INSERT INTO StatsTable(Sid, Description)
  VALUES              ('017', 'Fumble Recoveries');

INSERT INTO StatsTable(Sid, Description)
  VALUES              ('018', 'Defensive Interceptions');

INSERT INTO StatsTable(Sid, Description)
  VALUES              ('019', 'Defensive TDs');

INSERT INTO StatsTable(Sid, Description)
  VALUES              ('020', 'Pass Break Ups');

INSERT INTO StatsTable(Sid, Description)
  VALUES              ('021', 'Sacks');

INSERT INTO StatsTable(Sid, Description)
  VALUES              ('022', 'Kick Return TDs');

INSERT INTO StatsTable(Sid, Description)
  VALUES              ('023', 'Average Kick Return Yards');

INSERT INTO StatsTable(Sid, Description)
  VALUES              ('024', 'Punt Return TDs');

INSERT INTO StatsTable(Sid, Description)
  VALUES              ('025', 'Average Punt Return Yards');

INSERT INTO StatsTable(Sid, Description)
  VALUES              ('026', 'Field Goals Made');

INSERT INTO StatsTable(Sid, Description)
  VALUES              ('027', 'Field Goals Attempted');

INSERT INTO StatsTable(Sid, Description)
  VALUES              ('028', 'Forced Touch Backs');

INSERT INTO StatsTable(Sid, Description)
  VALUES              ('029', 'Forced Fair Catches');

INSERT INTO StatsTable(Sid, Description)
  VALUES              ('030', 'Number of Bad Snaps');

INSERT INTO StatsTable(Sid, Description)
  VALUES              ('031', 'Number of Bad Holds');


-----OFFENSIVIE STATS TABLE----

---Insert Statements for Passing Stats---

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p01', 'QB', '001', '101.5');

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p01', 'QB', '002', '87');

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p01', 'QB', '003', '13'); 

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p01', 'QB', '004', '6,874'); 

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p02', 'QB', '001', '98.7');

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p02', 'QB', '002', '6');

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p02', 'QB', '003', '0'); 

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p02', 'QB', '004', '147'); 

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p03', 'QB', '001', '108.9');

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p03', 'QB', '002', '94');

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p03', 'QB', '003', '15'); 

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p03', 'QB', '004', '10,098'); 

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p13', 'QB', '001', '110.9');

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p13', 'QB', '002', '110');

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p13', 'QB', '003', '21'); 

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p13', 'QB', '004', '12,090'); 

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p15', 'QB', '001', '103.4');

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p15', 'QB', '002', '28');

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p15', 'QB', '003', '4'); 

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p15', 'QB', '004', '7,908'); 

--Insert Rushing Stats--

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p02', 'RB', '005', '8');

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p02', 'RB', '006', '4.7');

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p02', 'RB', '007', '65'); 

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p02', 'RB', '008', '892'); 

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p08', 'RB', '005', '16');

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p08', 'RB', '006', '5.3');

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p08', 'RB', '007', '123'); 

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p08', 'RB', '008', '2,789'); 

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p15', 'RB', '005', '18');

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p15', 'RB', '006', '3.9');

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p15', 'RB', '007', '89'); 

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p15', 'RB', '008', '1,789'); 

---Insert Receiving Stats

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p05', 'WR', '010', '13');

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p05', 'WR', '011', '17.8');

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p05', 'WR', '012', '96.5'); 

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p05', 'WR', '013', '1,678'); 

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p10', 'WR', '010', '9');

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p10', 'WR', '011', '20.8');

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p10', 'WR', '012', '80.5'); 

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p10', 'WR', '013', '1,378'); 

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p15', 'TE', '010', '7');

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p15', 'WR', '011', '13.9');

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p15', 'WR', '012', '57.8'); 

INSERT INTO OffensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p15', 'WR', '013', '805'); 



-----DEFENSIVE STATS TABLE---
INSERT INTO DefensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p02', 'LB', '015', '84'); 

INSERT INTO DefensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p02', 'LB', '016', '3'); 

INSERT INTO DefensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p02', 'LB', '017', '6'); 

INSERT INTO DefensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p02', 'LB', '018', '7'); 

INSERT INTO DefensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p02', 'LB', '019', '2'); 

INSERT INTO DefensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p02', 'LB', '020', '15');

INSERT INTO DefensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p02', 'LB', '021', '8'); 

INSERT INTO DefensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p09', 'LB', '015', '78'); 

INSERT INTO DefensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p09', 'LB', '016', '2'); 

INSERT INTO DefensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p09', 'LB', '017', '5'); 

INSERT INTO DefensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p09', 'LB', '018', '4'); 

INSERT INTO DefensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p09', 'LB', '019', '1'); 

INSERT INTO DefensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p09', 'LB', '020', '11');

INSERT INTO DefensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p09', 'LB', '021', '12'); 

INSERT INTO DefensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p08', 'S', '015', '41'); 

INSERT INTO DefensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p08', 'LB', '016', '1'); 

INSERT INTO DefensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p08', 'LB', '017', '1'); 

INSERT INTO DefensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p08', 'LB', '018', '10'); 

INSERT INTO DefensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p08', 'LB', '019', '27'); 

INSERT INTO DefensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p08', 'LB', '020', '4');

INSERT INTO DefensiveStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p08', 'LB', '021', '12'); 



-----Insert Tables for SpecialTeams----

INSERT INTO SpecialTeamsStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p11', 'K', '026', '60'); 

INSERT INTO SpecialTeamsStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p11', 'K', '027', '71'); 

INSERT INTO SpecialTeamsStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p11', 'K', '028', '52'); 

INSERT INTO SpecialTeamsStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p11', 'P', '029', '28'); 

INSERT INTO SpecialTeamsStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p13', 'H', '030', '7');

INSERT INTO SpecialTeamsStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p14', 'LS', '031', '5'); 

INSERT INTO SpecialTeamsStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p05', 'KR', '022', '6'); 

INSERT INTO SpecialTeamsStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p05', 'KR', '023', '28.7'); 

INSERT INTO SpecialTeamsStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p10', 'KR', '022', '3'); 

INSERT INTO SpecialTeamsStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p10', 'KR', '023', '26.4'); 

INSERT INTO SpecialTeamsStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p02', 'PR', '024', '7');

INSERT INTO SpecialTeamsStats(Aid, PositionID, Sid, Performance)
  VALUES                  ('p02', 'PR', '025', '12.8'); 




			---Views---

--Players of offensive positions

CREATE VIEW OffensiveAthletes AS
select distinct p.pid, p.lastName, p.firstName, po.positionID, ct.collegeName
from athletes a, athletepositions ap, person p, positions po, teampositions tp, collegeTeams ct
where po.positionId = tp.positionID
	and tp.positionID = ap.positionID
	and ap.aid = a.aid
	and a.aid = p.pid
	and ct.collegeID = a.collegeID
	and po.positionType = 'Offense'
order by pid ASC;

Select * 
from OffensiveAthletes;


--Players of defensive positions:

CREATE VIEW DefensiveAthletes AS
select distinct p.pid, p.lastName, p.firstName, po.positionID, ct.collegeName
from athletes a, athletepositions ap, person p, positions po, teampositions tp, collegeTeams ct
where po.positionId = tp.positionID
	and tp.positionID = ap.positionID
	and ap.aid = a.aid
	and a.aid = p.pid
	and ct.collegeID = a.collegeID
	and po.positionType = 'Defense'
order by pid ASC;

Select *
from defensiveAthletes;


--Players of special teams positions

CREATE VIEW SpecialTeamsAthletes As
select distinct p.pid, p.lastName, p.firstName, po.positionID, ct.collegeName
from athletes a, athletepositions ap, person p, positions po, teampositions tp, collegeTeams ct
where po.positionId = tp.positionID
	and tp.positionID = ap.positionID
	and ap.aid = a.aid
	and a.aid = p.pid
	and ct.collegeID = a.collegeID
	and po.positionType = 'Special Teams'
order by pid ASC;

Select *
from specialTeamsAthletes;


			----Stored Procedures---

			
---Stored precedure For Offensive Stats-- 
create or replace function OffenseStatsFor(text, text,REFCURSOR) returns refcursor as
$$
declare
   AthleteLastName   text       := $1;
   AthleteFirstName  text       := $2;
   resultset         REFCURSOR  := $3;
begin
   open resultset for 
      select distinct p.lastname,p.firstname, ct.collegeName, o.*, st.description
      from statsTable st, offensiveStats o, person p, collegeTeams ct, athletes a
      where o.aid = p.pid
           and p.lastName LIKE AthleteLastName
           and p.firstName LIKE AthleteFirstName
           and o.sid = st.sid
           and o.aid = a.aid
           and a.aid = p.pid
           and a.collegeID = ct.collegeID
       order by positionID ASC;
    return resultset;
end;
$$ 
language plpgsql;

select OffenseStatsFor('L%', 'J%','results');
fetch all from results;



---Store Procedure for Athletes by Position---
create or replace function Get_Athlete_by_Position(text,REFCURSOR) returns refcursor as
$$
declare
   Position    text       :=  $1;
   resultset   REFCURSOR  := $2;
begin
   open resultset for 
      select distinct ap.aid, p.lastName, p.firstName, ap.positionID, ct.collegeName
      from AthletePositions ap, person p, collegeTeams ct, athletes a
      where a.collegeID = ct.collegeID
         and ap.aid = a.aid
         and a.aid = p.pid
         and ap.positionID = Position
       order by aid ASC;
    return resultset;
end;
$$ 
language plpgsql;

select Get_Athlete_by_Position('QB', 'results2');
fetch all from results2;


---Get Athletes by Schools--

create or replace function Get_Athlete_by_College(text,REFCURSOR) returns refcursor as
$$
declare
   CollegeNamePassIn    text       :=  $1;
   resultset            REFCURSOR  :=  $2;
begin
   open resultset for 
      select distinct ap.aid, p.lastName, p.firstName, ap.positionID
      from AthletePositions ap, person p, collegeTeams ct, athletes a
      where a.collegeID = ct.collegeID
           and ap.aid = a.aid
           and a.aid = p.pid
           and ct.collegeName = CollegeNamePassIn
      order by aid ASC;
   return resultset;
end;
$$ 
language plpgsql;

select Get_Athlete_by_College('Penn State University', 'results3');
fetch all from results3;



		----Reports----
		
---Draft Eligable Report--
select p.*, ct.collegeName, a.collegeStartDate
from person p, athletes a, collegeTeams ct
where pid = aid
   and ct.collegeID = a.collegeID
   and extract (day from now() - a.collegeStartDate) > 365 * 3
; 

select distinct p.pid, p.lastName, p.firstName, ct.collegeName, ct.conference, a.heightInches, a.weightPounds
from athletes a, collegeTeams ct, person p
where p.pid = a.aid
     and ct.collegeID = a.collegeID
     and ct.collegeName IN (select distinct ct.collegeName
                            from collegeTeams ct
                            where ct.NCAADivision = 1 
                             and ct.conference IN ('SEC', 'ACC', 'Big Ten', 'Pac-12', 'Big 12')
                        )
Order by ct.collegeName;

       


		-----Security----
--NCAA_Admin has the ability to view, insert, and update the entire database since it is ran and mainted by them
create role NCAA_Admin;
grant select, insert, update
on all tables in schema public
to NCAA_Admin;

---Collge Admin has the ability to view the entire database but cannot change it in anyway--- 
create role College_Admin;
grant select 
on all tables in schema public
to College_Admin;

--NFL Teams can look at the entire database to make decisions regarding the drafts
create role NFL_Teams;
grant select
on all tables in schema public
to NFL_Teams;



