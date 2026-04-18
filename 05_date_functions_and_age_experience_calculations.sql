IF OBJECT_ID('dbo.Employees', 'U') IS NOT NULL
  DROP TABLE dbo.Employees;
GO

CREATE TABLE dbo.Employees (
  EmpID INT PRIMARY KEY,
  Name VARCHAR(50),
  DateOfBirth DATE,
  JoinDate DATE
);
GO

INSERT INTO dbo.Employees (EmpID, Name, DateOfBirth, JoinDate) VALUES
 (1, 'Alice Johnson', '1985-05-20', '2010-06-15'),
 (2, 'Bob Smith',     '1990-08-10', '2015-09-01'),
 (3, 'Charlie Brown', '1988-03-25', '2012-11-12'),
 (4, 'Diana Prince',  '1992-01-30', '2017-07-08'),
 (5, 'Eve Adams',     '1987-12-05', '2013-03-20');
GO
SELECT * FROM dbo.Employees;
SELECT GETDATE() AS CurrentDateTime;
SELECT 
  Name,
  DateOfBirth,
  DATEDIFF(year, DateOfBirth, GETDATE())
    - CASE 
        WHEN (MONTH(GETDATE()) < MONTH(DateOfBirth))
          OR (MONTH(GETDATE()) = MONTH(DateOfBirth) AND DAY(GETDATE()) < DAY(DateOfBirth))
        THEN 1 ELSE 0
      END AS AgeYears
FROM dbo.Employees;
SELECT
  Name,
  JoinDate,
  DATEDIFF(year, JoinDate, GETDATE())
    - CASE 
        WHEN (MONTH(GETDATE()) < MONTH(JoinDate))
          OR (MONTH(GETDATE()) = MONTH(JoinDate) AND DAY(GETDATE()) < DAY(JoinDate))
        THEN 1 ELSE 0
      END AS YearsExperience
FROM dbo.Employees;
SELECT
  Name,
  DateOfBirth,
  YEAR(DateOfBirth)  AS BirthYear,
  MONTH(DateOfBirth) AS BirthMonth,
  DAY(DateOfBirth)   AS BirthDay
FROM dbo.Employees;
SELECT Name, DateOfBirth
FROM dbo.Employees
WHERE MONTH(DateOfBirth) = 8;
SELECT
  e.Name,
  e.DateOfBirth,
  NextBirthday = DATEADD(
    YEAR,
    CASE 
      WHEN DATEFROMPARTS(YEAR(GETDATE()), MONTH(e.DateOfBirth), DAY(e.DateOfBirth)) < CAST(GETDATE() AS DATE) 
      THEN 1 ELSE 0 END,
    DATEFROMPARTS(YEAR(GETDATE()), MONTH(e.DateOfBirth), DAY(e.DateOfBirth))
  ),
  DaysUntil = DATEDIFF(day, CAST(GETDATE() AS DATE),
    DATEADD(
      YEAR,
      CASE 
        WHEN DATEFROMPARTS(YEAR(GETDATE()), MONTH(e.DateOfBirth), DAY(e.DateOfBirth)) < CAST(GETDATE() AS DATE) 
        THEN 1 ELSE 0 END,
      DATEFROMPARTS(YEAR(GETDATE()), MONTH(e.DateOfBirth), DAY(e.DateOfBirth))
    )
  )
FROM dbo.Employees e
WHERE DATEDIFF(day, CAST(GETDATE() AS DATE),
    DATEADD(
      YEAR,
      CASE 
        WHEN DATEFROMPARTS(YEAR(GETDATE()), MONTH(e.DateOfBirth), DAY(e.DateOfBirth)) < CAST(GETDATE() AS DATE) 
        THEN 1 ELSE 0 END,
      DATEFROMPARTS(YEAR(GETDATE()), MONTH(e.DateOfBirth), DAY(e.DateOfBirth))
    )
  ) BETWEEN 0 AND 30
ORDER BY DaysUntil;
