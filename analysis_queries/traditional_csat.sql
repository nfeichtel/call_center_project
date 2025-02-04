-- traditional csat score
-- 12271 non-null values out of 32,941 total values = only 37.25% of respondents
-- csat score = 37.65, but only includes 37.25% of respondents, consider using a different metric

SELECT
    ROUND((SELECT SUM(csat_score)
    FROM call_center 
    WHERE csat_score IS NOT NULL AND csat_score >= 8) / SUM(csat_score) * 100, 2)
FROM call_center;


