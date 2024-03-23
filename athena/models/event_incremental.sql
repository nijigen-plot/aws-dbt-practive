{{ config(
    materialized='incremental',
    incremental_strategy='append',
    on_schema_change='append_new_columns',
    table_type='hive',
    schema='incremental',
    format='parquet',
    write_compression='snappy'
) }}


SELECT
    venueid,
    venuename,
    venuecity,
    venuestate,
    CAST(CURRENT_TIMESTAMP as timestamp) as incremental_timestamp
FROM
    awsdatacatalog."dbt-datalake".venue