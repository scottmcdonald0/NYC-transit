-- For average_time_between_pickups.sql
.output answers/average_time_between_pickups.txt
.echo on
.print nyc_transit/target/compiled/nyc_transit/analyses/average_time_between_pickups.sql
.read nyc_transit/target/compiled/nyc_transit/analyses/average_time_between_pickups.sql

-- For dedupe.sql
.output answers/dedupe.txt
.echo on
.print nyc_transit/target/compiled/nyc_transit/analyses/dedupe.sql
.read nyc_transit/target/compiled/nyc_transit/analyses/dedupe.sql

-- For pivot_trips_by_borough.sql
.output answers/pivot_trips_by_borough.txt
.echo on
.print nyc_transit/target/compiled/nyc_transit/analyses/pivot_trips_by_borough.sql
.read nyc_transit/target/compiled/nyc_transit/analyses/pivot_trips_by_borough.sql

-- For seven_day_moving_aggs_weather.sql
.output answers/seven_day_moving_aggs_weather.txt
.echo on
.print nyc_transit/target/compiled/nyc_transit/analyses/seven_day_moving_aggs_weather.sql
.read nyc_transit/target/compiled/nyc_transit/analyses/seven_day_moving_aggs_weather.sql

-- For seven_day_moving_average_prcp.sql
.output answers/seven_day_moving_average_prcp.txt
.echo on
.print nyc_transit/target/compiled/nyc_transit/analyses/seven_day_moving_average_prcp.sql
.read nyc_transit/target/compiled/nyc_transit/analyses/seven_day_moving_average_prcp.sql

-- For taxi_trips_no_valid_pickup_location_id.sql
.output answers/taxi_trips_no_valid_pickup_location_id.txt
.echo on
.print nyc_transit/target/compiled/nyc_transit/analyses/taxi_trips_no_valid_pickup_location_id.sql
.read nyc_transit/target/compiled/nyc_transit/analyses/taxi_trips_no_valid_pickup_location_id.sql

-- For trips_duration_grouped_by_borough_zone.sql
.output answers/trips_duration_grouped_by_borough_zone.txt
.echo on
.print nyc_transit/target/compiled/nyc_transit/analyses/trips_duration_grouped_by_borough_zone.sql
.read nyc_transit/target/compiled/nyc_transit/analyses/trips_duration_grouped_by_borough_zone.sql

-- For yellow_taxi_fair_comparison.sql
.output answers/yellow_taxi_fair_comparison.txt
.echo on
.print nyc_transit/target/compiled/nyc_transit/analyses/yellow_taxi_fair_comparison.sql
.read nyc_transit/target/compiled/nyc_transit/analyses/yellow_taxi_fair_comparison.sql

-- For zones_with_less_than_100k_trips.sql
.output answers/zones_with_less_than_100k_trips.txt
.echo on
.print nyc_transit/target/compiled/nyc_transit/analyses/zones_with_less_than_100k_trips.sql
.read nyc_transit/target/compiled/nyc_transit/analyses/zones_with_less_than_100k_trips.sql
