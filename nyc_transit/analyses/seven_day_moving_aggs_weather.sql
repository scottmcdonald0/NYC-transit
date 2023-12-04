--Write a query to calculate the 7 day moving min, max, avg, sum for precipitation
--and snow for every day in the weather data, defining the window only once.
--The 7 day window should center on the day in question (for each date, the 3 days
--before, the date & 3 days after).

SELECT date,
MIN(sales) OVER seven_days as min_sales,
MAX(sales) OVER seven_day as max_sales
FROM customer_sales
WINDOW seven_days AS (
ORDER BY date ASC
RANGE BETWEEN INTERVAL 3 DAYS PRECEDING AND
INTERVAL 3 DAYS FOLLOWING)

select date,
min(prcp) over seven_days as min_prcp,
max(prcp) over seven_days as max_prcp,
avg(prcp) over seven_days as avg_prcp,
sum(prcp) over seven_days as sum_prcp,
min(snow) over seven_days as min_snow,
max(snow) over seven_days as max_snow,
avg(snow) over seven_days as avg_snow,
sum(snow) over seven_days as sum_snow
from
    {{ ref('stg__central_park_weather')}}
window
    seven_days as (
        order by date asc
        range between interval 3 days preceding
        and interval 3 days following
    )
order by
    date;