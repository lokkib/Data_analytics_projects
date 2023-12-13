-- Выяснить, в каких частях города средняя стоимость за ночь является наиболее низкой.

SELECT 
neighbourhood_cleansed,
AVG(toFloat32OrNull(replaceRegexpAll(price,'[$,]','') )) AS average_price



FROM listings

GROUP BY neighbourhood_cleansed

ORDER BY average_price

LIMIT 60