with source as (

    select * from {{ source('main', 'fhv_tripdata') }}

),

renamed as (

    select
        TRIM(dispatching_base_num) as base_number,
        pickup_datetime as pickup_time,
        dropOff_datetime as dropoff_time,
        PUlocationID as PU_location_id,
        DOlocationID as DO_location_id,
        --TRIM(SR_Flag) as SR_Flag, exluding this row due to all null
        TRIM(Affiliated_base_number) as aff_base_number,
        filename

    from source
    WHERE pickup_datetime <= '2022-12-31' AND dropoff_time <= '2022-12-31'

)

select * from renamed