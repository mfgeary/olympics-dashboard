SELECT DISTINCT ROW_NUMBER() OVER (ORDER BY "Sport") as sport_id, "Sport" as name
FROM {{ ref('athlete_events') }}
GROUP BY "Sport"