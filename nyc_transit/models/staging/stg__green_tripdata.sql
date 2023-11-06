with source as (

    select * from {{ source('main', 'green_tripdata') }}

),

renamed as (

    select
        VendorID::int as vendor_id,
        lpep_pickup_datetime::timestamp as pickup_time,
        lpep_dropoff_datetime::timestamp as dropoff_time,
        store_and_fwd_flag::boolean as store_and_fwd_flag,
        ROUND(RatecodeID::double, 0) as ratecode_id,
        PULocationID::int as pu_location_id,
        DOLocationID::int as do_location_id,
        passenger_count::int as passenger_count,
        ROUND(trip_distance::double, 0) as trip_distance,
        ROUND(fare_amount::double, 0) as fare_amount,
        ROUND(extra, 2) as extra,
        ROUND(mta_tax, 2) as mta_tax,
        ROUND(tip_amount, 2) as tip_amount,
        ROUND(tolls_amount, 2) as tolls_amount,
        TRIM(ehail_fee) as ehail_fee,
        ROUND(improvement_surcharge, 2) as improvement_surcharge,
        ROUND(total_amount, 2) as total_amount,
        payment_type::int as payment_type,
        trip_type::int as trip_type,
        congestion_surcharge as congestion_surcharge,
        filename


    from source
    WHERE fare_amount >= 0 AND extra >= 0 AND mta_tax >= 0 AND tip_amount >= 0
    AND tolls_amount >= 0 AND improvement_surcharge >= 0 AND total_amount >= 0
    AND pickup_time <= '2022-12-31' AND dropoff_time <= '2022-12-31'
    

)

select * from renamed