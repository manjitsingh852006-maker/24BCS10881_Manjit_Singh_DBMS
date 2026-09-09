CREATE TABLE Orders (
    Order_ID NUMBER PRIMARY KEY,
    Customer_Name VARCHAR2(50),
    Amount NUMBER(10,2)
);
INSERT INTO Orders VALUES (101, 'Rahul', 5000);
INSERT INTO Orders VALUES (102, 'Amit', 15000);
INSERT INTO Orders VALUES (103, 'Neha', 8000);
INSERT INTO Orders VALUES (104, 'Priya', 25000);
INSERT INTO Orders VALUES (105, 'Karan', 12000);
INSERT INTO Orders VALUES (106, 'Rohit', 7000);
INSERT INTO Orders VALUES (107, 'Anjali', 18000);


COMMIT;

DECLARE

    -- Cursor to fetch all orders
    CURSOR order_cursor IS
        SELECT Order_ID, Amount
        FROM Orders;

BEGIN

    -- Cursor FOR loop processes orders one by one
    FOR order_rec IN order_cursor
    LOOP

        -- Check if amount is greater than 10,000
        IF order_rec.Amount > 10000 THEN

            DBMS_OUTPUT.PUT_LINE(
                'Order ID: ' || order_rec.Order_ID ||
                ' - High Value'
            );

        END IF;

    END LOOP;

END;
/