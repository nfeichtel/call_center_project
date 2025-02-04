-- Call duration does not seem to have any impact on csat score
SELECT
    sentiment_score,
    ROUND(AVG(call_duration_in_minutes), 2)
FROM call_center_augmented
GROUP BY sentiment_score
ORDER BY sentiment_score DESC;

