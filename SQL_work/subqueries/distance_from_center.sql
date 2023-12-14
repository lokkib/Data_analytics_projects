-- Посчитать среднее расстояние до центра города и вывести идентификаторы объявлений о сдаче отдельных комнат, для которых расстояние оказалось меньше среднего. Результат отсортировать по убыванию.

SELECT 
  id, 
  host_id, 
  geoDistance(
    13.4050, 
    52.5200, 
    toFloat64OrNull(longitude), 
    toFloat64OrNull(latitude)
  ) AS distance_from_center 
FROM 
  listings 
WHERE 
  room_type = 'Private room' 
  AND distance_from_center < (
    SELECT 
      AVG(
        geoDistance(
          13.4050, 
          52.5200, 
          toFloat64OrNull(longitude), 
          toFloat64OrNull(latitude)
        )
      ) 
    FROM 
      listings 
    WHERE 
      room_type = 'Private room'
  ) 
ORDER BY 
  distance_from_center DESC 
LIMIT 
  10
