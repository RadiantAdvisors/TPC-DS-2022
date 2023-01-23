#! bin/bash

echo "Process initialized to load data."

Scale=200
BucketName="infra-agent-370017-databucket"
DatabaseName="tpcds_2t_baseline"

declare -a TpcDSTable=("call_center"  "catalog_page"  "catalog_returns"  "catalog_sales"  "customer_address"  "customer_demographics"  "date_dim"  "household_demographics"  "income_band"  "inventory"  "item"
"promotion"  "reason"  "ship_mode"  "store"  "store_returns"  "store_sales"  "time_dim"  "warehouse"  "web_page"  "web_returns"  "web_sales"  "web_site")

for table in ${TpcDSTable[@]}; do
        echo "Loading data into: ${DatabaseName}.${table} table"
        bq load --field_delimiter '|' --null_marker '' --ignore_unknown_values $DatabaseName.${table} gs://$BucketName/scale${Scale}/${table}_*.dat
done

# To Load data into Customer table.
echo "Loading data into: ${DatabaseName}.customer table"

for digit in {1..20};
do
    bq load --field_delimiter '|' --null_marker '' --ignore_unknown_values $DatabaseName.customer gs://$BucketName/scale${Scale}/customer_${digit}_8.dat
done

echo "********* Data has been loaded into all tables **************"