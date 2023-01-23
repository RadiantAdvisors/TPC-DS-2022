-- start query 97 in stream 0 using template query61.tpl
select  promotions,total,cast(promotions as numeric)/cast(total as numeric)*100
from
  (select sum(ss_ext_sales_price) promotions
   from  tpcds_2t_baseline.store_sales
        ,tpcds_2t_baseline.store
        ,tpcds_2t_baseline.promotion
        ,tpcds_2t_baseline.date_dim
        ,tpcds_2t_baseline.customer
        ,tpcds_2t_baseline.customer_address 
        ,tpcds_2t_baseline.item
   where ss_sold_date_sk = d_date_sk
   and   ss_store_sk = s_store_sk
   and   ss_promo_sk = p_promo_sk
   and   ss_customer_sk= c_customer_sk
   and   ca_address_sk = c_current_addr_sk
   and   ss_item_sk = i_item_sk 
   and   ca_gmt_offset = -6
   and   i_category = 'Sports'
   and   (p_channel_dmail = 'Y' or p_channel_email = 'Y' or p_channel_tv = 'Y')
   and   s_gmt_offset = -6
   and   d_year = 1998
   and   d_moy  = 12) promotional_sales,
  (select sum(ss_ext_sales_price) total
   from  tpcds_2t_baseline.store_sales
        ,tpcds_2t_baseline.store
        ,tpcds_2t_baseline.date_dim
        ,tpcds_2t_baseline.customer
        ,tpcds_2t_baseline.customer_address
        ,tpcds_2t_baseline.item
   where ss_sold_date_sk = d_date_sk
   and   ss_store_sk = s_store_sk
   and   ss_customer_sk= c_customer_sk
   and   ca_address_sk = c_current_addr_sk
   and   ss_item_sk = i_item_sk
   and   ca_gmt_offset = -6
   and   i_category = 'Sports'
   and   s_gmt_offset = -6
   and   d_year = 1998
   and   d_moy  = 12) all_sales
order by promotions, total
-- end query 97 in stream 0 using template query61.tpl
