 Create a complex view named Unsold_Items that joins the Products and Order_Details tables to display the ProductName 
   and Category of all items that have never been ordered by any customer using a NOT IN or NOT EXISTS subquery.  


CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(50)
);


INSERT INTO Products (ProductID, ProductName, Category)
VALUES
(1, 'Laptop', 'Electronics'),
(2, 'Mobile Phone', 'Electronics'),
(3, 'Keyboard', 'Accessories'),
(4, 'Mouse', 'Accessories'),
(5, 'Headphones', 'Accessories'),
(6, 'Printer', 'Electronics'),
(7, 'Monitor', 'Electronics');


CREATE TABLE Order_Details (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Order_Details
(OrderDetailID, OrderID, ProductID, Quantity)
VALUES
(1, 101, 1, 2),
(2, 101, 2, 1),
(3, 102, 4, 3),
(4, 103, 6, 1);


CREATE VIEW Unsold_Items AS
SELECT p.ProductName, p.Category
FROM Products p
WHERE NOT EXISTS (
    SELECT 1
    FROM Order_Details od
    WHERE od.ProductID = p.ProductID
);

SELECT * FROM Unsold_Items;