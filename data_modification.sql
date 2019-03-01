-- delete all expired cards from wallets
DELETE FROM HoldCards 
WHERE
    cardNumber = (SELECT 
        cardNumber
    FROM
        CreditCards
    
    WHERE
        expiryDate < CURRENT_DATE);
		
-- modify out of bound ratings
UPDATE Comments 
SET 
    rating = CASE
        WHEN rating > 5 THEN 5
        WHEN rating < 0 THEN 0
        ELSE rating
    END; 

-- update status of driver based on vehicle
UPDATE Drivers 
SET 
    status = 'No Car'
WHERE
    userName NOT IN (SELECT 
            owner
        FROM
            Vehicles);

-- standardize trip naming
UPDATE Trips 
SET 
    title = 'Trip from ' || CAST(startLocation AS TEXT)
			|| ' at ' || CAST(startTime AS TEXT) || ' with ' 
            || CAST (numberOfSeatsAvailable AS TEXT) || ' seats';

