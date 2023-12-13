SELECT 
  Country, 
  SUM(Quantity * UnitPrice) AS Revenue 
FROM 
  retail 
GROUP BY 
  Country 
ORDER BY 
  Revenue DESC 
LIMIT 
  10
