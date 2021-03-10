--Drop table if exists
DROP TABLE world_bank_information;
DROP TABLE social_economic_score;

-- Create tables for raw data to be loaded into
CREATE TABLE world_bank_information (
year_wb INTEGER,
country_Name TEXT,
population BIGINT,
life_expectancy DECIMAL(5,2),
fertility_rate DECIMAL(5,2),
gdp_billions MONEY,
gdp_per_capita MONEY
);

CREATE TABLE social_economic_score (
year_ses INTEGER,
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
SELECT w.year_wb, w.Country_Name, w.population, w.life_expectancy, w.fertility_rate, w.gdp_billions, w.gdp_per_capita, s.ses
INTO world_bank_final
FROM world_bank_information AS w
JOIN social_economic_score AS s
ON w.year_wb = s.year_ses
AND s.country = w.country_name

SELECT *
FROM world_bank_final
LIMIT 100
