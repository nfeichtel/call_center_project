-- CSAT not impacted by inquery reason
-- Billing questions make up a majority of inqueries
WITH reason_positive AS
    (SELECT
        reason,
        COUNT(sentiment_score) AS reason_count
    FROM (SELECT * FROM call_center_augmented WHERE sentiment_score >= 4)
    GROUP BY reason),

    reason_total AS
    (SELECT
        reason,
        COUNT(sentiment_score) AS reason_count
    FROM call_center_augmented
    GROUP BY reason)


SELECT
    rt.reason AS reason,
    rp.reason_count AS positive_sentiments,
    rt.reason_count AS total_sentiments,
    ROUND(rp.reason_count :: numeric / rt.reason_count :: numeric * 100, 2) AS reason_sentiment_csat
FROM reason_total rt
JOIN reason_positive rp
    ON rt.reason = rp.reason