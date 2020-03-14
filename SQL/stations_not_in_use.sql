select end_station_name, count(*) from bike_data
where end_station_name like '%Don%Use%'
group by end_station_name

-- delete from bike_data where end_station_name like '%Don%Use%'

-- Deleted 1383 records
-- WS Don't Use
-- HS Don't Use
-- JSQ Don't Use