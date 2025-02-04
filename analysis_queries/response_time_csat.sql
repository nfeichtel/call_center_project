-- response time doesnt impact csat
-- within sla is the majority of response times

WITH response_time_positive AS
    (SELECT
        response_time,
        COUNT(sentiment_score) AS response_time_count
    FROM (SELECT * FROM call_center_augmented WHERE sentiment_score >= 4)
    GROUP BY response_time),

    response_time_total AS
    (SELECT
        response_time,
        COUNT(sentiment_score) AS response_time_count
    FROM call_center_augmented
    GROUP BY response_time)


SELECT
    rt.response_time AS response_time,
    rp.response_time_count AS positive_sentiments,
    rt.response_time_count AS total_sentiments,
    ROUND(rp.response_time_count :: numeric / rt.response_time_count :: numeric * 100, 2) AS response_time_sentiment_csat
FROM response_time_total rt
JOIN response_time_positive rp
    ON rt.response_time = rp.response_time;