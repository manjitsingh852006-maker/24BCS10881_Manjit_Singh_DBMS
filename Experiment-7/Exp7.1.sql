CREATE TABLE Staff (
    Staff_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    Salary NUMBER(10,2)
);

INSERT INTO Staff VALUES (1, 'Rahul', 45000);
INSERT INTO Staff VALUES (2, 'Amit', 75000);
INSERT INTO Staff VALUES (3, 'Neha', 60000);
INSERT INTO Staff VALUES (4, 'Priya', 95000);
INSERT INTO Staff VALUES (5, 'Karan', 55000);
INSERT INTO Staff VALUES (6, 'Rohit', 85000);
INSERT INTO Staff VALUES (7, 'Anjali', 70000);
INSERT INTO Staff VALUES (8, 'Vikas', 50000);
INSERT INTO Staff VALUES (9, 'Simran', 90000);
INSERT INTO Staff VALUES (10, 'Arjun', 80000);

COMMIT;


DECLARE

    CURSOR emp_cursor IS
        SELECT Name, Salary
        FROM Staff
        ORDER BY Salary DESC
        FETCH FIRST 5 ROWS ONLY;

    v_name   Staff.Name%TYPE;
    v_salary Staff.Salary%TYPE;

BEGIN

    OPEN emp_cursor;

    LOOP
        FETCH emp_cursor INTO v_name, v_salary;
        EXIT WHEN emp_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Name: ' || v_name || ' | Salary: ' || v_salary
        );
    END LOOP;

    
    CLOSE emp_cursor;
END;
/