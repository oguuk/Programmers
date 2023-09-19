select MCDP_CD as 진료과코드, count(APNT_NO) as 5월예약건수
from APPOINTMENT
where date_format(APNT_YMD, '%Y-%m-%d') between '2022-05-01' and '2022-05-31'
group by 진료과코드
order by 5월예약건수, 진료과코드

