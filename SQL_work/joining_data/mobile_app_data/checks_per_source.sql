-- По каждому источнику посчитать общую выручку, а также минимальный, максимальный и средний чек.

SELECT 
  Source, 
  SUM(Rub) AS total_revenue, 
  MIN(Rub) AS min_check, 
  Round(
    AVG(Rub)
  ) AS avg_check, 
  MAX(Rub) AS max_check 
FROM 
  installs 
  JOIN devices ON installs.DeviceID = devices.DeviceID 
  JOIN checks ON devices.UserID = checks.UserID 
GROUP BY 
  Source
