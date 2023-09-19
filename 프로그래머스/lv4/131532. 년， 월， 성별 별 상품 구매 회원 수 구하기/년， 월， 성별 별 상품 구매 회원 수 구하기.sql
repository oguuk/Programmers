SELECT YEAR(sale.sales_date) AS year, MONTH(sale.sales_date) AS month, info.GENDER, COUNT(DISTINCT info.user_id) AS USERS
FROM ONLINE_SALE sale
LEFT JOIN USER_INFO info ON info.user_id = sale.user_id
WHERE info.gender IS NOT NULL
GROUP BY YEAR(sale.sales_date), MONTH(sale.sales_date), info.GENDER
ORDER BY year, month, info.GENDER;
