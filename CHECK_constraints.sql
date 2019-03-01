-- rating in comments must be in range 0-5
ALTER TABLE Comments 
ADD CONSTRAINT rating_check CHECK (rating >= 0 AND rating <= 5);

ALTER TABLE Comments 
DROP CONSTRAINT rating_check;

-- user must provide a valid email address
ALTER TABLE Users 
ADD CONSTRAINT email_check CHECK (email LIKE '%@%.%');

ALTER TABLE Users 
DROP CONSTRAINT email_check;