SELECT 
  AppPlatform, 
  Source, 
  AVG(events) AS avg_views 
FROM 
  events 
  JOIN installs ON installs.DeviceID = events.DeviceID 
GROUP BY 
  AppPlatform, 
  Source 
ORDER BY 
  avg_views DESC
