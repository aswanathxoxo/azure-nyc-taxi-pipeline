SELECT TOP 10 *
FROM vw_yellow_trips;


SELECT COUNT(*) AS total_rows
FROM vw_yellow_trips;


SELECT COUNT(*) AS total_rows
FROM vw_yellow_trips;


SELECT
    pickup_hour,
    COUNT(*) AS trip_count,
    ROUND(AVG(fare_amount), 2) AS avg_fare,
    ROUND(AVG(trip_distance), 2) AS avg_distance_miles
FROM vw_yellow_trips
GROUP BY pickup_hour
ORDER BY pickup_hour;


SELECT
    pickup_borough,
    COUNT(*) AS trip_count,
    ROUND(AVG(fare_amount), 2) AS avg_fare,
    ROUND(AVG(tip_amount), 2) AS avg_tip,
    ROUND(AVG(tip_amount) / NULLIF(AVG(fare_amount), 0) * 100, 2) AS avg_tip_pct
FROM vw_yellow_trips
WHERE pickup_borough IS NOT NULL
GROUP BY pickup_borough
ORDER BY trip_count DESC;



SELECT
    CASE WHEN is_weekend = 1 THEN 'Weekend' ELSE 'Weekday' END AS day_type,
    COUNT(*) AS trip_count,
    ROUND(AVG(fare_amount), 2) AS avg_fare,
    ROUND(AVG(trip_duration_min), 2) AS avg_duration_min
FROM vw_yellow_trips
GROUP BY is_weekend
ORDER BY day_type;