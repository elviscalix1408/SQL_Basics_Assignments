/*PART 4*/

/*Assignment 7: Working with drinks and foods table

I am instructed to produce a result set that has all the data from one 

table combined with the other table for this I used UNION ALL statement to list all data

Union all also doesn't only produce unique values, like UNION does

I then created a new column titled 'Source_table' so the data can be traced back
to its original table*/



(select
	f.food_id
 	, f.item_name
 	, f.storage_type
 	, f.package_size
 	, f.package_size_uom as package_size_unit_of_measurement
 	, f.brand_name
 	, f.package_price
 	, f.price_last_updated_ts
 	, 'foods data' as source_table
from
	foods f )
	
union all
	
(select
	d.drink_id
 	, d.item_name
 	, d.storage_type
 	, d.package_size
 	, d.package_size_uom as package_size_unit_of_measurement
 	, d.brand_name
 	, d.package_price
 	, d.price_last_updated_ts
 	, 'drinks data' as source_table
from
	drinks d)
	

				/*Instructions 1: Now I need to separate the food_id and drink_id column for futher differentiation

				For this I will create two new columns, on the foods table I apply 'null' to drink_id,
				and on the drinks table, I apply the null value to the food_id
				
				This will create two separate columns one dedicated for food_id and the other the to
				the drink_id*/


		(select
			f.food_id
		 	, null as drink_id
			, f.item_name
			, f.storage_type
			, f.package_size
			, f.package_size_uom as package_size_unit_of_measurement
			, f.brand_name
			, f.package_price
			, f.price_last_updated_ts
			, 'foods data' as source_table
		from
			foods f )

		union all

		(select
		 	null as food_id
			, d.drink_id
			, d.item_name
			, d.storage_type
			, d.package_size
			, d.package_size_uom as package_size_unit_of_measurement
			, d.brand_name
			, d.package_price
			, d.price_last_updated_ts
			, 'drinks data' as source_table
		from
			drinks d)