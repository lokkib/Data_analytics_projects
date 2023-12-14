-- Посчитать скользящее среднее цены авокадо  в Нью-Йорке с разбивкой по типу авокадо. В качестве окна использовать текущую неделю и предыдущие две. 

SELECT 
  date, 
  average_price, 
  region, 
  type, 
  AVG(average_price) OVER (
    PARTITION BY type 
    ORDER BY 
      date ROWS BETWEEN 2 PRECEDING 
      AND CURRENT ROW
  ) AS rolling_price 
FROM 
  avocado 
WHERE 
  region = 'NewYork'
