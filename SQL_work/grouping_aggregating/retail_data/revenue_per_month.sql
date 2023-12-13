-- Посчитать выручку по месяцам.

SELECT 
  toStartOfMonth(InvoiceDate) AS month, 
  SUM(Quantity * UnitPrice) AS revenue 
FROM 
  retail 
WHERE 
  Description != 'Manual' 
GROUP BY 
  month 
ORDER BY 
  revenue DESC
