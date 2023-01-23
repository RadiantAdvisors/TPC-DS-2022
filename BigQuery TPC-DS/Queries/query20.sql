-- start query 65 in stream 0 using template query20.tpl
select  i_item_id
       ,i_item_desc 
       ,i_category 
       ,i_class 
       ,i_current_price
       ,sum(cs_ext_sales_price) as itemrevenue 
       ,sum(cs_ext_sales_price)*100/sum(sum(cs_ext_sales_price)) over
           (partition by i_class) as revenueratio
 from	tpcds_2t_baseline.catalog_sales
     ,tpcds_2t_baseline.item 
     ,tpcds_2t_baseline.date_dim
 where cs_item_sk = i_item_sk 
   and i_category in ('Men', 'Home', 'Music')
   and cs_sold_date_sk = d_date_sk
 and d_date between date(1999, 03, 08) 
 				and date_add(date '1999-03-08', interval 30 day)
 group by i_item_id
         ,i_item_desc 
         ,i_category
         ,i_class
         ,i_current_price
 order by i_category
         ,i_class
         ,i_item_id
         ,i_item_desc
         ,revenueratio
-- end query 65 in stream 0 using template query20.tpl
