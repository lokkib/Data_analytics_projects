-- Отобрать объявления из таблицы listings, которые:

--	* находятся на расстоянии от центра меньше среднего (здесь нам пригодится запрос из предыдущего задания)
--	* обойдутся дешевле 100$ в день (price с учетом cleaning_fee, который добавляется к общей сумме за неделю, т.е его нужно делить на кол-во дней)
--	* имеют последние отзывы (last_review), начиная с 1 сентября 2018 года
--	* имеют WiFi в списке удобств (amenities)

SELECT 
  id, 
  host_id, 
  geoDistance(
    13.4050, 
    52.5200, 
    toFloat64OrNull(longitude), 
    toFloat64OrNull(latitude)
  ) AS distance_from_center, 
  toFloat64OrNull(
    replaceRegexpAll(price, '[$,]', '')
  ) + (
    toFloat64OrNull(
      replaceRegexpAll(cleaning_fee, '[$]', '')
    ) / 7
  ) AS total_price, 
  multiSearchAnyCaseInsensitive(amenities, [ 'WiFi' ]) AS WiFi_included, 
  toFloat64OrNull(review_scores_rating) AS review_scores_rating 
FROM 
  listings 
WHERE 
  distance_from_center < (
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
  ) 
  AND total_price < 100 
  AND toDateOrNull(last_review) >= '2018-09-01' 
  AND WiFi_included = 1 
ORDER BY 
  review_scores_rating DESC 
LIMIT 
  10