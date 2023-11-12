with source as (

    select * from {{ source('main', 'green_tripdata') }}

),

renamed as (

    select
        vendorid,
        lpep_pickup_datetime,
        lpep_dropoff_datetime,
        {{flag_to_bool("store_and_fwd_flag")}} as store_and_fwd_flag,        
        ratecodeid,
        pulocationid,
        dolocationid,
        passenger_count::int as passenger_count,
        trip_distance,
        fare_amount,
        extra,
        mta_tax,
        tip_amount,
        tolls_amount,
        --ehail_fee, --removed due to 100% null source data
        improvement_surcharge,
        total_amount,
        payment_type,
        trip_type,
        congestion_surcharge,
        filename

    from source
      WHERE lpep_pickup_datetime < TIMESTAMP '2022-12-31' -- drop rows in the future
        AND trip_distance >= 0 -- drop negative trip_distance
)

select * from renamed