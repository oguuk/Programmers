SELECT a.MEMBER_NAME, b.REVIEW_TEXT, date_format(b.REVIEW_DATE, '%Y-%m-%d') as REVIEW_DATE
from MEMBER_PROFILE a
join REST_REVIEW b on a.member_id = b.member_id
where b.member_id = (select member_id 
                      from REST_REVIEW 
                      group by member_id 
                      order by count(*) desc LIMIT 1)
order by b.review_date, b.review_text
