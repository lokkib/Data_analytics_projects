SELECT 
  Country, 
  AVG(Quantity) AS average_quantity, 
  AVG(UnitPrice) AS average_price 
FROM 
  retail 
WHERE 
  Description != 'Manual' 
GROUP BY 
  Country 
ORDER BY 
  average_price DESC
