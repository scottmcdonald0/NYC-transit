--Ingest will pull data from the data directory and create it into new tables in main.db

--Create yellow_tripdata table from yellow_tripdata.parquet
CREATE TABLE yellow_tripdata AS SELECT *
FROM  read_parquet('./data/taxi/yellow_tripdata*.parquet',
union_by_name=True, filename=True, header=True);

--Create green_tripdata table from green_tripdata.parquet
CREATE TABLE green_tripdata AS SELECT *
FROM  read_parquet('./data/taxi/green_tripdata*.parquet',
union_by_name=True, filename=True, header=True);

--Create fhvhv_tripdata table from fhvhv_tripdata.parquet
CREATE TABLE fhvhv_tripdata AS SELECT *
FROM  read_parquet('./data/taxi/fhvhv_tripdata*.parquet',
union_by_name=True, filename=True, header=True);

--Create fhv_tripdata table from fhv_tripdata.parquet
CREATE TABLE fhv_tripdata AS SELECT *
FROM  read_parquet('./data/taxi/fhv_tripdata*.parquet',
union_by_name=True, filename=True, header=True);

--Create fhv_bases
CREATE TABLE fhv_bases AS SELECT * 
FROM read_csv_auto('./data/fhv_bases*.csv',
union_by_name=True, filename=True, header=True);

--Create central_park_weather table
CREATE TABLE central_park_weather AS SELECT *
FROM read_csv_auto('./data/central_park_weather.csv',
union_by_name=True, filename=True, header=True);

--Create bike_data
CREATE TABLE bike_data AS SELECT * 
FROM read_csv_auto('./data/citibike-tripdata.csv.gz',
union_by_name=True, filename=True, header=True);