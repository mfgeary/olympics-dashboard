SELECT ROW_NUMBER() OVER (ORDER BY "Event") as event_id, "Event" as name, sport_id
FROM {{ ref('athlete_events') }}
INNER JOIN {{ ref('sports') }}
ON "Sport" = name
GROUP BY "Event", sport_id