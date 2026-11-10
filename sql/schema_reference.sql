-- Reference schema based on the project documentation.
-- Compare with your actual deployed schema and use exported DDL if different.
-- Does not recreate Azure Data Factory connections or stored procedure.

CREATE SCHEMA stg;
GO

CREATE TABLE stg.Users (
    UserId INT PRIMARY KEY,
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    Age INT,
    Gender NVARCHAR(30),
    Email NVARCHAR(255),
    City NVARCHAR(100),
    Department NVARCHAR(100)
);
GO

CREATE TABLE dbo.UsersClean (
    UserId INT PRIMARY KEY,
    FullName NVARCHAR(201),
    Age INT,
    AgeGroup NVARCHAR(20),
    Gender NVARCHAR(30),
    Email NVARCHAR(255),
    City NVARCHAR(100),
    Department NVARCHAR(100)
);
GO
