--Make a query which finds taxi trips which don’t have a pick up location_id in the locations table.
select t.*
from {{ ref('mart__fact_all_taxi_trips') }} t
left join {{ ref('mart__dim_locations') }} dl
on t.pulocationid = dl.LocationID
where dl.LocationID is null;