SELECT DISTINCT "Medal" as type, CASE "Medal"
    WHEN 'Gold' THEN 1
    WHEN 'Silver' THEN 2
    WHEN 'Bronze' THEN 3
    ELSE 0
END as medal_id
FROM {{ ref('athlete_events') }}