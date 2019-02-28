-- DROP all tables (for test)
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Leads;
DROP TABLE IF EXISTS HasStops;
DROP TABLE IF EXISTS Stops;
DROP TABLE IF EXISTS Admins;
DROP TABLE IF EXISTS Cities;
DROP TABLE IF EXISTS Comments;
DROP TABLE IF EXISTS Trips;
DROP TABLE IF EXISTS Vehicles;
DROP TABLE IF EXISTS CreditCards;
DROP TABLE IF EXISTS Drivers;
DROP TABLE IF EXISTS Passengers;
DROP TABLE IF EXISTS Users;

-- create User table
CREATE TABLE Users (
    userName VARCHAR(20) PRIMARY KEY,
    lastName VARCHAR(20),
    firstName VARCHAR(20),
    email VARCHAR(30) UNIQUE,
    phone VARCHAR(15) UNIQUE
);

-- create Passengers table
CREATE TABLE Passengers (
    userName VARCHAR(20) UNIQUE,
    homelocation VARCHAR(30),
    workLocation VARCHAR(30)
) INHERITS (Users);

-- create Drivers table
CREATE TABLE Drivers(
  userName varchar(20) unique,
  driverLicense varchar(20),
  status varchar(20)
) INHERITS (Users);

-- create CreditCards table
CREATE TABLE CreditCards (
    cardNumber VARCHAR(20) PRIMARY KEY,
    holderName VARCHAR(30),
    issuer VARCHAR(20),
    expiryDate DATE,
    uid VARCHAR(20) NOT NULL,
    FOREIGN KEY (uid)
        REFERENCES Users (userName)
);

-- create Vehicles table
CREATE TABLE Vehicles (
    vehicleID SERIAL PRIMARY KEY,
    model VARCHAR(15),
    color VARCHAR(15),
    licensePlate VARCHAR(15),
    owner VARCHAR(20),
    FOREIGN KEY (owner)
        REFERENCES Drivers(userName)
);

-- create Trips table
CREATE TABLE Trips (
    tripId SERIAL PRIMARY KEY,
    numberOfSeatsAvailable INTEGER,
    title TEXT,
    startTime TIMESTAMP,
    startLocation VARCHAR(20),
    price FLOAT
);

-- create Comments table
CREATE TABLE Comments (
    commentID SERIAL PRIMARY KEY,
    posttime TIMESTAMP,
    content TEXT,
    rating INT,
    uid VARCHAR(20) NOT NULL,
    tripid INT NOT NULL,
    FOREIGN KEY (uid)
        REFERENCES Passengers (userName),
    FOREIGN KEY (tripid)
        REFERENCES Trips (tripId)
);

-- create Cities table
CREATE TABLE Cities (
    cityId SERIAL PRIMARY KEY,
    cityname VARCHAR(20)
);

-- create Admins table
CREATE TABLE Admins (
    userName VARCHAR(20) UNIQUE,
    cityID INT NOT NULL,
    FOREIGN KEY (cityID)
        REFERENCES Cities (cityId)
) INHERITS (Users);

-- create Stops table
CREATE TABLE Stops (
    cityID INT,
    stopName VARCHAR(30),
    PRIMARY KEY (cityID , stopName),
    FOREIGN KEY (cityId)
        REFERENCES Cities (cityID)
);

-- create HasStops table
CREATE TABLE HasStops (
    tripid INT NOT NULL,
    cityID INT,
    stopName VARCHAR(30),
    PRIMARY KEY (tripid , cityID , stopName),
    FOREIGN KEY (tripid)
        REFERENCES Trips (tripid),
    FOREIGN KEY (cityID , stopName)
        REFERENCES Stops (cityID , stopName)
);

-- create Leads table
CREATE TABLE Leads (
    advtime TIMESTAMP NOT NULL,
    vehicleID INT,
    uid VARCHAR(20),
    tripId INT,
    PRIMARY KEY (tripid),
    FOREIGN KEY (vehicleID)
        REFERENCES vehicles (vehicleID),
    FOREIGN KEY (uid)
        REFERENCES Drivers (userName),
    FOREIGN KEY (tripid)
        REFERENCES Trips (tripId)
);

-- create Books table
CREATE TABLE Books (
    booktime TIMESTAMP NOT NULL,
    cardNumber VARCHAR(20),
    tripid INT,
    uid VARCHAR(20),
    PRIMARY KEY (uid , tripid , cardNumber),
    FOREIGN KEY (uid)
        REFERENCES Passengers (userName),
    FOREIGN KEY (tripid)
        REFERENCES Trips (tripid),
    FOREIGN KEY (cardNumber)
        REFERENCES creditcards (cardNumber)
);
