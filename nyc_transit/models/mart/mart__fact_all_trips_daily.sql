-- with trips_renamed as
-- (
--     select 'bike' as type, started_at_ts, ended_at_ts from {{ ref('stg__bike_data') }}
--     union all
--     select 'fhv' as type, pickup_datetime, dropoff_datetime from {{ ref('stg__fhv_tripdata') }}
--     union all
--     select 'fhvhv' as type, pickup_datetime, dropoff_datetime from {{ ref('stg__fhvhv_tripdata') }}
--     union all
--     select 'green' as type, lpep_pickup_datetime, lpep_dropoff_datetime from {{ ref('stg__green_tripdata') }}
--     union all
--     select 'yellow' as type, tpep_pickup_datetime, tpep_dropoff_datetime from {{ ref('stg__yellow_tripdata') }}
-- )

-- select
--     type,
--     date_trunc('day', started_at_ts)::date as date,
--     count(*) as trips,
--     avg(datediff('minute', started_at_ts, ended_at_ts)) as average_trip_duration_min
-- from trips_renamed
-- groupby date, type

select
    type,
    date_trunc('day', started_at_ts)::date as date,
    count(*) as trips,
    avg(duration_min) as average_trip_duration_min
from {{ ref('mart__fact_all_trips') }}
group by all