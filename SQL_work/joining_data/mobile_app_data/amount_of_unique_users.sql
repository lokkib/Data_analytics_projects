SELECT 
  Source, 
  COUNT(DISTINCT checks.UserID) AS unique_users 
FROM 
  installs 
  JOIN devices ON installs.DeviceID = devices.DeviceID 
  JOIN checks ON devices.UserID = checks.UserID 
GROUP BY 
  Source
