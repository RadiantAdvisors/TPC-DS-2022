-- start query 44 in stream 0 using template query92.tpl
select  
   sum(ws_ext_discount_amt) as excess_discount_amount 
from 
    tpcds_2t_baseline.web_sales 
   ,tpcds_2t_baseline.item 
   ,tpcds_2t_baseline.date_dim
where
i_manufact_id = 783
and i_item_sk = ws_item_sk 
and d_date between date(1999, 03, 21) and 
        date_add(date '1999-03-21', interval 90 day)
and d_date_sk = ws_sold_date_sk 
and ws_ext_discount_amt  
     > ( 
         SELECT 
            1.3 * avg(ws_ext_discount_amt) 
         FROM 
            tpcds_2t_baseline.web_sales 
           ,tpcds_2t_baseline.date_dim
         WHERE 
              ws_item_sk = i_item_sk 
          and d_date between date(1999, 03, 21) and 
              date_add(date '1999-03-21', interval 90 day)
          and d_date_sk = ws_sold_date_sk 
      ) 
order by sum(ws_ext_discount_amt)
-- end query 44 in stream 0 using template query92.tpl
