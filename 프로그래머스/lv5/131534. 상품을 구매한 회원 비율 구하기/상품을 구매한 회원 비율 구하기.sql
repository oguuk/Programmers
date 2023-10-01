with total_people as (
    select count(user_id) count
    from user_info
    where joined like '2021%'
),
buy as (
    select YEAR(o.SALES_DATE) YEAR, MONTH(o.SALES_DATE) MONTH, count(distinct o.user_id) PUCHASED_USERS
    from ONLINE_SALE o
    join USER_INFO u on u.user_id = o.user_id
    where u.joined like '2021%'
    group by YEAR, MONTH
)

select b.year, b.month, b.PUCHASED_USERS, round(b.PUCHASED_USERS / p.count, 1) PUCHASED_RATIO
from buy b, total_people p
order by year, month