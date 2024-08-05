SELECT DISTINCT ROW_NUMBER() OVER (ORDER BY "Year") as game_id, "Year" as year, "Season" as season, "City" as city
FROM {{ ref('athlete_events') }}
GROUP BY "Year", "Season", "City"
ORDER BY "Year", "Season", "City"