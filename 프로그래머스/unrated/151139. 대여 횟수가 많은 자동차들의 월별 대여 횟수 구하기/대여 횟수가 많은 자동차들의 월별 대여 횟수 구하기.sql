select month(start_date) as month, car_id, count(car_id) as records
from car_rental_company_rental_history
WHERE START_DATE BETWEEN '2022-08-01' AND '2022-10-31' AND
car_id in (select car_id 
                 from car_rental_company_rental_history 
                 where start_date between '2022-08-01' and '2022-10-31' 
                 group by car_id 
                 having count(car_id) >= 5)
group by car_id, month(start_date)
having records >= 1
order by month, car_id desc