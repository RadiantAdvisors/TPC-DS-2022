-- start query 7 in stream 0 using template query32.tpl
select  sum(cs_ext_discount_amt)  as excess_discount_amount 
from 
   tpcds_2t_baseline.catalog_sales 
   ,tpcds_2t_baseline.item 
   ,tpcds_2t_baseline.date_dim
where
i_manufact_id = 283
and i_item_sk = cs_item_sk 
and d_date between date(1999, 02, 22) and 
        date_add(DATE '1999-02-22', interval 90 day)
and d_date_sk = cs_sold_date_sk 
and cs_ext_discount_amt  
     > ( 
         select 
            1.3 * avg(cs_ext_discount_amt) 
         from 
            tpcds_2t_baseline.catalog_sales 
           ,tpcds_2t_baseline.date_dim
         where 
              cs_item_sk = i_item_sk 
          and d_date between date(1999, 02, 22) and
                 date_add(DATE '1999-02-22', interval 90 day)
          and d_date_sk = cs_sold_date_sk 
      ) 
-- end query 7 in stream 0 using template query32.tpl
