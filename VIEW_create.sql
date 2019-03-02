-- Drop the DissatisfiedPassengers view (for test)
DROP VIEW IF EXISTS DissatisfiedPassengers;

-- 7.1 Dissatisfied Passengers 
-- A passenger left more than 3 comments with an average rating less than 5
CREATE VIEW DissatisfiedPassengers (userName , aveRating , numberOfComment) AS
    (SELECT 
        uid, AVG(rating), COUNT(*)
    FROM
        Comments
    GROUP BY uid
    HAVING COUNT(*) >= 3 AND AVG(rating) < 5);
-- The view is initially empty
SELECT * FROM DissatisfiedPassengers;
-- Insert a record the Comments table
INSERT INTO Comments VALUES (default, '07/22/19 10:20:00',
							 'This is a very bad driver!',0,'K9',1);
-- The VIEW DissatisfiedPassengers is also being updated 
SELECT * FROM DissatisfiedPassengers;
-- Update the view with UPDATE
UPDATE DissatisfiedPassengers SET aveRating=3;
-- Restore to initial state
DELETE FROM Comments WHERE rating=0;
-- Retrive information of all passengers in DissatisfiedPassengers
SELECT *
FROM DissatisfiedPassengers P, Users U
WHERE P.userName = U.userName;


-- Drop the passengerNoCard view (for test)   
DROP VIEW IF EXISTS passengerNoCard;
-- 7.2 Passengers with No Card in Wallet
CREATE VIEW passengerNoCard (userName , lastName , firstName , email , phone) AS
    SELECT *
    FROM Users
    WHERE userName IN (SELECT userName
            FROM Passengers
            WHERE userName NOT IN (SELECT userName
                    FROM HoldCards));
-- check VIEW passengerNoCard
SELECT * FROM passengerNoCard;
-- Insert a new passenger with no card
INSERT INTO passengers VALUES ('00001','test','test',
	                               'test@gmail.com','0000001','Park','Mcgill');
-- Test: the new passenger should be in the table
-- The VIEW is also updated
SELECT * FROM passengerNoCard;
-- Update the view with UPDATE
UPDATE passengerNoCard SET lastName='newname' WHERE lastName='test';
-- The lastName of 00001 should be 'newname' rather than 'test' 
SELECT * FROM passengerNoCard;
-- Restore to initial state
DELETE FROM Passengers WHERE userName='00001';
    