DROP TABLE IF EXISTS Products;
CREATE TABLE Products (
   ProductID INT PRIMARY KEY,
   ProductName VARCHAR(50),
   Price DECIMAL(10,2),
   QuantitySold INT,
   Category VARCHAR(50)
);

INSERT INTO Products (ProductID, ProductName, Price, QuantitySold, Category) VALUES
   (1, 'Laptop', 800.00, 5, 'Electronics'),
   (2, 'Smartphone', 600.00, 10, 'Electronics'),
   (3, 'Desk Chair', 120.00, 15, 'Furniture'),
   (4, 'Table', 200.00, 8, 'Furniture'),
   (5, 'Notebook', 5.00, 20, 'Stationery'),
   (6, 'Pen', 2.00, 50, 'Stationery');
SELECT * FROM Products
WHERE Price > (
   SELECT AVG(Price) FROM Products
);
SELECT TOP 1 ProductName, Price
FROM Products
ORDER BY Price DESC;
SELECT DISTINCT Category,
   (SELECT COUNT(*)
    FROM Products P2
    WHERE P2.Category = P1.Category) AS ProductCount
FROM Products P1;
SELECT * FROM Products
WHERE QuantitySold < (
   SELECT AVG(QuantitySold) FROM Products
);
 GO 
CREATE VIEW ElectronicsView AS
SELECT * FROM Products
WHERE Category = 'Electronics';
