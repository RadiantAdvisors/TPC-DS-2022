-- start query 64 in stream 0 using template query12.tpl
select  i_item_id
      ,i_item_desc 
      ,i_category 
      ,i_class 
      ,i_current_price
      ,sum(ws_ext_sales_price) as itemrevenue 
      ,sum(ws_ext_sales_price)*100/sum(sum(ws_ext_sales_price)) over
          (partition by i_class) as revenueratio
from	
	tpcds_2t_baseline.web_sales
    	,tpcds_2t_baseline.item 
    	,tpcds_2t_baseline.date_dim
where 
	ws_item_sk = i_item_sk 
  	and i_category in ('Women', 'Children', 'Books')
  	and ws_sold_date_sk = d_date_sk
	and d_date between date(2001, 02, 28) 
				and date_add(date '2001-02-28', interval 30 day)
group by 
	i_item_id
        ,i_item_desc 
        ,i_category
        ,i_class
        ,i_current_price
order by 
	i_category
        ,i_class
        ,i_item_id
        ,i_item_desc
        ,revenueratio
-- end query 64 in stream 0 using template query12.tpl
