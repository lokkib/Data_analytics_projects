-- I. C помощью оператора WITH создаем обобщенное табличное выражение (ОТВ), на которое будем ссылаться 
-- далее при объединении таблиц


WITH reorderings AS

-- 3) Создаем основной селект - селектим id курса, который студенты повторно заказали, id студента, 
-- стоимость повторно заказанного курса,а также порядковый номер также заказа, 
-- но с фильтрацией по определенным условиям (комментарии в последней части ОТВ).

  (SELECT course_id,
          student_id,
          cost,
          number_of_order
   FROM

        -- 2) Делаем подзапрос более высокого уровня, который будет ссылаться на созданный ниже.

        -- Вытаскиваем все данные, а также создаем новый столбец (reordering) 
        -- с условием - если number_of_order = 1
        -- и месяц подтверждения (считаем по дате обновленной информации - updated_at) < 9, присваиваем 1,
        -- Если number_of_order > 1 и дата updated_at совпадает с нужными числами сентября, присваиваем 
        -- 'reorder'. В противном случае - присваиваем 0.

        -- Данные значения понадобятся в дальнейшем для фильтрации именно тех повторных заказов, которые нам нужны.

     (SELECT *,
             CASE
                 WHEN number_of_order = 1
                      AND MONTH(updated_at) < 9 THEN 1
                 WHEN number_of_order > 1
                      AND updated_at BETWEEN '2023-09-01 00:00:00' AND '2023-09-25 00:00:00' THEN 'reorder'
                 ELSE 0
             END AS reordering
      FROM

         -- 1) Начинаем создание ОТВ с подзапроса - селекта данных из orders и 
         -- создания нового столбца (number_of_order), который будет содержать
         -- порядковый номер заказа с группировкой по студенту и курсу.
        -- Делаем это с помощью агрегирующей оконной функции.

        (SELECT *,
                COUNT(*) OVER (PARTITION BY course_id,
                                            student_id
                               ORDER BY updated_at) AS number_of_order
         FROM orders
         --  будем считать только подтвержденные заказы.
         WHERE status = 'CONFIRMED' ) AS t1) AS t2

         -- в рамках главного запроса - селектим только те данные, где в столбце reordering 
         -- значение 'reorder', то есть это данные с повторным заказом, совершенным в нужный нам период.
   WHERE reordering = 'reorder'

        -- а также добавляем второе условие - student_id и course_id с такими повторными заказами
        -- должны совпадать (оператор IN) с такими student_id и course_id, где первый заказ был совершен до
        -- сентября 2023 года.
        -- Для такой фильтрации используем еще один подзапрос с подсчетом порядковых номеров заказов.
     AND (student_id,
          course_id) IN
       (SELECT student_id,
               course_id
        FROM

     
        
          (SELECT *,
                  COUNT(*) OVER (PARTITION BY course_id,
                                              student_id
                                 ORDER BY updated_at) AS number_of_order
           FROM orders
           WHERE status = 'CONFIRMED') AS t3

          -- Ставим условие - первый заказ был совершен до сентября 2023 года
        WHERE number_of_order = 1
          AND MONTH(updated_at) < 9))



-- II. Селектим и объединяем данные из всех нужных нам таблиц

-- из ОТВ reorderings выбираем id студентов, id курсов, стоимость повторно заказанного курса и
--  порядковый номер заказа (number_of_order)

SELECT course_name,
       cost,
       r.student_id,
       r.course_id,
       last_name,
       first_name,
       available_lessons,
       number_of_order

FROM courses AS c

-- используем классический inner join и соединяем таблицы по соответствующим ключам

JOIN reorderings AS r ON c.id = r.course_id

JOIN users AS u ON r.student_id = u.id

JOIN course_students AS cs ON u.id = cs.student_id

AND c.id = cs.course_id