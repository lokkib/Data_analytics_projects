-- Проверить, сколько товаров в среднем просматривают пользователи с разных платформ, и пришедшие из разных источников. Отсортировать полученную табличку по убыванию среднего числа просмотров. 

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
