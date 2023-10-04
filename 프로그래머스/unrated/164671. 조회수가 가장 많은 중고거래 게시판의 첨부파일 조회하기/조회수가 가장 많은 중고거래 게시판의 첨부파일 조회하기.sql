select concat('/home/grep/src/', b.board_id, '/', f.file_id, f.file_name, f.file_ext) file_path
from used_goods_board b
left join used_goods_file f on b.board_id = f.board_id
where b.views in (select max(views) from USED_GOODS_BOARD)
order by f.file_id desc