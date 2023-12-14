-- Найти день, когда продажи в Нью-Йорке (NewYork) в 2018 году авокадо типа organic увеличились по сравнению с предыдущей неделей, а conventional – наоборот упали.

SELECT 
  date, 
  total_volume, 
  region, 
  type, 
  total_volume - LAG(total_volume, 1) OVER (
    PARTITION BY type 
    ORDER BY 
      date
  ) AS week_diff 
FROM 
  avocado 
WHERE 
  region = 'NewYork' 
ORDER BY 
  type
