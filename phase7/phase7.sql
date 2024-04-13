--1. Retrieve the names of all positions held by more than 5 employess. Sort the output by the position name (any direction).
SELECT p.name_
    FROM EMPLOYEE_ E
    INNER JOIN position_ P ON e.positionid = p.id_
    HAVING COUNT(E.positionid) > 5
    group by p.name_
    
--2. Retrieve the names of all courses that have 'Data Structures' as a prerequisite. 
SELECT * FROM course_ C
   INNER JOIN prereq_ P ON c.id_ = p.courseid
   where p.prereqid = (SELECT id_ FROM course_ WHERE name_ = 'Data Structures')     

--3. Find the employee names that have the highest paying position.    
SELECT e.name_ FROM employee_ E
    INNER JOIN position_ P on e.positionid = p.id_
    wHERE p.salary = (SELECT MAX(p.salary) FROM position_ P)

--4. Find the total number of hours worked for each position name.
SELECT p.name_, SUM(T.hours_) AS TotalHours
FROM timecard_ T
JOIN employee_ E ON T.employeeid = E.ID_
JOIN position_ P ON E.POSITIONID = P.ID_
GROUP BY p.name_

--5. List the total number of A's and B's for each course name. Order the output (descending) by this number.


--6. Find the course name(s) that is/are the most common requirement for positions.


--7. Find the employee name who worked the most hours between March 10th and 19th (inclusive)

SELECT E.NAME_, SUM(T.HOURS_) AS TotalHours
FROM employee_ E
JOIN timecard_ T ON E.ID_ = T.EMPLOYEEID
WHERE T.DATE_ BETWEEN DATE '2024-03-10' AND DATE '2024-03-19'
GROUP BY E.ID_, E.NAME_
ORDER BY TotalHours DESC
FETCH FIRST 1 ROWS ONLY;

--8. This problem requires (no points if you don't) you to use the regular expression function REGEXP_LIKE that we discussed in class.
-- Find all employee names where both the first name and last name begin with a vowel
SELECT E.NAME_
FROM employee_ E
WHERE REGEXP_LIKE(E.NAME_, '^[AEIOUaeiou]') AND REGEXP_LIKE(E.NAME_, '\s[AEIOUaeiou]')
