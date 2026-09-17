CREATE TABLE Employee (
    EMP_ID INT PRIMARY KEY,
    EMP_NAME VARCHAR(100),
    SALARY NUMERIC(10,2),
    DEPARTMENT_NAME VARCHAR(100)
);


CREATE OR REPLACE PROCEDURE Insert_Employee(
    p_EMP_ID INT,
    p_EMP_NAME VARCHAR(100),
    p_SALARY NUMERIC(10,2),
    p_DEPARTMENT_NAME VARCHAR(100)
)
LANGUAGE plpgsql
AS $$
BEGIN

    IF p_EMP_ID % 2 = 0 THEN

        RAISE EXCEPTION
        'Even EMP_ID is not allowed. Only odd EMP_ID is allowed.';

    ELSE

        INSERT INTO Employee
        VALUES (
            p_EMP_ID,
            p_EMP_NAME,
            p_SALARY,
            p_DEPARTMENT_NAME
        );

        RAISE NOTICE 'Employee inserted successfully.';

    END IF;

END;
$$;

CALL Insert_Employee(
    101,
    'Manjit Singh',
    50000,
    'CSE'
);


select* from Employee;
