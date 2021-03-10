--Drop table if exists
DROP TABLE world_bank_information;
DROP TABLE social_economic_score;

-- Create tables for raw data to be loaded into
CREATE TABLE world_bank_information (
year INTEGER,
Country_Name TEXT,
Population INTEGER,
Life_Expectancy DECIMAL(5,2),
Fertility_Rate DECIMAL(5,2),
GDP_Billions MONEY,
GDP_per_Capita MONEY
);

CREATE TABLE social_economic_score (
year INTEGER,
country TEXT,
ses DECIMAL(5,2)
);

-- Filter table and limit to 100
SELECT *
FROM world_bank_information
LIMIT 100;

SELECT *
FROM social_economic_score
LIMIT 100;

-- Filter table for United States
SELECT *
FROM world_bank_information
WHERE Country_Name = 'United States';

-- Join table for SES
SELECT w.year, w.Country_Name, w.Population, w.Life_Expectancy, w.Fertility_Rate, w.GDP_Billions, w.GDP_per_Capita, s.ses
INTO world_bank_final
FROM world_bank_information AS w
JOIN social_economic_score AS s
ON s.year = w.year 
AND s.country = w.Country_Name

SELECT *
FROM world_bank_final
LIMIT 100
