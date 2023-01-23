-- start query 1 in stream 0 using template query96.tpl
select  count(*) 
from tpcds_2t_baseline.store_sales
    ,tpcds_2t_baseline.household_demographics 
    ,tpcds_2t_baseline.time_dim, tpcds_2t_baseline.store
where ss_sold_time_sk = time_dim.t_time_sk   
    and ss_hdemo_sk = household_demographics.hd_demo_sk 
    and ss_store_sk = s_store_sk
    and time_dim.t_hour = 8
    and time_dim.t_minute >= 30
    and household_demographics.hd_dep_count = 5
    and store.s_store_name = 'ese'
order by count(*)
-- end query 1 in stream 0 using template query96.tpl
