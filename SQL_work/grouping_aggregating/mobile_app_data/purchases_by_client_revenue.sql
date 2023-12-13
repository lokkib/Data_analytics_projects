SELECT 
  UserID, 
  COUNT(*) AS NumChecks, 
  SUM(Rub) AS Revenue 
FROM 
  checks 
GROUP BY 
  UserID 
ORDER BY 
  Revenue DESC 
LIMIT 
  10