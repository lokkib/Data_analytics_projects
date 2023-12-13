--  Посчитать разницу между максимальной и минимальной установленной ценой у каждого хозяина 

SELECT 
  host_id, 
  MAX(
    toFloat64OrNull(
      replaceRegexpAll(price, '[$,]', '')
    )
  ) - MIN(
    toFloat64OrNull(
      replaceRegexpAll(price, '[$,]', '')
    )
  ) AS diff_between_max_min 
FROM 
  listings 
GROUP BY 
  host_id 
ORDER BY 
  diff_between_max_min DESC 
LIMIT 
  60
