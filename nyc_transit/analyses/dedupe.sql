--Use Window functions with QUALIFY and ROW_NUMBER to remove
--duplicate rows.
--Prefer rows with a later time stamp

select * from {{ ref('events') }} 
qualify row_number()
    over (partition by event_id
            order by insert_timestamp desc)
    = 1;