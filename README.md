# Karpov_courses_DA

# Karpov courses - Аналитик Данных

## Описание
Портфолио проектов, выполненных в рамках курса [Аналитик Данных](https://karpov.courses/analytics) от Karpov courses

## Основные инструменты и навыки:
- Языки: Python (Pandas, NumPy, SciPy, Statsmodels, Matplotlib, Seaborn), SQL
- Построение дашбордов: Tableau
- А/В-тестирование
- Работа с гипотезами (статистическая проверка)

## Проекты:
| # | Название | Задачи проекта                                                   | Навыки и инструменты           |  
| --|-----------|-------------------|------------------------------------------------------------------|
| 1 | [Анализ приложения для курьеров](Courier_app_analysis/) |По результатам проведенного А/B теста проверяем, действительно ли новый алгоритм сокращает время доставки пиццы курьерами| `A/B тест`, `scipy.stats`, `Проверка гипотез`, `Python`, `Pandas`, `Matplotlib.pyplot`|
| 2 | [Анализ факторов, влияющих на цену автомобилей](Car_cost_prediction/) | Пробуем предсказать стоимость машин и понять, от каких факторов зависит ценообразование на автомобили. Выбираем лучшую регрессионную модель | `Python`, `Pandas`, `statsmodels`, `регрессионный анализ` `предобработка данных` |
| 3 | [Анализ приложения доставки продуктов](Food_delivery_analysis/) | По результатам проведенного A/B теста проверяем две гипотезы - влияет ли разрешение фотографий блюд на кол-во заказов и влияет ли формат кнопки на кол-во заказов. | `Python`, `Pandas`, `Seaborn`, `Matplotlib.pyplot`, `statsmodels`, `pingouin`, `A/B тест` |
| 4 | [Анализ E-commerce](Researching_e-commerce/) | Изучаем данные о покупках пользователей в соответствии с задачами - определяем, в какой день недели товар чаще всего покупается, проводим когортный анализ и т.д. | `Python`, `Pandas`, `Seaborn`, `dateutil.relativedelta`, `когортный анализ`, `RFM анализ`|
| 5 | [Работа с грязными данными](Dirty_data_collection/) | Собираем все данные из папки data в один датафрэйм, имеющий следующие столбцы: колонки из самих файлов (product_id, quantity), а также имя пользователя (name), и дата этих покупок (date). Исследование покупок. | `Python`, `Pandas`, `Seaborn`, `os`, `предобработка данных` |
| 6 | [Анализ приложения знакомств](Dating_app_analysis/) | Оцениваем, правда ли, что новый алгоритм улучшил качество сервиса. Выбираем метрики, которые отвечают за качество сервиса, и статистически сравниваем  метрики в двух группах.|`Python`, `Pandas`, `A/B тест`, `Seaborn`, `Matplotlib.pyplot`, `scipy.stats`, `pingouin` |
| 7 | [Анализ новой системы рекомендаций товаров](Delivery_service_analysis/)| Оцениваем, смогла ли новая система рекомендаций принести пользу бизнесу и пользователям приложения. Для этого нужно выбираем метрики, которые отвечают за качество сервиса, статистически сравниваем метрики в двух группах|`Python`,  `A/B тест`, `Pandas`, `Seaborn`, `scipy.stats`, `pingouin`, `statistics` |
| 8 | [Расчет метрик](Metrics_analysis/)| Оцениваем, смогла ли новая система рекомендаций принести пользу бизнесу и пользователям приложения. Для этого нужно выбираем метрики, которые отвечают за качество сервиса, статистически сравниваем метрики в двух группах|`Метрики`, `Когортный анализ`, `Python`, `Pandas`, `numpy`  |
