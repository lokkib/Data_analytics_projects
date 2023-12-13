-- Вывести, кол-во покупок в разрезе каждого клиента, указав имя столбца как NumChecks. Результирующую таблицу с UserID, NumChecks отсортировать по убыванию  нового столбца. Ограничение вывода – 10.

SELECT 
  UserID, 
  COUNT(*) AS NumChecks 
FROM 
  checks 
GROUP BY 
  UserID 
ORDER BY 
  NumChecks DESC 
LIMIT 
  10
