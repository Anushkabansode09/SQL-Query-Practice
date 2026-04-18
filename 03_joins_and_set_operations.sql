-- Paste 1: Drop if exists, create tables, insert data, then verify
IF OBJECT_ID('dbo.Employees','U') IS NOT NULL DROP TABLE dbo.Employees;
IF OBJECT_ID('dbo.Departments','U') IS NOT NULL DROP TABLE dbo.Departments;

CREATE TABLE Employees (
  EmpID INT PRIMARY KEY,
  EmpName VARCHAR(50),
  DepartmentID INT
);

CREATE TABLE Departments (
  DepartmentID INT PRIMARY KEY,
  DeptName VARCHAR(50),
  Location VARCHAR(50)
);

INSERT INTO Employees (EmpID, EmpName, DepartmentID) VALUES
  (1, 'Alice', 101),
  (2, 'Bob', 102),
  (3, 'Charlie', 103),
  (4, 'Diana', NULL),
  (5, 'Eve', 101);

INSERT INTO Departments (DepartmentID, DeptName, Location) VALUES
  (101, 'HR', 'New York'),
  (102, 'IT', 'San Francisco'),
  (103, 'Finance', 'Chicago'),
  (104, 'Sales', 'Boston');

-- Verify contents
SELECT * FROM Employees;
SELECT * FROM Departments;
-- (a) Inner Join: employees with their department names
SELECT E.EmpID, E.EmpName, D.DeptName
FROM Employees E
INNER JOIN Departments D
  ON E.DepartmentID = D.DepartmentID
ORDER BY E.EmpID;
-- (b) Left Join: all employees, department name if assigned
SELECT E.EmpID, E.EmpName, D.DeptName
FROM Employees E
LEFT JOIN Departments D
  ON E.DepartmentID = D.DepartmentID
ORDER BY E.EmpID;
-- (c) Right Join: all departments, employee name if exists
SELECT D.DepartmentID, D.DeptName, E.EmpName
FROM Employees E
RIGHT JOIN Departments D
  ON E.DepartmentID = D.DepartmentID
ORDER BY D.DepartmentID, E.EmpName;
-- (d) Full Outer Join: include all employees and departments
SELECT E.EmpID, E.EmpName, D.DeptName
FROM Employees E
FULL OUTER JOIN Departments D
  ON E.DepartmentID = D.DepartmentID
ORDER BY COALESCE(E.EmpID, 9999), D.DepartmentID;
-- (e) Cross Join: every combination of employee and department names
SELECT E.EmpName, D.DeptName
FROM Employees E
CROSS JOIN Departments D
ORDER BY E.EmpName, D.DeptName;
-- (f) Union All: list of all employee names + department names in one column
SELECT EmpName AS Name FROM Employees
UNION ALL
SELECT DeptName FROM Departments
ORDER BY Name;
-- (g) Intersect: department IDs present in BOTH tables
SELECT DepartmentID FROM (
  SELECT DepartmentID FROM Employees
  INTERSECT
  SELECT DepartmentID FROM Departments
) AS t
ORDER BY DepartmentID;
-- (h) Except: department IDs in Departments but NOT in Employees
SELECT DepartmentID FROM (
  SELECT DepartmentID FROM Departments
  EXCEPT
  SELECT DepartmentID FROM Employees
) AS t
ORDER BY DepartmentID;
