SELECT f.flavor
FROM (
  SELECT flavor, SUM(total_order) AS first_half_total
  FROM first_half
  GROUP BY flavor
) f
JOIN (
  SELECT flavor, SUM(total_order) AS july_total
  FROM july
  GROUP BY flavor
) j ON f.flavor = j.flavor
ORDER BY (f.first_half_total + j.july_total) DESC
LIMIT 3
