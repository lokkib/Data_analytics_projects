-- Посчитать выручку (Revenue) по странам и отсортировать таблицу в порядке убывания выручки. 

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
