-- start query 80 in stream 0 using template query84.tpl
select  c_customer_id as customer_id
       , concat(coalesce(c_last_name,''),  ', ', coalesce(c_first_name,'')) as customername
 from tpcds_2t_baseline.customer
     ,tpcds_2t_baseline.customer_address
     ,tpcds_2t_baseline.customer_demographics
     ,tpcds_2t_baseline.household_demographics
     ,tpcds_2t_baseline.income_band
     ,tpcds_2t_baseline.store_returns
 where ca_city	        =  'Fairfield'
   and c_current_addr_sk = ca_address_sk
   and ib_lower_bound   >=  58125
   and ib_upper_bound   <=  58125 + 50000
   and ib_income_band_sk = hd_income_band_sk
   and cd_demo_sk = c_current_cdemo_sk
   and hd_demo_sk = c_current_hdemo_sk
   and sr_cdemo_sk = cd_demo_sk
 order by c_customer_id
-- end query 80 in stream 0 using template query84.tpl
