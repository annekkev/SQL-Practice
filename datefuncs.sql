SELECT
	DATENAME(month, OrderDate) OrderMonth,
	AVG(DATEDIFF(day,OrderDate,ShipDate)) AvgShippingDuration
FROM Orders
GROUP BY DATENAME(month,OrderDate);

SELECT
	OrderID,
	OrderDate CurrentOrderDate,
	LAG(OrderDate) OVER (ORDER BY OrderDate) PreviousOrderDate,
	DATEDIFF(day, LAG(OrderDate) OVER (ORDER BY OrderDate), OrderDate) NumberOfDays
FROM Orders