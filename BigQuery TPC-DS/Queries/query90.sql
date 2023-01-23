-- start query 40 in stream 0 using template query90.tpl
select  cast(amc as numeric) / cast(pmc as numeric) am_pm_ratio
 from ( select count(*) amc
       from tpcds_2t_baseline.web_sales, tpcds_2t_baseline.household_demographics , tpcds_2t_baseline.time_dim, tpcds_2t_baseline.web_page
       where ws_sold_time_sk = time_dim.t_time_sk
         and ws_ship_hdemo_sk = household_demographics.hd_demo_sk
         and ws_web_page_sk = web_page.wp_web_page_sk
         and time_dim.t_hour between 12 and 12+1
         and household_demographics.hd_dep_count = 0
         and web_page.wp_char_count between 5000 and 5200),
      ( select count(*) pmc
       from tpcds_2t_baseline.web_sales, tpcds_2t_baseline.household_demographics , tpcds_2t_baseline.time_dim, tpcds_2t_baseline.web_page
       where ws_sold_time_sk = time_dim.t_time_sk
         and ws_ship_hdemo_sk = household_demographics.hd_demo_sk
         and ws_web_page_sk = web_page.wp_web_page_sk
         and time_dim.t_hour between 15 and 15+1
         and household_demographics.hd_dep_count = 0
         and web_page.wp_char_count between 5000 and 5200)
 order by am_pm_ratio
-- end query 40 in stream 0 using template query90.tpl
