with source as (

    select * from {{ source('main', 'yellow_tripdata') }}

),

renamed as (

    select
        VendorID::int as vendor_id,
        tpep_pickup_datetime as pickup_datetime,
        tpep_dropoff_datetime as dropoff_datetime,
        passenger_count::int as passenger_count,
        ROUND(trip_distance::double, 0) as trip_distance,
        ROUND(RatecodeID::double, 0) as ratecode_id,
        store_and_fwd_flag::boolean as store_and_fwd_flag,
        PULocationID::int as pu_location_id,
        DOLocationID::int as do_location_id,
        payment_type::int as payment_type,
        ROUND(fare_amount::double, 0) as fare_amount,
        ROUND(extra, 2) as extra,
        ROUND(mta_tax, 2) as mta_tax,
        ROUND(tip_amount, 2) as tip_amount,
        ROUND(tolls_amount, 2) as tolls_amount,
        ROUND(improvement_surcharge, 2) as improvement_surcharge,
        ROUND(total_amount, 2) as total_amount,
        congestion_surcharge as congestion_surcharge,
        ROUND(airport_fee, 0) as airport_fee,
        filename,



    from source
    WHERE fare_amount >= 0 AND extra >= 0 AND mta_tax >= 0 AND tip_amount >= 0
    AND tolls_amount >= 0 AND improvement_surcharge >= 0 AND total_amount >= 0
    AND airport_fee >= 0
    AND pickup_datetime <= '2022-12-31' AND dropoff_datetime <= '2022-12-31'
    

)

select * from renamed