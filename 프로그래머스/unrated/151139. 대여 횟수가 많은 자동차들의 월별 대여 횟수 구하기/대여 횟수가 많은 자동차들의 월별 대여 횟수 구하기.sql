SELECT MONTH(START_DATE) MONTH, CAR_ID, COUNT(CAR_ID) RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE START_DATE >= '2022-08-01' AND START_DATE < '2022-11-01'
AND CAR_ID IN (SELECT CAR_ID
                 FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
                 WHERE START_DATE >= '2022-08-01' 
                 AND START_DATE < '2022-11-01'
                 GROUP BY CAR_ID
                 HAVING COUNT(HISTORY_ID) > 4)
GROUP BY MONTH, CAR_ID
ORDER BY MONTH, CAR_ID DESC