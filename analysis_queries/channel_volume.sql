SELECT
    channel AS channel,
    COUNT(*) AS ticket_volume,
    ROUND(COUNT(*) :: numeric / (SELECT COUNT(*) FROM call_center_augmented) * 100, 2) AS percent_of_volume
FROM call_center_augmented
GROUP BY channel
ORDER BY ticket_volume DESC;

SELECT
    call_center AS center_location,
    channel,
    COUNT(*) AS ticket_volume,
    ROUND(COUNT(*) :: numeric / (SELECT COUNT(*) FROM call_center_augmented) * 100, 2) AS percent_of_volume
FROM call_center_augmented
GROUP BY call_center, channel
ORDER BY ticket_volume DESC;