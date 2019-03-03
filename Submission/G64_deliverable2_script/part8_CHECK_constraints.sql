-- 8.1 Rating Range Check
-- Insert a record violates the constrain
INSERT INTO Comments VALUES (default,'07/22/19 10:20:00',
							 'This is a very bad driver!',12,'K9',1);
-- rating in comments must be in range 0-10
ALTER TABLE Comments 
ADD CONSTRAINT rating_check CHECK (rating >= 0 AND rating <= 10);
-- Restore to initial state
DELETE FROM Comments WHERE rating=12;
-- Applay 8.1 Rating Range Check
ALTER TABLE Comments 
ADD CONSTRAINT rating_check CHECK (rating >= 0 AND rating <= 10);
-- Insert a record violates the constrain
INSERT INTO Comments VALUES (default,'07/22/19 10:20:00',
							 'This is a very bad driver!',12,'K9',1);

-- Drop CONSTRAINT rating_check (for test)
ALTER TABLE Comments 
DROP CONSTRAINT rating_check;


-- 8.2 Valid Email Check
-- Insert a record violates the constrain
INSERT INTO passengers VALUES ('00001','test','test',
	                               'test@gmailcom','0000001','Park','Mcgill');
-- user must provide a valid email address
ALTER TABLE Users 
ADD CONSTRAINT email_check CHECK (email LIKE '%@%.%');
-- Restore to initial state
DELETE FROM Passengers WHERE userName='00001';
-- Applay 8.1 Rating Range Check
ALTER TABLE Users 
ADD CONSTRAINT email_check CHECK (email LIKE '%@%.%');
-- Insert a record violates the constrain
INSERT INTO passengers VALUES ('00001','test','test',
	                               'test@gmailcom','0000001','Park','Mcgill');
								   
-- Drop CONSTRAINT email_check (for test)
ALTER TABLE Users 
DROP CONSTRAINT email_check;
