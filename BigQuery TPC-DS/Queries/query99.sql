-- start query 94 in stream 0 using template query99.tpl
select  
   substr(w_warehouse_name,1,20) as warehouse_name
  ,sm_type
  ,cc_name
  ,sum(case when (cs_ship_date_sk - cs_sold_date_sk <= 30 ) then 1 else 0 end)  as _30_days 
  ,sum(case when (cs_ship_date_sk - cs_sold_date_sk > 30) and 
                 (cs_ship_date_sk - cs_sold_date_sk <= 60) then 1 else 0 end )  as _31_to_60_days 
  ,sum(case when (cs_ship_date_sk - cs_sold_date_sk > 60) and 
                 (cs_ship_date_sk - cs_sold_date_sk <= 90) then 1 else 0 end)  as _61_to_90_days 
  ,sum(case when (cs_ship_date_sk - cs_sold_date_sk > 90) and
                 (cs_ship_date_sk - cs_sold_date_sk <= 120) then 1 else 0 end)  as _91_to_120_days 
  ,sum(case when (cs_ship_date_sk - cs_sold_date_sk  > 120) then 1 else 0 end)  as over_120_days 
from
   tpcds_2t_baseline.catalog_sales
  ,tpcds_2t_baseline.warehouse
  ,tpcds_2t_baseline.ship_mode
  ,tpcds_2t_baseline.call_center
  ,tpcds_2t_baseline.date_dim
where
    d_month_seq between 1222 and 1222 + 11
and cs_ship_date_sk   = d_date_sk
and cs_warehouse_sk   = w_warehouse_sk
and cs_ship_mode_sk   = sm_ship_mode_sk
and cs_call_center_sk = cc_call_center_sk
group by
   warehouse_name
  ,sm_type
  ,cc_name
order by warehouse_name
        ,sm_type
        ,cc_name
-- end query 94 in stream 0 using template query99.tpl
