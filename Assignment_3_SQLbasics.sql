/*Assignment 3: I am instructed to make the brand_name output all upper case
Using the UPPER statement in the select statement to transform the output of the 
brand_name to all UPPER case, as seen below*/

select
	f.price_last_updated_ts
	, f.food_id
	, f.item_name
	, f.storage_type
	, f.package_size
	, f.package_size_uom
	, upper (f.brand_name)
	, f.package_price


from
	foods f
where 
	f.brand_name ilike 'h-e-b%'

				/*Instructions 2: make a new column to the output 'is_canned_yn' which will
				tell us if the item is canned or not, I am also using the CASE statement
				to populate the data based off item-name and whether or not it has 'canned'
				in the name, as seen below

				'%' sign on either side of the of 'canned' instructs the database
				to disregard case and look for 'canned' in this column and return no matter
				the format or where it is placed*/

select
	f.price_last_updated_ts
	, f.food_id
	, f.item_name
	, f.storage_type
	, f.package_size
	, f.package_size_uom
	, f.brand_name
	, f.package_price
	, case when item_name ilike '%canned%' then 'yes'
		else 'no'
	end
	as is_canned_yn
from
	foods f
	
				/* Instructions 3: find any 'null' value under the 'brand_name' column i will 
				accomplish this by using the WHERE statement as seen below*/

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
	brand_name is null

				/*instructions 4: count how many items belong to each brand, creating a result set
				listing both the brand name and total number of items under each specific brand_name, for
				this query I will use the COUNT statement and GROUP BY to both count the brand names
				then to group the results together as a total count I also used ORDER BY to order 
				by ascending order, DESC woul be descending*/

Select
	f.brand_name
	, count(*) as record_count
from
	foods f
group by
	f.brand_name
order by
	f.brand_name asc
	
				/*PART 2*/

				/* Next I am asked to get a distinct list. I have added the DISTINCT statement
				in the SELECT statement to produce a result set without duplicate brand_names*/

Select
	distinct
		f.brand_name
from
foods f

				/*Instructions 5: provide the distinct values of the Storage type fields*/

Select
	distinct
		f.storage_type
from
foods f