/*PART 3*/

select
	*
from
	foods

/*Assignment 6: I was asked to return the unique values in the price_last_updated_ts
using DISTINCT statement for the price_last_updated_ts, I am able to accomplish that
and rid the result set of any duplicate values */

Select
	distinct
		f.price_last_updated_ts
from
	foods f
	
				/*instructions 1: list all the products, create a separate column 
				to flag all the products that need updating

				Calculate the number of days its been since the price was last updated, so I am tasked
				to list all the product food columns next and add current_date

				Also was tasked with converting the timestamp to my timezone to match my city, as seen
				below*/

select
	 f.food_id
	, f.item_name
	, f.storage_type
	, f.package_size
	, f.package_size_uom
	, f.brand_name
	, f.package_price
	, f.price_last_updated_ts at time zone 'America/New_York' as price_last_updated_est_ts
	, current_timestamp
from
	foods f
	
					/*I am tasked now with finding the difference between current_timestamp and 
					price_last_updated_ts column, as seen below, I add a new column with that calculation
					in the select statement*/
	
select
	 f.food_id
	, f.item_name
	, f.storage_type
	, f.package_size
	, f.package_size_uom
	, f.brand_name
	, f.package_price
	, f.price_last_updated_ts at time zone 'America/New_York' as price_last_updated_est_ts
	, current_timestamp
	, (current_timestamp - f.price_last_updated_ts) as days_since_price_last_updated
from
	foods f
	
					/*Instructions now: add a date column and subtract current_date to price last updated
					using CAST to update the 'Price_last_updated_ts' column to date, to perform 
					calculation and only display the number of days since price was last updaed without
					the timestamp
					
					I also added an extra filter, encasing select statement as a subquery the parent query
					is able to refer to
					
					The parent query adds an extra layer of filtering where days_since_last_update
					is greater than 265 days*/
select
	*
from
			(select
				 f.food_id
				, f.item_name
				, f.storage_type
				, f.package_size
				, f.package_size_uom
				, f.brand_name
				, f.package_price
				, f.price_last_updated_ts at time zone 'America/New_York' as price_last_updated_est_ts
				, current_timestamp
				/* (current_timestamp - f.price_last_updated_ts) as days_since_price_last_updated*/
				, current_date - cast  (
										(f.price_last_updated_ts at time zone 'America/New_York')as date)
												as days_since_last_update
	from
		foods f) f
	where
		f.days_since_last_update > 265
