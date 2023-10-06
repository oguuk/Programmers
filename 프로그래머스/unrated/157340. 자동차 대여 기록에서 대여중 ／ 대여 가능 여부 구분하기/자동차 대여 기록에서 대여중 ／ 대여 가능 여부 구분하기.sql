with filter as (
    select car_id
    from car_rental_company_rental_history
    where start_date <= '2022-10-16' and end_date >= '2022-10-16'
)

select distinct(h.car_id), case
when f.car_id is null then '대여 가능'
else '대여중'
end availability
from car_rental_company_rental_history h
left join filter f on h.car_id = f.car_id
order by h.car_id desc