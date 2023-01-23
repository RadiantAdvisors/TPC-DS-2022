-- start query 25 in stream 0 using template query16.tpl
select  
   count(distinct cs_order_number) as order_count
  ,sum(cs_ext_ship_cost) as total_shipping_cost
  ,sum(cs_net_profit) as total_net_profit
from
   tpcds_2t_baseline.catalog_sales cs1
  ,tpcds_2t_baseline.date_dim
  ,tpcds_2t_baseline.customer_address
  ,tpcds_2t_baseline.call_center
where
    d_date between '1999-4-01' and 
           date_add(date '1999-4-01', interval 60 day)
and cs1.cs_ship_date_sk = d_date_sk
and cs1.cs_ship_addr_sk = ca_address_sk
and ca_state = 'MD'
and cs1.cs_call_center_sk = cc_call_center_sk
and cc_county in ('Ziebach County','Williamson County','Walker County','Ziebach County',
                  'Ziebach County'
)
and exists (select *
            from tpcds_2t_baseline.catalog_sales cs2
            where cs1.cs_order_number = cs2.cs_order_number
              and cs1.cs_warehouse_sk <> cs2.cs_warehouse_sk)
and not exists(select *
               from tpcds_2t_baseline.catalog_returns cr1
               where cs1.cs_order_number = cr1.cr_order_number)
order by count(distinct cs_order_number)
-- end query 25 in stream 0 using template query16.tpl
