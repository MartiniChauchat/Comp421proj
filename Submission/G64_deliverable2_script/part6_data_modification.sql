-- 6.1 Delete Expired Cards
DELETE FROM HoldCards 
WHERE
    cardNumber = (SELECT cardNumber
    FROM CreditCards
    WHERE expiryDate < CURRENT_DATE);
-- Test: Insert a expired credit card to CreditCards and HoldCards. 
INSERT INTO CreditCards VALUES ('0000000000000001',
	                               'Xueyou Zhang', 'BMO',DATE '2018-02-16');
INSERT INTO HoldCards VALUES ('0000000000000001','Caige');
-- The record in HoldCards should be removed with 6.1 Delete Expired Cards
DELETE FROM HoldCards 
WHERE
    cardNumber = (SELECT cardNumber
    FROM CreditCards
    WHERE expiryDate < CURRENT_DATE);
-- The expired card should not be in HoldCards
SELECT * FROM HoldCards;
-- Restore to initial state 
DELETE FROM CreditCards WHERE cardNumber='0000000000000001';
		
		
-- 6.2 Rating Scale and Range
UPDATE Comments 
SET 
    rating = CASE
        WHEN rating > 10 THEN 10
        WHEN rating < 0 THEN 0
        ELSE rating
    END; 
-- Test: Insert a comment with rating of 12
INSERT INTO Comments VALUES (default,'07/30/19 10:20:00',
							 'This is a fine driver!',12,'Xinyl',3);
-- Apply 6.2 Rating Scale and Range
UPDATE Comments 
SET 
    rating = CASE
        WHEN rating > 10 THEN 10
        WHEN rating < 0 THEN 0
        ELSE rating
    END; 
-- The rating should be scaled to 10  
SELECT * FROM Comments;
-- Restore to initial state
DELETE FROM Comments WHERE rating=10;


-- 6.3 Driver Status
UPDATE Drivers 
SET status = 'No Car'
WHERE userName NOT IN (SELECT owner
        FROM Vehicles);
-- Test: status of drivers before modification
SELECT * FROM Drivers;
-- Apply 6.3 Driver Status
UPDATE Drivers 
SET status = 'No Car'
WHERE userName NOT IN (SELECT owner
        FROM Vehicles);
-- Driver's status should be updated
SELECT * FROM Drivers;


-- 6.4 Standardize Trip Naming
UPDATE Trips 
SET title = 'Trip from ' || CAST(startLocation AS TEXT)
			|| ' at ' || CAST(startTime AS TEXT) || ' with ' 
            || CAST (numberOfSeatsAvailable AS TEXT) || ' seats';
-- Test: title before modification
SELECT * FROM Trips;
-- Apply 6.4 Standardize Trip Naming
UPDATE Trips 
SET title = 'Trip from ' || CAST(startLocation AS TEXT)
			|| ' at ' || CAST(startTime AS TEXT) || ' with ' 
            || CAST (numberOfSeatsAvailable AS TEXT) || ' seats';
-- Test: title should be updated
SELECT * FROM Trips;