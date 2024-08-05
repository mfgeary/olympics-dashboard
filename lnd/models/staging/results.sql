SELECT DISTINCT
    ROW_NUMBER() OVER () as result_id,
    athlete_id,
    country_id,
    game_id,
    event_id,
    medal_id,
    team_id,
    "Age" as age, "Height" as height, "Weight" as weight
FROM {{ ref('athlete_events') }}
    FULL JOIN {{ ref('athletes') }} as a
    ON "ID" = a.athlete_id
    FULL JOIN {{ ref('teams') }} as t
    ON "Team" = t.name
    FULL JOIN {{ ref('countries') }} as c
    ON "NOC" = c.code
    JOIN {{ ref('games') }} as g
    ON "Year" = g.year AND "Season" = g.season AND "City" = g.city
    JOIN {{ ref('events') }} as e
    ON "Event" = e.name
    JOIN {{ ref('medals') }} as m
    ON "Medal" = m.type
GROUP BY athlete_id, country_id, game_id, event_id, medal_id, team_id, age, height, weight