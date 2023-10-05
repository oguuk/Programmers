select a.cart_id
from (select id, cart_id, name, price
      from cart_products
      where name like 'Milk'
     ) a
left join (select id, cart_id, name, price
           from cart_products
           where name like 'Yogurt'
          )  b on a.cart_id = b.cart_id
where b.name is not null
order by cart_id