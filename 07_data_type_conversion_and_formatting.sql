DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  OrderDate DATE,
  Amount DECIMAL(10,2)
);
INSERT INTO Orders (OrderID, OrderDate, Amount) VALUES
  (1, '2024-11-01', 250.50),
  (2, '2024-11-02', 300.75),
  (3, '2024-11-03', 150.25);
SELECT * FROM Orders;
-- (a) Amount to String
SELECT CAST(Amount AS CHAR(10)) AS AmountText
FROM Orders;
-- (b) Date to String
SELECT FORMAT(OrderDate, 'yyyy-MM-dd') AS OrderDateText
FROM Orders;
-- (c) String to Date
SELECT CAST('2024-11-05' AS DATE) AS ConvertedDate;
-- (d) Extract Year
SELECT YEAR(OrderDate) AS OrderYear
FROM Orders;
-- (e) Concatenate OrderDate and Amount
SELECT 
  CONCAT(FORMAT(OrderDate, 'yyyy-MM-dd'), ' - $', Amount) AS Summary
FROM Orders;

