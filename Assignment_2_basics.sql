/* Assignment 2: Count all the records with the COUNT statement*/
select
	count(*) as record_count
from
	foods f
	

			/* Part 1: update column to 'package_size_uom' to something
			stakeholders can understand below is the code to that change. I am able to
			temporarily change the name with the 'AS' statement as shown below*/

select
	f.food_id
	, f.item_name
	, f.storage_type
	, f.package_size
	, f.package_size_uom as package_size_unit_of_measurement
	, f.brand_name
	, f.package_price
	, f.price_last_updated_ts
from
	foods f

			/*another option is to permanently change the column name is using the
			 ALTER command as seen below*/

alter table foods
	rename package_size_uom   to package_size_unit_of_measurement

select
	*
from
	foods



			/* Part 2: count the records that are 'H-E-B (private label), two ways to do
			1.) GROUP BY and HAVING command if you need to consolidate the results by
			brand_name 2.) you can also add the WHERE command to simply list all 
			H-E-B (private label)'*/
	
select
	f.brand_name
	, count(*) as record_count
from
	foods f
group by f.brand_name
Having
	f.brand_name = 'H-E-B (private label)'
	
			/*Here I use the simple WHERE statement to filter through what I need*/
	
select
	 f.price_last_updated_ts
	, f.food_id
	, f.item_name
	, f.storage_type
	, f.package_size
	, f.package_size_uom
	, f.brand_name
	, f.package_price

from
	foods f
where 
	brand_name ='H-E-B (private label)'
	
			/*Taking case sensitivity into consdieration, we can also use the LOWER
			statement to pull every record under the 'H-E-B (private label)' regardless
			of case sensitivity. 
			
			The LOWER statment serves as the logic of the statement but
			returns the data in its original format. It does not change the format
			of the data*/	

select
	 f.price_last_updated_ts
	, f.food_id
	, f.item_name
	, f.storage_type
	, f.package_size
	, f.package_size_uom
	, f.brand_name
	, f.package_price

from
	foods f
where 
	lower (brand_name) = 'h-e-b (private label)'
	
				/*The ILIKE statement also allows logic to take place, return data in original
				formt regardless of case sensitivity, as seen below, the % sign after the 'h-e-b'
				instructs the database to search for anything after 'h-e-b' and return it*/
	
select
	f.price_last_updated_ts
	, f.food_id
	, f.item_name
	, f.storage_type
	, f.package_size
	, f.package_size_uom
	, f.brand_name
	, f.package_price

from
	foods f
where 
	f.brand_name ilike 'h-e-b%'