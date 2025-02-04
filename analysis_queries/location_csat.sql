-- Sentimet CSAT based on call center location
WITH location_positive AS
    (SELECT
        call_center,
        COUNT(sentiment_score) AS location_count
    FROM (SELECT * FROM call_center_augmented WHERE sentiment_score >= 4)
    GROUP BY call_center),

    location_total AS
    (SELECT
        call_center,
        COUNT(sentiment_score) AS location_count
    FROM call_center_augmented
    GROUP BY call_center)


SELECT
    lt.call_center AS location,
    lp.location_count AS positive_sentiments,
    lt.location_count AS total_sentiments,
    ROUND(lp.location_count :: numeric / lt.location_count :: numeric * 100, 2) AS location_sentiment_csat
FROM location_total lt
JOIN location_positive lp
    ON lt.call_center = lp.call_center



WITH location_positive AS
    (SELECT
        call_center,
        channel,
        COUNT(sentiment_score) AS location_count
    FROM (SELECT * FROM call_center_augmented WHERE sentiment_score >= 4)
    GROUP BY call_center, channel),

    location_total AS
    (SELECT
        call_center,
        channel,
        COUNT(sentiment_score) AS location_count
    FROM call_center_augmented
    GROUP BY call_center, channel)


SELECT
    lt.call_center AS location,
    lt.channel AS channel,
    lp.location_count AS positive_sentiments,
    lt.location_count AS total_sentiments,
    ROUND(lp.location_count :: numeric / lt.location_count :: numeric * 100, 2) AS location_sentiment_csat
FROM location_total lt
JOIN location_positive lp
    ON lt.call_center = lp.call_center AND lt.channel = lp.channel
ORDER BY location, channel



