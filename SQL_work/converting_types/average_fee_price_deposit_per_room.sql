-- Сгруппировать данные по типу жилья и вывести средние значения цены за ночь, размера депозита и цены уборки

SELECT 
  room_type, 
  AVG(
    toFloat32OrNull(
      replaceRegexpAll(price, '[$,]', '')
    )
  ) AS average_price, 
  AVG(
    toFloat32OrNull(
      replaceRegexpAll(security_deposit, '[$,]', '')
    )
  ) AS average_deposit, 
  AVG(
    toFloat32OrNull(
      replaceRegexpAll(cleaning_fee, '[$,]', '')
    )
  ) AS average_fee 
FROM 
  listings 
GROUP BY 
  room_type 
ORDER BY 
  average_deposit DESC 
LIMIT 
  60
