-- Create the final results table that combines all tables to get
-- each individual's final Olympic results.
with res as (SELECT DISTINCT
    athlete_id,
    country_id,
    game_id,
    event_id,
    medal_id,
    team_id,
    "Age" as age, "Height" as height, "Weight" as weight
FROM {{ ref('athlete_events') }}
    FULL JOIN {{ ref('athlete') }} as a
    ON "ID" = a.athlete_id
    FULL JOIN {{ ref('team') }} as t
    ON "Team" = t.name
    FULL JOIN {{ ref('country') }} as c
    ON "NOC" = c.code
    JOIN {{ ref('game') }} as g
    ON "Year" = g.year AND "Season" = g.season AND "City" = g.city
    JOIN {{ ref('event') }} as e
    ON "Event" = e.name
    JOIN {{ ref('medal') }} as m
    ON "Medal" = m.type
)

-- select count(*) from (
-- select distinct *
--     -- "ID", "Name", "Sex", "Age", "Weight", "Height", --done
--     -- "Team", "NOC", --done
--     -- "Games", "Year", "Season", "City", --done
--     -- "Event", "Sport", --done
--     -- "Medal" --done
-- from {{ ref('athlete_events') }}
-- ) as subq

select count(*) from res