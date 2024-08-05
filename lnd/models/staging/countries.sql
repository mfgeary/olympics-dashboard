SELECT ROW_NUMBER() OVER () AS country_id, "NOC" AS code, region AS name
FROM {{ ref('noc_regions') }}