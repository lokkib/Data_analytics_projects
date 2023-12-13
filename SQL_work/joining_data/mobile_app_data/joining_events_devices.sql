SELECT 
  events.*, 
  UserID 
FROM 
  events 
  LEFT JOIN devices ON events.DeviceID = devices.DeviceID 
ORDER BY 
  DeviceID DESC 

