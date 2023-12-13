# Работа с данными мобильного приложения крупной розничной сети

## Описание данных

**retail** — содержит данные о покупках товаров в разных странах.

* InvoiceNo  — идентификатор покупки;
* StockCode  — идентификатор товара на складе;
* Description  — текстовое описание товара;
* Quantity  — количество товара;
* InvoiceDate  — дата покупки;
* UnitPrice — цена товара;
* CustomerID — идентификатор покупателя;
* Country — страна



## Задачи проекта

1. Посчитать выручку (Revenue) по странам и отсортировать таблицу в порядке убывания выручки. 
2. Посчитать среднее число купленных товаров по стране и среднюю цену товара, отсортировать по убыванию средней цены товара.
3. Посчитать выручку (Revenue) по месяцам.
4. Используя данные за март 2011 года, посчитать среднюю цену товара клиента с группировкой по id покупателя, вывести строки с покупками тех покупателей, у которых самая высокая средняя цена купленного товара в марте. 
5. Сгруппировать данные по странам и месяцам, посчитать среднее (Avg), минимальное (Min) и максимальное (Max) количество купленных товаров, и отсортировать данные по месяцу, применить фильтр по стране с наибольшей выручкой.

## Стек технологий
* СУБД ClickHouse
* Tabix