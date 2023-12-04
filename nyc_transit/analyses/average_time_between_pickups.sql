--Find the average time between taxi pick ups per zone
--Use lead or lag to find the next trip per zone for each record
--then find the time difference between the pick up time for the current record and the next
--then use this result to calculate the average time between pick ups per zone.

with time_difference as (
    select 
        l.zone,
        t.pickup_datetime,
        lead(t.pickup_datetime) over (partition by l.Zone order by t.pickup_datetime) as next_pickup_time,
        extract(epoch from (lead(t.pickup_datetime) over (partition by l.Zone order by t.pickup_datetime) - t.pickup_datetime)) as time_diff
    from 
        {{ ref('mart__fact_all_taxi_trips') }} t
    inner join 
        {{ ref('mart__dim_locations') }} l on t.pulocationid = l.LocationID
)
select 
    Zone,
    avg(time_diff) as avg_time_diff
from 
    time_difference
where 
    time_diff is not null
group by 
    Zone;
