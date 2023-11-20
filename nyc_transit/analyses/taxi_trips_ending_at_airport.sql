.echo on

select
    weekday(started_at_ts) as weekday,
    count(*) as total_trips,
from {{ ref('mart__fact_all_taxi_trips') }} taxi_trips
join {{ ref('mart__dim_locations') }} locations
on taxi_trips.dolocationid = locations.LocationID
where locations.service_zone in ('Airports', 'EWR');