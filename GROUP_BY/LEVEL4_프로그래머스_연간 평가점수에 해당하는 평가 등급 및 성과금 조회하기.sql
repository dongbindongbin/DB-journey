WITH HR_SCORE AS (
    SELECT EMP_NO,
        CASE
            WHEN (AVG(SCORE) >= 96) THEN "S"
            WHEN (AVG(SCORE) >= 90) THEN "A"
            WHEN (AVG(SCORE) >= 80) THEN "B"
            ELSE "C"
        END AS GRADE,
        CASE
            WHEN (AVG(SCORE) >= 96) THEN 0.2
            WHEN (AVG(SCORE) >= 90) THEN 0.15
            WHEN (AVG(SCORE) >= 80) THEN 0.1
            ELSE 0
        END AS BONUS_RATE
    FROM HR_GRADE
    GROUP BY EMP_NO
)

SELECT e.EMP_NO, e.EMP_NAME, s.GRADE, (e.SAL * s.BONUS_RATE) AS BONUS
FROM HR_EMPLOYEES e
JOIN HR_SCORE s
ON e.EMP_NO = s.EMP_NO
ORDER BY EMP_NO ASC