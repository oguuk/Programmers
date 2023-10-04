select u.user_id, u.nickname, sum(b.price) total_sales
from used_goods_board b
left join used_goods_user u on b.writer_id = u.user_id
where b.status = 'DONE'
group by b.writer_id
having sum(b.price) >= 700000
order by total_sales