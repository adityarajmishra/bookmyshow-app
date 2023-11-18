--SQL Queries for P1:

-- CinemaHall Table
CREATE TABLE CinemaHall (
    CinemaHallID INT PRIMARY KEY,
    HallName VARCHAR(255),
    TotalSeats INT,
    CinemaMasterID INT,
    FOREIGN KEY (CinemaMasterID) REFERENCES CinemaMaster(CinemaMasterID),
    -- Other attributes
);

-- MovieDetails Table
CREATE TABLE MovieDetails (
    MovieDetailsID INT PRIMARY KEY,
    MovieTitle VARCHAR(255),
    Description VARCHAR(255),
    Duration INT,
    Language VARCHAR(45),
    ReleaseDate DATETIME,
    Country VARCHAR(45),
    Genre VARCHAR(45),
    -- Other attributes
);

-- ShowDate Table
CREATE TABLE ShowDate (
    ShowDateID INT PRIMARY KEY,
    Date DATE,
    CinemaHallID INT,
    FOREIGN KEY (CinemaHallID) REFERENCES CinemaHall(CinemaHallID),
    -- Other attributes
);

-- ShowTime Table
CREATE TABLE ShowTime (
    ShowTimeID INT PRIMARY KEY,
    StartTime DATETIME,
    EndTime DATETIME,
    -- Other attributes
);

-- ShowSchedule Table
CREATE TABLE ShowSchedule (
    ShowScheduleID INT PRIMARY KEY,
    MovieDetailsID INT,
    CinemaHallID INT,
    ShowDateID INT,
    ShowTimeID INT,
    FOREIGN KEY (MovieDetailsID) REFERENCES MovieDetails(MovieDetailsID),
    FOREIGN KEY (CinemaHallID) REFERENCES CinemaHall(CinemaHallID),
    FOREIGN KEY (ShowDateID) REFERENCES ShowDate(ShowDateID),
    FOREIGN KEY (ShowTimeID) REFERENCES ShowTime(ShowTimeID),
    -- Other attributes
);

-- CinemaMaster Table
CREATE TABLE CinemaMaster (
    CinemaMasterID INT PRIMARY KEY,
    Name VARCHAR(255),
    TotalCinemaHalls INT,
    CityID INT,
    FOREIGN KEY (CityID) REFERENCES City(CityID),
    -- Other attributes
);

-- CinemaSeat Table
CREATE TABLE CinemaSeat (
    CinemaSeatID INT PRIMARY KEY,
    SeatNumber INT,
    Type INT,
    CinemaHallID INT,
    FOREIGN KEY (CinemaHallID) REFERENCES CinemaHall(CinemaHallID),
    -- Other attributes
);

-- City Table
CREATE TABLE City (
    CityID INT PRIMARY KEY,
    CityName VARCHAR(255),
    State VARCHAR(255),
    ZipCode VARCHAR(45),
    -- Other attributes
);

-- MovieMaster Table
CREATE TABLE MovieMaster (
    MovieMasterID INT PRIMARY KEY,
    MovieTitle VARCHAR(255),
    Description VARCHAR(255),
    Duration INT,
    Language VARCHAR(45),
    ReleaseDate DATETIME,
    Country VARCHAR(45),
    Genre VARCHAR(45),
    -- Other attributes
);

-- Payment Table
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    Amount INT,
    Date DATETIME,
    PaymentMethod VARCHAR(100),
    BookingID INT,
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID),
    -- Other attributes
);

-- Booking Table
CREATE TABLE Booking (
    BookingID INT PRIMARY KEY,
    NumOfSeats INT,
    Time DATETIME,
    Status INT,
    UserID INT,
    ShowScheduleID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (ShowScheduleID) REFERENCES ShowSchedule(ShowScheduleID),
    -- Other attributes
);

-- User Table
CREATE TABLE User (
    UserID INT PRIMARY KEY,
    FullName VARCHAR(255),
    Email VARCHAR(255),
    Password VARCHAR(255),
    Phone VARCHAR(45),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    IsDeleted INT DEFAULT 1,
    IsActive INT DEFAULT 1,
    -- Other attributes
);

--P2 - Query to List Shows on a Given Date at a Given Cinema Hall:

SELECT MovieDetails.MovieTitle, ShowTime.StartTime, ShowTime.EndTime
FROM ShowSchedule
JOIN MovieDetails ON ShowSchedule.MovieDetailsID = MovieDetails.MovieDetailsID
JOIN ShowDate ON ShowSchedule.ShowDateID = ShowDate.ShowDateID
JOIN ShowTime ON ShowSchedule.ShowTimeID = ShowTime.ShowTimeID
WHERE ShowDate.Date = '2023-09-11' AND ShowSchedule.CinemaHallID = 1;

