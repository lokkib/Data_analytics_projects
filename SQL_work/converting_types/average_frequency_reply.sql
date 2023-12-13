-- Посмотреть на среднюю частоту ответа среди хозяев (f) и суперхозяев (t).

SELECT 
  host_is_superhost, 
  ROUND(
    AVG(
      toInt32OrNull(
        replaceAll(host_response_rate, '%', '')
      )
    )
  ) AS average_frequency 
FROM 
  listings 
GROUP BY 
  host_is_superhost
