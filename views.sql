DROP VIEW IF EXISTS lowRatingPassenger;

CREATE VIEW lowRatingPassenger (uid , aveRating , numberOfComment) AS
    (SELECT 
        uid, AVG(rating), COUNT(*)
    FROM
        Comments
    GROUP BY uid
    HAVING COUNT(*) > 5 AND AVG(rating) < 2);