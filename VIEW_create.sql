-- Drop the lowRatingPassenger view (for test)
DROP VIEW IF EXISTS lowRatingPassenger;

-- create a view of all passengers give more than 5 comments with an average rating less than 2
CREATE VIEW lowRatingPassenger (userName , aveRating , numberOfComment) AS
    (SELECT 
        uid, AVG(rating), COUNT(*)
    FROM
        Comments
    GROUP BY uid
    HAVING COUNT(*) > 5 AND AVG(rating) < 2);
	
-- retrive information of all passengers in lowRatingPassenger
SELECT 
    *
FROM
    lowRatingPassenger P,
    Users U
WHERE
    P.userName = U.userName;
    
    
-- Drop the passengerNoCard view (for test)   
DROP VIEW IF EXISTS passengerNoCard;

-- create a view of all passengers who does not added any credit card
CREATE VIEW passengerNoCard (userName , lastName , firstName , email , phone) AS
    SELECT 
        *
    FROM
        Users
    WHERE
        userName IN (SELECT 
                userName
            FROM
                Passengers
            WHERE
                userName NOT IN (SELECT 
                        userName
                    FROM
                        HoldCards));

-- check VIEW passengerNoCard
SELECT * FROM passengerNoCard;
    
    