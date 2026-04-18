-- Drop if exists, create table, insert rows, show table
IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL
  DROP TABLE dbo.Orders;
GO

CREATE TABLE dbo.Orders (
  OrderID INT PRIMARY KEY,
  CustomerName VARCHAR(50),
  ProductCategory VARCHAR(50),
  Quantity INT,
  TotalPrice DECIMAL(10,2),
  OrderDate DATE
);
GO

INSERT INTO dbo.Orders (OrderID, CustomerName, ProductCategory, Quantity, TotalPrice, OrderDate) VALUES
  (1, 'Alice',   'Electronics', 2,  1600.00, '2024-11-01'),
  (2, 'Bob',     'Furniture',   1,   300.00, '2024-11-02'),
  (3, 'Charlie', 'Electronics', 1,   800.00, '2024-11-03'),
  (4, 'Diana',   'Stationery', 10,    50.00, '2024-11-04'),
  (5, 'Eve',     'Electronics', 3,  2400.00, '2024-11-05'),
  (6, 'Frank',   'Stationery', 20,   100.00, '2024-11-06');
GO

SELECT * FROM dbo.Orders;
GO
SELECT ProductCategory, SUM(Quantity) AS TotalQuantity
FROM dbo.Orders
GROUP BY ProductCategory
ORDER BY ProductCategory;
SELECT ProductCategory, SUM(Quantity) AS TotalQuantity
FROM dbo.Orders
GROUP BY ProductCategory
HAVING SUM(Quantity) > 10;
SELECT ProductCategory, AVG(TotalPrice) AS AvgPrice
FROM dbo.Orders
GROUP BY ProductCategory
ORDER BY ProductCategory;
SELECT ProductCategory, AVG(TotalPrice) AS AvgPrice
FROM dbo.Orders
GROUP BY ProductCategory
HAVING AVG(TotalPrice) < 1000;
SELECT OrderID, CustomerName, ProductCategory, Quantity, TotalPrice, OrderDate,
  CASE WHEN TotalPrice > 1000 THEN 'High Value' ELSE 'Low Value' END AS ValueCategory
FROM dbo.Orders
ORDER BY OrderID;
