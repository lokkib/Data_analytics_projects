-- Вывести в результирующую таблицу UserID клиентов, количество сделанных покупок  и сумму потраченных денег (Revenue). Результат отсортировать по убыванию Revenue, оставив 10 записей.

SELECT 
  UserID, 
  COUNT(*) AS NumChecks, 
  SUM(Rub) AS Revenue 
FROM 
  checks 
GROUP BY 
  UserID 
ORDER BY 
  Revenue DESC 
LIMIT 
  10