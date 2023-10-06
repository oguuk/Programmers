select b.writer_id, u.nickname, sum(price) total_sales
from used_goods_board b
left join used_goods_user u on b.writer_id = u.user_id
where b.status like 'DONE'
group by b.writer_id
having sum(price) >= 700000
order by total_sales
