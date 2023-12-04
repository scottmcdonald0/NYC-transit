--Calculate the number of trips and average duration by borough and zone
select
    Borough,
    Zone,
    count(*),
    avg(duration_min)
from
    {{ ref('mart__dim_locations') }} dl
join
    {{ ref('mart__fact_all_taxi_trips') }} t
on dl.LocationID = t.pulocationid
group by all
order by Borough, Zone;
