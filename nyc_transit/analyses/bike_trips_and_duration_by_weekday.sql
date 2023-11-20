.echo on

select
    weekday(started_at_ts) as weekday,
    count(*) as total_trips,
    sum(duration_min) as total_trip_duration_mins
from {{ ref('mart__fact_all_bike_trips') }}
group by all;