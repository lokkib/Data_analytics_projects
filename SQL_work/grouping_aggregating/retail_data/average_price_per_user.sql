SELECT 
  CustomerID, 
  AVG(UnitPrice) AS average_price 
FROM 
  retail 
WHERE 
  Description != 'Manual' 
  AND toStartOfMonth(InvoiceDate) = '2011-03-01' 
GROUP BY 
  CustomerID 
ORDER BY 
  average_price DESC 
LIMIT 
  100