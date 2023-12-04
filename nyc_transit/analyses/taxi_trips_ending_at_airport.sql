.echo on

select count(*) as trips
from {{ ref('mart__fact_all_taxi_trips') }} t
join {{ ref('mart__dim_locations') }} dl on t.DOlocationID = dl.LocationID
where dl.service_zone in ('Airports', 'EWR')
group by all;