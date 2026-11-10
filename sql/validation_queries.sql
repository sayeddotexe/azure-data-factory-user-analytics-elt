-- Examples for validating the documented staging and curated tables.
-- Run against your Azure SQL Database and inspect real results before claiming checks passed.

-- Staging vs curated record counts
SELECT 'staging' AS layer, COUNT(*) AS row_count FROM stg.Users
UNION ALL
SELECT 'curated', COUNT(*) FROM dbo.UsersClean;

-- Age validation: should return zero rows for out-of-range ages
SELECT COUNT(*) AS invalid_ages
FROM dbo.UsersClean
WHERE Age IS NULL OR Age NOT BETWEEN 0 AND 120;

-- Check duplicate identifiers in curated data
SELECT UserId, COUNT(*) AS duplicate_count
FROM dbo.UsersClean
GROUP BY UserId
HAVING COUNT(*) > 1;

-- Department distribution (aggregate-only output, no email addresses)
SELECT Department, COUNT(*) AS total_users
FROM dbo.UsersClean
GROUP BY Department
ORDER BY total_users DESC;

-- Check age group segmentation
SELECT AgeGroup, COUNT(*) AS total_users
FROM dbo.UsersClean
GROUP BY AgeGroup
ORDER BY AgeGroup;

-- Check null / unknown categories
SELECT
    SUM(CASE WHEN Department IS NULL OR Department = 'Unknown' THEN 1 ELSE 0 END) AS unknown_departments,
    SUM(CASE WHEN City IS NULL OR City = 'Unknown' THEN 1 ELSE 0 END) AS unknown_cities
FROM dbo.UsersClean;
