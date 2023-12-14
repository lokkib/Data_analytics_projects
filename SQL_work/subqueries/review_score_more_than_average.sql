-- Оставить только те объявления, в которых оценка на основе отзывов выше среднего, а число отзывов в месяц составляет строго меньше трёх. Затем отсортировать по убыванию две колонки: сначала по числу отзывов в месяц, потом по оценке.

SELECT 
  id, 
  toFloat64OrNull(review_scores_rating) AS review_scores_rating, 
  reviews_per_month 
FROM 
  listings 
WHERE 
  review_scores_rating > (
    SELECT 
      AVG(
        toFloat64OrNull(review_scores_rating)
      ) 
    FROM 
      listings
  ) 
  AND reviews_per_month < 3 
ORDER BY 
  reviews_per_month DESC, 
  review_scores_rating DESC 
LIMIT 
  10
