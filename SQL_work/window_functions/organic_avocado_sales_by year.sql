-- К предыдущему запросу - добавить разбивку по каждому году.

SELECT 
  region, 
  date, 
  total_volume, 
  SUM(total_volume) OVER (
    PARTITION BY region, 
    Extract(
      'Year' 
      FROM 
        date
    ) 
    ORDER BY 
      date
  ) AS volume 
FROM 
  avocado 
WHERE 
  region IN ('NewYork', 'LosAngeles') 
  AND type = 'organic' 
ORDER BY 
  region DESC
