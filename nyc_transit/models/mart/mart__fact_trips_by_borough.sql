--select trips and locations for fact_trips_by_borough
with all_trips as (
    select
        pulocationid
    from
        {{ ref('mart__fact_all_taxi_trips') }}
),

locations as (
    select
        LocationID,
        Borough
    from
        {{ ref('mart__dim_locations') }}
)

select
    Borough,
    count(*) as trips
from
    all_trips t
join
    locations l ON t.pulocationid = l.LocationID
group by
    Borough
