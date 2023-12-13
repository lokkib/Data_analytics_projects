 -- C помощью JOIN дополнить таблицу events данными о UserID пользователей из таблицы devices

SELECT 
  events.*, 
  UserID 
FROM 
  events 
  LEFT JOIN devices ON events.DeviceID = devices.DeviceID 
ORDER BY 
  DeviceID DESC 

