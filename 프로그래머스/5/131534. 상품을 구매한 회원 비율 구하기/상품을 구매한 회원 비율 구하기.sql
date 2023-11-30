With C as (
    select *
    from USER_INFO
    where JOINED like "2021%"
),
B as (
    select *
    from ONLINE_SALE
    where user_id in (select user_id from C)
)


select Year(sales_date) YEAR, month(sales_date) MONTH,
count(distinct user_id) PUCHASED_USERS,
round(count(distinct user_id) / (select count(*) from C), 1) PUCHASED_RATIO
from B
group by Year(SALES_DATE), Month(SALES_DATE)
ORDER BY YEAR asc, MONTH asc