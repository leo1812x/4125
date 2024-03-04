--1. [2 pts] Find all positions (the names) with a salary greater than $95,000.
SELECT name_ FROM POSITION_ WHERE (salary > 95000);

--2. [2 pts] Find all employees that do not have a position.
SELECT * FROM employee_ WHERE positionid IS NULL;

--3. [2 pts] Find the average hours submitted by employee E001 to their timecards. 
SELECT AVG(hours_) AS avghours FROM timecard_ WHERe employeeid  = 'E001';

--4. [2 pts] Find all employee's born in August. Sort the output by the employee name. Hint: remember the LIKE operator. 
SELECT * FROM employee_ WHERE dob LIKE '__-AUG-__' ORDER BY name_;

--5. [2 pts] Find the minimum and maximum salaries amongst all positions. Use only a single query that returns a single row (ex. $60000, $100000).
SELECT MIN(SALARY), MAX(SALARY) FROM POSITION_;

--6. [2 pts] Find all 4000-level courses. Hint: remember the LIKE operator.
SELECT * FROM COURSE_ WHERE id_ LIKE 'CSCI-4___';

--7. [2 pts] Find the number of timecards for E018 with hours between 5 and 7 (inclusive).
SELECT COUNT(*) FROM TIMECARD_ WHERE employeeid = 'E018' AND hours_ BETWEEN 5 and 7;

--8. [4 pts] Find the name of the position with the highest salary. Do not harcode any salaries - you must use SQL without assuming you know the current database snapshot.
SELECT NAME_ FROM position_ WHERE salary = (SELECT MAX(position_.salary) FROM position_);

--9. [4 pts] Find the employee timecards with the submitted hours greater than the average overall hours + 75% (i.e., greater than 1.75 * average hours.). Do not hardcode any hours or other values – you must use SQL without assuming you know the current database snapshot.
SELECT * FROM timecard_ WHERE hours_ > (SELECT AVG(hours_) FROM timecard_) * 1.75























