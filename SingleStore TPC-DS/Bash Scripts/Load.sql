use tpcds_scale200;

CREATE PIPELINE IF NOT EXISTS call_center_pipeline AS
LOAD DATA S3 "yourbucket/tpcds/call_center."
CONFIG '{"region":"us-west-2", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `call_center`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '|\r\n';

CREATE PIPELINE IF NOT EXISTS catalog_page_pipeline AS
LOAD DATA S3 "yourbucket/tpcds/catalog_page."
CONFIG '{"region":"us-west-2", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `catalog_page`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '|\r\n';

CREATE PIPELINE IF NOT EXISTS catalog_returns_pipeline AS
LOAD DATA S3 "yourbucket/tpcds/catalog_returns."
CONFIG '{"region":"us-west-2", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `catalog_returns`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '|\r\n';

CREATE PIPELINE IF NOT EXISTS catalog_sales_pipeline AS
LOAD DATA S3 "yourbucket/tpcds/catalog_sales."
CONFIG '{"region":"us-west-2", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `catalog_sales`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '|\r\n';

CREATE PIPELINE IF NOT EXISTS customer_pipeline AS
LOAD DATA S3 "yourbucket/tpcds/customer."
CONFIG '{"region":"us-west-2", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `customer`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '|\r\n';

CREATE PIPELINE IF NOT EXISTS customer_address_pipeline AS
LOAD DATA S3 "yourbucket/tpcds/customer_address."
CONFIG '{"region":"us-west-2", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `customer_address`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '|\r\n';

CREATE PIPELINE IF NOT EXISTS customer_demographics_pipeline AS
LOAD DATA S3 "yourbucket/tpcds/customer_demographics."
CONFIG '{"region":"us-west-2", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `customer_demographics`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '|\r\n';

CREATE PIPELINE IF NOT EXISTS date_dim_pipeline AS
LOAD DATA S3 "yourbucket/tpcds/date_dim."
CONFIG '{"region":"us-west-2", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `date_dim`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '|\r\n';

CREATE PIPELINE IF NOT EXISTS household_demographics_pipeline AS
LOAD DATA S3 "yourbucket/tpcds/household_demographics."
CONFIG '{"region":"us-west-2", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `household_demographics`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '|\r\n';

CREATE PIPELINE IF NOT EXISTS income_band_pipeline AS
LOAD DATA S3 "yourbucket/tpcds/income_band."
CONFIG '{"region":"us-west-2", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `income_band`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '|\r\n';

CREATE PIPELINE IF NOT EXISTS inventory_pipeline AS
LOAD DATA S3 "yourbucket/tpcds/inventory."
CONFIG '{"region":"us-west-2", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `inventory`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '|\r\n';

CREATE PIPELINE IF NOT EXISTS item_pipeline AS
LOAD DATA S3 "yourbucket/tpcds/item."
CONFIG '{"region":"us-west-2", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `item`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '|\r\n';

CREATE PIPELINE IF NOT EXISTS promotion_pipeline AS
LOAD DATA S3 "yourbucket/tpcds/promotion."
CONFIG '{"region":"us-west-2", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `promotion`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '|\r\n';

CREATE PIPELINE IF NOT EXISTS reason_pipeline AS
LOAD DATA S3 "yourbucket/tpcds/reason."
CONFIG '{"region":"us-west-2", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `reason`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '|\r\n';

CREATE PIPELINE IF NOT EXISTS ship_mode_pipeline AS
LOAD DATA S3 "yourbucket/tpcds/ship_mode."
CONFIG '{"region":"us-west-2", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `ship_mode`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '|\r\n';

CREATE PIPELINE IF NOT EXISTS store_pipeline AS
LOAD DATA S3 "yourbucket/tpcds/store."
CONFIG '{"region":"us-west-2", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `store`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '|\r\n';

CREATE PIPELINE IF NOT EXISTS store_returns_pipeline AS
LOAD DATA S3 "yourbucket/tpcds/store_returns."
CONFIG '{"region":"us-west-2", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `store_returns`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '|\r\n';

CREATE PIPELINE IF NOT EXISTS store_sales_pipeline AS
LOAD DATA S3 "yourbucket/tpcds/store_sales."
CONFIG '{"region":"us-west-2", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `store_sales`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '|\r\n';

CREATE PIPELINE IF NOT EXISTS time_dim_pipeline AS
LOAD DATA S3 "yourbucket/tpcds/time_dim."
CONFIG '{"region":"us-west-2", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `time_dim`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '|\r\n';

CREATE PIPELINE IF NOT EXISTS warehouse_pipeline AS
LOAD DATA S3 "yourbucket/tpcds/warehouse."
CONFIG '{"region":"us-west-2", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `warehouse`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '|\r\n';

CREATE PIPELINE IF NOT EXISTS web_page_pipeline AS
LOAD DATA S3 "yourbucket/tpcds/web_page."
CONFIG '{"region":"us-west-2", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `web_page`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '|\r\n';

CREATE PIPELINE IF NOT EXISTS web_returns_pipeline AS
LOAD DATA S3 "yourbucket/tpcds/web_returns."
CONFIG '{"region":"us-west-2", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `web_returns`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '|\r\n';

CREATE PIPELINE IF NOT EXISTS web_sales_pipeline AS
LOAD DATA S3 "yourbucket/tpcds/web_sales."
CONFIG '{"region":"us-west-2", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `web_sales`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '|\r\n';

CREATE PIPELINE IF NOT EXISTS web_site_pipeline AS
LOAD DATA S3 "yourbucket/tpcds/web_site."
CONFIG '{"region":"us-west-2", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `web_site`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '|\r\n';

start pipeline call_center_pipeline foreground;
start pipeline catalog_page_pipeline foreground;
start pipeline catalog_returns_pipeline foreground;
start pipeline catalog_sales_pipeline foreground;
start pipeline customer_pipeline foreground;
start pipeline customer_address_pipeline foreground;
start pipeline customer_demographics_pipeline foreground;
start pipeline date_dim_pipeline foreground;
start pipeline household_demographics_pipeline foreground;
start pipeline income_band_pipeline foreground;
start pipeline inventory_pipeline foreground;
start pipeline item_pipeline foreground;
start pipeline promotion_pipeline foreground;
start pipeline reason_pipeline foreground;
start pipeline ship_mode_pipeline foreground;
start pipeline store_pipeline foreground;
start pipeline store_returns_pipeline foreground;
start pipeline store_sales_pipeline foreground;
start pipeline time_dim_pipeline foreground;
start pipeline warehouse_pipeline foreground;
start pipeline web_page_pipeline foreground;
start pipeline web_returns_pipeline foreground;
start pipeline web_sales_pipeline foreground;
start pipeline web_site_pipeline foreground;