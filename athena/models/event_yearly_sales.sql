{{ 
    config(
        materialized='table',
        ha=true,
        format='parquet',
        write_compression='snappy',
        table_type='hive',
        schema='dbt-datamart'
    ) 
}}

SELECT
    year,
    SUM(qtysold) as total_qtysold,
    SUM(pricepaid) as total_price_paid,
    SUM(commission) as total_commission
FROM
    {{ ref('event_sales') }}
GROUP BY
    1