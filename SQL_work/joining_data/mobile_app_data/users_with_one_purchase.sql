SELECT 
  installs.DeviceID 
FROM 
  installs 
  JOIN devices ON installs.DeviceID = devices.DeviceID 
  JOIN checks ON devices.UserID = checks.UserID 
WHERE 
  toStartOfMonth(
    CAST(BuyDate AS DATE)
  ) = '2019-10-01' 
ORDER BY 
  installs.DeviceID ASC 
LIMIT 
  10
