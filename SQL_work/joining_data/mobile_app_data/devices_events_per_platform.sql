SELECT 
  AppPlatform, 
  COUNT (DISTINCT installs.DeviceID) as unique_devices 
FROM 
  installs 
  JOIN events ON installs.DeviceID = events.DeviceID 
WHERE 
  events IS NOT NULL 
GROUP BY 
  AppPlatform
