-- start query 21 in stream 0 using template query36.tpl
select  
    sum(ss_net_profit)/sum(ss_ext_sales_price) as gross_margin
   ,i_category
   ,i_class
   ,concat(i_category, i_class) as lochierarchy
   ,rank() over (
 	partition by concat(i_category, i_class),
 	case when i_class = '0' then i_category end 
 	order by sum(ss_net_profit)/sum(ss_ext_sales_price) asc) as rank_within_parent
 from
    tpcds_2t_baseline.store_sales
   ,tpcds_2t_baseline.date_dim       d1
   ,tpcds_2t_baseline.item
   ,tpcds_2t_baseline.store
 where
    d1.d_year = 1999 
 and d1.d_date_sk = ss_sold_date_sk
 and i_item_sk  = ss_item_sk 
 and s_store_sk  = ss_store_sk
 and s_state in ('AL','TN','SD','SD',
                 'SD','SD','SD','SD')
 group by rollup(i_category,i_class)
 order by
   lochierarchy desc
  ,case when lochierarchy = '0' then i_category end
  ,rank_within_parent
-- end query 21 in stream 0 using template query36.tpl
