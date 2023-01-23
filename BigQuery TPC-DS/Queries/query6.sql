-- start query 58 in stream 0 using template query6.tpl
select  a.ca_state state, count(*) cnt
 from tpcds_2t_baseline.customer_address a
     ,tpcds_2t_baseline.customer c
     ,tpcds_2t_baseline.store_sales s
     ,tpcds_2t_baseline.date_dim d
     ,tpcds_2t_baseline.item i
 where       a.ca_address_sk = c.c_current_addr_sk
 	and c.c_customer_sk = s.ss_customer_sk
 	and s.ss_sold_date_sk = d.d_date_sk
 	and s.ss_item_sk = i.i_item_sk
 	and d.d_month_seq = 
 	     (select distinct (d_month_seq)
 	      from tpcds_2t_baseline.date_dim
               where d_year = 1998
 	        and d_moy = 6 )
 	and i.i_current_price > 1.2 * 
             (select avg(j.i_current_price) 
 	     from tpcds_2t_baseline.item j 
 	     where j.i_category = i.i_category)
 group by a.ca_state
 having count(*) >= 10
 order by cnt, a.ca_state 
-- end query 58 in stream 0 using template query6.tpl
