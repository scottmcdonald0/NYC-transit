with source as (

    select * from {{ source('main', 'fhv_bases') }}

),

renamed as (

    select
        TRIM(base_number) as base_number,
        TRIM(base_name) as base_name,
        TRIM(dba) as dba,
        TRIM(dba_category) as dba_category,
        filename

    from source

)

select * from renamed