/*Assignment 4: Update the 'NULL' record to 'unknown' to make more sense to
the end user, to accomplish this I will use the UPDATE, SET, WHERE and IS
statements as shown below

NOTE: double check for null values with select statement before running the
update below*/

update
	foods f
set storage_type = 'unknown'
where
	storage_type is null
	
				/*double checking to make sure the records were updated by 
				running the DISTINCT command for the storage type again*/

Select
	distinct
		f.storage_type
from
		foods f

				/* Instructions 1: I was assigned to look for food_id 13, 15, and 17, I used the
				WHERE statement to provide the conditions for the database, and the OR statement
				to provide furhter conditions for the data that is to be obtained*/

select
	*
from foods f
where
	f.food_id = 13
	or f.food_id = 15
	or f.food_id = 17
	

				/*next I was asked to provide further filtering to get a result set
				that only included the 'H-E-B (private label)' brand name. for this,
				i simply needed to add an AND and ILIKE statement to search only for the
				Specific brand name regardless of case sensitivity if it meets the 
				necessary criteria, as seen below*/

select
	*
from foods f
where
	 (f.food_id = 13
	or f.food_id = 15
	or f.food_id = 17)
	and f.brand_name ilike 'h-e-b (private label)'
	
				/*Instructions 2: I was asked to create a new column that will have the total
				count of each storage_type per brand_name. I used the COUNT and GROUP BY statement
				below to aggregate all the storage_types per brand_name. COUNT in this 
				scenario served as a new column storing the requested calculation AS record_count*/

select
	f.brand_name
	,f.storage_type
	, count(*) as record_count
from
	foods f
group by
	f.brand_name
	, f.storage_type