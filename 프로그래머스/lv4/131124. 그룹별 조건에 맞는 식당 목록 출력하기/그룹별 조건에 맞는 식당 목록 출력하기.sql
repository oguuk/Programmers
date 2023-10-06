with A as (
    select member_id, count(member_id) count
    from rest_review
    group by member_id
    order by count desc limit 1
)

select p.member_name, r.review_text, date_format(r.review_date, '%Y-%m-%d') REVIEW_DATE
from member_profile p
join rest_review r on p.member_id = r.member_id
join A a on a.member_id = p.member_id
order by r.review_date, r.review_text