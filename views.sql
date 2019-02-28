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