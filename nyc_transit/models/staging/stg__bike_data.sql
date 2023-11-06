with source as (

    select * from {{ source('main', 'bike_data') }}

),

renamed as (

    select
        tripduration::int as trip_duration,
        starttime::timestamp as start_time,
        stoptime::timestamp as stop_time,
        TRIM('start station id') as start_station_id,
        TRIM('start station name') as start_station_name ,
        'start station latitude'::double as start_station_lat,
        'start station longitude'::double as start_station_lon,
        TRIM('end station id') as end_station_id,
        TRIM('end station name') as end_station_name,
        'end station latitude'::double as end_station_lat,
        'end station longitude'::double as end_station_lon,
        bikeid::int as bike_id,
        TRIM(usertype) as user_type,
        'birth year'::int as birth_year,
        gender::int as gender,
        TRIM(ride_id) as ride_id,
        TRIM(rideable_type) as rideable_type,
        started_at::timestamp as started_at,
        ended_at::timestamp as ended_at,
        TRIM(start_station_name) as start_station_name,
        TRIM(start_station_id)::double as start_station_id,
        TRIM(end_station_name) as end_station_name,
        TRIM(end_station_id)::double as end_station_id,
        start_lat::double as start_lat,
        start_lng::double as start_lon,
        end_lat::double as end_lat,
        end_lng::double as end_long,
        TRIM(member_casual) as member_casual,
        filename
        

    from source
    where (stop_time <= '2022-12-31' OR stop_time is null)
    and (tripduration >= 0 OR tripduration is null) AND (ended_at <= '2022-12-31' OR ended_at is null)


)

select * from renamed


