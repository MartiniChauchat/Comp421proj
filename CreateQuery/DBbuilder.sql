-- create User table
CREATE TABLE Users (
    userName VARCHAR(20) PRIMARY KEY,
    lastName VARCHAR(20),
    firstName VARCHAR(20),
    gender VARCHAR(10),
    email VARCHAR(30) UNIQUE,
    phone VARCHAR(30) UNIQUE
);

-- create creditcards table
CREATE TABLE creditcards (
    cardNumber VARCHAR(20) PRIMARY KEY,
    holderName VARCHAR(30),
    issuer VARCHAR(20),
    expiryDate DATE,
    uid VARCHAR(20) NOT NULL,
    FOREIGN KEY (uid)
        REFERENCES Users (userName)
);

CREATE TABLE vehicles (
    vehicleID SERIAL PRIMARY KEY,
    model VARCHAR(15),
    color VARCHAR(15),
    licensePlate VARCHAR(15)
);

CREATE TABLE Trips (
    tripId SERIAL PRIMARY KEY,
    numberOfSeatsAvailable INTEGER,
    title TEXT,
    startTime TIMESTAMP,
    startLocation VARCHAR(20),
    price FLOAT
);


CREATE TABLE comments (
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

CREATE TABLE Cities (
    cityId SERIAL PRIMARY KEY,
    population_Density BIGINT,
    cityname VARCHAR(20)
);

create table Drivers(
  userName varchar(20) unique,
  driverLicense varchar(20),
  status varchar(20),
  overallRating float
) INHERITS (Users);

CREATE TABLE Admins (
    userName VARCHAR(20) UNIQUE,
    cityID INT NOT NULL,
    FOREIGN KEY (cityID)
        REFERENCES Cities (cityId)
) INHERITS (Users);


CREATE TABLE Passengers (
    userName VARCHAR(20) UNIQUE,
    homelocation VARCHAR(30),
    workLocation VARCHAR(30)
) INHERITS (Users);

CREATE TABLE Stops (
    cityID INT,
    stopName VARCHAR(30),
    PRIMARY KEY (cityID , stopName),
    FOREIGN KEY (cityId)
        REFERENCES Cities (cityID)
);

CREATE TABLE hasStops (
    tripid INT NOT NULL,
    cityID INT,
    stopName VARCHAR(30),
    PRIMARY KEY (tripid , cityID , stopName),
    FOREIGN KEY (tripid)
        REFERENCES Trips (tripid),
    FOREIGN KEY (cityID , stopName)
        REFERENCES Stops (cityID , stopName)
);

CREATE TABLE leads (
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

CREATE TABLE books (
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

-- test data
insert into vehicles values(default,'AudiA8','Black','768XU2');
insert into vehicles values(default,'AudiA4','Black','777969');
insert into trips values(default,8,'A trip to NYC',TIMESTAMP'07/02/19 10:20:00','Montreal',69.5);
insert into Users values('xieyudi1997','xie','yudi','male','843172479@qq.com','5148347080');
insert into comments values(default,'07/11/19 10:20:00','This is a very bad driver!',3,'oppo123',1);

insert into Passengers values('ABC appartment','Mcgill','oppo123','fang','naxin','male','199888@163.com','5783218989');
insert into Drivers values('zhanlang123','zhan','lang',
                           'male','a843172479@gamil.com','5148347080',
                           '123haskjd2','working',0.0);
insert into Cities values(default, 78999,'NanChang');
insert into Stops values(2,'metrocenter');

insert into Cities values(default, 76999,'Shanghai');
insert into Cities values(default, 8923, 'Simolensk');
insert into hasStops values(1, 1, 'metrocenter');

