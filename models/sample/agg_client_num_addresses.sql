{{
    config(
        materialized="table"
    )
}}
select
    client_id,
    postal_code,
    count(*) as number_of_addresses

from
    hive_metastore.ref_dev_mysql_progresso_production.addresses

group by
    client_id,
    postal_code

having
    number_of_addresses > 1
