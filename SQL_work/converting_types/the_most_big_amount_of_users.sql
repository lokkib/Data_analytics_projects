--  Проверить, в какой месяц и год зарегистрировалось наибольшее количество новых хостов.  

SELECT 
  toStartOfMonth(
    toDateOrNull(host_since)
  ) AS date, 
  COUNT (DISTINCT host_id) AS hosts 
FROM 
  listings 
GROUP BY 
  date 
ORDER BY 
  hosts DESC
