-- start query 31 in stream 0 using template query37.tpl
select  i_item_id
       ,i_item_desc
       ,i_current_price
 from tpcds_2t_baseline.item, tpcds_2t_baseline.inventory, tpcds_2t_baseline.date_dim, tpcds_2t_baseline.catalog_sales
 where i_current_price between 16 and 16 + 30
 and inv_item_sk = i_item_sk
 and d_date_sk=inv_date_sk
 and d_date between date(1999, 03, 27) and date_add(date '1999-03-27', interval 60 day)
 and i_manufact_id in (821,673,849,745)
 and inv_quantity_on_hand between 100 and 500
 and cs_item_sk = i_item_sk
 group by i_item_id,i_item_desc,i_current_price
 order by i_item_id
-- end query 31 in stream 0 using template query37.tpl
