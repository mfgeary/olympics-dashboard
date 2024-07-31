-- Create the final results table that combines all tables to get
-- each individual's final Olympic results.
-- SELECT result_id, athlete_id, country_id, game_id, event_id, medal_id, age, height, weight
SELECT athlete_id, country_id, game_id, event_id, "Age" as age, "Height" as height, "Weight" as weight
FROM {{ ref('athlete_events') }}
    JOIN {{ ref('athlete') }} as a
    ON "Name" = a.name
    JOIN {{ ref('country') }} as c
    ON "NOC" = code
    JOIN {{ ref('game') }} as g
    ON "Year" = g.year AND "Season" = g.season AND "City" = g.city
    JOIN {{ ref('event') }} as e
    ON "Event" = e.name