select YEAR(SALES_DATE) YEAR,
MONTH(SALES_DATE) MONTH,
GENDER,
COUNT(distinct u.user_id) USERS
from user_info u
join online_sale s on s.user_id = u.user_id
where GENDER is not NULL
group by YEAR, MONTH, GENDER