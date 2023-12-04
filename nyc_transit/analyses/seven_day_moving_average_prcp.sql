--Write a query to calculate the 7 day moving average precipitation for every day in
--the weather data.
--The 7 day window should center on the day in question (for each date, the 3 days
--before, the date & 3 days after).

--Adapted from: https://duckdb.org/2021/10/13/windowing.html
select date,
    avg(prcp) over (
        order by date asc
        range between interval 3 days preceding
                  and interval 3 days following)
        as "prcp 7-day Moving Average"
FROM {{ ref('stg__central_park_weather')}}
ORDER BY date;
