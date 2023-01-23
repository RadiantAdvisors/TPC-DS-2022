-- start query 98 in stream 0 using template query5.tpl
with ssr as
 (select s_store_id,
        sum(sales_price) as sales,
        sum(profit) as profit,
        sum(return_amt) as returns,
        sum(net_loss) as profit_loss
 from
  ( select  ss_store_sk as store_sk,
            ss_sold_date_sk  as date_sk,
            ss_ext_sales_price as sales_price,
            ss_net_profit as profit,
            cast(0 as numeric) as return_amt,
            cast(0 as numeric) as net_loss
    from tpcds_2t_baseline.store_sales
    union all
    select sr_store_sk as store_sk,
           sr_returned_date_sk as date_sk,
           cast(0 as numeric) as sales_price,
           cast(0 as numeric) as profit,
           sr_return_amt as return_amt,
           sr_net_loss as net_loss
    from tpcds_2t_baseline.store_returns
   ) salesreturns,
     tpcds_2t_baseline.date_dim,
     tpcds_2t_baseline.store
 where date_sk = d_date_sk
       and d_date between date(1998, 08, 21) 
                  and date_add(date '1998-08-21', interval 14 day)
       and store_sk = s_store_sk
 group by s_store_id)
 ,
 csr as
 (select cp_catalog_page_id,
        sum(sales_price) as sales,
        sum(profit) as profit,
        sum(return_amt) as returns,
        sum(net_loss) as profit_loss
 from
  ( select  cs_catalog_page_sk as page_sk,
            cs_sold_date_sk  as date_sk,
            cs_ext_sales_price as sales_price,
            cs_net_profit as profit,
            cast(0 as numeric) as return_amt,
            cast(0 as numeric) as net_loss
    from tpcds_2t_baseline.catalog_sales
    union all
    select cr_catalog_page_sk as page_sk,
           cr_returned_date_sk as date_sk,
           cast(0 as numeric) as sales_price,
           cast(0 as numeric) as profit,
           cr_return_amount as return_amt,
           cr_net_loss as net_loss
    from tpcds_2t_baseline.catalog_returns
   ) salesreturns,
     tpcds_2t_baseline.date_dim,
     tpcds_2t_baseline.catalog_page
 where date_sk = d_date_sk
       and d_date between date(1998, 08, 21)
                  and date_add(date '1998-08-21', interval 14 day)
       and page_sk = cp_catalog_page_sk
 group by cp_catalog_page_id)
 ,
 wsr as
 (select web_site_id,
        sum(sales_price) as sales,
        sum(profit) as profit,
        sum(return_amt) as returns,
        sum(net_loss) as profit_loss
 from
  ( select  ws_web_site_sk as wsr_web_site_sk,
            ws_sold_date_sk  as date_sk,
            ws_ext_sales_price as sales_price,
            ws_net_profit as profit,
            cast(0 as numeric) as return_amt,
            cast(0 as numeric) as net_loss
    from tpcds_2t_baseline.web_sales
    union all
    select ws_web_site_sk as wsr_web_site_sk,
           wr_returned_date_sk as date_sk,
           cast(0 as numeric) as sales_price,
           cast(0 as numeric) as profit,
           wr_return_amt as return_amt,
           wr_net_loss as net_loss
    from tpcds_2t_baseline.web_returns left outer join tpcds_2t_baseline.web_sales on
         ( wr_item_sk = ws_item_sk
           and wr_order_number = ws_order_number)
   ) salesreturns,
     tpcds_2t_baseline.date_dim,
     tpcds_2t_baseline.web_site
 where date_sk = d_date_sk
       and d_date between date(1998, 08, 21)
       and date_add(date '1998-08-21', interval 14 day)
       and wsr_web_site_sk = web_site_sk
 group by web_site_id)
  select  channel
        , id
        , sum(sales) as sales
        , sum(returns) as returns
        , sum(profit) as profit
 from 
 (select 'store channel' as channel
        , concat('store', s_store_id) as id
        , sales
        , returns
        , (profit - profit_loss) as profit
 from   ssr
 union all
 select 'catalog channel' as channel
        , concat('catalog_page', cp_catalog_page_id) as id
        , sales
        , returns
        , (profit - profit_loss) as profit
 from  csr
 union all
 select 'web channel' as channel
        , concat('web_site', web_site_id) as id
        , sales
        , returns
        , (profit - profit_loss) as profit
 from   wsr
 ) x
 group by rollup (channel, id)
 order by channel
         ,id
-- end query 98 in stream 0 using template query5.tpl
