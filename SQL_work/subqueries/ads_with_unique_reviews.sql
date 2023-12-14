-- Найти в таблице calendar_summary те доступные (available='t') объявления, у которых число отзывов от уникальных пользователей в таблице reviews выше среднего.

WITH (
  SELECT 
    COUNT(DISTINCT reviewer_id) / COUNT(DISTINCT listing_id) 
  FROM 
    reviews
) AS average_reviews 
SELECT 
  listing_id, 
  COUNT(DISTINCT reviewer_id) AS number_of_reviews 
FROM 
  calendar_summary 
  JOIN reviews ON calendar_summary.listing_id = reviews.listing_id 
WHERE 
  available = 't' 
GROUP BY 
  listing_id 
HAVING 
  number_of_reviews > average_reviews 
ORDER BY 
  listing_id ASC 
LIMIT 
  10
