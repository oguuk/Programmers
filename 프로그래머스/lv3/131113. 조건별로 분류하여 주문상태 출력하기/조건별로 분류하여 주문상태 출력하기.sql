select order_id, product_id, date_format(out_date, '%Y-%m-%d') OUT_DATE, case
when isnull(out_date) then '출고미정'
when out_date < '2022-05-02' then '출고완료'
when out_date > '2022-05-02' then '출고대기'
end 출고여부
from FOOD_ORDER
order by order_id