select distinct(CAR_ID), case
when car_id in (select car_id 
                from CAR_RENTAL_COMPANY_RENTAL_HISTORY 
                where start_date <= '2022-10-16' and end_date >= '2022-10-16') then '대여중'
else '대여 가능'
end AVAILABILITY
from CAR_RENTAL_COMPANY_RENTAL_HISTORY
order by CAR_ID desc