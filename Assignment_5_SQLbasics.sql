/* Assignment 5:  I am instructed to find the percentage of 'H-E-B (private label)' there are

First thing I did was count all of 'H-E-B (private label)'

I also did a LOWER statement to serve as the logic of the query regardless of the case sensitivity, and
a GROUP BY to give me a total count

I also counted all products so I could know what the denominator would be*/

select
	lower (f.brand_name)
	, count(*) as record_count
from
	foods f
group by
	f.brand_name
Having
	lower (f.brand_name) = 'h-e-b (private label)'
	
	
				/*Instructions 1: finding the percentage of 'H-E-B (private label)' brands that are in the table,
				I calculated it by dividing the total number of 'H-E-B (private label) brand by the
				total brand count

				In this case, I used CAST to convert the values of two encased tables, one representing
				the total count of brand names, and the other representing only the total
				number of 'H-E-B (private label)' branded products

				CAST is necessary to convert two varying character values to a decimal, necessary
				to run an equation on these columns

				The cross join statement allows for all the values of n.heb_records table 
				to be joined and divided by d.total_records, as seen in the SELECT statement outside
				the two encased statments*/

select
	cast(n.heb_records as decimal (10,2)) / cast(d.total_records as decimal(10,2))
	as heb_percentage
	from

			(select
				count(*) as heb_records
			from
				foods f
			where
				lower (f.brand_name)= 'h-e-b (private label)') n -- numerator 
				
			cross join
			
			(select
				count(*) as total_records
			from
				foods f) d --denominator 