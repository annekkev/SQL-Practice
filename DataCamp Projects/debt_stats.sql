-- What country has the highest amount of debt?

SELECT country_name,
	SUM(debt) AS total_debt
FROM public.international_debt
GROUP BY country_name
ORDER BY total_debt DESC
	LIMIT 1;

-- What country has the lowest amount of principal repayments (indicated by the "DT.AMT.DLXF.CD" indicator code)?

SELECT country_name, indicator_name, 
	MIN(debt) AS lowest_repayment
FROM public.international_debt
WHERE indicator_code = 'DT.AMT.DLXF.CD'
GROUP BY country_name, indicator_name
ORDER BY lowest_repayment ASC
	LIMIT 1;