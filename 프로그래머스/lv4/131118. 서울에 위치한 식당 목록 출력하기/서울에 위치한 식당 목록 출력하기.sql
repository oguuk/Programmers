select i.rest_id,
i.rest_name,
i.food_type,
favorites,
address,
round(sum(review_score) / count(r.review_id), 2) score
from rest_info i
right join rest_review r on i.rest_id = r.rest_id
where address like '서울%'
group by rest_id
order by score desc, favorites desc