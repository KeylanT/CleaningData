/*
Cleaning Data in SQL Queries
*/

SELECT *
FROM usvideos

--------------------------------------------------------------------------------------------------------------------------


-- Standardize Date Format (trending_date)

-- Updating Year

SELECT CONCAT(20,(SUBSTRING(trending_date, 1,2))) AS 'YEAR'
FROM usvideos


-- Updating Day

SELECT SUBSTRING(trending_date, 4,2) AS 'Day'
FROM usvideos

-- Updating Month

SELECT SUBSTRING(trending_date, 7,2) AS 'Month'
FROM usvideos


-- Year-Month-Day 

SELECT CONCAT(20,(SUBSTRING(trending_date, 1,2))) AS 'YEAR', SUBSTRING(trending_date, 7,2) AS 'Month', SUBSTRING(trending_date, 4,2) AS 'Day'
FROM usvideos


-- Combining Year, month, and date using substrings and concat

SELECT CONCAT_WS('-',(CONCAT(20,(SUBSTRING(trending_date, 1,2)))) , SUBSTRING(trending_date, 7,2), SUBSTRING(trending_date, 4,2)) AS 'NewTrendingDate'
FROM usvideos


ALTER TABLE usvideos
ADD NewTrendingDate DATE

UPDATE usvideos
SET NewTrendingDate = CONCAT_WS('-',(CONCAT(20,(SUBSTRING(trending_date, 1,2)))) , SUBSTRING(trending_date, 7,2), SUBSTRING(trending_date, 4,2))

-- Checking my work

SELECT trending_date, newtrendingdate 
FROM usvideos

--------------------------------------------------------------------------------------------------------------------------


-- Standardize DATETIME Format (publish_time)

-- Updating Date

SELECT publish_time, SUBSTRING(publish_time, 1, 10) AS 'DATE'
FROM usvideos

-- Updating TIME

SELECT publish_time, SUBSTRING(publish_time, 12, 8) AS 'TIME'
FROM usvideos

-- DATE TIME

SELECT CONCAT_WS(' ',SUBSTRING(publish_time, 1, 10),SUBSTRING(publish_time, 12, 8)) AS 'NewPublishDate'
FROM usvideos

ALTER TABLE usvideos
ADD NewPublishDate DATETIME

UPDATE usvideos
SET NewPublishDate = CONCAT_WS(' ',SUBSTRING(publish_time, 1, 10),SUBSTRING(publish_time, 12, 8))

-- Checking my work

SELECT publish_time, newtrendingdate, NewPublishDate
FROM usvideos


--------------------------------------------------------------------------------------------------------------------------


-- Change FALSE and TRUE to Yes and No in comments_disabled, ratings_disabled, and video_error_or_removed

SELECT comments_disabled,
CASE 
WHEN comments_disabled LIKE 'FALSE' THEN 'NO' 
WHEN comments_disabled LIKE 'TRUE' THEN 'YES' 
ELSE comments_disabled
END 
FROM usvideos


SELECT ratings_disabled, 
CASE 
WHEN ratings_disabled LIKE 'FALSE' THEN 'NO' 
WHEN ratings_disabled LIKE 'TRUE' THEN 'YES'
ELSE ratings_disabled
END 
FROM usvideos


SELECT video_error_or_removed, 
CASE
WHEN video_error_or_removed LIKE 'TRUE' THEN 'YES'
WHEN video_error_or_removed LIKE 'FALSE' THEN 'NO' 
ELSE video_error_or_removed
END 
FROM usvideos


UPDATE usvideos
SET comments_disabled = CASE 
WHEN comments_disabled LIKE 'FALSE' THEN 'NO' 
WHEN comments_disabled LIKE 'TRUE' THEN 'YES' 
ELSE comments_disabled
END 

UPDATE usvideos
SET ratings_disabled = CASE 
WHEN ratings_disabled LIKE 'FALSE' THEN 'NO' 
WHEN ratings_disabled LIKE 'TRUE' THEN 'YES' 
ELSE ratings_disabled
END 

UPDATE usvideos
SET video_error_or_removed = CASE 
WHEN video_error_or_removed LIKE 'FALSE' THEN 'NO' 
WHEN video_error_or_removed LIKE 'TRUE' THEN 'YES' 
ELSE video_error_or_removed
END 


SELECT comments_disabled, ratings_disabled, video_error_or_removed
FROM usvideos



---------------------------------------------------------------------------------------------------------


-- Delete Unused Columns

Select *
From usvideos


ALTER TABLE usvideos
DROP COLUMN trending_date

ALTER TABLE usvideos
DROP COLUMN publish_time