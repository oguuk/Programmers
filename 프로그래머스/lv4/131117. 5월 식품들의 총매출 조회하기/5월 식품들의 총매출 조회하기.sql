select p.product_id, p.product_name, sum(p.price * o.amount) total_sales
from food_product p
right join food_order o on p.product_id = o.product_id
where p.product_cd is not null and o.produce_date like '2022-05%'
group by o.product_id
order by total_sales desc, product_id