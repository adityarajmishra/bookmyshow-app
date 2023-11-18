**[BookMySHow Database Assignment\
\
\
]{.underline}**P1 - Database Design:

Entities:

Theatre:

Attributes: TheatreID (Primary Key), Name, Location, Capacity, \...

Movie:

Attributes: MovieID (Primary Key), Title, Genre, \...

ShowDate:

Attributes: ShowDateID (Primary Key), Date, TheatreID (Foreign Key),
\...

ShowTime:

Attributes: ShowTimeID (Primary Key), Time, \...

Show:

Attributes: ShowID (Primary Key), MovieID (Foreign Key), TheatreID
(Foreign Key), ShowDateID (Foreign Key), ShowTimeID (Foreign Key)

**[SQL Queries for P1:]{.underline}**\
\
\-- Theatre Table

CREATE TABLE Theatre (

TheatreID INT PRIMARY KEY,

Name VARCHAR(255),

Location VARCHAR(255),

Capacity INT,

\-- Other attributes

);

\-- Movie Table

CREATE TABLE Movie (

MovieID INT PRIMARY KEY,

Title VARCHAR(255),

Genre VARCHAR(255),

\-- Other attributes

);

\-- ShowDate Table

CREATE TABLE ShowDate (

ShowDateID INT PRIMARY KEY,

Date DATE,

TheatreID INT,

FOREIGN KEY (TheatreID) REFERENCES Theatre(TheatreID),

\-- Other attributes

);

\-- ShowTime Table

CREATE TABLE ShowTime (

ShowTimeID INT PRIMARY KEY,

Time TIME,

\-- Other attributes

);

\-- Show Table

CREATE TABLE Show (

ShowID INT PRIMARY KEY,

MovieID INT,

TheatreID INT,

ShowDateID INT,

ShowTimeID INT,

FOREIGN KEY (MovieID) REFERENCES Movie(MovieID),

FOREIGN KEY (TheatreID) REFERENCES Theatre(TheatreID),

FOREIGN KEY (ShowDateID) REFERENCES ShowDate(ShowDateID),

FOREIGN KEY (ShowTimeID) REFERENCES ShowTime(ShowTimeID),

\-- Other attributes

);

\-- Sample Entries (you can add more as needed)

INSERT INTO Theatre VALUES (1, \'ABC Theatre\', \'City Center\', 200);

INSERT INTO Movie VALUES (1, \'Movie 1\', \'Action\');

INSERT INTO ShowDate VALUES (1, \'2023-01-01\', 1);

INSERT INTO ShowTime VALUES (1, \'18:00:00\');

INSERT INTO Show VALUES (1, 1, 1, 1, 1);\
\
\
\
\
\
**[P2 - Query to List Shows on a Given Date at a Given Theatre:\
\
]{.underline}**SELECT Movie.Title, ShowTime.Time

FROM Show

JOIN Movie ON Show.MovieID = Movie.MovieID

JOIN ShowDate ON Show.ShowDateID = ShowDate.ShowDateID

JOIN ShowTime ON Show.ShowTimeID = ShowTime.ShowTimeID

WHERE ShowDate.Date = \'2023-01-01\' AND Show.TheatreID = 1;
