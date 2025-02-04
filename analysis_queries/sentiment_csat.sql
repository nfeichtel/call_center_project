-- Using customer sentiment to determine a csat using more customer inputs

SELECT
    ROUND((SELECT COUNT(*) FROM (SELECT *
    FROM call_center_augmented
    WHERE sentiment_score >= 4)) / ROUND(COUNT(*), 2) * 100, 2) AS sentiment_csat
FROM call_center_augmented;

