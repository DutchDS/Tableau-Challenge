SELECT 
count(*)
FROM bike_data
WHERE year in ('2016', '2017', '2018', '2019')
AND (tripduration < 300 AND start_station_id=end_station_id)