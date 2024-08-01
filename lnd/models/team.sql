SELECT ROW_NUMBER() OVER () AS team_id, "Team" AS name
FROM {{ ref('athlete_events') }}
GROUP BY "Team"