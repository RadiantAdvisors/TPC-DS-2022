-- start query 34 in stream 0 using template query70.tpl
select  
    sum(ss_net_profit) as total_sum
   ,s_state
   ,s_county
   ,concat(s_state, s_county) as lochierarchy
   ,rank() over (
 	partition by concat(s_state, s_county),
 	case when s_county = '0' then s_state end 
 	order by sum(ss_net_profit) desc) as rank_within_parent
 from
    tpcds_2t_baseline.store_sales
   ,tpcds_2t_baseline.date_dim       d1
   ,tpcds_2t_baseline.store
 where
    d1.d_month_seq between 1191 and 1191+11
 and d1.d_date_sk = ss_sold_date_sk
 and s_store_sk  = ss_store_sk
 and s_state in
             ( select s_state
               from  (select s_state as s_state,
 			    rank() over ( partition by s_state order by sum(ss_net_profit) desc) as ranking
                      from   tpcds_2t_baseline.store_sales, tpcds_2t_baseline.store, tpcds_2t_baseline.date_dim
                      where  d_month_seq between 1191 and 1191+11
 			    and d_date_sk = ss_sold_date_sk
 			    and s_store_sk  = ss_store_sk
                      group by s_state
                     ) tmp1 
               where ranking <= 5
             )
 group by rollup(s_state,s_county)
 order by
   lochierarchy desc
  ,case when lochierarchy = '0' then s_state end
  ,rank_within_parent
-- end query 34 in stream 0 using template query70.tpl
