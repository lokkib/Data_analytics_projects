-- Сгруппировать данные по хозяевам  и посчитать, какую цену за ночь в среднем каждый из них устанавливает. Идентификаторы сдаваемого жилья объединить в отдельный массив. Таблицу отсортировать по убыванию средней цены и убыванию host_id

SELECT 
  host_id, 
  AVG(
    toFloat64OrNull(
      replaceRegexpAll(price, '[$,]', '')
    )
  ) AS average_price, 
  groupArray(id) AS housings 
FROM 
  listings 
GROUP BY 
  host_id 
ORDER BY 
  average_price DESC, 
  host_id DESC 
LIMIT 
  60
