-- start query 11 in stream 0 using template query86.tpl
select   
    sum(ws_net_paid) as total_sum
   ,i_category
   ,i_class
   ,concat(i_category, i_class) as lochierarchy
   ,rank() over (
 	partition by concat(i_category, i_class),
 	case when i_class = '0' then i_category end 
 	order by sum(ws_net_paid) desc) as rank_within_parent
 from
    tpcds_2t_baseline.web_sales
   ,tpcds_2t_baseline.date_dim       d1
   ,tpcds_2t_baseline.item
 where
    d1.d_month_seq between 1205 and 1205+11
 and d1.d_date_sk = ws_sold_date_sk
 and i_item_sk  = ws_item_sk
 group by rollup(i_category,i_class)
 order by
   lochierarchy desc,
   case when lochierarchy = '0' then i_category end,
   rank_within_parent
-- end query 11 in stream 0 using template query86.tpl
