CREATE TABLE POSITION_(
    ID_ NUMBER(3) NOT NULL,
    NAME_ VARCHAR2(30) NOT NULL,
    SALARY NUMBER(10,2) NOT NULL,
    CONSTRAINT POSITION_PK PRIMARY KEY(ID_)
)

CREATE TABLE COURSE_(
    ID_ NUMBER(3) NOT NULL,
    Name_ VARCHAR2(30) NOT NULL,
    CONSTRAINT COURSE_PK PRIMARY KEY(ID_)
)

CREATE TABLE PREREQ_(
    CourseID NUMBER(3) NOT NULL,
    PrereqID NUMBER(3) NOT NULL,
    CONSTRAINT PREREQ_PK PRIMARY KEY(CourseID, PrereqID),
    CONSTRAINT PREREQ_CourseID_FK FOREIGN KEY(CourseID) REFERENCES COURSE_(ID_),
    CONSTRAINT PREREQ_PrereqID_FK FOREIGN KEY(PrereqID) REFERENCES COURSE_(ID_)
)

CREATE TABLE REQUIREMENT_(
    PositionID NUMBER(3) NOT NULL,
    CourseID NUMBER(3) NOT NULL,
    CONSTRAINT REQUIREMENT_PK PRIMARY KEY(PositionID, CourseID),
    CONSTRAINT REQUIREMENT_PositionID_FK FOREIGN KEY(PositionID) REFERENCES POSITION_(ID_),
    CONSTRAINT REQUIREMENT_CourseID_FK FOREIGN KEY(CourseID) REFERENCES COURSE_(ID_)
)


CREATE TABLE EMPLOYEE_(
    ID_ NUMBER(3) NOT NULL,
    NAME_ VARCHAR2(30) NOT NULL,
    PositionID NUMBER(3) NOT NULL,
    CONSTRAINT EMPLOYEE_PK PRIMARY KEY(ID_),
    CONSTRAINT EMPLOYEE_PositionID_FK FOREIGN KEY(PositionID) REFERENCES POSITION_(ID_)
)

CREATE TABLE ENROLLMENT_(
    EMPLOYEEID NUMBER(3) NOT NULL,
    CourseID NUMBER(3) NOT NULL,
    Grade NUMBER(3) NOT NULL,
    CONSTRAINT ENROLLMENT_PK PRIMARY KEY(EMPLOYEEID, CourseID),
    CONSTRAINT ENROLLMENT_EMPLOYEEID_FK FOREIGN KEY(EMPLOYEEID) REFERENCES EMPLOYEE_(ID_),
    CONSTRAINT ENROLLMENT_CourseID_FK FOREIGN KEY(CourseID) REFERENCES COURSE_(ID_)
)


CREATE TABLE TIMECARD_(
    EmployeeID NUMBER(3) NOT NULL,
    DATE_ DATE NOT NULL,
    Hours NUMBER(3),
    CONSTRAINT TIMECARD_PK PRIMARY KEY(EmployeeID, DATE_),
    CONSTRAINT TIMECARD_EmployeeID_FK FOREIGN KEY(EmployeeID) REFERENCES EMPLOYEE_(ID_)
)

CREATE TABLE ADDRESS_(
    EMPLOYEEID NUMBER(3) NOT NULL,
    ADRESS VARCHAR2(30) NOT NULL,
    CONSTRAINT ADRESS_PK PRIMARY KEY(EMPLOYEEID, ADRESS),
    CONSTRAINT ADRESS_EMPLOYEEID_FK FOREIGN KEY(EMPLOYEEID) REFERENCES EMPLOYEE_(ID_)
)







