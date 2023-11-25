/*Below I have been assigned to create the following tables where data will be
imported into*/

create table foods
(
food_id bigint,
item_name character varying(255),
storage_type character varying(255),
package_size integer,
package_size_uom character varying(255),
brand_name character varying(255),
package_price numeric(10,2),
price_last_updated_ts timestamp without time zone
)
;

CREATE TABLE food_inventories
(
food_inventory_id bigint,
food_item_id bigint,
quantity integer,
inventory_dt date
)

;

create table drinks
(
drink_id bigint,
item_name character varying(255),
storage_type character varying(255),
package_size integer,
package_size_uom character varying(255),
brand_name character varying(255),
package_price numeric(10,2),
price_last_updated_ts timestamp without time zone
)
;

/*After cleaning the data, creating a diagram of the data and importing it I am
assigned to the following -- Refer to Assignment 2*/
