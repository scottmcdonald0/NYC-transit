--Write a query to compare an individual fare to the zone, borough and overall
--average fare using the fare_amount in yellow taxi trip data

with yt as --yellow_taxi_data
(
    select 
        fare_amount,
        pulocationid as location_id
    from {{ ref('stg__yellow_tripdata') }}
    -- from yellow_tripdata
    where pulocationid is not null
)

select
    yt.fare_amount,
    avg(yt.fare_amount) over (partition by l.Zone) as avg_fare_zone,
    avg(yt.fare_amount) over (partition by l.Borough) as avg_fare_borough,
    avg(yt.fare_amount) over () as avg_fare_overall
from
    yt
inner join
    {{ ref('mart__dim_locations') }}
on 
    yt.location_id = l.LocationID;