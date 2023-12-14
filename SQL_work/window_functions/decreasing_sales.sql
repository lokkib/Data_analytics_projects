--  Выяснить, когда объемы продаж обычных  авокадо резко падали по сравнению с предыдущей неделей. Взять данные по США в целом, посчитать разницу между объемом продаж в неделю x и количеством проданных авокадо в течение предыдущей недели.

SELECT 
  date, 
  total_volume, 
  region, 
  type, 
  total_volume - LAG(total_volume, 1) OVER (
    ORDER BY 
      date
  ) AS week_diff 
FROM 
  avocado 
WHERE 
  type = 'conventional' 
  AND region = 'TotalUS'
