-- start query 79 in stream 0 using template query73.tpl
select c_last_name
       ,c_first_name
       ,c_salutation
       ,c_preferred_cust_flag 
       ,ss_ticket_number
       ,cnt from
   (select ss_ticket_number
          ,ss_customer_sk
          ,count(*) cnt
    from tpcds_2t_baseline.store_sales,tpcds_2t_baseline.date_dim,tpcds_2t_baseline.store,tpcds_2t_baseline.household_demographics
    where store_sales.ss_sold_date_sk = date_dim.d_date_sk
    and store_sales.ss_store_sk = store.s_store_sk  
    and store_sales.ss_hdemo_sk = household_demographics.hd_demo_sk
    and date_dim.d_dom between 1 and 2 
    and (household_demographics.hd_buy_potential = '1001-5000' or
         household_demographics.hd_buy_potential = 'Unknown')
    and household_demographics.hd_vehicle_count > 0
    and case when household_demographics.hd_vehicle_count > 0 then 
             household_demographics.hd_dep_count/ household_demographics.hd_vehicle_count else null end > 1
    and date_dim.d_year in (1999,1999+1,1999+2)
    and store.s_county in ('Walker County','Williamson County','Ziebach County','Ziebach County')
    group by ss_ticket_number,ss_customer_sk) dj, tpcds_2t_baseline.customer
    where ss_customer_sk = c_customer_sk
      and cnt between 1 and 5
-- end query 79 in stream 0 using template query73.tpl
