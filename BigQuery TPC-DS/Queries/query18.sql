-- start query 90 in stream 0 using template query18.tpl
select  i_item_id,
        ca_country,
        ca_state, 
        ca_county,
        avg( cast(cs_quantity as numeric)) agg1,
        avg( cast(cs_list_price as numeric)) agg2,
        avg( cast(cs_coupon_amt as numeric)) agg3,
        avg( cast(cs_sales_price as numeric)) agg4,
        avg( cast(cs_net_profit as numeric)) agg5,
        avg( cast(c_birth_year as numeric)) agg6,
        avg( cast(cd1.cd_dep_count as numeric)) agg7
 from tpcds_2t_baseline.catalog_sales, tpcds_2t_baseline.customer_demographics cd1, 
      tpcds_2t_baseline.customer_demographics cd2, tpcds_2t_baseline.customer, tpcds_2t_baseline.customer_address, tpcds_2t_baseline.date_dim, tpcds_2t_baseline.item
 where cs_sold_date_sk = d_date_sk and
       cs_item_sk = i_item_sk and
       cs_bill_cdemo_sk = cd1.cd_demo_sk and
       cs_bill_customer_sk = c_customer_sk and
       cd1.cd_gender = 'F' and 
       cd1.cd_education_status = '4 yr Degree' and
       c_current_cdemo_sk = cd2.cd_demo_sk and
       c_current_addr_sk = ca_address_sk and
       c_birth_month in (4,2,12,10,11,3) and
       d_year = 2001 and
       ca_state in ('AR','GA','CO'
                   ,'MS','ND','KS','KY')
 group by rollup (i_item_id, ca_country, ca_state, ca_county)
 order by ca_country,
        ca_state, 
        ca_county,
	i_item_id
-- end query 90 in stream 0 using template query18.tpl
