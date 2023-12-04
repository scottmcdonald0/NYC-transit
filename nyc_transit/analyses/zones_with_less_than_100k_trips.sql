--Write a query which finds all the Zones where there are less than 100000 trips.
select
    Zone,
    count(*) as trips
from
    {{ ref('mart__dim_locations') }} dl
join
    {{ ref('mart__fact_all_taxi_trips') }} t
on dl.LocationID = t.pulocationid
group by all
having trips < 100000
order by Zone;