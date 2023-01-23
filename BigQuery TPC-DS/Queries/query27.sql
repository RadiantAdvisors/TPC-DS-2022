-- start query 16 in stream 0 using template query27.tpl
select  i_item_id,
        s_state, s_state as g_state,
        avg(ss_quantity) agg1,
        avg(ss_list_price) agg2,
        avg(ss_coupon_amt) agg3,
        avg(ss_sales_price) agg4
 from tpcds_2t_baseline.store_sales, tpcds_2t_baseline.customer_demographics, tpcds_2t_baseline.date_dim, tpcds_2t_baseline.store, tpcds_2t_baseline.item
 where ss_sold_date_sk = d_date_sk and
       ss_item_sk = i_item_sk and
       ss_store_sk = s_store_sk and
       ss_cdemo_sk = cd_demo_sk and
       cd_gender = 'F' and
       cd_marital_status = 'D' and
       cd_education_status = 'College' and
       d_year = 2002 and
       s_state in ('SD','AL', 'TN', 'SD', 'SD', 'SD')
 group by rollup (i_item_id, s_state)
 order by i_item_id
         ,s_state
-- end query 16 in stream 0 using template query27.tpl
