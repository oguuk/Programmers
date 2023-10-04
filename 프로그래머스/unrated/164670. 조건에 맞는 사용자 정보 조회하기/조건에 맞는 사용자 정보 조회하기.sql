select u.user_id, u.NICKNAME, concat(u.city, ' ', u.STREET_ADDRESS1, ' ', u.STREET_ADDRESS2) 전체주소, concat(left(u.tlno, 3), '-', mid(u.tlno,4,4), '-', right(u.tlno, 4)) 전화번호
from USED_GOODS_BOARD b
left join used_goods_user u on b.WRITER_ID = u.USER_ID
group by b.writer_id
having count(b.board_id) > 2
order by b.writer_id desc