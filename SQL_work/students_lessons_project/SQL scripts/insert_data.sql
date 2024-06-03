
-- Наполняем таблицы данными

INSERT INTO courses 
VALUES 
  (1, 'Информатика'), 
  (2, 'Математика'), 
  (3, 'История');

INSERT INTO users (last_name, first_name) 
VALUES 
  ('Ivanov', 'Sergey'), 
  ('Petrov', 'Anton'), 
  ('Sidorov', 'Alex');


  -- у студента с id 1, проходящего курс с id 1, а также у студента с id 1 (курс 3) не будет доступных уроков

INSERT INTO course_students 
VALUES 
  (1, 1, null), 
  (1, 2, 10), 
  (1, 3, 30), 
  (2, 1, 10), 
  (2, 2, 30), 
  (2, 3, 20), 
  (3, 1, null), 
  (3, 2, 50), 
  (3, 3, 20);


  -- наполняем таблицу с заказами. 
  -- Статусы будут иметь значение 'confirmed' (подтвержден),'init','not_confirmed'.

  -- Там, где статус 'init', updated_at будет отсутствовать, поскольку init предполагает только 
  -- изначальную подачу заявки на осуществление заказа, с отсутствием данных по дальнейшему движению.

  -- По условию, нас будут интересовать те повторные заказы и студенты, чей предыдущий заказ/заказы были 
  -- совершены/подтверждены до 01.09.2023, а сам повторный совершен в промежутке 
  -- от 2023-09-01 00:00:00 до 2023-09-25 00:00:00.

  -- Под это условие попадают студент id 3, проходящий курс id 2 - первый заказ был совершен/подтвержден 2023-05-09,
  --  второй - 2023-09-02.
  -- а также студент с id 2, проходящий курс с id 2 - два заказа были совершены до 09.2023, третий - 2023-09-19.


INSERT INTO orders (
  course_id, student_id, status, code, 
  token, cost, terminal_id, is_sbp, 
  created_at, updated_at
) 
VALUES 
  (
    1, 2, 'CONFIRMED', 'sddjldvdfvdjodsv', 
    '32fdbfdb32dd', 5000, 6, 0, '2023-04-01 18:24:03', 
    '2023-04-02 01:02:00'
  ) (
    1, 3, 'CONFIRMED', 'sddjlvdjodsv', 
    '3232dd', 3000, 11, 0, '2023-09-01 16:24:03', 
    '2023-09-02 01:02:00'
  ), 
  (
    1, 3, 'CONFIRMED', 'evdnvnfv4', 'weeiw24', 
    3000, 11, 1, '2023-09-17 14:34:00', 
    '2023-09-17 16:51:00'
  ), 
  (
    1, 3, 'CONFIRMED', 'eewf4', 'wq4', 3000, 
    12, 1, '2023-11-18 14:24:07', '2023-11-18 19:44:00'
  ), 
  (
    2, 1, 'CONFIRMED', 'eeFHFJN3', 'wWWRW3', 
    5000, 9, 1, '2023-08-08 04:24:00', 
    '2023-08-10 02:24:30'
  ), 
  (
    2, 2, 'CONFIRMED', 'eN3', 'wdsvsdv3', 
    5000, 5, 0, '2023-07-08 14:24:00', 
    '2023-07-09 04:24:30'
  ), 
  (
    2, 2, 'INIT', 'eeFHFJSQWD3', 'dvdvWWRW3', 
    5000, 9, 1, '2023-08-08 04:24:00', 
    null
  ), 
  (
    2, 2, 'CONFIRMED', 'eeFdvdvHFJSQWD3', 
    'dvdvdvWWRW3', 5000, 9, 1, '2023-08-10 01:24:00', 
    '2023-08-12 03:24:30'
  ), 
  (
    2, 2, 'CONFIRMED', 'eeFHFJN3', 'wWWRW3', 
    5000, 9, 1, '2023-09-18 05:32:00', 
    '2023-09-19 02:24:30'
  ), 
  (
    2, 2, 'NOT_CONFIRMED', 'eeFHFJN3', 
    'wWWRW3', 5000, 9, 1, '2023-10-08 20:24:00', 
    '2023-10-11 06:24:30'
  ), 
  (
    2, 3, 'INIT', 'eeFHFJdfdfbN3', 'wWWfbdfbRW3', 
    5000, 1, 0, '2023-05-08 14:24:00', 
    null
  ), 
  (
    2, 3, 'CONFIRMED', 'eeFHefefFJdfdfbN3', 
    'wWWfefefbdfbRW3', 5000, 1, 0, '2023-05-09 17:24:20', 
    '2023-05-09 18:24:20'
  ), 
  (
    2, 3, 'NOT_CONFIRMED', 'eeefeFHFJN3', 
    'wWWRW3', 5000, 9, 1, '2023-08-28 04:24:00', 
    '2023-08-29 04:26:30'
  ), 
  (
    2, 3, 'CONFIRMED', 'eeFHFJN3', 'wWWRW3', 
    5000, 9, 1, '2023-09-01 15:24:00', 
    '2023-09-02 12:24:30'
  ), 
  (
    3, 2, 'CONFIRMED', 'eeefewewdv3', 'wadvsd3', 
    2000, 3, 0, '2023-06-01 04:24:00', 
    '2023-08-10 02:24:30'
  ), 
  (
    3, 2, 'CONFIRMED', 'eeFefefHFJN3', 
    'wWvrrvWRW3', 2000, 3, 1, '2023-07-08 00:01:30', 
    '2023-07-10 13:24:30'
  ), 
  (
    3, 2, 'NOT_CONFIRMED', 'eefeFHFJN3', 
    'wWWRW3', 2000, 4, 1, '2023-09-15 14:24:00', 
    '2023-09-15 15:44:30'
  ), 
  (
    3, 2, 'CONFIRMED', 'eeFHFJN3', 'wWWRW3', 
    2000, 9, 1, '2023-09-25 11:24:00', 
    '2023-09-25 15:24:30'
  ), 
  (
    3, 2, 'NOT_CONFIRMED', 'eeFHFfgnfgnJN3', 
    'wWWRWdng3', 2000, 4, 1, '2023-11-11 04:10:00', 
    '2023-11-12 02:24:30'
  ), 
  (
    3, 3, 'CONFIRMED', 'eeFHFJevewN3', 
    'wWWwefefRW3', 2000, 9, 1, '2023-08-19 04:24:00', 
    '2023-08-20 02:24:30'
  ), 
  (
    3, 3, 'CONFIRMED', 'eeFHFwevwvJN3', 
    'wWWwevRW3', 2000, 9, 0, '2023-08-30 10:12:00', 
    '2023-08-30 15:24:30'
  );