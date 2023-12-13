-- Используя данные за март 2011 года, посчитать среднюю цену товара клиента с группировкой по id покупателя, вывести строки с покупками тех покупателей, у которых самая высокая средняя цена купленного товара в марте. 

SELECT 
  CustomerID, 
  AVG(UnitPrice) AS average_price 
FROM 
  retail 
WHERE 
  Description != 'Manual' 
  AND toStartOfMonth(InvoiceDate) = '2011-03-01' 
GROUP BY 
  CustomerID 
ORDER BY 
  average_price DESC 
LIMIT 
  100