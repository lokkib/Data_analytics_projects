SELECT 
  UserID, 
  COUNT(*) AS NumChecks 
FROM 
  checks 
GROUP BY 
  UserID 
ORDER BY 
  NumChecks DESC 
LIMIT 
  10
