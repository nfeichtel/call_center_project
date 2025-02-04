-- ticket volume based on location
SELECT
    call_center AS center_location,
    COUNT(*) AS ticket_volume,
    ROUND(COUNT(*) :: numeric / (SELECT COUNT(*) FROM call_center_augmented) * 100, 2) AS percent_of_volume
FROM call_center_augmented
GROUP BY call_center
ORDER BY ticket_volume DESC
