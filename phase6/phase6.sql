--1. Find the names of all employees who have at least one address.
SELECT DISTINCT employee_.name_ FROM employee_ INNER JOIN address_ ON 
    employee_.id_ = address_.employeeid

--2. For each employee id, list the total hours worked (from the timecards).
SELECT employee_.id_, SUM(timecard_.hours_) FROM employee_ right OUTER JOIN timecard_ ON
    employee_.id_= timecard_.employeeid
    GROUP BY employee_.id_

--3. Find the names of all employees that do not have an address.
SELECT employee_.name_, address_.adress FROM address_ RIGHT OUTER JOIN employee_ ON
   address_.employeeid = employee_.id_
   WHERE address_.adress IS NULL

--4. Find the names of all employees that have the position 'Security Analyst'.
SELECT employee_.name_ FROM employee_ INNER JOIN position_ ON
    employee_.positionid = position_.id_
    WHERE position_.name_ = 'Security Analyst'














    