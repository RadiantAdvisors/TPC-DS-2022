-- start query 54 in stream 0 using template query38.tpl
select  count(*) from (
    select distinct c_last_name, c_first_name, d_date
    from tpcds_2t_baseline.store_sales, tpcds_2t_baseline.date_dim, tpcds_2t_baseline.customer
          where store_sales.ss_sold_date_sk = date_dim.d_date_sk
      and store_sales.ss_customer_sk = customer.c_customer_sk
      and d_month_seq between 1212 and 1212 + 11
  intersect distinct
    select distinct c_last_name, c_first_name, d_date
    from tpcds_2t_baseline.catalog_sales, tpcds_2t_baseline.date_dim, tpcds_2t_baseline.customer
          where catalog_sales.cs_sold_date_sk = date_dim.d_date_sk
      and catalog_sales.cs_bill_customer_sk = customer.c_customer_sk
      and d_month_seq between 1212 and 1212 + 11
  intersect distinct
    select distinct c_last_name, c_first_name, d_date
    from tpcds_2t_baseline.web_sales, tpcds_2t_baseline.date_dim, tpcds_2t_baseline.customer
          where web_sales.ws_sold_date_sk = date_dim.d_date_sk
      and web_sales.ws_bill_customer_sk = customer.c_customer_sk
      and d_month_seq between 1212 and 1212 + 11
) hot_cust
-- end query 54 in stream 0 using template query38.tpl
