SELECT
    (SELECT COUNT(*) FROM (SELECT *
    FROM call_center_augmented
    WHERE sentiment_score >= 4)) / ROUND(COUNT(*), 2) * 100
FROM call_center_augmented


SELECT
    sentiment,
    COUNT(*)
FROM call_center_augmented
GROUP BY sentiment
