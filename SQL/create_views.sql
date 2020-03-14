-- drop view trips_per_month_v

create view trips_per_month_v as 
(select 
	year,
	month,
	year || '-' || month year_month, 
	gender, 
	usertype, 
	2020-birth_year age,
	count(*) number_trips, 
	sum(tripduration) tripduration 
from bike_data 
group by 
	year,
	month,
	year_month, 
	gender, 
	usertype,
	age
)

-- drop view trips_by_hour_v

create view trips_by_hour_v as
(select 
 	substr(starttime, 12,2) as hour,
 	year,
 	year || '-' || month year_month, 
 	sum(tripduration) tripduration, 
 	count(*) number_trips,
 	gender
 from bike_data 
 group by substr(starttime, 12,2), year || '-' || month , year, gender)
 
 
-- drop view stations_by_popularity_v
-- create view stations_by_popularity_v as (
-- select 
-- 	start_station_name,
-- 	start_station_latitude,
-- 	start_station_longitude,
-- 	end_station_name,
-- 	end_station_latitude,
-- 	end_station_longitude,
-- 	count(*) number_trips,
-- 	sum(tripduration) trip_duration
-- from bike_data
-- group by 	
-- 	start_station_name,
-- 	start_station_latitude,
-- 	start_station_longitude,
-- 	end_station_name,
-- 	end_station_latitude,
-- 	end_station_longitude
-- )

CREATE VIEW bike_data_v as (
SELECT 
	bikeid AS bike_id,
	starttime AS start_time,
	stoptime AS stop_time,
	tripduration/60 AS trip_minutes,
	CASE
    	WHEN tripduration/60 < 120 THEN round(tripduration/60*(7.456/60),1)
    	ELSE 14.9
  	END AS trip_miles,
	substr(starttime, 12,2) as hour,
	year || '-' || month year_month,
	month,
	year,
	start_station_id,
	start_station_name,
	start_station_latitude,
	start_station_longitude,
	end_station_id,
	end_station_name,
	end_station_latitude,
	end_station_longitude,
	CASE 
		WHEN gender = 0 THEN 'Undefined'
		WHEN gender = 1 THEN 'Male'
		ELSE 'Female'
	END AS gender,
	usertype as user_type,
	CASE WHEN birth_year IS NOT NULL 
            THEN 2020-birth_year 
            ELSE 0
    END AS age,
	birth_year
FROM bike_data
WHERE year in ('2016', '2017', '2018', '2019')
AND NOT (tripduration < 300 AND start_station_id=end_station_id)
)