CREATE TABLE call_center_augmented AS (    
    SELECT
        call_center.*,
        CASE WHEN sentiment = 'Very Negative' THEN 1
            WHEN sentiment = 'Negative' THEN 2
            WHEN sentiment = 'Neutral' THEN 3
            WHEN sentiment = 'Positive' THEN 4
            WHEN sentiment = 'Very Positive' THEN 5
            END AS sentiment_score
    FROM call_center);