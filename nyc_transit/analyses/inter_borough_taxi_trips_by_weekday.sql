.echo on

-- Adapted with ChatGPT

with trips as (
  select
    DATE_TRUNC('weekday', pickup_datetime) as weekday,
    pulocationid as pickup_location,
    dolocationid as dropoff_location
  from {{ ref('mart__fact_all_taxi_trips') }}
),

locations as (
  select
    pulocationid as locationid,
    borough as pickup_borough
  from {{ ref('mart__dim_locations') }}
),

inter_borough_trips as (
  select
    t.weekday,
    t.pickup_location,
    t.dropoff_location,
    l.pickup_borough as pickup_borough,
    d.borough as dropoff_borough
  from trips t
  join locations l ON t.pickup_location = l.locationid
  join {{ ref('mart__dim_locations') }} d ON t.dropoff_location = d.locationid
  where l.pickup_borough != d.borough
),

total_trips_by_weekday as (
  select
    weekday,
    COUNT(*) as total_trips,
    SUM(case when pickup_location != dropoff_location then 1 else 0 end) as different_start_end
  from trips
  group by weekday
)

select
  tt.weekday,
  tt.total_trips,
  tt.different_start_end,
  tt.different_start_end::float / NULLIF(tt.total_trips, 0) * 100 as percentage_different_start_end
from total_trips_by_weekday tt
order by tt.weekday;
