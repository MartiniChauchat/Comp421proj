--create User table
CREATE TABLE Users(
  userName varchar(20) primary key,
  lastName varchar(20),
  firstName varchar(20),
  gender varchar(10),
  email varchar(30),
  phone varchar(30)
);

--create creditcards table
CREATE TABLE creditcards(
  cardNumber varchar(20) primary key,
  holderName varchar(30),
  issuer varchar(20),
  expiryDate date,
  uid varchar(20) not null ,
  foreign key (uid) references Users(userName)
);

CREATE TABLE vehicles(
  vehicleID SERIAL primary key,
  model varchar(15),
  color varchar(15),
  licensePlate varchar(15)
);

CREATE TABLE Trips(
  tripId SERIAL primary key,
  numberOfSeatsAvailable integer,
  title text,
  startTime timestamp,
  startLocation varchar(20),
  price float
);


create table comments(
  commentID serial primary key,
  posttime timestamp,
  content text,
  rating int,
  uid varchar(20) not null,
  tripid int not null,
  foreign key (uid) references Passengers(userName),
  foreign key (tripid) references Trips(tripId)
);

create table Cities(
  cityId serial primary key,
  population_Density bigint,
  cityname varchar(20)
);

create table Drivers(
  userName varchar(20) unique,
  driverLicense varchar(20),
  status varchar(20),
  overallRating float
)inherits (Users);

create table Admins(
  userName varchar(20) unique,
  cityID int not null,
  foreign key (cityID) references Cities(cityId)
)inherits(Users);


create table Passengers(
  userName varchar(20) unique,
  homelocation varchar(30),
  workLocation varchar(30)
)inherits(Users);

create table Stops(
  cityID int,
  stopName varchar(30),
  primary key (cityID, stopName),
  foreign key (cityId) references Cities(cityID)
);

create table hasStops(
  tripid int not null ,
  cityID int,
  stopName varchar(30),
  primary key (tripid,cityID,stopName),
  foreign key (tripid) references Trips(tripid),
  foreign key (cityID,stopName) references Stops(cityID,stopName)
);

create table leads(
  advtime timestamp not null,
  vehicleID int,
  uid varchar(20),
  tripId int,
  primary key (tripid),
  foreign key (vehicleID) references vehicles(vehicleID),
  foreign key (uid) references Drivers(userName),
  foreign key (tripid) references Trips(tripId)
);

create table books(
  booktime timestamp not null,
  cardNumber varchar(20),
  tripid int,
  uid varchar(20),
  primary key (uid,tripid,cardNumber),
  foreign key (uid) references Passengers(userName),
  foreign key (tripid) references Trips(tripid),
  foreign key (cardNumber) references creditcards(cardNumber)
);

--test data
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

