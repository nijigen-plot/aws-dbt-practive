
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='view') }}

SELECT
    s.salesid,
    s.listid,
    s.sellerid,
    s.buyerid,
    s.eventid,
    e.eventname,
    s.dateid,
    s.qtysold,
    s.pricepaid,
    s.commission,
    s.saletime
FROM
    awsdatacatalog."dbt-datalake".sales as s
INNER JOIN
    awsdatacatalog."dbt-datalake".event as e
ON
    s.eventid = e.eventid

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
