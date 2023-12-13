-- Вывести минимальный (MinCheck), максимальный (MaxCheck) и средний (AvgCheck) чек по дням. В результирующей таблице использовать сортировку по убыванию  столбца BuyDate.

SELECT 
  BuyDate, 
  MIN(Rub) AS MinCheck, 
  AVG(Rub) AS AvgCheck, 
  MAX(Rub) AS MaxCheck 
FROM 
  checks 
GROUP BY 
  BuyDate 
ORDER BY 
  BuyDate DESC 
LIMIT 
  10