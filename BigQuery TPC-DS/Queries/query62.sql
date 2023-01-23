-- start query 24 in stream 0 using template query62.tpl
select  
   substr(w_warehouse_name,1,20) as warehouse_name
  ,sm_type
  ,web_name
  ,sum(case when (ws_ship_date_sk - ws_sold_date_sk <= 30 ) then 1 else 0 end)  as _30_days 
  ,sum(case when (ws_ship_date_sk - ws_sold_date_sk > 30) and 
                 (ws_ship_date_sk - ws_sold_date_sk <= 60) then 1 else 0 end )  as _31_to_60_days 
  ,sum(case when (ws_ship_date_sk - ws_sold_date_sk > 60) and 
                 (ws_ship_date_sk - ws_sold_date_sk <= 90) then 1 else 0 end)  as _61_to_90_days 
  ,sum(case when (ws_ship_date_sk - ws_sold_date_sk > 90) and
                 (ws_ship_date_sk - ws_sold_date_sk <= 120) then 1 else 0 end)  as _91_to_120_days 
  ,sum(case when (ws_ship_date_sk - ws_sold_date_sk  > 120) then 1 else 0 end)  as above_120_days 
from
   tpcds_2t_baseline.web_sales
  ,tpcds_2t_baseline.warehouse
  ,tpcds_2t_baseline.ship_mode
  ,tpcds_2t_baseline.web_site
  ,tpcds_2t_baseline.date_dim
where
    d_month_seq between 1211 and 1211 + 11
and ws_ship_date_sk   = d_date_sk
and ws_warehouse_sk   = w_warehouse_sk
and ws_ship_mode_sk   = sm_ship_mode_sk
and ws_web_site_sk    = web_site_sk
group by
   warehouse_name
  ,sm_type
  ,web_name
order by warehouse_name
        ,sm_type
       ,web_name
-- end query 24 in stream 0 using template query62.tpl
