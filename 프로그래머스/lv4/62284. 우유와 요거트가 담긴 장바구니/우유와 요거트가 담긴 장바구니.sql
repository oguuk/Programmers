SELECT cart_id
from cart_products
where cart_id in (select cart_id 
                  from cart_products
                  where name like 'Milk'
                 ) and cart_id in (select cart_id
                                   from cart_products
                                   where name like 'Yogurt'
                                  )
group by cart_id
order by cart_id