create or replace NONEDITIONABLE TRIGGER total_hours
BEFORE INSERT ON timecard_
FOR EACH ROW
DECLARE
    current_hours NUMBER;
BEGIN
    -- Retrieve total hrs of employee
    SELECT TOTALHOURSWORKED INTO current_hours FROM EMPLOYEE_ WHERE ID_ = :NEW.EMPLOYEEID;

    -- Calculate the new total hours
    current_hours := current_hours + :NEW.HOURS_;

    -- if new total hours > 160 hours
    IF current_hours > 160 THEN

        -- If so ,raise an error 
        RAISE_APPLICATION_ERROR(-20001, 'Employee #' || :NEW.EMPLOYEEID || ' has worked too much!');
    ELSE
        UPDATE EMPLOYEE_ SET TOTALHOURSWORKED = current_hours WHERE ID_ = :NEW.EMPLOYEEID;

    END IF;
END;