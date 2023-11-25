

/*PART 5*/

			/*Assignment 8: I am instructed to produce  an output that will give me 
			all fo the food items, but add a column that shows the inventory we have

			There are multiple dates I am dealing with, so I am only looking for records
			for the latest inventory, not past inventory
			
			I first start with querying a left join, one that will produce all records of
			the left table, foods f in this case, regardless if there is data or not

*/

Select
	*
from
food_inventories i

	

select
	*
from
	foods
	

select
	f.item_name
	, i.quantity
 	, i.inventory_dt as varchar
from 
	foods f
		left join
			food_inventories i
on
	f.food_id = i.food_item_id

						/*solution to the problem is below*/

select
	i.food_inventory_id
	, i.food_item_id
	, i.quantity
	, i.inventory_dt
from
	food_inventories i
	
	
select 
	f.food_id
	, f.item_name
	, f.storage_type
	, f.package_size
	, f.package_size_uom
	, f.brand_name
	, f.package_price
	, f.price_last_updated_ts
from
	foods f

				/*Use MAX function to isolate MAX date */
	

select
	max(i.inventory_dt) as max_inventory_dt
from
	food_inventories i
	

				/* get all inventory that matches the MAX inventory date by refrencing the query above
				for this, using a subquery would work*/

select
	i.food_inventory_id
	, i.food_item_id
	, i.quantity
	, i.inventory_dt
from
	food_inventories i
where
	i.inventory_dt = (select
						max(i.inventory_dt) as max_inventory_dt
						from
						food_inventories i)
						
						
					/*After retrieving all data with the MAX date, now I will left join the table
					to the above query that is refrencing the subquery with a left join*/





select 
	f.food_id
	, f.item_name
	, f.storage_type
	, f.package_size
	, f.package_size_uom
	, f.brand_name
	, f.package_price
	, f.price_last_updated_ts
	, i.quantity as inventory_quantity
from
	foods f
left join
			(select
				i.food_inventory_id
				, i.food_item_id
				, i.quantity
				, i.inventory_dt
			from
				food_inventories i
			where
				i.inventory_dt = (select
									max(i.inventory_dt) as max_inventory_dt
									from
									food_inventories i) ) i

on
	f.food_id = i.food_item_id


	
	
	
	

				
