-- Сгруппировать данные по странам и месяцам, посчитать среднее, минимальное и максимальное количество купленных товаров, и отсортировать данные по месяцу, применить фильтр по стране с наибольшей выручкой.

SELECT 
  Country, 
  AVG(Quantity) AS average_quantity, 
  AVG(UnitPrice) AS average_price 
FROM 
  retail 
WHERE 
  Description != 'Manual' 
GROUP BY 
  Country 
ORDER BY 
  average_price DESC
