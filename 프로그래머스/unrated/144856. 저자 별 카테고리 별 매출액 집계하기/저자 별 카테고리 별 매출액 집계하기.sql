SELECT a.AUTHOR_ID, b.AUTHOR_NAME, a.CATEGORY, SUM(a.count * a.price) as SALES
FROM (
    SELECT b.*, SUM(s.sales) as count 
    FROM book_sales s 
    LEFT JOIN book b ON b.BOOK_ID = s.BOOK_ID 
    WHERE s.sales_date BETWEEN '2022-01-01' AND '2022-01-31'
    GROUP BY b.BOOK_ID
) a
LEFT JOIN author b ON a.author_id = b.author_id
GROUP BY a.author_id, a.category
ORDER BY a.author_id ASC, a.category DESC;