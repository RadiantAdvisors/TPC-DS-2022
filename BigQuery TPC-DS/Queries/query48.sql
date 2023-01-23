-- start query 74 in stream 0 using template query48.tpl
select sum (ss_quantity)
 from tpcds_2t_baseline.store_sales, tpcds_2t_baseline.store, tpcds_2t_baseline.customer_demographics, tpcds_2t_baseline.customer_address, tpcds_2t_baseline.date_dim
 where s_store_sk = ss_store_sk
 and  ss_sold_date_sk = d_date_sk and d_year = 1998
 and  
 (
  (
   cd_demo_sk = ss_cdemo_sk
   and 
   cd_marital_status = 'S'
   and 
   cd_education_status = 'Secondary'
   and 
   ss_sales_price between 100.00 and 150.00  
   )
 or
  (
  cd_demo_sk = ss_cdemo_sk
   and 
   cd_marital_status = 'M'
   and 
   cd_education_status = 'Primary'
   and 
   ss_sales_price between 50.00 and 100.00   
  )
 or 
 (
  cd_demo_sk = ss_cdemo_sk
  and 
   cd_marital_status = 'W'
   and 
   cd_education_status = '2 yr Degree'
   and 
   ss_sales_price between 150.00 and 200.00  
 )
 )
 and
 (
  (
  ss_addr_sk = ca_address_sk
  and
  ca_country = 'United States'
  and
  ca_state in ('ND', 'KY', 'TX')
  and ss_net_profit between 0 and 2000  
  )
 or
  (ss_addr_sk = ca_address_sk
  and
  ca_country = 'United States'
  and
  ca_state in ('WI', 'AR', 'GA')
  and ss_net_profit between 150 and 3000 
  )
 or
  (ss_addr_sk = ca_address_sk
  and
  ca_country = 'United States'
  and
  ca_state in ('NC', 'SD', 'IL')
  and ss_net_profit between 50 and 25000 
  )
 )
-- end query 74 in stream 0 using template query48.tpl
