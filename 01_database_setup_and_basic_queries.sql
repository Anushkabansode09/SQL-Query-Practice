DROP TABLE IF EXISTS Employees2;
DROP TABLE IF EXISTS Departments2;

CREATE TABLE Employees2 (
  EmpID INT PRIMARY KEY,
  Name VARCHAR(50),
  Department VARCHAR(30),
  Salary DECIMAL(10,2)
);

CREATE TABLE Departments2 (
  DeptID INT PRIMARY KEY,
  DeptName VARCHAR(50),
  Location VARCHAR(50)
);
INSERT INTO Employees2 (EmpID, Name, Department, Salary) VALUES
   (1, 'John Doe', 'HR', 50000),
   (2, 'Jane Smith', 'IT', 60000),
   (3, 'Alice Johnson', 'Finance', 55000),
   (4, 'Bob Brown', 'HR', 45000),
   (5, 'Charlie White', 'IT', 65000);
INSERT INTO Departments2 (DeptID, DeptName, Location)
   VALUES (101, 'Sales', 'New York');
SELECT * FROM Employees2;
SELECT DISTINCT Department FROM Employees2;
SELECT * FROM Employees2 WHERE Salary > 55000;
