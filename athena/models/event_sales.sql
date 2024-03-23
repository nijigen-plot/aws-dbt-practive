{{ 
    config(
        materialized='table',
        ha=true,
        format='parquet',
        table_type='hive',
        partitioned_by=['year']
    ) 
}}

SELECT
    e.eventid,
    e.eventname,
    SUM(qtysold) as qtysold,
    SUM(pricepaid) as pricepaid,
    SUM(commission) as commission,
    d.year
FROM
    awsdatacatalog."dbt-datalake".sales as s
INNER JOIN
    awsdatacatalog."dbt-datalake".event as e
ON
    s.eventid = e.eventid
LEFT JOIN
    awsdatacatalog."dbt-datalake".date as d
ON
    s.dateid = d.dateid
GROUP BY
    1,2,6
