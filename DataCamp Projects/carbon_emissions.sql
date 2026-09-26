/*
Using the product_emissions table, find the number of unique companies and their total carbon footprint PCF for each industry group, filtering for the most recent year in the database. The query should return three columns: industry_group, num_companies, and total_industry_footprint, with the last column being rounded to one decimal place. The results should be sorted by total_industry_footprint from highest to lowest values.
*/


-- Update your query here
SELECT industry_group,
	COUNT(DISTINCT company) AS num_companies,
	ROUND(SUM(carbon_footprint_pcf),1) AS total_industry_footprint
FROM product_emissions
WHERE year IN (SELECT MAX(year) FROM product_emissions)
GROUP BY industry_group
ORDER BY total_industry_footprint DESC;