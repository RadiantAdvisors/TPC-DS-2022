-- start query 67 in stream 0 using template query82.tpl
select  i_item_id
       ,i_item_desc
       ,i_current_price
 from tpcds_2t_baseline.item, tpcds_2t_baseline.inventory, tpcds_2t_baseline.date_dim, tpcds_2t_baseline.store_sales
 where i_current_price between 9 and 9+30
 and inv_item_sk = i_item_sk
 and d_date_sk=inv_date_sk
 and d_date between date(2001, 06, 07) and date_add(date '2001-06-07', interval 60 day)
 and i_manufact_id in (797,412,331,589)
 and inv_quantity_on_hand between 100 and 500
 and ss_item_sk = i_item_sk
 group by i_item_id,i_item_desc,i_current_price
 order by i_item_id
-- end query 67 in stream 0 using template query82.tpl
