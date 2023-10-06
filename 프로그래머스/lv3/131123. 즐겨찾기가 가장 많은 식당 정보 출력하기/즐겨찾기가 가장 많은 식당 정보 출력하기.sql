SELECT r1.food_type, r1.rest_id, r1.rest_name, r1.favorites
FROM rest_info r1
JOIN (
    SELECT food_type, MAX(favorites) AS max_fav
    FROM rest_info
    GROUP BY food_type
) r2 ON r1.food_type = r2.food_type AND r1.favorites = r2.max_fav
ORDER BY r1.food_type DESC;
