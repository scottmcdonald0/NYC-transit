with source as (

    select * from {{ source('main', 'fhvhv_tripdata') }}

),

renamed as (

    select
        TRIM(hvfhs_license_num) as hvfhs_license_num,
        TRIM(dispatching_base_num) as dispatching_base_num,
        TRIM(originating_base_num) as originating_base_num,
        request_datetime as request_datetime,
        on_scene_datetime as on_scene_datetime,
        pickup_datetime as pickup_datetime,
        dropoff_datetime as dropoff_datetime,
        PULocationID as pu_location_id,
        DOLocationID as do_location_id,
        ROUND(trip_miles, 2) as trip_miles,
        trip_time as trip_time,
        ROUND(base_passenger_fare, 2) as base_passenger_fare,
        ROUND(tolls, 2) as tolls,
        ROUND(bcf, 2) as bcf,
        ROUND(sales_tax, 2) as sales_tax,
        ROUND(congestion_surcharge, 2) as congestion_surcharge,
        ROUND(airport_fee, 2) as airport_fee,
        ROUND(tips, 2) as tips,
        ROUND(driver_pay, 2) as driver_pay,
        shared_request_flag::boolean as shared_request_flag,
        shared_match_flag::boolean as shared_match_flag,
        access_a_ride_flag::boolean as access_a_ride_flag,
        wav_request_flag::boolean as wav_request_flag,
        wav_match_flag::boolean as wav_match_flag,
        filename


    from source
    WHERE trip_miles >= 0 AND base_passenger_fare >= 0 AND tolls >= 0 AND bcf >= 0
    AND sales_tax >= 0 AND congestion_surcharge >= 0 AND airport_fee >= 0
    AND tips >= 0 AND driver_pay >= 0
    AND pickup_datetime <= '2022-12-31' AND dropoff_datetime <= '2022-12-31' 
    AND request_datetime <= '2022-12-31' AND on_scene_datetime <= '2022-12-31'
    

)

select * from renamed