SELECT user.USER_ID,
user.nickname,
concat(user.city, ' ', user.STREET_ADDRESS1, ' ', user.STREET_ADDRESS2) as 전체주소,
concat(left(user.TLNO, 3), '-', mid(user.TLNO, 4, 4), '-', right(user.TLNO, 4)) as 전화번호
from USED_GOODS_BOARD board
left join USED_GOODS_USER user on board.WRITER_ID = user.user_id
group by board.writer_id
having count(board.board_id) >= 3
order by board.writer_id desc
