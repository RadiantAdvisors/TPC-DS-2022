-- start query 45 in stream 0 using template query3.tpl
select  dt.d_year 
       ,item.i_brand_id brand_id 
       ,item.i_brand brand
       ,sum(ss_sales_price) sum_agg
 from  tpcds_2t_baseline.date_dim dt 
      ,tpcds_2t_baseline.store_sales
      ,tpcds_2t_baseline.item
 where dt.d_date_sk = store_sales.ss_sold_date_sk
   and store_sales.ss_item_sk = item.i_item_sk
   and item.i_manufact_id = 211
   and dt.d_moy=11
 group by dt.d_year
      ,item.i_brand
      ,item.i_brand_id
 order by dt.d_year
         ,sum_agg desc
         ,brand_id
-- end query 45 in stream 0 using template query3.tpl
