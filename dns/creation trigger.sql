CREATE TRIGGER Ecole_before_insert
BEFORE INSERT ON Ecole
  FOR EACH ROW 
  BEGIN
  DECLARE msg varchar(255);
    IF NOT NEW.mail REGEXP '^[a-z0-9._-]+@[a-z0-9._-]{2,}\.[a-z]{2,4}$' THEN
      SET msg = ('Constraint violated:Invalid email');
	END IF;
    If Not NEW.Tel REGEXP '^[0][0-9]{8,9}$' then
		set msg=concat(msg, 'constraint violated:Invalid phone number');
        SIGNAL sqlstate '45000' SET message_text = msg;
    END IF;
	If Not NEW.Nom REGEXP "^[A-Za-z0-9]+[ \-']?[[A-Za-z0-9]+[ \-']?]*[A-Za-z0-9]+$" then
		set msg=concat(msg, 'constraint violated:Invalid phone number');
        SIGNAL sqlstate '45000' SET message_text = msg;
    END IF;
	
  END;
  
DELIMITER $$
drop trigger Ecole_before_update$$

CREATE TRIGGER Ecole_before_update
BEFORE UPDATE ON Ecole
  FOR EACH ROW 
  BEGIN
  DECLARE msg varchar(255);
    IF NOT NEW.mail REGEXP '^[a-z0-9._-]+@[a-z0-9._-]{2,}\.[a-z]{2,4}$' THEN
      SET msg = ('Constraint violated:Invalid email');
	END IF;
    If Not NEW.Tel REGEXP '^[0][0-9]{8,9}$' then
		set msg=concat(msg, 'constraint violated:Invalid phone number');
        SIGNAL sqlstate '45000' SET message_text = msg;
    END IF;
  END;
