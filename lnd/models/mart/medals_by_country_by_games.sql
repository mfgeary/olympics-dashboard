SELECT count(*) as count, g.year, g.season, c.name as team_country, m.type as medal_type
FROM
    {{ ref('results') }} as r
    JOIN {{ ref('games') }} as g
    ON r.game_id = g.game_id
    JOIN {{ ref('countries') }} as c
    ON r.country_id = c.country_id
    JOIN {{ ref('medals') }} as m
    ON r.medal_id = m.medal_id
GROUP BY g.year, g.season, c.name, m.type
ORDER BY g.year, g.season, c.name, (CASE m.type WHEN 'Gold' THEN 1 WHEN 'Silver' THEN 2 ELSE 3 END)