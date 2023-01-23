-- start query 86 in stream 0 using template query40.tpl
select  
   w_state
  ,i_item_id
  ,sum(case when d_date < date(1998, 03, 13) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_before
  ,sum(case when d_date >= date(1998, 03, 13) 
 		then cs_sales_price - coalesce(cr_refunded_cash,0) else 0 end) as sales_after
 from
   tpcds_2t_baseline.catalog_sales left outer join tpcds_2t_baseline.catalog_returns on
       (cs_order_number = cr_order_number 
        and cs_item_sk = cr_item_sk)
  ,tpcds_2t_baseline.warehouse 
  ,tpcds_2t_baseline.item
  ,tpcds_2t_baseline.date_dim
 where
     i_current_price between 0.99 and 1.49
 and i_item_sk          = cs_item_sk
 and cs_warehouse_sk    = w_warehouse_sk 
 and cs_sold_date_sk    = d_date_sk
 and d_date between date_sub(date '1998-03-13', interval 30 day)
                and date_add(date '1998-03-13', interval 30 day) 
 group by
    w_state,i_item_id
 order by w_state,i_item_id
-- end query 86 in stream 0 using template query40.tpl
