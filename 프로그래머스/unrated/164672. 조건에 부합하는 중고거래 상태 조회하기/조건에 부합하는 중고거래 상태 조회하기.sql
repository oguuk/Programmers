SELECT board_id, writer_id, title, price, Case when status = 'SALE' then '판매중'
when status = 'RESERVED' then '예약중' when status = 'DONE' then '거래완료' end status
from USED_GOODS_BOARD
WHERE board_id IN(SELECT board_id FROM USED_GOODS_BOARD WHERE created_date = '2022-10-05')
ORDER BY board_id DESC