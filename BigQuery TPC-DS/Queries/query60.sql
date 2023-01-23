-- start query 29 in stream 0 using template query60.tpl
with ss as (
 select
          i_item_id,sum(ss_ext_sales_price) total_sales
 from
 	tpcds_2t_baseline.store_sales,
 	tpcds_2t_baseline.date_dim,
         tpcds_2t_baseline.customer_address,
         tpcds_2t_baseline.item
 where
         i_item_id in (select
  i_item_id
from
 tpcds_2t_baseline.item
where i_category in ('Music'))
 and     ss_item_sk              = i_item_sk
 and     ss_sold_date_sk         = d_date_sk
 and     d_year                  = 1998
 and     d_moy                   = 10
 and     ss_addr_sk              = ca_address_sk
 and     ca_gmt_offset           = -5 
 group by i_item_id),
 cs as (
 select
          i_item_id,sum(cs_ext_sales_price) total_sales
 from
 	tpcds_2t_baseline.catalog_sales,
 	tpcds_2t_baseline.date_dim,
         tpcds_2t_baseline.customer_address,
         tpcds_2t_baseline.item
 where
         i_item_id               in (select
  i_item_id
from
 tpcds_2t_baseline.item
where i_category in ('Music'))
 and     cs_item_sk              = i_item_sk
 and     cs_sold_date_sk         = d_date_sk
 and     d_year                  = 1998
 and     d_moy                   = 10
 and     cs_bill_addr_sk         = ca_address_sk
 and     ca_gmt_offset           = -5 
 group by i_item_id),
 ws as (
 select
          i_item_id,sum(ws_ext_sales_price) total_sales
 from
 	tpcds_2t_baseline.web_sales,
 	tpcds_2t_baseline.date_dim,
         tpcds_2t_baseline.customer_address,
         tpcds_2t_baseline.item
 where
         i_item_id               in (select
  i_item_id
from
 tpcds_2t_baseline.item
where i_category in ('Music'))
 and     ws_item_sk              = i_item_sk
 and     ws_sold_date_sk         = d_date_sk
 and     d_year                  = 1998
 and     d_moy                   = 10
 and     ws_bill_addr_sk         = ca_address_sk
 and     ca_gmt_offset           = -5
 group by i_item_id)
  select   
  i_item_id
,sum(total_sales) total_sales
 from  (select * from ss 
        union all
        select * from cs 
        union all
        select * from ws) tmp1
 group by i_item_id
 order by i_item_id
      ,total_sales
-- end query 29 in stream 0 using template query60.tpl
