Use tpcds_scale200;

Select 'call_center' as 'TableName', count(*) as Count from call_center
UNION
Select 'catalog_page' as 'TableName', count(*) as Count from catalog_page
UNION
Select 'catalog_returns' as 'TableName', count(*) as Count from catalog_returns
UNION
Select 'catalog_sales' as 'TableName', count(*) as Count from catalog_sales
UNION
Select 'customer' as 'TableName', count(*) as Count from customer
UNION
Select 'customer_address' as 'TableName', count(*) as Count from customer_address
UNION
Select 'customer_demographics,' as 'TableName', count(*) as Count from customer_demographics
UNION
Select 'date_dim' as 'TableName', count(*) as Count from date_dim
UNION
Select 'household_demographics' as 'TableName', count(*) as Count from household_demographics
UNION
Select 'income_band' as 'TableName', count(*) as Count from income_band
UNION
Select 'inventory' as 'TableName', count(*) as Count from inventory
UNION
Select 'promotion' as 'TableName', count(*) as Count from promotion
UNION
Select 'reason' as 'TableName', count(*) as Count from reason
UNION
Select 'ship_mode' as 'TableName', count(*) as Count from ship_mode
UNION
Select 'store' as 'TableName', count(*) as Count from store
UNION
Select 'store_returns' as 'TableName', count(*) as Count from store_returns
UNION
Select 'store_sales' as 'TableName', count(*) as Count from store_sales
UNION
Select 'time_dim' as 'TableName', count(*) as Count from time_dim
UNION
Select 'warehouse' as 'TableName', count(*) as Count from warehouse
UNION
Select 'web_page' as 'TableName', count(*) as Count from web_page
UNION
Select 'web_sales' as 'TableName', count(*) as Count from web_sales
UNION
Select 'web_site' as 'TableName', count(*) as Count from web_site;