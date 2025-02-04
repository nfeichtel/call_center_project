-- Sentiment csat based on channel
WITH channel_positive AS
    (SELECT
        channel,
        COUNT(sentiment_score) AS channel_count
    FROM (SELECT * FROM call_center_augmented WHERE sentiment_score >= 4)
    GROUP BY channel),

    channel_total AS
    (SELECT
        channel,
        COUNT(sentiment_score) AS channel_count
    FROM call_center_augmented
    GROUP BY channel)


SELECT
    ct.channel AS channel,
    cp.channel_count AS positive_sentiments,
    ct.channel_count AS total_sentiments,
    ROUND(cp.channel_count :: numeric / ct.channel_count :: numeric * 100, 2) AS channel_sentiment_csat
FROM channel_total ct
JOIN channel_positive cp
    ON ct.channel = cp.channel