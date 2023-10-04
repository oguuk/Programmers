select distinct(c.car_id)
from CAR_RENTAL_COMPANY_RENTAL_HISTORY h
left join CAR_RENTAL_COMPANY_CAR c on c.car_id = h.car_id
where c.car_type like '세단' and h.start_date between '2022-10-01' and '2022-10-31'
order by car_id desc