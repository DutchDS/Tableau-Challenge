# Week 20: Tableau Challenge - Bike Rental Dashboard  
By Aukje Rijpkema 3/12/2020

For the stories behind Tableau's [webpage](https://public.tableau.com/views/NYCityBikeDashboard_15838437149040/BIkeStory?:display_count=y&publish=yes&:origin=viz_share_link), please click [here](STORY.md). This website contains 8 tabs (=8 dashboards) and covers 6 'views' on the data provided. 

Data for City Bike goes back to mid 2013. Since they change the format in which they provided the data in September of 2015, which is over 4 years ago, I decided there was enough history and data available in the files from then on forward. See folder /Resources.

A python script loops through all 53 months of files and sequentially appends them to a postgres database called bike.db. The reason I choose to cleanup and enhance the data at the database level was because that way, all further views/reports/queries would use the same definitions. There could be no confusion about it. See folder /Scripts for Jupyter notebook and all_files.txt for the notebook to loop over.

A database view on the **trip level** was created as can be seen below. This way the trip distance is calculated per trip, the gender is derived and the age is calculated, before being passed to Tableau. Some extra date fields are added for convenience as well.

CREATE VIEW **bike_data_v** as
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
		
		
**Data Cleaning / Issues along the way:**

- the format of the .csv files changed a bit over time. Mainly the headers. The 'old' format was adjusted manually before being processed by the Python script and before being saved to the database.
- 3 bike stations were not in use, those records (1385) were deleted from the database (see /SQL/stations_not_in_use.sql)
- Only years '2016', '2017', '2018', '2019' are used in the view
- 5947 records were excluded from the view because there were under 5 minutes and both start and end stations were the same.

**From Postgres to Tableau.**

In order to extract data from a view in Postgres the following command line in psql was used.
1. Connect: psql bike_db postgres
2. Extract: \COPY (select * from bike_data_v) TO 'c:\users\public\bike_data_v.csv' DELIMITER ',' CSV HEADER;

The subsequent file had to be saved to a public domain space and from there I copied it to a location that was accesible by Tableau. Sounds complicated. Was easy.
