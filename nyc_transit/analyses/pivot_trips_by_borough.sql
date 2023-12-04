--Write a query to pivot the results by borough.
select
  {{ dbt_utils.pivot(
    'trips',
    dbt_utils.get_column_values(ref('mart__fact_trips_by_borough'), 'Borough')
  ) }}
from {{ ref('mart__fact_trips_by_borough') }};
