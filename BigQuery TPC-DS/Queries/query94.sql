-- start query 17 in stream 0 using template query94.tpl
select  
   count(distinct ws_order_number) as order_count
  ,sum(ws_ext_ship_cost) as total_shipping_cost
  ,sum(ws_net_profit) as total_net_profit
from
   tpcds_2t_baseline.web_sales ws1
  ,tpcds_2t_baseline.date_dim
  ,tpcds_2t_baseline.customer_address
  ,tpcds_2t_baseline.web_site
where
    d_date between '2001-5-01' and 
           date_add(date '2001-5-01', interval 60 day)
and ws1.ws_ship_date_sk = d_date_sk
and ws1.ws_ship_addr_sk = ca_address_sk
and ca_state = 'AR'
and ws1.ws_web_site_sk = web_site_sk
and web_company_name = 'pri'
and exists (select *
            from tpcds_2t_baseline.web_sales ws2
            where ws1.ws_order_number = ws2.ws_order_number
              and ws1.ws_warehouse_sk <> ws2.ws_warehouse_sk)
and not exists(select *
               from tpcds_2t_baseline.web_returns wr1
               where ws1.ws_order_number = wr1.wr_order_number)
order by count(distinct ws_order_number)
-- end query 17 in stream 0 using template query94.tpl
