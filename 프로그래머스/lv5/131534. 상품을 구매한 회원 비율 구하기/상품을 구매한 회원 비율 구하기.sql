with INFO as (
    select YEAR(sales_date) YEAR,
    MONTH(sales_date) MONTH,
    count(distinct user_id) count,
    (select count(user_id) from user_info where joined like '2021%') user_sum
    from online_sale
    where user_id in (select user_id
                        from online_sale
                        where user_id in (select user_id
                                          from user_info
                                          where joined like '2021%'
                                         )
                       )
    group by YEAR, MONTH
)

select YEAR(o.sales_date) YEAR,
MONTH(o.sales_date) MONTH,
i.count PUCHASED_USERS,
ROUND(i.count / i.user_sum, 1) PUNCHASED_RATIO
from online_sale o
join INFO i on YEAR(o.sales_date) = i.year and MONTH(o.sales_date) = i.month
group by YEAR, MONTH
order by YEAR, MONTH