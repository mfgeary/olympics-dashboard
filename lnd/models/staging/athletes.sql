SELECT DISTINCT "ID" as athlete_id, "Name" as name, "Sex" as sex
FROM {{ ref('athlete_events') }}