Select 'call_center' as TableName, count(*) as Count from `tpcds_2t_baseline.call_center`
UNION ALL
Select 'catalog_page' as TableName, count(*) as Count from `tpcds_2t_baseline.catalog_page`
UNION ALL
Select 'catalog_returns' as TableName, count(*) as Count from `tpcds_2t_baseline.catalog_returns`
UNION ALL
Select 'catalog_sales' as TableName, count(*) as Count from `tpcds_2t_baseline.catalog_sales`
UNION ALL
Select 'customer' as TableName, count(*) as Count from `tpcds_2t_baseline.customer`
UNION ALL
Select 'customer_address' as TableName, count(*) as Count from `tpcds_2t_baseline.customer_address`
UNION ALL
Select 'customer_demographics,' as TableName, count(*) as Count from `tpcds_2t_baseline.customer_demographics`
UNION ALL
Select 'date_dim' as TableName, count(*) as Count from `tpcds_2t_baseline.date_dim`
UNION ALL
Select 'household_demographics' as TableName, count(*) as Count from `tpcds_2t_baseline.household_demographics`
UNION ALL
Select 'income_band' as TableName, count(*) as Count from `tpcds_2t_baseline.income_band`
UNION ALL
Select 'inventory' as TableName, count(*) as Count from `tpcds_2t_baseline.inventory`
UNION ALL
Select 'promotion' as TableName, count(*) as Count from `tpcds_2t_baseline.promotion`
UNION ALL
Select 'reason' as TableName, count(*) as Count from `tpcds_2t_baseline.reason`
UNION ALL
Select 'ship_mode' as TableName, count(*) as Count from `tpcds_2t_baseline.ship_mode`
UNION ALL
Select 'store' as TableName, count(*) as Count from `tpcds_2t_baseline.store`
UNION ALL
Select 'store_returns' as TableName, count(*) as Count from `tpcds_2t_baseline.store_returns`
UNION ALL
Select 'store_sales' as TableName, count(*) as Count from `tpcds_2t_baseline.store_sales`
UNION ALL
Select 'time_dim' as TableName, count(*) as Count from `tpcds_2t_baseline.time_dim`
UNION ALL
Select 'warehouse' as TableName, count(*) as Count from `tpcds_2t_baseline.warehouse`
UNION ALL
Select 'web_page' as TableName, count(*) as Count from `tpcds_2t_baseline.web_page`
UNION ALL
Select 'web_sales' as TableName, count(*) as Count from `tpcds_2t_baseline.web_sales`
UNION ALL
Select 'web_sales' as TableName, count(*) as Count from `tpcds_2t_baseline.web_site`;