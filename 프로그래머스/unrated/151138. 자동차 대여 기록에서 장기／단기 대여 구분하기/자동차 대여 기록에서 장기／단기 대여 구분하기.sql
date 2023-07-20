SELECT history_id
, car_id
, DATE_FORMAT(start_date, '%Y-%m-%d') AS start_date
, DATE_FORMAT(end_date, '%Y-%m-%d') AS end_date
, Case when DATEDIFF(end_date, start_date) + 1 >= 30 then '장기 대여' ELSE '단기 대여' END AS RENT_TYPE
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE START_DATE BETWEEN '2022-09-01' AND '2022-09-30'
ORDER BY history_id DESC