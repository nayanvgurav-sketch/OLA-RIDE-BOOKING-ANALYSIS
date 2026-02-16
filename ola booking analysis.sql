create database if not exists OLA;
use OLA;
select * from data;

-- *************************************** PEAK DEMAND AND TIME BASED ANALYSIS **********************************************

-- 1 total bookings per day for given month, top 5 busiest days
select Date_col, count(*) as total_bookings from data
group by Date_col order by total_bookings desc limit 5;

-- 2 Average booking per hour of day; top 3 highest demand hours
select hour(Time_col) as 'hour_col', avg(total_bookings) as 'avg_bookings' from 
(select Time_col, count(*) as 'total_bookings' from data group by Time_col order by total_bookings) as t
group by hour_col order by avg_bookings desc limit 3;

-- 3 growth/decline in bookings week over week(last 4 weeks)
select week_col, count(*) Bookings, round((count(*)-lag(count(*)) over(order by week_col))*100/lag(count(*)) over(order by week_col),2) week_growth
from data group by week_col;

-- 4 categorize booking into time slots (e.g. Morning/afternoon/evening/night) with completed rides per slot
select case
when hour(Time_col) between 6 and 11 then 'morning'
when hour(Time_col) between 12 and 16 then 'afternoon'
when hour(Time_col) between 17 and 19 then 'evening'
else 'Night' 
end as 'time_slots', count(*) as 'total_bookings' from data where Booking_Status='Success'
group by time_slots order by total_bookings desc; 

-- 5 weekday vs weekend average bookings and completion rates
select case
when day_col='Sunday' then 'weekend'
else 'weekday'
end as 'day_type', count(*) as 'avg_bookings',
round(sum(case when booking_status='Success' then 1 else 0 end)*100/count(*),2) as 'completion_rate_pct'  from data
group by day_type;

-- ******************************************* CANCELLATION AND FAILURE REASONS *********************************************

-- 6 Overall cancellation rate split by driver/customer/auto-cancel
select 'customer_cancelled' as 'cancel_type', 
round((count(*)*100/(select count(*) from data)),2) as 'customer_cancel_pct' from data
 where Booking_Status='Canceled by Customer'
union all
select 'driver_cancelled' as 'cancel_type', 
round((count(*)*100/(select count(*) from data)),2) as 'customer_cancel_pct' from data 
where Booking_Status='Canceled by Driver'
union all 
select 'driver not found' as 'cancel_type', 
(count(*)*100/(select count(*) from data)) as 'customer_cancel_pct' 
from data where Booking_Status ='Driver Not Found'
union all
select 'total cancelled rate' as 'cancel_type', 
round((count(*)*100/(select count(*) from data)),2) as 'customer_cancel_pct' 
from data where Booking_Status !='Success';


-- 7 Cancellation reasons with counts and percentage share
select Incomplete_Rides_Reason, count(*) total_cancel,
 round(count(*)*100/sum(count(*)) over(),2) cancel_pct
 from data where Incomplete_Rides_Reason!='none'
 group by Incomplete_Rides_Reason order by cancel_pct limit 5;
 
-- 9 Hourly cancellation rates for driver cancellation vs customer cancelled; peak cancellation hours
select hour(Time_col) hour_col,
round(sum(case when Booking_Status='Canceled by Driver' then 1 else 0 end)*100/count(*),2) driver_cancel_pct, 
round(sum(case when Booking_Status='Canceled by Customer' then 1 else 0 end)*100/count(*),2) customer_cancel_pct
from data group by hour_col order by hour_col;

-- 10 Routes with cancellation rate >20% and minimum 50 bookings
select concat(Pickup_Location,'-',Drop_Location) as "route", count(*) as 'total_bookings',
(round(sum(case when Booking_Status!='Success' then 1 else 0 end)*100/count(*),2)) as 'cancel_rate'
from data
group by route
having cancel_rate >20 
order by cancel_rate desc;

-- 11 for each hour: total bookings, completed bookings, cacellation rate; hour with highest cancellation
select hour(Time_col) hour_col, count(*) total_bookings, 
sum(case when booking_status='Success' then 1 else 0 end) as 'complete_bookings',
(round(sum(case when Booking_Status!='Success' then 1 else 0 end)*100/count(*),2)) as 'cancel_rate' from data 
group by hour_col order by cancel_rate desc; 

