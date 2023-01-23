-- start query 49 in stream 0 using template query9.tpl
select case when (select count(*) 
                  from tpcds_2t_baseline.store_sales 
                  where ss_quantity between 1 and 20) > 144610
            then (select avg(ss_ext_tax) 
                  from tpcds_2t_baseline.store_sales 
                  where ss_quantity between 1 and 20) 
            else (select avg(ss_net_paid)
                  from tpcds_2t_baseline.store_sales
                  where ss_quantity between 1 and 20) end bucket1 ,
       case when (select count(*)
                  from tpcds_2t_baseline.store_sales
                  where ss_quantity between 21 and 40) > 162498
            then (select avg(ss_ext_tax)
                  from tpcds_2t_baseline.store_sales
                  where ss_quantity between 21 and 40) 
            else (select avg(ss_net_paid)
                  from tpcds_2t_baseline.store_sales
                  where ss_quantity between 21 and 40) end bucket2,
       case when (select count(*)
                  from tpcds_2t_baseline.store_sales
                  where ss_quantity between 41 and 60) > 28387
            then (select avg(ss_ext_tax)
                  from tpcds_2t_baseline.store_sales
                  where ss_quantity between 41 and 60)
            else (select avg(ss_net_paid)
                  from tpcds_2t_baseline.store_sales
                  where ss_quantity between 41 and 60) end bucket3,
       case when (select count(*)
                  from tpcds_2t_baseline.store_sales
                  where ss_quantity between 61 and 80) > 442573
            then (select avg(ss_ext_tax)
                  from tpcds_2t_baseline.store_sales
                  where ss_quantity between 61 and 80)
            else (select avg(ss_net_paid)
                  from tpcds_2t_baseline.store_sales
                  where ss_quantity between 61 and 80) end bucket4,
       case when (select count(*)
                  from tpcds_2t_baseline.store_sales
                  where ss_quantity between 81 and 100) > 212532
            then (select avg(ss_ext_tax)
                  from tpcds_2t_baseline.store_sales
                  where ss_quantity between 81 and 100)
            else (select avg(ss_net_paid)
                  from tpcds_2t_baseline.store_sales
                  where ss_quantity between 81 and 100) end bucket5
from tpcds_2t_baseline.reason
where r_reason_sk = 1
-- end query 49 in stream 0 using template query9.tpl
