CREATE OR REPLACE PROCEDURE generate_report_card (p_emp_id EMPLOYEE_.ID_%TYPE) AS
    emp_name EMPLOYEE_.NAME_%TYPE;
    course_id COURSE_.ID_%TYPE;
    course_name COURSE_.NAME_%TYPE;
    grade CHAR(1);
    total_gpa NUMBER := 0;
    courses_count NUMBER := 0;
    avg_gpa NUMBER;

    CURSOR course_cursor IS
        SELECT c.ID_, c.NAME_, ec.GRADE
        FROM COURSE_ c
        JOIN ENROLLMENT_ ec ON c.ID_ = ec.COURSEID
        WHERE ec.EMPLOYEEID = p_emp_id;

BEGIN
    
    BEGIN
        SELECT NAME_ INTO emp_name FROM EMPLOYEE_ WHERE ID_ = p_emp_id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Employee with ID ' || p_emp_id || ' does not exist.');
            RETURN;
    END;

    
    OPEN course_cursor;
    FETCH course_cursor INTO course_id, course_name, grade;
    IF course_cursor%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No report card to generate for Employee ID: ' || p_emp_id);
        CLOSE course_cursor;
        RETURN;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Report Card for Employee: ' || p_emp_id || ' - ' || emp_name);
    DBMS_OUTPUT.PUT_LINE('Courses Taken:');
    LOOP
        DBMS_OUTPUT.PUT_LINE('Course ID: ' || course_id || ', Name: ' || course_name || ', Grade: ' || grade);
        -- GPA Calculation
        CASE grade
            WHEN 'A' THEN total_gpa := total_gpa + 4;
            WHEN 'B' THEN total_gpa := total_gpa + 3;
            WHEN 'C' THEN total_gpa := total_gpa + 2;
            WHEN 'D' THEN total_gpa := total_gpa + 1;
  
        END CASE;
        courses_count := courses_count + 1;

        FETCH course_cursor INTO course_id, course_name, grade;
        EXIT WHEN course_cursor%NOTFOUND;
    END LOOP;
    CLOSE course_cursor;

    -- Calculate average GPA
    IF courses_count > 0 THEN
        avg_gpa := total_gpa / courses_count;
        DBMS_OUTPUT.PUT_LINE('Average GPA: ' || TO_CHAR(avg_gpa, '0.00'));
    ELSE
        DBMS_OUTPUT.PUT_LINE('No grades available to calculate GPA for Employee ID: ' || p_emp_id);
    END IF;
    
EXCEPTION
    WHEN OTHERS THEN
       
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END generate_report_card;
/
