SELECT i.REST_ID, i.REST_NAME, i.FOOD_TYPE, i.FAVORITES, i.ADDRESS, round(avg(r.review_score), 2) as score
from REST_INFO i
join REST_REVIEW r on i.rest_id = r.rest_id
GROUP BY i.REST_ID
having i.address like "서울%"
order by score desc, i.favorites desc