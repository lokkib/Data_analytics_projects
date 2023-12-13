SELECT 
  toStartOfMonth(InvoiceDate) AS month, 
  AVG(Quantity) AS average_quantity, 
  MIN(Quantity) AS min_quantity, 
  MAX(Quantity) AS max_quantity 
FROM 
  retail 
WHERE 
  Description != 'Manual' 
  AND Country = 'United Kingdom' 
  AND Quantity > 0 
GROUP BY 
  month 
ORDER BY 
  month ASC
