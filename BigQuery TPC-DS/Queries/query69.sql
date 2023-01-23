-- start query 28 in stream 0 using template query69.tpl
select  
  cd_gender,
  cd_marital_status,
  cd_education_status,
  count(*) cnt1,
  cd_purchase_estimate,
  count(*) cnt2,
  cd_credit_rating,
  count(*) cnt3
 from
  tpcds_2t_baseline.customer c,tpcds_2t_baseline.customer_address ca,tpcds_2t_baseline.customer_demographics
 where
  c.c_current_addr_sk = ca.ca_address_sk and
  ca_state in ('IN','ND','PA') and
  cd_demo_sk = c.c_current_cdemo_sk and 
  exists (select *
          from tpcds_2t_baseline.store_sales,tpcds_2t_baseline.date_dim
          where c.c_customer_sk = ss_customer_sk and
                ss_sold_date_sk = d_date_sk and
                d_year = 1999 and
                d_moy between 2 and 2+2) and
   (not exists (select *
            from tpcds_2t_baseline.web_sales,tpcds_2t_baseline.date_dim
            where c.c_customer_sk = ws_bill_customer_sk and
                  ws_sold_date_sk = d_date_sk and
                  d_year = 1999 and
                  d_moy between 2 and 2+2) and
    not exists (select * 
            from tpcds_2t_baseline.catalog_sales,tpcds_2t_baseline.date_dim
            where c.c_customer_sk = cs_ship_customer_sk and
                  cs_sold_date_sk = d_date_sk and
                  d_year = 1999 and
                  d_moy between 2 and 2+2))
 group by cd_gender,
          cd_marital_status,
          cd_education_status,
          cd_purchase_estimate,
          cd_credit_rating
 order by cd_gender,
          cd_marital_status,
          cd_education_status,
          cd_purchase_estimate,
          cd_credit_rating
-- end query 28 in stream 0 using template query69.tpl
