-- Найти покупателей, сумма покупок которых превышает 10 000 рублей. Результат отсортировать по убыванию UserID и вывести 10 строк.

SELECT 
  UserID, 
  SUM(Rub) AS Revenue 
FROM 
  checks 
GROUP BY 
  UserID 
HAVING 
  Revenue > 10000 
ORDER BY 
  UserID DESC 
LIMIT 
  10
