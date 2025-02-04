WITH call_timestamp_positive AS
    (SELECT
        call_timestamp,
        COUNT(sentiment_score) AS call_timestamp_count
    FROM (SELECT * FROM call_center_augmented WHERE sentiment_score >= 4)
    GROUP BY call_timestamp),

    call_timestamp_total AS
    (SELECT
        call_timestamp,
        COUNT(sentiment_score) AS call_timestamp_count
    FROM call_center_augmented
    GROUP BY call_timestamp)


SELECT
    ct.call_timestamp AS call_timestamp,
    cp.call_timestamp_count AS positive_sentiments,
    ct.call_timestamp_count AS total_sentiments,
    ROUND(cp.call_timestamp_count :: numeric / ct.call_timestamp_count :: numeric * 100, 2) AS call_timestamp_sentiment_csat
FROM call_timestamp_total ct
JOIN call_timestamp_positive cp
    ON ct.call_timestamp = cp.call_timestamp
ORDER BY call_timestamp;