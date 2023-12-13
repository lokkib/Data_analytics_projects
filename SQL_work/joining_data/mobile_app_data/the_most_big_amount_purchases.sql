SELECT 
  Source, 
  COUNT(Rub) AS amount_of_purchases 
FROM 
  checks 
  LEFT JOIN devices ON checks.UserID = devices.UserID 
  JOIN installs ON installs.DeviceID = devices.DeviceID 
GROUP BY 
  Source 
ORDER BY 
  amount_of_purchases DESC 
LIMIT 
  1