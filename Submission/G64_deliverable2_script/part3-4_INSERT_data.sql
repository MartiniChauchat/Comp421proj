--data for passengers
insert into passengers values ('Oppo123','Fang',
                               'Naxin','199888@163.com',
                               '5783218989','ABC appartment', 'Mcgill');

insert into passengers values ('Mayx','Ma',
                               'Xinlaoshiren','newhonestman@gmail.com',
                               '5143453455','Lacite', 'Cisco');

insert into passengers values ('Xinyl','Xinyu',
                               'Li','xinyuli@gmail.com',
                               '5143453723','Lacite', 'TUM');

insert into passengers values ('5plusp','yuhao','wu',
                               'yuhaowu@gmail.com','778896782','Park','Mcgill');

insert into passengers values ('Caige','Renjun','Cai',
                               'cairenjun@gmail.com','1391391887','3440durocher','Mcgill');

insert into passengers values ('K9','Ge','Ji',
                               'jige@gmail.com','514234829','Lacite','Ubisoft');

insert into passengers values ('Huawei','Wei','Hua',
                               'huawei@gmail.com','514231239','Shenzhen','Huawei');

insert into passengers values ('xiaohuozhi','zhi','Huo',
                               'huozhi@gmail.com','514212439','Shenzhen','Ubisoft');

--data for drivers
insert into drivers values ('zhanlang123','zhan','lang',
                            'a843172479@gmail.com','778238129','123haskjd2','working');
insert into drivers values ('yss0755','yao','shenshun',
                            'yaoyaole@gmail.com','514999238','123udemhec','onbreak');
insert into drivers values ('liudehua','Liu','Dehua',
                            'dehua@gmail.com','5149992738','123sjdewbs','working');
insert into drivers values ('zhangxueyou','Zhang','xueyou',
                            'xueyou@gmail.com','5149999018','123sdwidcs','working');
insert into drivers values ('chenyixun','chen','eason',
                            'yixun@gmail.com','5149958388','123xncfrjw','onbreak');
insert into drivers values ('zhoujielun','chou','Joe',
                            'jielun@gmail.com','5149912588','123popofuq','working');
insert into drivers values ('zhangwentao','Zhang','Wentao',
                            'greek@gmail.com','5149912488','123papayus','working');

--data for vehicle
insert into vehicles values(default,'AudiA8','Black','768XU2', 'zhangxueyou');
insert into vehicles values(default,'AudiA4','Black','777969','chenyixun');
insert into vehicles values(default,'BMWX6','White','273YFR', 'yss0755');
insert into vehicles values(default,'ToyotaA7','Black','H6F8B4','chenyixun');
insert into vehicles values(default,'HondaGMZ-8','Red','2HGM92', 'zhangwentao');
insert into vehicles values(default,'BenzG54','Yellow','9OPBVD','liudehua');

--data for trips;
insert into trips values(default, 7, 'Go to Montreal',TIMESTAMP'07/03/19 10:20:00','Quebec',43.5);
insert into trips values(default,8,'A trip to NYC',TIMESTAMP'07/02/19 10:20:00','Kingston',69.5);
insert into trips values(default, 2, 'Go to Ottawa',TIMESTAMP'07/11/19 10:20:00','Kingston',79.5);
insert into trips values(default,3,'A trip to Toronto',TIMESTAMP'07/12/19 10:20:00','Montreal',80.5);
insert into trips values(default, 4, 'Go to Vancouver',TIMESTAMP'07/13/19 10:20:00','Surrey',99.5);
insert into trips values(default,5,'A trip to Chicago',TIMESTAMP'07/14/19 10:20:00','NewYork',92.5);
insert into trips values(default, 6, 'From Paris to Amsterdam', TIMESTAMP'01/12/19 03:25:00', 'Paris', 60.5);
insert into trips values(default, 5, 'From Istanbul to Budapest', TIMESTAMP'03/21/19 07:33:00', 'Istanbul', 70.5);
insert into trips values(default, 6, 'From Shenzhen(Guannei) to Nanjing', TIMESTAMP'05/15/19 18:50:00', 'Shenzhen', 280.8);
insert into trips values(default, 3, 'From Manchester to Liverpool', TIMESTAMP'11/09/19 10:24:00', 'Manchester', 101.0);
insert into trips values(default, 4, 'From Suzhou to Nanchang', TIMESTAMP'08/08/19 13:03:03', 'Suzhou', 123.3);
insert into trips values(default, 12, 'From White Rock to Burnaby', TIMESTAMP'02/14/19 18:00:00', 'White Rock', 250.5);

--data for comments:
insert into comments values(default,'07/21/19 10:20:00','This is a very bad driver!',3,'Oppo123',1);
insert into comments values(default,'07/22/19 10:20:00','This is a very bad driver!',4,'K9',1);
insert into comments values(default,'07/23/19 10:20:00','This is a very bad driver!',4,'5plusp',1);
insert into comments values(default,'07/25/19 10:20:00','This is a very good driver!',8,'Huawei',2);
insert into comments values(default,'07/25/19 10:20:00','This is a very good driver!',9,'xiaohuozhi',2);
insert into comments values(default,'07/29/19 10:20:00','This is a fine driver!',6,'K9',3);
insert into comments values(default,'07/30/19 10:20:00','This is a fine driver!',7,'Xinyl',3);

--data for creditcard;
insert into creditcards values('5792837560192853',
                               'Naxin Fang', 'BMO',DATE '2020-02-16');
insert into creditcards values('2847581029374814',
                               'Xinyu Li', 'BMO',DATE '2020-02-16');
insert into creditcards values('4028492840002847',
                               'YuXiang Ma', 'CIBC',DATE '2020-02-16');
insert into creditcards values('1827384927493029',
                               'Yuhao Wu', 'BMO',DATE '2020-02-16');
insert into creditcards values('9090334477889234',
                               'Xueyou Zhang', 'BMO',DATE '2020-02-16');
insert into creditcards values('1984328437274304',
                               'YuDi Xie', 'ICBC',DATE '2020-02-16');
insert into creditcards values('1298498227465028',
                               'Papa Xi', 'ICBC',DATE '2020-02-16');

insert into holdcards values('5792837560192853','Oppo123');
insert into holdcards values('2847581029374814','Xinyl');
insert into holdcards values('4028492840002847','Mayx');
insert into holdcards values('1827384927493029','5plusp');
insert into holdcards values('9090334477889234','Caige');
insert into holdcards values('1984328437274304','Huawei');
insert into holdcards values('1298498227465028','xiaohuozhi');

insert into Cities values(default, 'Montreal');
insert into Cities values(default, 'Toronto');
insert into Cities values(default, 'Ottawa');
insert into Cities values(default, 'Kingston');
insert into Cities values(default, 'Vancouver');
insert into Cities values(default, 'Boston');
insert into Cities values(default, 'Miami');

insert into manages values('manshishing',104);
insert into manages values('mohdshubhan',105);
insert into manages values('shkurkhan',106);
insert into manages values('devdutt',107);
insert into manages values('gorvsharma',108);
insert into manages values('insafali',109);
insert into manages values('samimmalik',110);
insert into manages values('mahaveerjain',110);
insert into manages values('mohd.habib',110);

insert into books values(TIMESTAMP'07/15/19 10:20:00','5792837560192853',1,'Oppo123');
insert into books values(TIMESTAMP'07/17/19 10:34:00','2847581029374814',2,'Xinyl');
insert into books values(TIMESTAMP'07/17/19 10:44:00','1984328437274304',3,'Huawei');
insert into books values(TIMESTAMP'07/19/19 10:55:00','1298498227465028',4,'xiaohuozhi');

insert into Stops values(104,'TrainStation');
insert into Stops values(104,'Mcgill');
insert into Stops values(104,'BellCentre');
insert into Stops values(105,'TrainStation');
insert into Stops values(105,'UofT');
insert into Stops values(105,'Union');
insert into Stops values(106,'TrainStation');
insert into Stops values(107,'TrainStation');
insert into Stops values(108,'WhiteRock');
insert into Stops values(109,'Harvard');

insert into hasstops values(1,'Mcgill',104);
insert into hasstops values(1,'BellCentre',104);
insert into hasstops values(1,'TrainStation',104);
insert into hasstops values(4,'UofT',105);
insert into hasstops values(4,'Union',105);
insert into hasstops values(5,'Harvard',109);

insert into leads values(TIMESTAMP'06/03/19 10:20:00',1,'zhangxueyou',1);
insert into leads values(TIMESTAMP'06/04/19 10:20:00',4,'chenyixun',2);
insert into leads values(TIMESTAMP'06/05/19 10:20:00',3,'yss0755',3);
insert into leads values(TIMESTAMP'06/06/19 10:20:00',5,'zhangwentao',4);
insert into leads values(TIMESTAMP'06/07/19 10:20:00',6,'liudehua',5);

















