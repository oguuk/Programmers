SET @HOUR = -1;
SELECT (@HOUR := @HOUR +1) AS HOUR, (SELECT COUNT(HOUR(DATETIME))
                                     FROM ANIMAL_OUTS
                                     WHERE HOUR(DATETIME) = @HOUR
                                    ) COUNT
FROM ANIMAL_OUTS
WHERE @HOUR < 23
