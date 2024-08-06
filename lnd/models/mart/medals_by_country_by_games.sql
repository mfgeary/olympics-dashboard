SELECT DISTINCT g.year, g.season, c.name as team_country, m.type as medal_type, COUNT(DISTINCT r.event_id) as count
FROM
    {{ ref('results') }} as r
    JOIN {{ ref('games') }} as g
    ON r.game_id = g.game_id
    JOIN {{ ref('countries') }} as c
    ON r.country_id = c.country_id
    JOIN {{ ref('medals') }} as m
    ON r.medal_id = m.medal_id
    JOIN {{ ref('events') }} as e
    ON r.event_id = e.event_id
WHERE m.type != 'NA'
GROUP BY g.year, g.season, c.name, m.type
ORDER BY year, season, team_country, medal_type