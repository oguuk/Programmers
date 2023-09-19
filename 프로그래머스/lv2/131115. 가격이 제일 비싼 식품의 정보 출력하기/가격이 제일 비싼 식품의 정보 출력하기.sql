select *
from food_product
where price in (select max(price )from food_product )