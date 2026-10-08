/*
List the first five names in alphabetical order and find out if each name is "Classic" or "Trendy." Save your query as a DataFrame name_types with three columns: first_name, sum, and popularity_type.
*/

SELECT first_name, 
	SUM(num) AS sum,
	CASE WHEN COUNT(year) >= 50 THEN 'Classic'
	ELSE 'Trendy' END AS popularity_type
FROM public.baby_names
GROUP BY first_name
ORDER BY first_name ASC
LIMIT 5;

/*
What were the top 20 male names overall, and how did the name Paul rank? Save your query as a DataFrame top_20 with three columns: name_rank, first_name, and sum.
*/

SELECT first_name,
	SUM(num) AS sum,
	RANK() OVER (ORDER BY SUM(num) DESC) AS name_rank
FROM public.baby_names
WHERE sex = 'M'
GROUP BY first_name
ORDER BY sum DESC
LIMIT 20;

/*
Which female names appeared in both 1920 and 2020? Save your query as a DataFrame a_names with two columns: first_name, and total_occurrences.
*/

SELECT a.first_name, a.num AS total_occurrences
FROM baby_names AS a
JOIN baby_names AS b
ON a.first_name = b.first_name
WHERE a.sex = 'F'
	AND a.year = 1920
	AND b.year = 2020